//
//  BarSerieSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 02/07/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class BarSerieSpec: QuickSpec {
    override func spec() {
        let nameValue = "nameValue"
        let valueValue: Float = 3.1314
        let labelValue = FormattedLabel(
            .normal(FormattedLabelStyle(
                .position(.inside),
                .formatter(.string("{c}%")),
                .textStyle(TextStyle(
                    .color(.hexColor("#fff"))
                    ))
                )),
            .emphasis(FormattedLabelStyle(
                .position(.inside),
                .formatter(.string("{b}实际: {c}%"))
                ))
        )
        let itemStyleValue = ItemStyle(
            .normal(CommonItemStyleContent(
                .opacity(0.8),
                .shadowBlur(10),
                .shadowOffsetX(0),
                .shadowOffsetY(0),
                .shadowColor(.rgba(0, 0, 0, 0.5))
                ))
        )
        
        let barSerieData = BarSerie.Data()
        barSerieData.name = nameValue
        barSerieData.value = valueValue
        barSerieData.label = labelValue
        barSerieData.itemStyle = itemStyleValue
        
        describe("For BarSerie.Data") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "name": nameValue,
                    "value": valueValue,
                    "label": labelValue,
                    "itemStyle": itemStyleValue
                ]
                
                expect(barSerieData.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let barSerieDataByEnums = BarSerie.Data(
                    .name(nameValue),
                    .value(valueValue),
                    .label(labelValue),
                    .itemStyle(itemStyleValue)
                )
                
                expect(barSerieDataByEnums.jsonString).to(equal(barSerieData.jsonString))
            }
        }
    }
}
