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
        
        describe("For BoxplotSerie") {
            let coordinateSystemValue = CoordinateSystem.parallel
            let xAxisIndexValue: UInt8 = 5
            let yAxisIndexValue: UInt8 = 255
            let nameValue1 = "boxplotSerieName"
            let legendHoverLinkValue = true
            let hoverAnimationValue = true
            let layoutValue = Orient.horizontal
            let boxWidthValue: SwiftyEcharts.Range = [40%, 90%]
            let itemStyleValue1 = ItemStyle(
                .normal(CommonItemStyleContent(
                    .borderColor(.hexColor("#fff")),
                    .borderWidth(1)
                    ))
            )
            let dataValue: [Jsonable] = [
                boxplotSerieData,
                [655, 850, 940, 980, 1175],
                "min"
            ]
            let markPointValue = MarkPoint(
                .data([
                    MarkData(
                        .type(.max),
                        .name("最大值")
                    ),
                    MarkData(
                        .type(.min),
                        .name("最小值")
                    )
                    ])
            )
            let markLineValue = MarkLine(
                .data([
                    MarkData(
                        .type(.average),
                        .name("平均值")
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
            let zlevelValue: Float = 7.912
            let zValue: Float = 10
            let silentValue = true
            let animationDurationValue: Float = 2.0
            let animationEasingValue = EasingFunction.cubicInOut
            let animationDelayValue: Float = 0.5
            let tooltipValue = Tooltip(
                .show(false),
                .showContent(false),
                .trigger(.none),
                .backgroundColor("#999"),
                .padding(50),
                .extraCssText("backgroundColor: red")
            )
            
            let boxplotSerie = BoxplotSerie()
            boxplotSerie.coordinateSystem = coordinateSystemValue
            boxplotSerie.xAxisIndex = xAxisIndexValue
            boxplotSerie.yAxisIndex = yAxisIndexValue
            boxplotSerie.name = nameValue1
            boxplotSerie.legendHoverLink = legendHoverLinkValue
            boxplotSerie.hoverAnimation = hoverAnimationValue
            boxplotSerie.layout = layoutValue
            boxplotSerie.boxWidth = boxWidthValue
            boxplotSerie.itemStyle = itemStyleValue1
            boxplotSerie.data = dataValue
            boxplotSerie.markPoint = markPointValue
            boxplotSerie.markLine = markLineValue
            boxplotSerie.markArea = markAreaValue
            boxplotSerie.zlevel = zlevelValue
            boxplotSerie.z = zValue
            boxplotSerie.silent = silentValue
            boxplotSerie.animationDuration = animationDurationValue
            boxplotSerie.animationEasing = animationEasingValue
            boxplotSerie.animationDelay = animationDelayValue
            boxplotSerie.tooltip = tooltipValue
            
            it("needs to check the type value") {
                expect(boxplotSerie.type.jsonString).to(equal(SerieType.boxplot.jsonString))
            }
            
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "type": SerieType.boxplot,
                    "coordinateSystem": coordinateSystemValue,
                    "xAxisIndex": xAxisIndexValue,
                    "yAxisIndex": yAxisIndexValue,
                    "name": nameValue1,
                    "legendHoverLink": legendHoverLinkValue,
                    "hoverAnimation": hoverAnimationValue,
                    "layout": layoutValue,
                    "boxWidth": boxWidthValue,
                    "itemStyle": itemStyleValue1,
                    "data": dataValue,
                    "markPoint": markPointValue,
                    "markLine": markLineValue,
                    "markArea": markAreaValue,
                    "zlevel": zlevelValue,
                    "z": zValue,
                    "silent": silentValue,
                    "animationDuration": animationDurationValue,
                    "animationEasing": animationEasingValue,
                    "animationDelay": animationDelayValue,
                    "tooltip": tooltipValue
                ]

                expect(boxplotSerie.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let boxplotSerieByEnums = BoxplotSerie(
                    .coordinateSystem(coordinateSystemValue),
                    .xAxisIndex(xAxisIndexValue),
                    .yAxisIndex(yAxisIndexValue),
                    .name(nameValue1),
                    .legendHoverLink(legendHoverLinkValue),
                    .hoverAnimation(hoverAnimationValue),
                    .layout(layoutValue),
                    .boxWidth(boxWidthValue),
                    .itemStyle(itemStyleValue1),
                    .data(dataValue),
                    .markPoint(markPointValue),
                    .markLine(markLineValue),
                    .markArea(markAreaValue),
                    .zlevel(zlevelValue),
                    .z(zValue),
                    .silent(silentValue),
                    .animationDuration(animationDurationValue),
                    .animationEasing(animationEasingValue),
                    .animationDelay(animationDelayValue),
                    .tooltip(tooltipValue)
                )
                
                expect(boxplotSerieByEnums.jsonString).to(equal(boxplotSerie.jsonString))
            }
        }
    }
}
