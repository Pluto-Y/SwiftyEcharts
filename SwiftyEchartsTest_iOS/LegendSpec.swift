//
//  LegendSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 18/07/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class LegendSpec: QuickSpec {
    override func spec() {
        let nameDataValue = "nameDataValue"
        let iconDataValue = Symbol.none
        let textStyleDataValue = TextStyle(
            .color(rgb(200, 100, 100)),
            .fontWeight(.lighter)
        )
        
        let legendData = Legend.Data()
        legendData.name = nameDataValue
        legendData.icon = iconDataValue
        legendData.textStyle = textStyleDataValue
        
        describe("For Legend.Data") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "name": nameDataValue,
                    "icon": iconDataValue,
                    "textStyle": textStyleDataValue
                ]
                
                expect(legendData.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let legendDataByEnums = Legend.Data(
                    .name(nameDataValue),
                    .icon(iconDataValue),
                    .textStyle(textStyleDataValue)
                )
                
                expect(legendDataByEnums.jsonString).to(equal(legendData.jsonString))
            }
        }
    }
}
