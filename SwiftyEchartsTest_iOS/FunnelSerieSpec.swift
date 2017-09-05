//
//  FunnelSerieSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 12/07/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class FunnelSerieSpec: QuickSpec {
    override func spec() {
        let ascendingSort = FunnelSerie.Sort.ascending
        let descendingSort = FunnelSerie.Sort.descending
        
        describe("For FunnelSerie.Sort") {
            let ascendingString = "ascending"
            let descendingString = "descending"
            it("needs to check the jsonString") {
                expect(ascendingSort.jsonString).to(equal(ascendingString.jsonString))
                expect(descendingSort.jsonString).to(equal(descendingString.jsonString))
            }
        }
        
        let labelLineShowValue = false
        let labelLineLengthValue: Float = 0.512
        let labelLineLineStyleValue = LineStyle(
            .opacity(0.62),
            .width(0.22)
        )
        
        let normalLabelLineContent = FunnelSerie.LabelLineContent()
        normalLabelLineContent.show = labelLineShowValue
        normalLabelLineContent.length = labelLineLengthValue
        normalLabelLineContent.lineStyle = labelLineLineStyleValue
        
        describe("For FunnelSerie.LabelLineContent") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "show": labelLineShowValue,
                    "length": labelLineLengthValue,
                    "lineStyle": labelLineLineStyleValue
                ]
                
                expect(normalLabelLineContent.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let labelLineContentByEnums = FunnelSerie.LabelLineContent(
                    .show(labelLineShowValue),
                    .length(labelLineLengthValue),
                    .lineStyle(labelLineLineStyleValue)
                )
                
                expect(labelLineContentByEnums.jsonString).to(equal(normalLabelLineContent.jsonString))
            }
        }
        
        let normalValue = normalLabelLineContent
        let emphasisValue = FunnelSerie.LabelLineContent(
            .show(true),
            .length(0.0),
            .lineStyle(LineStyle(
                .width(2.486),
                .type(LineType.dotted),
                .opacity(1.0)
                ))
        )
        
        let labelLine = FunnelSerie.LabelLine()
        labelLine.normal = normalValue
        labelLine.emphasis = emphasisValue
        
        describe("For FunnelSerie.LabelLine") {
            it("needs to check the jsonString") {
                let resutlDic: [String: Jsonable] = [
                    "normal": normalValue,
                    "emphasis": emphasisValue,
                    ]
                
                expect(labelLine.jsonString).to(equal(resutlDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let labelLineByEnums = FunnelSerie.LabelLine(
                    .normal(normalValue),
                    .emphasis(emphasisValue)
                )
                
                expect(labelLineByEnums.jsonString).to(equal(labelLine.jsonString))
            }
        }
        
        let dataNameValue = "dataNameValue"
        let dataValueValue: Float = 2
        let dataLabelValue = EmphasisLabel(
            .normal(LabelStyle(
                .show(true),
                .position(Position.point(Point([20, 30])))
                ))
        )
        let dataLabelLineValue = labelLine
        let dataItemStyleValue = ItemStyle(
            .emphasis(CommonItemStyleContent(
                ))
        )
        
        let funnelSerieData = FunnelSerie.Data()
        funnelSerieData.name = dataNameValue
        funnelSerieData.value = dataValueValue
        funnelSerieData.label = dataLabelValue
        funnelSerieData.labelLine = dataLabelLineValue
        funnelSerieData.itemStyle = dataItemStyleValue
        
        describe("For FunnelSerie.Data") { 
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "name": dataNameValue,
                    "value": dataValueValue,
                    "label": dataLabelValue,
                    "labelLine": dataLabelLineValue,
                    "itemStyle": dataItemStyleValue
                ]
                
                expect(funnelSerieData.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let funnelSerieDataByEnums = FunnelSerieData(
                    .name(dataNameValue),
                    .value(dataValueValue),
                    .label(dataLabelValue),
                    .labelLine(dataLabelLineValue),
                    .itemStyle(dataItemStyleValue)
                )
                
                expect(funnelSerieDataByEnums.jsonString).to(equal(funnelSerieData.jsonString))
            }
        }
        
        
        describe("For FunnelSerie") {    
            let nameValue = "funnelSerieName"
            let minValue: Float = 2.45
            let maxValue: Float = 7.442
            let minSizeValue = 80%
            let maxSizeValue = 10%
            let sortValue = ascendingSort
            let gapValue: Float = 7.22
            let legendHoverLinkValue = false
            let funnelAlignValue = Align.right
            let labelValue = EmphasisLabel(
                .normal(LabelStyle(
                    .interval(88),
                    .fontStyle(FontStyle.normal),
                    .position(.start),
                    .formatter(.string("最大值"))
                    ))
            )
            let labelLineValue = labelLine
            let itemStyleValue = ItemStyle()
            let dataValue: [Jsonable] = [
                ["name": "数据1", "value": 10],
                ["name": "数据2", "value": 20]
            ]
            let markPointValue = MarkPoint(
                .silent(false)
            )
            let markLineValue = MarkLine(
                .symbolSize([10, 20%])
            )
            let markAreaValue = MarkArea(
                .animation(false)
            )
            let silentValue = true
            let animationValue = false
            let animationThresholdValue: Float = 2.5582
            let animationDurationValue = Time.init(floatLiteral: 2.4)
            let animationEasingValue = EasingFunction.backIn
            let animationDelayValue: Time = 0.0
            let animationDurationUpdateValue: Time = Time.init(integerLiteral: 22)
            let animationEasingUpdateValue = EasingFunction.sinusoidalOut
            let animationDelayUpdateValue: Time = 22
            
            let funnelSerie = FunnelSerie()
            funnelSerie.name = nameValue
            funnelSerie.min = minValue
            funnelSerie.max = maxValue
            funnelSerie.minSize = minSizeValue
            funnelSerie.maxSize = maxSizeValue
            funnelSerie.sort = sortValue
            funnelSerie.gap = gapValue
            funnelSerie.legendHoverLink = legendHoverLinkValue
            funnelSerie.funnelAlign = funnelAlignValue
            funnelSerie.label = labelValue
            funnelSerie.labelLine = labelLineValue
            funnelSerie.itemStyle = itemStyleValue
            funnelSerie.data = dataValue
            funnelSerie.markPoint = markPointValue
            funnelSerie.markLine = markLineValue
            funnelSerie.markArea = markAreaValue
            funnelSerie.silent = silentValue
            funnelSerie.animation = animationValue
            funnelSerie.animationThreshold = animationThresholdValue
            funnelSerie.animationDuration = animationDurationValue
            funnelSerie.animationEasing = animationEasingValue
            funnelSerie.animationDelay = animationDelayValue
            funnelSerie.animationDurationUpdate = animationDurationUpdateValue
            funnelSerie.animationEasingUpdate = animationEasingUpdateValue
            funnelSerie.animationDelayUpdate = animationDelayUpdateValue
            
            it("needs to check the type value") {
                expect(funnelSerie.type.jsonString).to(equal(SerieType.funnel.jsonString))
            }
            
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "type": SerieType.funnel,
                    "name": nameValue,
                    "min": minValue,
                    "max": maxValue,
                    "minSize": minSizeValue,
                    "maxSize": maxSizeValue,
                    "sort": sortValue,
                    "gap": gapValue,
                    "legendHoverLink": legendHoverLinkValue,
                    "funnelAlign": funnelAlignValue,
                    "label": labelValue,
                    "labelLine": labelLineValue,
                    "itemStyle": itemStyleValue,
                    "data": dataValue,
                    "markPoint": markPointValue,
                    "markLine": markLineValue,
                    "markArea": markAreaValue,
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
                
                expect(funnelSerie.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let funnelSerieByEnums = FunnelSerie(
                    .name(nameValue),
                    .min(minValue),
                    .max(maxValue),
                    .minSize(minSizeValue),
                    .maxSize(maxSizeValue),
                    .sort(sortValue),
                    .gap(gapValue),
                    .legendHoverLink(legendHoverLinkValue),
                    .funnelAlign(funnelAlignValue),
                    .label(labelValue),
                    .labelLine(labelLineValue),
                    .itemStyle(itemStyleValue),
                    .data(dataValue),
                    .markPoint(markPointValue),
                    .markLine(markLineValue),
                    .markArea(markAreaValue),
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
                
                expect(funnelSerieByEnums.jsonString).to(equal(funnelSerie.jsonString))
            }
        }
    }
}
