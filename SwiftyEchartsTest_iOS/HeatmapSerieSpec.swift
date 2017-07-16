//
//  HeatmapSerieSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 16/07/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class HeatmapSerieSpec: QuickSpec {
    override func spec() {
        
        let nameDataValue = "dataNameValue"
        let valueDataValue: [Jsonable] = ["周一", "周二", "周三"]
        let labelDataValue = Label(
            .normal(CommonLabelStyle(
                .show(true),
                .position(.top)
                ))
        )
        let itemStyleDataValue = ItemStyle(
            .normal(CommonItemStyleContent(
                .opacity(0.7),
                .color(.hexColor("#332342")),
                .borderWidth(3),
                .borderColor(.hexColor("#235894"))
                ))
        )
        
        let data = HeatmapSerie.Data()
        data.name = nameDataValue
        data.value = valueDataValue
        data.label = labelDataValue
        data.itemStyle = itemStyleDataValue
        
        describe("For HeatmapSerie.Data") {
            
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "name": nameDataValue,
                    "value": valueDataValue,
                    "label": labelDataValue,
                    "itemStyle": itemStyleDataValue
                ]
                
                expect(data.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let dataByEnums = HeatmapSerie.Data(
                    .name(nameDataValue),
                    .value(valueDataValue),
                    .label(labelDataValue),
                    .itemStyle(itemStyleDataValue)
                )
                
                expect(dataByEnums.jsonString).to(equal(data.jsonString))
            }
        }
    }
}
