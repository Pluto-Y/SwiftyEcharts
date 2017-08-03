//
//  RadarSerieSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 03/08/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class RadarSerieSpec: QuickSpec {
    override func spec() {
        let nameDataValue = "dataNameValue"
        let valueDataValue: Jsonable = 74.7263
        let symbolDataOrignValue = Symbol.emptyCircle
        let symbolDataValue = OneOrMore(one: symbolDataOrignValue)
        let symbolSizeDataValue: FunctionOrFloatOrPair = [20, 30]
        let symbolRotateDataValue: Float = 75.364
        let symbolOffsetDataValue: Point = [10%, 50%]
        let labelDataValue = FormattedLabel(
            .emphasis(FormattedLabelStyle(
                .show(false),
                .position(Position.point([20, 100])),
                .offset([10%, 5])
                )),
            .normal(FormattedLabelStyle(
                .show(true)
                ))
        )
        let itemStyleDataValue = ItemStyle(
            .normal(CommonItemStyleContent(
                .color(Color.array([Color.auto, Color.transparent])),
                .borderWidth(7564.746),
                .shadowOffsetY(1.0)
                ))
        )
        let lineStyleDataValue = EmphasisLineStyle(
            .emphasis(LineStyle(
                .type(LineType.dashed),
                .opacity(0.48573),
                .curveness(1.2847)
                ))
        )
        let areaStyleDataValue = EmphasisAreaStyle(
            .normal(CommonAreaStyleContent(
                .opacity(0.57362),
                .color(Color.green),
                .shadowColor(Color.red)
                ))
        )
        
        let data = RadarSerie.Data()
        data.name = nameDataValue
        data.value = valueDataValue
        data.symbol = symbolDataValue
        data.symbolSize = symbolSizeDataValue
        data.symbolRotate = symbolRotateDataValue
        data.symbolOffset = symbolOffsetDataValue
        data.label = labelDataValue
        data.itemStyle = itemStyleDataValue
        data.lineStyle = lineStyleDataValue
        data.areaStyle = areaStyleDataValue
        
        
        describe("For RadarSerie.Data") { 
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "name": nameDataValue,
                    "value": valueDataValue,
                    "symbol": symbolDataValue,
                    "symbolSize": symbolSizeDataValue,
                    "symbolRotate": symbolRotateDataValue,
                    "symbolOffset": symbolOffsetDataValue,
                    "label": labelDataValue,
                    "itemStyle": itemStyleDataValue,
                    "lineStyle": lineStyleDataValue,
                    "areaStyle": areaStyleDataValue
                ]
                
                expect(data.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let dataByEnums = RadarSerie.Data(
                    .name(nameDataValue),
                    .value(valueDataValue),
                    .symbol(symbolDataOrignValue),
                    .symbolSize(symbolSizeDataValue),
                    .symbolRotate(symbolRotateDataValue),
                    .symbolOffset(symbolOffsetDataValue),
                    .label(labelDataValue),
                    .itemStyle(itemStyleDataValue),
                    .lineStyle(lineStyleDataValue),
                    .areaStyle(areaStyleDataValue)
                )
                
                expect(dataByEnums.jsonString).to(equal(data.jsonString))
            }
        }
    }
}
