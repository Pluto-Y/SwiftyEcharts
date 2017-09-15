//
//  AxisSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 28/06/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class AxisSpec: QuickSpec {
    override func spec() {
        let valueValue = "value"
        let textStyleValue = TextStyle(
            .fontSize(16),
            .color(.hexColor("#e54035"))
        )
        
        let axisData = Axis.Data()
        axisData.value = valueValue
        axisData.textStyle = textStyleValue
        describe("For Axis.Data") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "value": valueValue,
                    "textStyle": textStyleValue
                ]
                
                expect(axisData.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let axisDataByEnums = Axis.Data(
                    .value(valueValue),
                    .textStyle(textStyleValue)
                )
                
                expect(axisDataByEnums.jsonString).to(equal(axisData.jsonString))
                
            }
        }
        
        describe("For Axis") {
            let showValue = false
            let gridIndexValue: UInt = 33
            let positionValue = Position.right
            let offsetValue: Float = -12
            let typeValue = AxisType.log
            let nameValue = "x values"
            let nameLocationValue = Position.middle
            let nameTextStyleValue = TextStyle(
                .color(.green),
                .fontSize(30),
                .fontFamily("Arial")
            )
            let nameGapValue: Float = 5.6
            let nameRotateValue: Float = 135
            let inverseValue = true
            let boundaryGapValue = BoundaryGap.notCategory([20%, 15%])
            let minValue: Float = 0.05
            let maxValue: Float = 10000
            let scaleValue = false
            let splitNumberValue: UInt = 4
            let minIntervalValue: UInt = 2
            let intervalValue = 3
            let logBaseValue: Float = 2.5
            let silentValue = true
            let triggerEventValue = false
            let axisLineValue = AxisLine(
                .lineStyle(LineStyle(
                    .color(Color.hexColor("#223344"))
                    ))
            )
            let axisTickValue = AxisTick(
                .show(false),
                .alignWithLabel(true),
                .inside(false),
                .length(0)
            )
            let axisLabelValue = AxisLabel(
                .inside(true),
                .color(.hexColor("#fff"))
            )
            let axisPointerValue = AxisPointerForAxis(
                .type(.shadow)
            )
            let splitLineValue = SplitLine(
                .lineStyle(LineStyle(
                    .type(.dashed)
                    ))
            )
            let splitAreaValue = SplitArea(
                .show(false)
            )
            let dataValue: [Jsonable] = [
                axisData,
                "周二", "周三", "周四", "周五", "周六", "周日"
            ]
            let zlevelValue: Float = 10
            let zValue: Float = 3.5
            
            let axis = Axis()
            axis.show = showValue
            axis.gridIndex = gridIndexValue
            axis.position = positionValue
            axis.offset = offsetValue
            axis.type = typeValue
            axis.name = nameValue
            axis.nameLocation = nameLocationValue
            axis.nameTextStyle = nameTextStyleValue
            axis.nameGap = nameGapValue
            axis.nameRotate = nameRotateValue
            axis.inverse = inverseValue
            axis.boundaryGap = boundaryGapValue
            axis.min = minValue
            axis.max = maxValue
            axis.scale = scaleValue
            axis.splitNumber = splitNumberValue
            axis.minInterval = minIntervalValue
            axis.interval = intervalValue
            axis.logBase = logBaseValue
            axis.silent = silentValue
            axis.triggerEvent = triggerEventValue
            axis.axisLine = axisLineValue
            axis.axisTick = axisTickValue
            axis.axisLabel = axisLabelValue
            axis.axisPointer = axisPointerValue
            axis.splitLine = splitLineValue
            axis.splitArea = splitAreaValue
            axis.data = dataValue
            axis.zlevel = zlevelValue
            axis.z = zValue
            
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "show": showValue,
                    "gridIndex": gridIndexValue,
                    "position": positionValue,
                    "offset": offsetValue,
                    "type": typeValue,
                    "name": nameValue,
                    "nameLocation": nameLocationValue,
                    "nameTextStyle": nameTextStyleValue,
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
                    "axisPointer": axisPointerValue,
                    "splitLine": splitLineValue,
                    "splitArea": splitAreaValue,
                    "data": dataValue,
                    "zlevel": zlevelValue,
                    "z": zValue
                ]
                
                expect(axis.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let axisByEnums = Axis(
                    .show(showValue),
                    .gridIndex(gridIndexValue),
                    .position(positionValue),
                    .offset(offsetValue),
                    .type(typeValue),
                    .name(nameValue),
                    .nameLocation(nameLocationValue),
                    .nameTextStyle(nameTextStyleValue),
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
                    .axisPointer(axisPointerValue),
                    .splitLine(splitLineValue),
                    .splitArea(splitAreaValue),
                    .data(dataValue),
                    .zlevel(zlevelValue),
                    .z(zValue)
                )
                
                expect(axisByEnums.jsonString).to(equal(axis.jsonString))
            }
        }
    }

}
