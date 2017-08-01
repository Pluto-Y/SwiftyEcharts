//
//  PolygonGraphicSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 01/08/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class PolygonGraphicSpec: QuickSpec {
    override func spec() {
        describe("For PolygonGraphic.Shape.Smooth") {
            let valValue: Float = 563.5626
            let splineString = "spline"
            
            let valSmooth = PolygonGraphic.Shape.Smooth.val(valValue)
            let splineSmooth = PolygonGraphic.Shape.Smooth.spline
            
            it("needs to check the enum case jsonString") {
                expect(valSmooth.jsonString).to(equal("\(valValue)"))
                expect(splineSmooth.jsonString).to(equal(splineString.jsonString))
            }
        }
        
        let pointShapeValue: [Point] = [[22, 44], [44, 55], [11, 44]]
        let smoothShapeValue = PolygonGraphic.Shape.Smooth.spline
        let smoothConstraintShapeValue = true
        
        let shape = PolygonGraphic.Shape()
        shape.point = pointShapeValue
        shape.smooth = smoothShapeValue
        shape.smoothConstraint = smoothConstraintShapeValue
        
        describe("For PolygonGraphic.Shape") {
            it("needs to check the jsonStrin") {
                let resultDic: [String: Jsonable] = [
                    "point": pointShapeValue,
                    "smooth": smoothShapeValue,
                    "smoothConstraint": smoothConstraintShapeValue
                ]
                
                expect(shape.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let shapeByEnums = PolygonGraphic.Shape(
                    .point(pointShapeValue),
                    .smooth(smoothShapeValue),
                    .smoothConstraint(smoothConstraintShapeValue)
                )
                
                expect(shapeByEnums.jsonString).to(equal(shape.jsonString))
            }
        }
    }
}
