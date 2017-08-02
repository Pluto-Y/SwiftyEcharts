//
//  PolylineGraphicSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 02/08/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class PolylineGraphicSpec: QuickSpec {
    override func spec() {
        describe("For PolylineGraphic.Shape.Smooth") {
            let valValue: Float = 563.5626
            let splineString = "spline"
            
            let valSmooth = PolylineGraphic.Shape.Smooth.val(valValue)
            let splineSmooth = PolylineGraphic.Shape.Smooth.spline
            
            it("needs to check the enum case jsonString") {
                expect(valSmooth.jsonString).to(equal("\(valValue)"))
                expect(splineSmooth.jsonString).to(equal(splineString.jsonString))
            }
        }
        
        let pointShapeValue: [Point] = [[22%, 44%], [44%, 55%], [11%, 44%]]
        let smoothShapeValue = PolylineGraphic.Shape.Smooth.val(75.37)
        let smoothConstraintShapeValue = false
        
        let shape = PolylineGraphic.Shape()
        shape.point = pointShapeValue
        shape.smooth = smoothShapeValue
        shape.smoothConstraint = smoothConstraintShapeValue
        
        describe("For PolylineGraphic.Shape") {
            it("needs to check the jsonStrin") {
                let resultDic: [String: Jsonable] = [
                    "point": pointShapeValue,
                    "smooth": smoothShapeValue,
                    "smoothConstraint": smoothConstraintShapeValue
                ]
                
                expect(shape.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let shapeByEnums = PolylineGraphic.Shape(
                    .point(pointShapeValue),
                    .smooth(smoothShapeValue),
                    .smoothConstraint(smoothConstraintShapeValue)
                )
                
                expect(shapeByEnums.jsonString).to(equal(shape.jsonString))
            }
        }
    }
}
