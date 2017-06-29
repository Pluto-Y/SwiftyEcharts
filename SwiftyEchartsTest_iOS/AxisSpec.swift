//
//  AxisSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 28/06/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class AxisSpec: QuickSpec {
    override func spec() {
        let valueValue = "value"
        let textStyleValue = TextStyle(
            .fontSize(16),
            .color(.hexColor("#e54035"))
        )
        
        let axisData = Axis.Data()
        axisData.value = valueValue
        axisData.textStyle = textStyleValue
        describe("For Axis.Data") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "value": valueValue,
                    "textStyle": textStyleValue
                ]
                
                expect(axisData.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let axisDataByEnums = Axis.Data(
                    .value(valueValue),
                    .textStyle(textStyleValue)
                )
                
                expect(axisDataByEnums.jsonString).to(equal(axisData.jsonString))
                
            }
        }
    }

}
