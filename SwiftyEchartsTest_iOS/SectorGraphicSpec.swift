//
//  SectorGraphicSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 08/08/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class SectorGraphicSpec: QuickSpec {
    override func spec() {
        let cxShapeValue: Float = 84.2736
        let cyShapeValue: Float = 0.99999999
        let rShapeValue: Float = 8888
        let r0ShapeValue: Float = 0.547
        let startAngleShapeValue: Float = 5736.973
        let endAngleShapeValue: Float = 0.57346
        let clockwiseShapeValue = false
        
        let shape = SectorGraphic.Shape()
        shape.cx = cxShapeValue
        shape.cy = cyShapeValue
        shape.r = rShapeValue
        shape.r0 = r0ShapeValue
        shape.startAngle = startAngleShapeValue
        shape.endAngle = endAngleShapeValue
        shape.clockwise = clockwiseShapeValue
        
        describe("For SectorGraphic.Shape") { 
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "cx": cxShapeValue,
                    "cy": cyShapeValue,
                    "r": rShapeValue,
                    "r0": r0ShapeValue,
                    "startAngle": startAngleShapeValue,
                    "endAngle": endAngleShapeValue,
                    "clockwise": clockwiseShapeValue
                ]
                
                expect(shape.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let shapeByEnums = SectorGraphic.Shape(
                    .cx(cxShapeValue),
                    .cy(cyShapeValue),
                    .r(rShapeValue),
                    .r0(r0ShapeValue),
                    .startAngle(startAngleShapeValue),
                    .endAngle(endAngleShapeValue),
                    .clockwise(clockwiseShapeValue)
                )
                
                expect(shapeByEnums.jsonString).to(equal(shape.jsonString))
            }
        }
    }
}
