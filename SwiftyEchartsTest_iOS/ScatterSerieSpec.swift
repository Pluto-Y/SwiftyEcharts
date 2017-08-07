//
//  ScatterSerieSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 08/08/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class ScatterSerieSpec: QuickSpec {
    override func spec() {
        let nameDataValue = "dataNameValue"
        let valueDataValue = "dataValueValue"
        let symbolOriginDataValue = Symbol.rect
        let symbolDataValue = OneOrMore<Symbol>(one: symbolOriginDataValue)
        let symbolSizeDataValue = FunctionOrFloatOrPair.value(20.582)
        let symbolRotateDataValue: Float = 7.75634
        let symbolOffsetDataValue: Point = [20.57, 57246]
        let labelDataValue = Label(
            .emphasis(CommonLabelStyle(
                .position(Position.point([0.0, 100%])),
                .textStyle(TextStyle(
                    .fontWeight(FontWeight.bold)
                    ))
                ))
        )
        let itemStyleDataValue = ItemStyle(
            .normal(CommonItemStyleContent(
                .borderColor(Color.hexColor("#090342")),
                .opacity(574.7437),
                .areaColor(Color.hexColor("#ffffff")),
                .shadowOffsetY(0.000757)
                ))
        )
        
        let data = ScatterSerie.Data()
        data.name = nameDataValue
        data.value = valueDataValue
        data.symbol = symbolDataValue
        data.symbolSize = symbolSizeDataValue
        data.symbolRotate = symbolRotateDataValue
        data.symbolOffset = symbolOffsetDataValue
        data.label = labelDataValue
        data.itemStyle = itemStyleDataValue
        
        describe("For ScatterSerie.Data") {
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
                let dataByEnums = ScatterSerie.Data(
                    .name(nameDataValue),
                    .value(valueDataValue),
                    .symbol(symbolOriginDataValue),
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











































