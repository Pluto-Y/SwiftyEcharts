//
//  MarkDataSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 25/07/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class MarkDataSpec: QuickSpec {
    override func spec() {
        describe("For MarkData") {
            let nameValue = "markDataNameValue"
            let typeValue = MarkDataType.average
            let valueIndexValue: UInt = 82
            let valueDimValue = "close"
            let coordValue: [Jsonable] = [1, 3, 10, 24, 482]
            let xValue = 283
            let yValue = 10%
            let xAxisValue = "markDataXAxisValue"
            let yAxisValue = "yAxisValueOfMarkData"
            let valueValue: Float = 2587347
            let symbolValue = Symbol.triangle
            let symbolSizeValue = 20%
            let symbolRotateValue: Float = 275
            let symbolOffsetValue: Point = [0, 50%]
            let lineStyleValue = EmphasisLineStyle(
                .normal(LineStyle(
                    .color(Color.transparent),
                    .width(28.4)
                    ))
            )
            let labelValue = FormattedLabel(
                .normal(FormattedLabelStyle(
                    .show(true),
                    .position(.outside),
                    .offset([10, 0]),
                    .textStyle(TextStyle(
                        .fontSize(6)
                        ))
                    ))
            )
            
            let markData = MarkData()
            markData.name = nameValue
            markData.type = typeValue
            markData.valueIndex = valueIndexValue
            markData.valueDim = valueDimValue
            markData.coord = coordValue
            markData.x = xValue
            markData.y = yValue
            markData.xAxis = xAxisValue
            markData.yAxis = yAxisValue
            markData.value = valueValue
            markData.symbol = symbolValue
            markData.symbolSize = symbolSizeValue
            markData.symbolRotate = symbolRotateValue
            markData.symbolOffset = symbolOffsetValue
            markData.lineStyle = lineStyleValue
            markData.label = labelValue
            
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "name": nameValue,
                    "type": typeValue,
                    "valueIndex": valueIndexValue,
                    "valueDim": valueDimValue,
                    "coord": coordValue,
                    "x": xValue,
                    "y": yValue,
                    "xAxis": xAxisValue,
                    "yAxis": yAxisValue,
                    "value": valueValue,
                    "symbol": symbolValue,
                    "symbolSize": symbolSizeValue,
                    "symbolRotate": symbolRotateValue,
                    "symbolOffset": symbolOffsetValue,
                    "lineStyle": lineStyleValue,
                    "label": labelValue
                ]
                
                expect(markData.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let markDataByEnums = MarkData(
                    .name(nameValue),
                    .type(typeValue),
                    .valueIndex(valueIndexValue),
                    .valueDim(valueDimValue),
                    .coord(coordValue),
                    .x(xValue),
                    .y(yValue),
                    .xAxis(xAxisValue),
                    .yAxis(yAxisValue),
                    .value(valueValue),
                    .symbol(symbolValue),
                    .symbolSize(symbolSizeValue),
                    .symbolRotate(symbolRotateValue),
                    .symbolOffset(symbolOffsetValue),
                    .lineStyle(lineStyleValue),
                    .label(labelValue)
                )
                
                expect(markDataByEnums.jsonString).to(equal(markData.jsonString))
            }
        }
    }
}
