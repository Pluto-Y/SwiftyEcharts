//
//  AngleAxisSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 28/06/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class AngleAxisSpec: QuickSpec {
    override func spec() {
        let valueValue = "value"
        let textStyleValue = TextStyle(
            .color(Color.hexColor("#ff8899")),
            .fontStyle(.italic),
            .fontWeight(12),
            .fontFamily("fontFamily"),
            .fontSize(22),
            .align(Position.inner)
        )
        let angleAxisData = AngleAxis.Data()
        angleAxisData.value = valueValue
        angleAxisData.textStyle = textStyleValue
        
        describe("For AngleAxis.Data") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "value": valueValue,
                    "textStyle": textStyleValue
                ]
                
                expect(angleAxisData.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let angleAxisDataByEnums = AngleAxis.Data(
                    .value(valueValue),
                    .textStyle(textStyleValue)
                )
                
                expect(angleAxisDataByEnums.jsonString).to(equal(angleAxisData.jsonString))
            }
        }
        
    }
}
