//
//  BarSerieSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 02/07/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class BarSerieSpec: QuickSpec {
    override func spec() {
        let nameValue = "nameValue"
        let valueValue: Float = 3.1314
        let labelValue = FormattedLabel(
            .normal(FormattedLabelStyle(
                .position(.inside),
                .formatter(.string("{c}%")),
                .textStyle(TextStyle(
                    .color(.hexColor("#fff"))
                    ))
                )),
            .emphasis(FormattedLabelStyle(
                .position(.inside),
                .formatter(.string("{b}实际: {c}%"))
                ))
        )
        let itemStyleValue = ItemStyle(
            .normal(CommonItemStyleContent(
                .opacity(0.8),
                .shadowBlur(10),
                .shadowOffsetX(0),
                .shadowOffsetY(0),
                .shadowColor(.rgba(0, 0, 0, 0.5))
                ))
        )
        
        let barSerieData = BarSerie.Data()
        barSerieData.name = nameValue
        barSerieData.value = valueValue
        barSerieData.label = labelValue
        barSerieData.itemStyle = itemStyleValue
        
        describe("For BarSerie.Data") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "name": nameValue,
                    "value": valueValue,
                    "label": labelValue,
                    "itemStyle": itemStyleValue
                ]
                
                expect(barSerieData.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let barSerieDataByEnums = BarSerie.Data(
                    .name(nameValue),
                    .value(valueValue),
                    .label(labelValue),
                    .itemStyle(itemStyleValue)
                )
                
                expect(barSerieDataByEnums.jsonString).to(equal(barSerieData.jsonString))
            }
        }
        
        describe("For BarSerie") {
            let nameValue = "BarSerieNameValue"
            let legendHoverLineValue = false
            let coordinateSystemValue = CoordinateSystem.cartesian2d
            let xAxisIndexValue: UInt8 = 5
            let yAxisIndexValue: UInt8 = 12
            let labelValue = EmphasisLabel(
                .emphasis(LabelStyle(
                    .show(true),
                    .formatter(.string("function (param) {return param.data[3];}")),
                    .position(.top),
                    .width(20%),
                    .verticalAlign(VerticalAlign.bottom),
                    .fontStyle(FontStyle.oblique)
                    ))
            )
            let itemStyleValue = ItemStyle(
                .normal(CommonItemStyleContent(
                    .borderWidth(1),
                    .borderColor(.hexColor("#aaa"))
                    ))
            )
            let stackValue = "stackValue"
            let barWidthValue = 12%
            let barMaxWidthValue = 80%
            let barMinHeightValue: Float = 5
            let barGapValue = 20%
            let barCategoryGapValue = 10%
            let dataValue: [Jsonable] = [
                barSerieData,
                "周一",
                "周二",
                "周三"
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
            let areaData1: [Jsonable] = [[["xAxis": "2009/9/12/\\n7:00"], ["xAxis": "2009/9/22\\n7:00"]]]
            let markAreaValue = MarkArea(
                .silent(true),
                .data(areaData1)
            )
            let zlevelValue: Float = 8
            let zValue: Float = 9.22
            let silentValue = true
            let animationValue = true
            let animationThresholdValue: Float = 2.87
            let animationDurationValue = Time.number(25.86)
            let animationEasingValue = EasingFunction.backOut
            let animationDelayValue = Time.number(20.5)
            let animationDurationUpdateValue = Time.number(0.0)
            let animationEasingUpdateValue = EasingFunction.cubicInOut
            let animationDelayUpdateValue = Time.number(9.99)
            let barSerie = BarSerie()
            barSerie.name = nameValue
            barSerie.legendHoverLine = legendHoverLineValue
            barSerie.coordinateSystem = coordinateSystemValue
            barSerie.xAxisIndex = xAxisIndexValue
            barSerie.yAxisIndex = yAxisIndexValue
            barSerie.label = labelValue
            barSerie.itemStyle = itemStyleValue
            barSerie.stack = stackValue
            barSerie.barWidth = barWidthValue
            barSerie.barMaxWidth = barMaxWidthValue
            barSerie.barMinHeight = barMinHeightValue
            barSerie.barGap = barGapValue
            barSerie.barCategoryGap = barCategoryGapValue
            barSerie.data = dataValue
            barSerie.markPoint = markPointValue
            barSerie.markLine = markLineValue
            barSerie.markArea = markAreaValue
            barSerie.zlevel = zlevelValue
            barSerie.z = zValue
            barSerie.silent = silentValue
            barSerie.animation = animationValue
            barSerie.animationThreshold = animationThresholdValue
            barSerie.animationDuration = animationDurationValue
            barSerie.animationEasing = animationEasingValue
            barSerie.animationDelay = animationDelayValue
            barSerie.animationDurationUpdate = animationDurationUpdateValue
            barSerie.animationEasingUpdate = animationEasingUpdateValue
            barSerie.animationDelayUpdate = animationDelayUpdateValue
            
            it("needs to check the type value") {
               expect(barSerie.type).to(equal(SerieType.bar))
            }
            
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "type": SerieType.bar,
                    "name": nameValue,
                    "legendHoverLine": legendHoverLineValue,
                    "coordinateSystem": coordinateSystemValue,
                    "xAxisIndex": xAxisIndexValue,
                    "yAxisIndex": yAxisIndexValue,
                    "label": labelValue,
                    "itemStyle": itemStyleValue,
                    "stack": stackValue,
                    "barWidth": barWidthValue,
                    "barMaxWidth": barMaxWidthValue,
                    "barMinHeight": barMinHeightValue,
                    "barGap": barGapValue,
                    "barCategoryGap": barCategoryGapValue,
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
                
                expect(barSerie.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let barSerieByEnums = BarSerie(
                    .name(nameValue),
                    .legendHoverLine(legendHoverLineValue),
                    .coordinateSystem(coordinateSystemValue),
                    .xAxisIndex(xAxisIndexValue),
                    .yAxisIndex(yAxisIndexValue),
                    .label(labelValue),
                    .itemStyle(itemStyleValue),
                    .stack(stackValue),
                    .barWidth(barWidthValue),
                    .barMaxWidth(barMaxWidthValue),
                    .barMinHeight(barMinHeightValue),
                    .barGap(barGapValue),
                    .barCategoryGap(barCategoryGapValue),
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
                
                expect(barSerieByEnums.jsonString).to(equal(barSerie.jsonString))
            }
        }
    }
}
