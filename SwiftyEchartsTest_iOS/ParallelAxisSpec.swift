//
//  ParallelAxisSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 26/07/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class ParallelAxisSpec: QuickSpec {
    override func spec() {
        let widthAreaSelectedStyleValue: Float = 28573.2
        let borderWidthAreaSelectedStyleValue: Float = 2.0
        let borderColorAreaSelectedStyleValue = Color.rgb(200, 5, 202)
        let colorAreaSelectedStyleValue = Color.array([rgb(102, 47, 274), Color.hexColor("#285244")])
        let opacityAreaSelectedStyleValue: Float = 0.9375
        
        let areaSelectedStyle = ParallelAxis.AreaSelectedStyle()
        areaSelectedStyle.width = widthAreaSelectedStyleValue
        areaSelectedStyle.borderWidth = borderWidthAreaSelectedStyleValue
        areaSelectedStyle.borderColor = borderColorAreaSelectedStyleValue
        areaSelectedStyle.color = colorAreaSelectedStyleValue
        areaSelectedStyle.opacity = opacityAreaSelectedStyleValue
        
        describe("For ParallelAxis") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "width": widthAreaSelectedStyleValue,
                    "borderWidth": borderWidthAreaSelectedStyleValue,
                    "borderColor": borderColorAreaSelectedStyleValue,
                    "color": colorAreaSelectedStyleValue,
                    "opacity": opacityAreaSelectedStyleValue
                ]
                
                expect(areaSelectedStyle.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let areaSelectedStyleByEnums = ParallelAxis.AreaSelectedStyle(
                    .width(widthAreaSelectedStyleValue),
                    .borderWidth(borderWidthAreaSelectedStyleValue),
                    .borderColor(borderColorAreaSelectedStyleValue),
                    .color(colorAreaSelectedStyleValue),
                    .opacity(opacityAreaSelectedStyleValue)
                )
                
                expect(areaSelectedStyleByEnums.jsonString).to(equal(areaSelectedStyle.jsonString))
            }
        }
        
        describe("For ParallelAxis") {
            let dimValue: Float = 1
            let parallelIndexValue: UInt8 = 4
            let realtimeValue = true
            let typeValue = AxisType.log
            let areaSelectedStyleValue = areaSelectedStyle
            let nameValue = "parallelAxisNameValue"
            let nameTextStyleValue = TextStyle(
                .color(Color.red),
                .fontStyle(.normal),
                .fontWeight(.bolder),
                .fontFamily("parallelAxis")
            )
            let nameLocationValue = Location.middle
            let nameGapValue: Float = 20.5
            let nameRotateValue: Float = 85
            let inverseValue = false
            let boundaryGapValue: BoundaryGap = [40%, 40%]
            let minValue: Float = -3
            let maxValue: Float = 285.2
            let scaleValue = true
            let splitNumberValue: UInt8 = 6
            let minIntervalValue: UInt8 = 1
            let intervalValue = 38
            let logBaseValue: Float = 674.2
            let silentValue = true
            let triggerEventValue = false
            let axisLineValue = AxisLine(
                .show(false),
                .onZero(true),
                .lineStyle(LineStyle(
                    .type(LineType.dotted)
                    ))
            )
            let axisTickValue = AxisTick(
                .show(false),
                .alignWithLabel(false),
                .inside(true)
            )
            let axisLabelValue = AxisLabel(
                .rotate(28.5),
                .margin(299),
                .interval(8),
                .inside(true)
            )
            let dataValue: [Jsonable] = [
                [
                    "value": "周一",
                    "textStyle": [
                        "fontSize": 20,
                        "color": "red"
                    ]
                ], "周二", "周三", "周四", "周五", "周六", "周日"
            ]
            
            let paralleAxis = ParallelAxis()
            paralleAxis.dim = dimValue
            paralleAxis.parallelIndex = parallelIndexValue
            paralleAxis.realtime = realtimeValue
            paralleAxis.areaSelectedStyle = areaSelectedStyleValue
            paralleAxis.type = typeValue
            paralleAxis.name = nameValue
            paralleAxis.nameTextStyle = nameTextStyleValue
            paralleAxis.nameLocation = nameLocationValue
            paralleAxis.nameGap = nameGapValue
            paralleAxis.nameRotate = nameRotateValue
            paralleAxis.inverse = inverseValue
            paralleAxis.boundaryGap = boundaryGapValue
            paralleAxis.min = minValue
            paralleAxis.max = maxValue
            paralleAxis.scale = scaleValue
            paralleAxis.splitNumber = splitNumberValue
            paralleAxis.minInterval = minIntervalValue
            paralleAxis.interval = intervalValue
            paralleAxis.logBase = logBaseValue
            paralleAxis.silent = silentValue
            paralleAxis.triggerEvent = triggerEventValue
            paralleAxis.axisLine = axisLineValue
            paralleAxis.axisTick = axisTickValue
            paralleAxis.axisLabel = axisLabelValue
            paralleAxis.data = dataValue
            
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "dim": dimValue,
                    "parallelIndex": parallelIndexValue,
                    "realtime": realtimeValue,
                    "areaSelectedStyle": areaSelectedStyleValue,
                    "type": typeValue,
                    "name": nameValue,
                    "nameTextStyle": nameTextStyleValue,
                    "nameLocation": nameLocationValue,
                    "nameGap": nameGapValue,
                    "nameRotate": nameRotateValue,
                    "inverse": inverseValue,
                    "boundaryGap": boundaryGapValue,
                    "min": minValue,
                    "max": maxValue,
                    "scale": scaleValue,
                    "splitNumber": splitNumberValue,
                    "minInterval": minIntervalValue,
                    "interval": intervalValue,
                    "logBase": logBaseValue,
                    "silent": silentValue,
                    "triggerEvent": triggerEventValue,
                    "axisLine": axisLineValue,
                    "axisTick": axisTickValue,
                    "axisLabel": axisLabelValue,
                    "data": dataValue
                ]
                
                expect(paralleAxis.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let parallelAxisByEnums = ParallelAxis(
                    .dim(dimValue),
                    .parallelIndex(parallelIndexValue),
                    .realtime(realtimeValue),
                    .areaSelectedStyle(areaSelectedStyleValue),
                    .type(typeValue),
                    .name(nameValue),
                    .nameTextStyle(nameTextStyleValue),
                    .nameLocation(nameLocationValue),
                    .nameGap(nameGapValue),
                    .nameRotate(nameRotateValue),
                    .inverse(inverseValue),
                    .boundaryGap(boundaryGapValue),
                    .min(minValue),
                    .max(maxValue),
                    .scale(scaleValue),
                    .splitNumber(splitNumberValue),
                    .minInterval(minIntervalValue),
                    .interval(intervalValue),
                    .logBase(logBaseValue),
                    .silent(silentValue),
                    .triggerEvent(triggerEventValue),
                    .axisLine(axisLineValue),
                    .axisTick(axisTickValue),
                    .axisLabel(axisLabelValue),
                    .data(dataValue)
                )
                
                expect(parallelAxisByEnums.jsonString).to(equal(paralleAxis.jsonString))
            }
            
        }
    }
}
