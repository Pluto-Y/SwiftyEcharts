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
        let labelDataValue = EmphasisLabel(
            .normal(LabelStyle(
                .position(.end),
                .show(false),
                .fontFamily("dataLabelFontFamily")
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
        
        describe("For LineSerie.SmoothMonotone") {
            let xString = "x"
            let yString = "y"
            let xSmoothMonotone = LineSerie.SmoothMonotone.x
            let ySmoothMonotone = LineSerie.SmoothMonotone.y
            
            it("needs to check the enum case") {
                expect(xSmoothMonotone.jsonString).to(equal(xString.jsonString))
                expect(ySmoothMonotone.jsonString).to(equal(yString.jsonString))
            }
        }
        
        describe("For LineSerie") {
            let nameValue = "lineSerieNameValue"
            let coordinateSystemValue = CoordinateSystem.parallel
            let xAxisIndexValue: UInt = 293
            let yAxisIndexValue: UInt = 8394
            let polarIndexValue: UInt = 382
            let symbolOriginValues = Symbol.none
            let symbolValue = OneOrMore(one: symbolOriginValues)
            let symbolSizeValue = FunctionOrFloatOrPair.point([20,20%])
            let symbolRotateValue: Float = 83.82
            let symbolOffsetValue: Point = [0, 0]
            let showSymbolValue = false
            let showAllSymbolValue = true
            let hoverAnimationValue = false
            let legendHoverLinkValue = false
            let stackValue = "lineSerieStack"
            let connectNullsValue = false
            let clipOverflowValue = true
            let stepValue = LineSerie.Step.middle
            let labelValue = EmphasisLabel(
                .emphasis(LabelStyle(
                    .fontStyle(.italic),
                    .fontWeight(.bold),
                    .height(20000),
                    .fontSize(200),
                    .align(Align.auto)
                    ))
            )
            let itemStyleValue = ItemStyle(
                .normal(CommonItemStyleContent(
                    .borderWidth(284.2),
                    .shadowBlur(0.02832)
                    ))
            )
            let lineStyleValue = EmphasisLineStyle(
                .normal(LineStyle(
                    .color(.hexColor("#823548")),
                    .shadowColor(rgba(200, 1, 255, 0.43))
                    )),
                .emphasis(LineStyle())
            )
            let areaStyleValue = EmphasisAreaStyle(
                .emphasis(CommonAreaStyleContent(
                    .shadowOffsetX(28.38),
                    .shadowBlur(8.8888)
                    )),
                .normal(CommonAreaStyleContent(
                    .opacity(0.284),
                    .shadowColor(rgb(2, 3, 4))
                    ))
            )
            let smoothValue = false
            let smoothMonotoneValue = LineSerie.SmoothMonotone.y
            let samplingValue = LineSerie.Sampling.average
            let dataValue: [Jsonable] = [
                [  3.4,    4.5,   15,   43],
                [  4.2,    2.3,   20,   91],
                [  10.8,   9.5,   30,   18],
                [  7.2,    8.8,   18,   57]
            ]
            let markPointValue = MarkPoint(
                .data([
                    MarkData(
                        .name("周最低"),
                        .value(-2),
                        .xAxis("1"),
                        .yAxis("-1.5")
                    )
                    ])
            )
            let markLineValue = MarkLine(
                .symbol(.none),
                .lineStyle(EmphasisLineStyle(
                    .normal(LineStyle(
                        .opacity(0.3)
                        ))
                    )),
                .data([
                    MarkData(
                        .type(.max),
                        .label(FormattedLabel(
                            .normal(FormattedLabelStyle(
                                .formatter(.string("max: {c}"))
                                ))
                            ))
                    ),
                    MarkData(
                        .type(.min),
                        .label(FormattedLabel(
                            .normal(FormattedLabelStyle(
                                .formatter(.string("min: {c}"))
                                ))
                            ))
                    )
                    ])
            )
            let markAreaValue = MarkArea(
                .data([
                    [
                        [
                            "name": "早高峰",
                            "xAxis": "07:30"
                        ], [
                            "xAxis": "10:00"
                        ]
                    ],
                    [
                        [
                            "name": "晚高峰",
                            "xAxis": "17:30"
                        ], [
                            "xAxis": "21:15"
                        ]
                    ]
                    ])
            )
            let zlevelValue: Float = 25.334
            let zValue: Float = 8.238
            let silentValue = true
            let animationValue = false
            let animationThresholdValue: Float = 2.83703743
            let animationDurationValue: Time = 85.283
            let animationEasingValue = EasingFunction.quadraticInOut
            let animationDelayValue: Time = 28
            let animationDurationUpdateValue = Time.number(222222)
            let animationEasingUpdateValue = EasingFunction.backIn
            let animationDelayUpdateValue = Time.init(integerLiteral: 6)
            
            let lineSerie = LineSerie()
            lineSerie.name = nameValue
            lineSerie.coordinateSystem = coordinateSystemValue
            lineSerie.xAxisIndex = xAxisIndexValue
            lineSerie.yAxisIndex = yAxisIndexValue
            lineSerie.polarIndex = polarIndexValue
            lineSerie.symbol = symbolValue
            lineSerie.symbolSize = symbolSizeValue
            lineSerie.symbolRotate = symbolRotateValue
            lineSerie.symbolOffset = symbolOffsetValue
            lineSerie.showSymbol = showSymbolValue
            lineSerie.showAllSymbol = showAllSymbolValue
            lineSerie.hoverAnimation = hoverAnimationValue
            lineSerie.legendHoverLink = legendHoverLinkValue
            lineSerie.stack = stackValue
            lineSerie.connectNulls = connectNullsValue
            lineSerie.clipOverflow = clipOverflowValue
            lineSerie.step = stepValue
            lineSerie.label = labelValue
            lineSerie.itemStyle = itemStyleValue
            lineSerie.lineStyle = lineStyleValue
            lineSerie.areaStyle = areaStyleValue
            lineSerie.smooth = smoothValue
            lineSerie.smoothMonotone = smoothMonotoneValue
            lineSerie.sampling = samplingValue
            lineSerie.data = dataValue
            lineSerie.markPoint = markPointValue
            lineSerie.markLine = markLineValue
            lineSerie.markArea = markAreaValue
            lineSerie.zlevel = zlevelValue
            lineSerie.z = zValue
            lineSerie.silent = silentValue
            lineSerie.animation = animationValue
            lineSerie.animationThreshold = animationThresholdValue
            lineSerie.animationDuration = animationDurationValue
            lineSerie.animationEasing = animationEasingValue
            lineSerie.animationDelay = animationDelayValue
            lineSerie.animationDurationUpdate = animationDurationUpdateValue
            lineSerie.animationEasingUpdate = animationEasingUpdateValue
            lineSerie.animationDelayUpdate = animationDelayUpdateValue
            
            it("needs to check the type value") {
                expect(lineSerie.type).to(equal(SerieType.line))
            }
            
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "type": SerieType.line,
                    "name": nameValue,
                    "coordinateSystem": coordinateSystemValue,
                    "xAxisIndex": xAxisIndexValue,
                    "yAxisIndex": yAxisIndexValue,
                    "polarIndex": polarIndexValue,
                    "symbol": symbolValue,
                    "symbolSize": symbolSizeValue,
                    "symbolRotate": symbolRotateValue,
                    "symbolOffset": symbolOffsetValue,
                    "showSymbol": showSymbolValue,
                    "showAllSymbol": showAllSymbolValue,
                    "hoverAnimation": hoverAnimationValue,
                    "legendHoverLink": legendHoverLinkValue,
                    "stack": stackValue,
                    "connectNulls": connectNullsValue,
                    "clipOverflow": clipOverflowValue,
                    "step": stepValue,
                    "label": labelValue,
                    "itemStyle": itemStyleValue,
                    "lineStyle": lineStyleValue,
                    "areaStyle": areaStyleValue,
                    "smooth": smoothValue,
                    "smoothMonotone": smoothMonotoneValue,
                    "sampling": samplingValue,
                    "data": dataValue,
                    "markPoint": markPointValue,
                    "markLine": markLineValue,
                    "markArea": markAreaValue,
                    "zlevel": zlevelValue,
                    "z": zValue,
                    "silent": silentValue,
                    "animation": animationValue,
                    "animationThreshold": animationThresholdValue,
                    "animationDuration": animationDurationValue,
                    "animationEasing": animationEasingValue,
                    "animationDelay": animationDelayValue,
                    "animationDurationUpdate": animationDurationUpdateValue,
                    "animationEasingUpdate": animationEasingUpdateValue,
                    "animationDelayUpdate": animationDelayUpdateValue
                ]
                
                expect(lineSerie.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let lineSerieByEnums = LineSerie(
                    .name(nameValue),
                    .coordinateSystem(coordinateSystemValue),
                    .xAxisIndex(xAxisIndexValue),
                    .yAxisIndex(yAxisIndexValue),
                    .polarIndex(polarIndexValue),
                    .symbol(symbolOriginValues),
                    .symbolSize(symbolSizeValue),
                    .symbolRotate(symbolRotateValue),
                    .symbolOffset(symbolOffsetValue),
                    .showSymbol(showSymbolValue),
                    .showAllSymbol(showAllSymbolValue),
                    .hoverAnimation(hoverAnimationValue),
                    .legendHoverLink(legendHoverLinkValue),
                    .stack(stackValue),
                    .connectNulls(connectNullsValue),
                    .clipOverflow(clipOverflowValue),
                    .step(stepValue),
                    .label(labelValue),
                    .itemStyle(itemStyleValue),
                    .lineStyle(lineStyleValue),
                    .areaStyle(areaStyleValue),
                    .smooth(smoothValue),
                    .smoothMonotone(smoothMonotoneValue),
                    .sampling(samplingValue),
                    .data(dataValue),
                    .markPoint(markPointValue),
                    .markLine(markLineValue),
                    .markArea(markAreaValue),
                    .zlevel(zlevelValue),
                    .z(zValue),
                    .silent(silentValue),
                    .animation(animationValue),
                    .animationThreshold(animationThresholdValue),
                    .animationDuration(animationDurationValue),
                    .animationEasing(animationEasingValue),
                    .animationDelay(animationDelayValue),
                    .animationDurationUpdate(animationDurationUpdateValue),
                    .animationEasingUpdate(animationEasingUpdateValue),
                    .animationDelayUpdate(animationDelayUpdateValue)
                )
                
                expect(lineSerieByEnums.jsonString).to(equal(lineSerie.jsonString))
            }
        }
    }
}
