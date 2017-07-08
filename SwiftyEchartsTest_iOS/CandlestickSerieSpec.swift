//
//  CandlestickSerieSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 08/07/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class CandlestickSerieSpec: QuickSpec {
    override func spec() {
        let nameDataValue = "dataNameValue"
        let valueDataValue: [Jsonable] = ["open", "close", "lowest", "hightest"]
        let itemStyleDataValue = ItemStyle(
            .emphasis(CommonItemStyleContent(
                .color(Color.red),
                .areaColor(Color.yellow),
                .opacity(0.78)
                ))
        )
        
        let candlesticSerieData = CandlestickSerie.Data()
        candlesticSerieData.name = nameDataValue
        candlesticSerieData.value = valueDataValue
        candlesticSerieData.itemStyle = itemStyleDataValue
        
        describe("For CandlesticSerie") { 
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "name": nameDataValue,
                    "value": valueDataValue,
                    "itemStyle": itemStyleDataValue
                ]
                
                expect(candlesticSerieData.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let candlesticSerieDataByEnums = CandlestickSerie.Data(
                    .name(nameDataValue),
                    .value(valueDataValue),
                    .itemStyle(itemStyleDataValue)
                )
                
                expect(candlesticSerieDataByEnums.jsonString).to(equal(candlesticSerieData.jsonString))
            }
        }
    }
}
