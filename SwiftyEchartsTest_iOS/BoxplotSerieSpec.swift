//
//  BoxplotSerieSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 04/07/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class BoxplotSerieSpec: QuickSpec {
    override func spec() {
        let nameValue: String = "boxplotSerieData"
        let valueValue: [Jsonable] = ["min", "Q1", "median", "Q3", "max"].map { $0 as Jsonable}
        let itemStyleValue = ItemStyle(
            .normal(CommonItemStyleContent(
                .color(Color.hexColor("#ff3396")),
                .opacity(0.762),
                .shadowBlur(12.5),
                .borderType(.solid)
                )),
            .emphasis(CommonItemStyleContent(
                .shadowOffsetX(1.2),
                .barBorderRadius(5)
                ))
        )

        let boxplotSerieData = BoxplotSerie.Data()
        boxplotSerieData.name = nameValue
        boxplotSerieData.value = valueValue
        boxplotSerieData.itemStyle = itemStyleValue

        describe("For BoxplotSerie.Data") { 
            it("needs to check the jsonString") {
                let resultDit: [String: Jsonable] = [
                    "name": nameValue,
                    "value": valueValue,
                    "itemStyle": itemStyleValue
                ]
                
                expect(boxplotSerieData.jsonString).to(equal(resultDit.jsonString))
            }
            
            it("needs to check the Enumable") {
                let boxplotSerieDataByEnums = BoxplotSerie.Data(
                    .name(nameValue),
                    .value(valueValue),
                    .itemStyle(itemStyleValue)
                )
                
                expect(boxplotSerieDataByEnums.jsonString).to(equal(boxplotSerieData.jsonString))
            }
        }
    }
}
