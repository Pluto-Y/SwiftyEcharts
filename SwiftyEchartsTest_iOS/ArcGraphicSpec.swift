//
//  ArcGraphicSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 27/06/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class ArcGraphicSpec: QuickSpec {
    override func spec() {
        let cxValue: Float = 56.2
        let cyValue: Float = 22.5
        let rValue: Float = 5.5
        let r0Value: Float = 9.2
        let startAngleValue: Float = 45
        let endAngleValue: Float = 270
        let clockwiseValue: Float = 2.345
        
        let shape = ArcGraphic.Shape()
        shape.cx = cxValue
        shape.cy = cyValue
        shape.r = rValue
        shape.r0 = r0Value
        shape.startAngle = startAngleValue
        shape.endAngle = endAngleValue
        shape.clockwise = clockwiseValue
        
        describe("For ArcGraphic.Shape") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "cx": cxValue,
                    "cy": cyValue,
                    "r": rValue,
                    "r0": r0Value,
                    "startAngle": startAngleValue,
                    "endAngle": endAngleValue,
                    "clockwise": clockwiseValue
                ]
                
                expect(shape.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let shapeByEnums = ArcGraphic.Shape(
                    .cx(cxValue),
                    .cy(cyValue),
                    .r(rValue),
                    .r0(r0Value),
                    .startAngle(startAngleValue),
                    .endAngle(endAngleValue),
                    .clockwise(clockwiseValue)
                )
                
                expect(shapeByEnums.jsonString).to(equal(shape.jsonString))
            }
        }
    }
}
