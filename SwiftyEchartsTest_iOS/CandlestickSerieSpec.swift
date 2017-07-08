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
        
        let candlestickSerieData = CandlestickSerie.Data()
        candlestickSerieData.name = nameDataValue
        candlestickSerieData.value = valueDataValue
        candlestickSerieData.itemStyle = itemStyleDataValue
        
        describe("For CandlesticSerie") { 
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "name": nameDataValue,
                    "value": valueDataValue,
                    "itemStyle": itemStyleDataValue
                ]
                
                expect(candlestickSerieData.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let candlestickSerieDataByEnums = CandlestickSerie.Data(
                    .name(nameDataValue),
                    .value(valueDataValue),
                    .itemStyle(itemStyleDataValue)
                )
                
                expect(candlestickSerieDataByEnums.jsonString).to(equal(candlestickSerieData.jsonString))
            }
        }
        
        let coordinateSystemValue = CoordinateSystem.geo
        let xAxisIndexValue: UInt8 = 0
        let yAxisIndexValue: UInt8 = 8
        let nameValue = "serieValue"
        let legendHoverLinkValue = false
        let hoverAnimationValue = true
        let layoutValue = Orient.horizontal
        let barWidthValue: Float = 1.414121
        let barMinWidthValue: Float = 3.141592653
        let barMaxWidthValue: Float = 7.4421
        let itemStyleValue = ItemStyle(
            .normal(CommonItemStyleContent(
                .color(.hexColor("#B3E4A1"))
                ))
        )
        let dataValue: [Jsonable] = [
            candlestickSerieData,
            "open", "close", "lowest", "hightest"
        ]
        let markPointValue = MarkPoint(
            .data([
                MarkData(
                    .name("年最高"),
                    .value(182.2),
                    .xAxis("7"),
                    .yAxis("183")
                ),
                MarkData(
                    .name("年最低"),
                    .value(2.3),
                    .xAxis("11"),
                    .yAxis("3")
                )
                ])
        )
        let markLineValue = MarkLine(
            .animation(false),
            .label(FormattedLabel(
                .normal(FormattedLabel.Style(
                    .formatter(.string("y = 0.5 * x + 3")),
                    .textStyle(TextStyle(
                        .align(.right)
                        ))
                    ))
                )),
            .lineStyle(EmphasisLineStyle(
                .normal(LineStyle(
                    .type(.solid)
                    ))
                )),
            .data([[
                MarkData(
                    .coord([0, 3]),
                    .symbol(.none)
                ),
                MarkData(
                    .coord([20, 13]),
                    .symbol(.none)
                )
                ]])
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
        let zlevelValue: Float = 8.7
        let zValue: Float = 90
        let silentValue = false
        let animationDurationValue: Time = 100
        let animationEasingValue = EasingFunction.circularIn
        let animationDelayValue: Time = 8.77283
        
        let candlestickSerie = CandlestickSerie()
        candlestickSerie.coordinateSystem = coordinateSystemValue
        candlestickSerie.xAxisIndex = xAxisIndexValue
        candlestickSerie.yAxisIndex = yAxisIndexValue
        candlestickSerie.name = nameValue
        candlestickSerie.legendHoverLink = legendHoverLinkValue
        candlestickSerie.hoverAnimation = hoverAnimationValue
        candlestickSerie.layout = layoutValue
        candlestickSerie.barWidth = barWidthValue
        candlestickSerie.barMinWidth = barMinWidthValue
        candlestickSerie.barMaxWidth = barMaxWidthValue
        candlestickSerie.itemStyle = itemStyleValue
        candlestickSerie.data = dataValue
        candlestickSerie.markPoint = markPointValue
        candlestickSerie.markLine = markLineValue
        candlestickSerie.markArea = markAreaValue
        candlestickSerie.zlevel = zlevelValue
        candlestickSerie.z = zValue
        candlestickSerie.silent = silentValue
        candlestickSerie.animationDuration = animationDurationValue
        candlestickSerie.animationEasing = animationEasingValue
        candlestickSerie.animationDelay = animationDelayValue
        
        it("needs to check the type value") {
            expect(candlestickSerie.type).to(equal(SerieType.candlestick))
        }

        it("needs to check the jsonString") {
            let resultDic: [String: Jsonable] = [
                "type": SerieType.candlestick,
                "coordinateSystem": coordinateSystemValue,
                "xAxisIndex": xAxisIndexValue,
                "yAxisIndex": yAxisIndexValue,
                "name": nameValue,
                "legendHoverLink": legendHoverLinkValue,
                "hoverAnimation": hoverAnimationValue,
                "layout": layoutValue,
                "barWidth": barWidthValue,
                "barMinWidth": barMinWidthValue,
                "barMaxWidth": barMaxWidthValue,
                "itemStyle": itemStyleValue,
                "data": dataValue,
                "markPoint": markPointValue,
                "markLine": markLineValue,
                "markArea": markAreaValue,
                "zlevel": zlevelValue,
                "z": zValue,
                "silent": silentValue,
                "animationDuration": animationDurationValue,
                "animationEasing": animationEasingValue,
                "animationDelay": animationDelayValue
            ]
            expect(candlestickSerie.jsonString).to(equal(resultDic.jsonString))
        }
        
        it("needs to check the Enumable") {
            let candlestickSerieByEnums = CandlestickSerie(
                .coordinateSystem(coordinateSystemValue),
                .xAxisIndex(xAxisIndexValue),
                .yAxisIndex(yAxisIndexValue),
                .name(nameValue),
                .legendHoverLink(legendHoverLinkValue),
                .hoverAnimation(hoverAnimationValue),
                .layout(layoutValue),
                .barWidth(barWidthValue),
                .barMinWidth(barMinWidthValue),
                .barMaxWidth(barMaxWidthValue),
                .itemStyle(itemStyleValue),
                .data(dataValue),
                .markPoint(markPointValue),
                .markLine(markLineValue),
                .markArea(markAreaValue),
                .zlevel(zlevelValue),
                .z(zValue),
                .silent(silentValue),
                .animationDuration(animationDurationValue),
                .animationEasing(animationEasingValue),
                .animationDelay(animationDelayValue)
            )
            
            expect(candlestickSerieByEnums.jsonString).to(equal(candlestickSerie.jsonString))
        }
        
    }
}
