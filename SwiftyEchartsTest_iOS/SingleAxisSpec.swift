//
//  SingleAxisSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 08/08/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class SingleAxisSpec: QuickSpec {
    override func spec() {
        let valueDataValue = "singAxisDataValue"
        let textStyleDataValue = TextStyle(
            .fontSize(18),
            .fontFamily("singleAxisDataTextStyleFontFamily"),
            .fontStyle(.italic)
        )
        
        let data = SingleAxis.Data()
        data.value = valueDataValue
        data.textStyle = textStyleDataValue
        
        describe("For SingleAxis.Data") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "value": valueDataValue,
                    "textStyle": textStyleDataValue
                ]
                
                expect(data.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let dataByEnums = SingleAxis.Data(
                    .value(valueDataValue),
                    .textStyle(textStyleDataValue)
                )
                
                expect(dataByEnums.jsonString).to(equal(data.jsonString))
            }
        }
        
        describe("For SingleAxis") {
            let zlevelValue: Float = 7562.4746
            let zValue: Float = 0.000003476734
            let leftValue = Position.value(28%)
            let topValue = Position.value(20)
            let rightValue = Position.point([20, 0.0%])
            let bottomValue = Position.bottom
            let widthValue: Float = 20
            let heightValue: Float = 0.0
            let orientValue = Orient.vertical
            let typeValue = AxisType.log
            let nameValue = "singleAxisValue"
            let nameLocationValue = Location.start
            let nameTextStyleValue = TextStyle(
                .align(.right),
                .fontStyle(FontStyle.oblique)
            )
            let nameGapValue: Float = 25
            let nameRotateValue: Float = 90.0
            let inverseValue = true
            let boundaryGapValue: BoundaryGap = false
            let minValue = "类C"
            let maxValue = 100.9999999
            let scaleValue = false
            let splitNumberValue: UInt8 = 0
            let minIntervalValue: UInt8 = 255
            let intervalValue = Int.min
            let logBaseValue: Float = 0.057235
            let silentValue = true
            let triggerEventValue = true
            let axisLineValue = AxisLine(
                .lineStyle(LineStyle(
                    .curveness(99999.11111111),
                    .opacity(0.99999999999)
                    ))
            )
            
            let axisTickValue = AxisTick(
                .alignWithLabel(true),
                .interval(1),
                .inside(false)
            )
            let axisLabelValue = AxisLabel(
                .margin(75.46),
                .formatter(.string("")),
                .rotate(90.989)
            )
            let splitLineValue = SplitLine(
                .show(false)
            )
            let splitAreaValue = SplitArea(
                .interval(2)
            )
            let dataValue: [Jsonable] = [
                data,
                "周二", ["value": "周三", "textStyle": TextStyle()]
            ]
            
            let singleAxis = SingleAxis()
            singleAxis.zlevel = zlevelValue
            singleAxis.z = zValue
            singleAxis.left = leftValue
            singleAxis.top = topValue
            singleAxis.right = rightValue
            singleAxis.bottom = bottomValue
            singleAxis.width = widthValue
            singleAxis.height = heightValue
            singleAxis.orient = orientValue
            singleAxis.type = typeValue
            singleAxis.name = nameValue
            singleAxis.nameLocation = nameLocationValue
            singleAxis.nameTextStyle = nameTextStyleValue
            singleAxis.nameGap = nameGapValue
            singleAxis.nameRotate = nameRotateValue
            singleAxis.inverse = inverseValue
            singleAxis.boundaryGap = boundaryGapValue
            singleAxis.min = minValue
            singleAxis.max = maxValue
            singleAxis.scale = scaleValue
            singleAxis.splitNumber = splitNumberValue
            singleAxis.minInterval = minIntervalValue
            singleAxis.interval = intervalValue
            singleAxis.logBase = logBaseValue
            singleAxis.silent = silentValue
            singleAxis.triggerEvent = triggerEventValue
            singleAxis.axisLine = axisLineValue
            singleAxis.axisTick = axisTickValue
            singleAxis.axisLabel = axisLabelValue
            singleAxis.splitLine = splitLineValue
            singleAxis.splitArea = splitAreaValue
            singleAxis.data = dataValue
            
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "zlevel": zlevelValue,
                    "z": zValue,
                    "left": leftValue,
                    "top": topValue,
                    "right": rightValue,
                    "bottom": bottomValue,
                    "width": widthValue,
                    "height": heightValue,
                    "orient": orientValue,
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
                    "splitLine": splitLineValue,
                    "splitArea": splitAreaValue,
                    "data": dataValue
                ]
                
                expect(singleAxis.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let singleAxisByEnums = SingleAxis(
                    .zlevel(zlevelValue),
                    .z(zValue),
                    .left(leftValue),
                    .top(topValue),
                    .right(rightValue),
                    .bottom(bottomValue),
                    .width(widthValue),
                    .height(heightValue),
                    .orient(orientValue),
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
                    .splitLine(splitLineValue),
                    .splitArea(splitAreaValue),
                    .data(dataValue)
                )
                
                expect(singleAxisByEnums.jsonString).to(equal(singleAxis.jsonString))
            }
        }
    }
}
