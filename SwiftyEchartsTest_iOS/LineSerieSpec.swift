//
//  LineSerieSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 20/07/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class LineSerieSpec: QuickSpec {
    override func spec() {
        describe("For LineSerie.Sampling") {
            let averageString = "average"
            let maxString = "max"
            let minString = "min"
            let sumString = "sum"
            
            let averageSampling = LineSerie.Sampling.average
            let maxSampling = LineSerie.Sampling.max
            let minSampling = LineSerie.Sampling.min
            let sumSampling = LineSerie.Sampling.sum
            
            it("needs to check the enum case") {
                expect(averageSampling.jsonString).to(equal(averageString.jsonString))
                expect(maxSampling.jsonString).to(equal(maxString.jsonString))
                expect(minSampling.jsonString).to(equal(minString.jsonString))
                expect(sumSampling.jsonString).to(equal(sumString.jsonString))
            }
        }
        
        let nameDataValue = "nameDataValue"
        let valueDataValue: Float = 20.482
        let symbolOriginValue = Symbol.diamond
        let symbolDataValue = OneOrMore(one: symbolOriginValue)
        let symbolSizeDataValue = FunctionOrFloatOrPair.init(floatLiteral: 28.48)
        let symbolRotateDataValue: Float = 999.2832
        let symbolOffsetDataValue: Point = [28%, 0.0]
        let labelDataValue = Label(
            .normal(CommonLabelStyle(
                .position(.end),
                .show(false)
            ))
        )
        let itemStyleDataValue = ItemStyle(
            .normal(CommonItemStyleContent(
                .color(.hexColor("#888999"))
            )),
            .emphasis(CommonItemStyleContent(
                .shadowOffsetX(28.38)
            ))
        )
        
        let data = LineSerie.Data()
        data.name = nameDataValue
        data.value = valueDataValue
        data.symbol = symbolDataValue
        data.symbolSize = symbolSizeDataValue
        data.symbolRotate = symbolRotateDataValue
        data.symbolOffset = symbolOffsetDataValue
        data.label = labelDataValue
        data.itemStyle = itemStyleDataValue
        
        describe("For LineSerie.Data") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "name": nameDataValue,
                    "value": valueDataValue,
                    "symbol": symbolDataValue,
                    "symbolSize": symbolSizeDataValue,
                    "symbolRotate": symbolRotateDataValue,
                    "symbolOffset": symbolOffsetDataValue,
                    "label": labelDataValue,
                    "itemStyle": itemStyleDataValue
                ]
                
                expect(data.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let dataByEnums = LineSerie.Data(
                    .name(nameDataValue),
                    .value(valueDataValue),
                    .symbol(symbolOriginValue),
                    .symbolSize(symbolSizeDataValue),
                    .symbolRotate(symbolRotateDataValue),
                    .symbolOffset(symbolOffsetDataValue),
                    .label(labelDataValue),
                    .itemStyle(itemStyleDataValue)
                )
                
                expect(dataByEnums.jsonString).to(equal(data.jsonString))
                
            }
        }
    }
}
