//
//  AngleAxisSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 28/06/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class AngleAxisSpec: QuickSpec {
    override func spec() {
        let valueValue = "value"
        let textStyleValue = TextStyle(
            .color(Color.hexColor("#ff8899")),
            .fontStyle(.italic),
            .fontWeight(12),
            .fontFamily("fontFamily"),
            .fontSize(22),
            .align(Position.inner)
        )
        let angleAxisData = AngleAxis.Data()
        angleAxisData.value = valueValue
        angleAxisData.textStyle = textStyleValue
        
        describe("For AngleAxis.Data") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "value": valueValue,
                    "textStyle": textStyleValue
                ]
                
                expect(angleAxisData.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let angleAxisDataByEnums = AngleAxis.Data(
                    .value(valueValue),
                    .textStyle(textStyleValue)
                )
                
                expect(angleAxisDataByEnums.jsonString).to(equal(angleAxisData.jsonString))
            }
        }
        
        describe("For AngleAxis") {
            let polarIndexValue: UInt8 = 12
            let startAngleValue: Float = 8.999
            let clockwiseValue = false
            let typeValue = AxisType.category
            let boundaryGapValue: BoundaryGap = true
            let minValue: Float = 7.123
            let maxValue: Float = 123
            let scaleValue = true
            let splitNumberValue: UInt8 = 8
            let minIntervalValue: UInt8 = 0
            let intervalValue: UInt = 2
            let logBaseValue: Float = Float(M_PI)
            let silentValue = false
            let triggerEventValue = true
            let axisLineValue = AxisLine(
                .show(false),
                .onZero(true)
            )
            let axisTickValue = AxisTick(
                .show(true),
                .alignWithLabel(false),
                .interval(89),
                .inside(false),
                .length(33),
                .lineStyle(LineStyle(
                    .color(Color.yellow),
                    .width(12),
                    .type(.dashed),
                    .opacity(0.13),
                    .shadowOffsetX(1),
                    .shadowBlur(39)
                    ))
            )
            let axisLabelValue = AxisLabel(
                .margin(20),
                .color("#ddd"),
                .fontSize(14)
            )
            let splitLineValue = SplitLine(
                .lineStyle(LineStyle(
                    .type(.dashed)
                    ))
            )
            let splitAreaValue = SplitArea(
                .show(false),
                .interval(5),
                .areaStyle(AreaStyle(
                    .color(Color.rgb(20, 155, 235)),
                    .shadowBlur(8.88),
                    .shadowOffsetX(12),
                    .opacity(9)
                    ))
            )
            let dataValue: [Jsonable] = [
                angleAxisData,
                [
                    "value": "周一",
                    // 突出周一
                    "textStyle": [
                        "fontSize": 20,
                        "color": "red"
                    ]
                ]
            ]
            let zlevelValue: Float = 10
            let zValue: Float = 12.345
            
            let angleAxis = AngleAxis()
            angleAxis.polarIndex = polarIndexValue
            angleAxis.startAngle = startAngleValue
            angleAxis.clockwise = clockwiseValue
            angleAxis.type = typeValue
            angleAxis.boundaryGap = boundaryGapValue
            angleAxis.min = minValue
            angleAxis.max = maxValue
            angleAxis.scale = scaleValue
            angleAxis.splitNumber = splitNumberValue
            angleAxis.minInterval = minIntervalValue
            angleAxis.interval = intervalValue
            angleAxis.logBase = logBaseValue
            angleAxis.silent = silentValue
            angleAxis.triggerEvent = triggerEventValue
            angleAxis.axisLine = axisLineValue
            angleAxis.axisTick = axisTickValue
            angleAxis.axisLabel = axisLabelValue
            angleAxis.splitLine = splitLineValue
            angleAxis.splitArea = splitAreaValue
            angleAxis.data = dataValue
            angleAxis.zlevel = zlevelValue
            angleAxis.z = zValue
            
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "polarIndex": polarIndexValue,
                    "startAngle": startAngleValue,
                    "clockwise": clockwiseValue,
                    "type": typeValue,
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
                    "splitLine": splitLineValue,
                    "splitArea": splitAreaValue,
                    "data": dataValue,
                    "zlevel": zlevelValue,
                    "z": zValue
                ]
                
                expect(angleAxis.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let angleAxisByEnums = AngleAxis(
                    .polarIndex(polarIndexValue),
                    .startAngle(startAngleValue),
                    .clockwise(clockwiseValue),
                    .type(typeValue),
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
                    .splitLine(splitLineValue),
                    .splitArea(splitAreaValue),
                    .data(dataValue),
                    .zlevel(zlevelValue),
                    .z(zValue)
                )
                
                expect(angleAxisByEnums.jsonString).to(equal(angleAxis.jsonString))
            }
        }
    }
}
