//
//  GaugeSerieSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 13/07/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class GaugeSerieSpec: QuickSpec {
    override func spec() {
        let showPointerValue = false
        let lengthPointerValue: LengthValue = 2.52
        let widthPointerValue: Float = 2.55
        
        let pointer = GaugeSerie.Pointer()
        pointer.show = showPointerValue
        pointer.length = lengthPointerValue
        pointer.width = widthPointerValue
        
        describe("For GaugeSerie.Pointer") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "show": showPointerValue,
                    "length": lengthPointerValue,
                    "width": widthPointerValue
                ]
                
                expect(pointer.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let pointerByEnums = GaugeSerie.Pointer(
                    .show(showPointerValue),
                    .length(lengthPointerValue),
                    .width(widthPointerValue)
                )
                
                expect(pointerByEnums.jsonString).to(equal(pointer.jsonString))
            }
        }
        
        let showTitleValue = false
        let offsetCenterTitleValue: Point = [20, 30%]
        let textStyleTitleValue = TextStyle(
            .color(Color.hexColor("#f4f4f4")),
            .fontStyle(FontStyle.normal),
            .fontWeight(.lighter),
            .fontFamily("fontFamilyValue"),
            .fontSize(23),
            .align(Position.center)
        )
        
        let title = GaugeSerie.Title()
        title.show = showTitleValue
        title.offsetCenter = offsetCenterTitleValue
        title.textStyle = textStyleTitleValue
        
        describe("For GaugeSerie.Title") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "show": showTitleValue,
                    "offsetCenter": offsetCenterTitleValue,
                    "textStyle": textStyleTitleValue
                ]
                
                expect(title.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let titleByEnums = GaugeSerie.Title(
                    .show(showTitleValue),
                    .offsetCenter(offsetCenterTitleValue),
                    .textStyle(textStyleTitleValue)
                )
                
                expect(titleByEnums.jsonString).to(equal(title.jsonString))
            }
        }
        
        let showDetailValue = true
        let widthDetailValue: Float = 28.482
        let heightDetailValue: Float = 274.23
        let backgroundColorDetailValue = Color.auto
        let borderWidthDetailValue: Float = 0.5
        let borderColorDetailValue = Color.yellow
        let offsetCenterDetailValue = Point([0, 0%])
        let formatterDetailValue = Formatter.string("formatterValue")
        let textStyleDetailValue = TextStyle(
            .align(Position.auto)
        )
        
        let detail = GaugeSerie.Detail()
        detail.show = showDetailValue
        detail.width = widthDetailValue
        detail.height = heightDetailValue
        detail.backgroundColor = backgroundColorDetailValue
        detail.borderWidth = borderWidthDetailValue
        detail.borderColor = borderColorDetailValue
        detail.offsetCenter = offsetCenterDetailValue
        detail.formatter = formatterDetailValue
        detail.textStyle = textStyleDetailValue
        
        describe("For GaugeSerie.Detail") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "show": showDetailValue,
                    "width": widthDetailValue,
                    "height": heightDetailValue,
                    "backgroundColor": backgroundColorDetailValue,
                    "borderWidth": borderWidthDetailValue,
                    "borderColor": borderColorDetailValue,
                    "offsetCenter": offsetCenterDetailValue,
                    "formatter": formatterDetailValue,
                    "textStyle": textStyleDetailValue
                ]
                
                expect(detail.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let detailByEnums = GaugeSerie.Detail(
                    .show(showDetailValue),
                    .width(widthDetailValue),
                    .height(heightDetailValue),
                    .backgroundColor(backgroundColorDetailValue),
                    .borderWidth(borderWidthDetailValue),
                    .borderColor(borderColorDetailValue),
                    .offsetCenter(offsetCenterDetailValue),
                    .formatter(formatterDetailValue),
                    .textStyle(textStyleDetailValue)
                )
                
                expect(detailByEnums.jsonString).to(equal(detail.jsonString))
            }
        }
        
        describe("For GaugeSerie") {
            let nameValue = "gaugeSerieName"
            let radiusValue = 100%
            let centerValue: Point = [100%, 20]
            let startAngleValue: Float = 45
            let endAngleValue: Float = 135
            let clockwiseValue = true
            let minValue: Float = -1.5
            let maxValue: Float = 10.22
            let splitNumberValue: Float = 2.0
            let axisLineValue = AxisLine(
                .show(false),
                .onZero(true),
                .lineStyle(LineStyle(.width(2.0)))
            )
            let splitLineValue = SplitLine(
                .show(false),
                .interval(2)
            )
            let axisTickValue = AxisTick(
                .show(false),
                .splitNumber(20),
                .length(20%),
                .lineStyle(LineStyle(
                    .width(8)
                    ))
            )
            let axisLabelValue = AxisLabel(
                .show(false),
                .distance(0.5),
                .formatter(.string("{value} ml")),
                .color("#fff"),
                .fontSize(16),
                .color("#5a5a5a")
            )
            let pointerValue = pointer
            let itemStyleValue = ItemStyle(
                .normal(CommonItemStyleContent(
                    .opacity(0.224),
                    .borderType(.dotted)
                    ))
            )
            let titleValue = title
            let detailValue = detail
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
                .symbol(.none),
                .label(FormattedLabel(
                    .normal(FormattedLabelStyle(
                        .formatter(.string("max: {c}")),
                        .position(.start)
                        ))
                    )),
                .lineStyle(EmphasisLineStyle(
                    .normal(LineStyle(
                        .color(.green),
                        .type(.dotted),
                        .opacity(0.2),
                        .width(2)
                        ))
                    )),
                .data([["type": "max"]])
            )
            let markAreaValue = MarkArea(
                .silent(true),
                .data([[["xAxis": "2009/9/10/\\n7:00"], ["xAxis": "2009/9/20\\n7:00"]]])
            )
            let dataValue: [Jsonable] = ["周一"]
            let silentValue = true
            let animationValue = false
            let animationThresholdValue: Float = 2.5245
            let animationDurationValue = Time.number(3.553)
            let animationEasingValue = EasingFunction.exponentialOut
            let animationDelayValue: Time = 2.3552323
            let animationDurationUpdateValue: Time = 0.0
            let animationEasingUpdateValue = EasingFunction.quarticInOut
            let animationDelayUpdateValue: Time = 100.0
            let tooltipValue = Tooltip(
                .position(.point([50%, 10])),
                .formatter(.string("{b0}: {c0}<br />{b1}: {c1}")),
                .backgroundColor(rgba(50, 50, 50, 0.7)),
                .borderColor("#333"),
                .borderWidth(0),
                .padding(5),
                .extraCssText("box-shadow: 0 0 3px rgba(0, 0, 0, 0.3);")
            )
            
            let gaugeSerie = GaugeSerie()
            gaugeSerie.name = nameValue
            gaugeSerie.radius = radiusValue
            gaugeSerie.center = centerValue
            gaugeSerie.startAngle = startAngleValue
            gaugeSerie.endAngle = endAngleValue
            gaugeSerie.clockwise = clockwiseValue
            gaugeSerie.min = minValue
            gaugeSerie.max = maxValue
            gaugeSerie.splitNumber = splitNumberValue
            gaugeSerie.axisLine = axisLineValue
            gaugeSerie.splitLine = splitLineValue
            gaugeSerie.axisTick = axisTickValue
            gaugeSerie.axisLabel = axisLabelValue
            gaugeSerie.pointer = pointerValue
            gaugeSerie.itemStyle = itemStyleValue
            gaugeSerie.title = titleValue
            gaugeSerie.detail = detailValue
            gaugeSerie.markPoint = markPointValue
            gaugeSerie.markLine = markLineValue
            gaugeSerie.markArea = markAreaValue
            gaugeSerie.data = dataValue
            gaugeSerie.silent = silentValue
            gaugeSerie.animation = animationValue
            gaugeSerie.animationThreshold = animationThresholdValue
            gaugeSerie.animationDuration = animationDurationValue
            gaugeSerie.animationEasing = animationEasingValue
            gaugeSerie.animationDelay = animationDelayValue
            gaugeSerie.animationDurationUpdate = animationDurationUpdateValue
            gaugeSerie.animationEasingUpdate = animationEasingUpdateValue
            gaugeSerie.animationDelayUpdate = animationDelayUpdateValue
            gaugeSerie.tooltip = tooltipValue
            
            it("needs to check the type value") {
                expect(gaugeSerie.type).to(equal(SerieType.gauge))
            }
            
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "type": SerieType.gauge,
                    "name": nameValue,
                    "radius": radiusValue,
                    "center": centerValue,
                    "startAngle": startAngleValue,
                    "endAngle": endAngleValue,
                    "clockwise": clockwiseValue,
                    "min": minValue,
                    "max": maxValue,
                    "splitNumber": splitNumberValue,
                    "axisLine": axisLineValue,
                    "splitLine": splitLineValue,
                    "axisTick": axisTickValue,
                    "axisLabel": axisLabelValue,
                    "pointer": pointerValue,
                    "itemStyle": itemStyleValue,
                    "title": titleValue,
                    "detail": detailValue,
                    "markPoint": markPointValue,
                    "markLine": markLineValue,
                    "markArea": markAreaValue,
                    "data": dataValue,
                    "silent": silentValue,
                    "animation": animationValue,
                    "animationThreshold": animationThresholdValue,
                    "animationDuration": animationDurationValue,
                    "animationEasing": animationEasingValue,
                    "animationDelay": animationDelayValue,
                    "animationDurationUpdate": animationDurationUpdateValue,
                    "animationEasingUpdate": animationEasingUpdateValue,
                    "animationDelayUpdate": animationDelayUpdateValue,
                    "tooltip": tooltipValue
                ]
                
                expect(gaugeSerie.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let gaugeSerieByEnums = GaugeSerie(
                    .name(nameValue),
                    .radius(radiusValue),
                    .center(centerValue),
                    .startAngle(startAngleValue),
                    .endAngle(endAngleValue),
                    .clockwise(clockwiseValue),
                    .min(minValue),
                    .max(maxValue),
                    .splitNumber(splitNumberValue),
                    .axisLine(axisLineValue),
                    .splitLine(splitLineValue),
                    .axisTick(axisTickValue),
                    .axisLabel(axisLabelValue),
                    .pointer(pointerValue),
                    .itemStyle(itemStyleValue),
                    .title(titleValue),
                    .detail(detailValue),
                    .markPoint(markPointValue),
                    .markLine(markLineValue),
                    .markArea(markAreaValue),
                    .data(dataValue),
                    .silent(silentValue),
                    .animation(animationValue),
                    .animationThreshold(animationThresholdValue),
                    .animationDuration(animationDurationValue),
                    .animationEasing(animationEasingValue),
                    .animationDelay(animationDelayValue),
                    .animationDurationUpdate(animationDurationUpdateValue),
                    .animationEasingUpdate(animationEasingUpdateValue),
                    .animationDelayUpdate(animationDelayUpdateValue),
                    .tooltip(tooltipValue)
                )
                
                expect(gaugeSerieByEnums.jsonString).to(equal(gaugeSerie.jsonString))
            }
        }
        
    }
}
