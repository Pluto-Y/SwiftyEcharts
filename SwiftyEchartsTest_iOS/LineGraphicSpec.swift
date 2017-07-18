//
//  LineGraphicSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 18/07/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class LineGraphicSpec: QuickSpec {
    override func spec() {
        let x1DataValue: Float = 8.823
        let y1DataValue: Float = 999.999
        let x2DataValue: Float = 382.381
        let y2DataValue: Float = 93.0
        let percentDataValue: Float = 0.283
        
        let shape = LineGraphic.Shape()
        shape.x1 = x1DataValue
        shape.y1 = y1DataValue
        shape.x2 = x2DataValue
        shape.y2 = y2DataValue
        shape.percent = percentDataValue
        
        describe("For LineGraphic.Shape") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "x1": x1DataValue,
                    "y1": y1DataValue,
                    "x2": x2DataValue,
                    "y2": y2DataValue,
                    "percent": percentDataValue
                ]
                
                expect(shape.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let shapeByEnums = LineGraphic.Shape(
                    .x1(x1DataValue),
                    .y1(y1DataValue),
                    .x2(x2DataValue),
                    .y2(y2DataValue),
                    .percent(percentDataValue)
                )
                
                expect(shapeByEnums.jsonString).to(equal(shape.jsonString))
            }
        }
    }
}
