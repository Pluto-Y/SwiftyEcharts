//
//  MarkLineSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 26/07/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class MarkLineSpec: QuickSpec {
    override func spec() {
        describe("For MarkLine") {
            let silentValue = false
            let symbolOriginValue = Symbol.arrow
            let symbolValue = OneOrMore(one: symbolOriginValue)
            let symbolSizeValue = FunctionOrFloatOrPair.value(285735)
            let precisionValue: Float = 93.457
            let labelValue = FormattedLabel(
                .normal(FormattedLabelStyle(
                    .show(false),
                    .position(Position.point([37.57, 29%])),
                    .formatter(.string("barin")),
                    .offset([2, 302])
                    ))
            )
            let lineStyleValue = EmphasisLineStyle(
                .emphasis(LineStyle(
                    .color(Color.transparent),
                    .width(2845.73),
                    .type(LineType.solid),
                    .opacity(0.375)
                    ))
            )
            let dataValue: [Jsonable] = [
                [
                    "name": "平均线",
                    "type": "average"
                ],
                [
                    "name": "Y 轴值为 100 的水平线",
                    "yAxis": 100
                ],
                [
                    [
                        "name": "最小值到最大值",
                        "type": "min"
                    ],
                    [
                        "type": "max"
                    ]
                ],
                [
                    [
                        "name": "两个坐标之间的标线",
                        "coord": [10, 20]
                    ],
                    [
                        "coord": [20, 30]
                    ]
                ], [[
                    "yAxis": "max",
                    "x": "90%"
                    ], [
                        "type": "max"
                    ]],
                   [
                    [
                        "name": "两个屏幕坐标之间的标线",
                        "x": 100,
                        "y": 100
                    ],
                    [
                        "x": 500,
                        "y": 200
                    ]
                ]
            ]
            let animationValue = false
            let animationThresholdValue: Float = 8563
            let animationDurationValue = Time.number(48)
            let animationEasingValue = EasingFunction.sinusoidalOut
            let animationDelayValue: Time = 85.24
            let animationDurationUpdateValue: Time = 10000
            let animationEasingUpdateValue = EasingFunction.backIn
            let animationDelayUpdateValue = Time.number(284.2)
            
            let markLine = MarkLine()
            markLine.silent = silentValue
            markLine.symbol = symbolValue
            markLine.symbolSize = symbolSizeValue
            markLine.precision = precisionValue
            markLine.label = labelValue
            markLine.lineStyle = lineStyleValue
            markLine.data = dataValue
            markLine.animation = animationValue
            markLine.animationThreshold = animationThresholdValue
            markLine.animationDuration = animationDurationValue
            markLine.animationEasing = animationEasingValue
            markLine.animationDelay = animationDelayValue
            markLine.animationDurationUpdate = animationDurationUpdateValue
            markLine.animationEasingUpdate = animationEasingUpdateValue
            markLine.animationDelayUpdate = animationDelayUpdateValue
            
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "silent": silentValue,
                    "symbol": symbolValue,
                    "symbolSize": symbolSizeValue,
                    "precision": precisionValue,
                    "label": labelValue,
                    "lineStyle": lineStyleValue,
                    "data": dataValue,
                    "animation": animationValue,
                    "animationThreshold": animationThresholdValue,
                    "animationDuration": animationDurationValue,
                    "animationEasing": animationEasingValue,
                    "animationDelay": animationDelayValue,
                    "animationDurationUpdate": animationDurationUpdateValue,
                    "animationEasingUpdate": animationEasingUpdateValue,
                    "animationDelayUpdate": animationDelayUpdateValue
                ]
                
                expect(markLine.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the jsonString") {
                let markLineByEnums = MarkLine(
                    .silent(silentValue),
                    .symbol(symbolOriginValue),
                    .symbolSize(symbolSizeValue),
                    .precision(precisionValue),
                    .label(labelValue),
                    .lineStyle(lineStyleValue),
                    .data(dataValue),
                    .animation(animationValue),
                    .animationThreshold(animationThresholdValue),
                    .animationDuration(animationDurationValue),
                    .animationEasing(animationEasingValue),
                    .animationDelay(animationDelayValue),
                    .animationDurationUpdate(animationDurationUpdateValue),
                    .animationEasingUpdate(animationEasingUpdateValue),
                    .animationDelayUpdate(animationDelayUpdateValue)
                )
                
                expect(markLineByEnums.jsonString).to(equal(markLine.jsonString))
            }
            
            it("needs to check the symbol enum case") {
                let symbolOriginValues = [Symbol.pin, Symbol.circle]
                markLine.symbol = OneOrMore(more: symbolOriginValues)
                let markLineByEnums = MarkLine(
                    .silent(silentValue),
                    .symbols(symbolOriginValues),
                    .symbolSize(symbolSizeValue),
                    .precision(precisionValue),
                    .label(labelValue),
                    .lineStyle(lineStyleValue),
                    .data(dataValue),
                    .animation(animationValue),
                    .animationThreshold(animationThresholdValue),
                    .animationDuration(animationDurationValue),
                    .animationEasing(animationEasingValue),
                    .animationDelay(animationDelayValue),
                    .animationDurationUpdate(animationDurationUpdateValue),
                    .animationEasingUpdate(animationEasingUpdateValue),
                    .animationDelayUpdate(animationDelayUpdateValue)
                )
            
                expect(markLineByEnums.jsonString).to(equal(markLine.jsonString))
            }
        }
    }
}
