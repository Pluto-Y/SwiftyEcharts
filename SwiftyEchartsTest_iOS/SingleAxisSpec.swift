//
//  SingleAxisSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 08/08/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class SingleAxisSpec: QuickSpec {
    override func spec() {
        let valueDataValue = "singAxisDataValue"
        let textStyleDataValue = TextStyle(
            .fontSize(18),
            .fontFamily("singleAxisDataTextStyleFontFamily"),
            .fontStyle(.italic)
        )
        
        let data = SingleAxis.Data()
        data.value = valueDataValue
        data.textStyle = textStyleDataValue
        
        describe("For SingleAxis.Data") { 
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "value": valueDataValue,
                    "textStyle": textStyleDataValue
                ]
                
                expect(data.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let dataByEnums = SingleAxis.Data(
                    .value(valueDataValue),
                    .textStyle(textStyleDataValue)
                )
                
                expect(dataByEnums.jsonString).to(equal(data.jsonString))
            }
        }
    }
}
