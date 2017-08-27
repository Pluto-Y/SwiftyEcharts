//
//  RadiusAxisSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 03/08/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class RadiusAxisSpec: QuickSpec {
    override func spec() {
        describe("For RadiusAxis.AxisPointer.Type") { 
            let lineString = "line"
            let shadowString = "shadow"
            
            let lineType = RadiusAxis.AxisPointer.Type.line
            let shadowType = RadiusAxis.AxisPointer.Type.shadow
            
            it("needs to check the jsonString") {
                expect(lineType.jsonString).to(equal(lineString.jsonString))
                expect(shadowType.jsonString).to(equal(shadowString.jsonString))
            }
        }
        
        let showLabelValue = false
        let precisionLabelValue: Float = 4.8723
        let formatterLabelValue = Formatter.string("labelFormatterValue")
        let marginLabelValue: [Float] = [0.0, 0.284, 237, 573.237]
        let textStyleLabelValue = TextStyle()
        let paddingLabelValue = Padding.verticalAndHorizontal(5, 10)
        let backgroundColorLabelValue = Color.hexColor("#029573")
        let borderColorLabelValue = Color.red
        let borderWidthLabelValue: Float = 0.8572
        let shadowBlurLabelValue: Float = 10
        let shadowColorLabelValue = rgb(100, 0, 38)
        let shadowOffsetXLabelValue: Float = 0.8572
        let shadowOffsetYLabelValue: Float = 8937462.7623467
        
        let label = RadiusAxis.AxisPointer.Label()
        label.show = showLabelValue
        label.precision = precisionLabelValue
        label.formatter = formatterLabelValue
        label.margin = marginLabelValue
        label.textStyle = textStyleLabelValue
        label.padding = paddingLabelValue
        label.backgroundColor = backgroundColorLabelValue
        label.borderColor = borderColorLabelValue
        label.borderWidth = borderWidthLabelValue
        label.shadowBlur = shadowBlurLabelValue
        label.shadowColor = shadowColorLabelValue
        label.shadowOffsetX = shadowOffsetXLabelValue
        label.shadowOffsetY = shadowOffsetYLabelValue
        
        describe("For RadiusAxis.AxisPointer.Label") { 
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "show": showLabelValue,
                    "precision": precisionLabelValue,
                    "formatter": formatterLabelValue,
                    "margin": marginLabelValue,
                    "textStyle": textStyleLabelValue,
                    "padding": paddingLabelValue,
                    "backgroundColor": backgroundColorLabelValue,
                    "borderColor": borderColorLabelValue,
                    "borderWidth": borderWidthLabelValue,
                    "shadowBlur": shadowBlurLabelValue,
                    "shadowColor": shadowColorLabelValue,
                    "shadowOffsetX": shadowOffsetXLabelValue,
                    "shadowOffsetY": shadowOffsetYLabelValue
                ]
                
                expect(label.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let labelByEnums = RadiusAxis.AxisPointer.Label(
                    .show(showLabelValue),
                    .precision(precisionLabelValue),
                    .formatter(formatterLabelValue),
                    .margin(marginLabelValue),
                    .textStyle(textStyleLabelValue),
                    .padding(paddingLabelValue),
                    .backgroundColor(backgroundColorLabelValue),
                    .borderColor(borderColorLabelValue),
                    .borderWidth(borderWidthLabelValue),
                    .shadowBlur(shadowBlurLabelValue),
                    .shadowColor(shadowColorLabelValue),
                    .shadowOffsetX(shadowOffsetXLabelValue),
                    .shadowOffsetY(shadowOffsetYLabelValue)
                )
                
                expect(labelByEnums.jsonString).to(equal(label.jsonString))
            }
        }
        
        let showHandleValue = false
        let iconHandleValue = "path://handleIconValue"
        let sizeHandleValue: Pair<Float> = [20.5, 50.2]
        let marginHandleValue: Float = 45
        let colorHandleValue = Color.hexColor("#88ffaa")
        let throttleHandleValue: Float = 5.555555
        let shadowBlurHandleValue: Float = 20.20
        let shadowColorHandleValue = Color.transparent
        let shadowOffsetXHandleValue: Float = 0.5737
        let shadowOffsetYHandleValue: Float = 85723.7234
        
        let handle = RadiusAxis.AxisPointer.Handle()
        handle.show = showHandleValue
        handle.icon = iconHandleValue
        handle.size = sizeHandleValue
        handle.margin = marginHandleValue
        handle.color = colorHandleValue
        handle.throttle = throttleHandleValue
        handle.shadowBlur = shadowBlurHandleValue
        handle.shadowColor = shadowColorHandleValue
        handle.shadowOffsetX = shadowOffsetXHandleValue
        handle.shadowOffsetY = shadowOffsetYHandleValue
        
        describe("For RadiusAxis.AxisPointer.Handle") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "show": showHandleValue,
                    "icon": iconHandleValue,
                    "size": sizeHandleValue,
                    "margin": marginHandleValue,
                    "color": colorHandleValue,
                    "throttle": throttleHandleValue,
                    "shadowBlur": shadowBlurHandleValue,
                    "shadowColor": shadowColorHandleValue,
                    "shadowOffsetX": shadowOffsetXHandleValue,
                    "shadowOffsetY": shadowOffsetYHandleValue
                ]
                
                expect(handle.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let handleByEnums = RadiusAxis.AxisPointer.Handle(
                    .show(showHandleValue),
                    .icon(iconHandleValue),
                    .size(sizeHandleValue),
                    .margin(marginHandleValue),
                    .color(colorHandleValue),
                    .throttle(throttleHandleValue),
                    .shadowBlur(shadowBlurHandleValue),
                    .shadowColor(shadowColorHandleValue),
                    .shadowOffsetX(shadowOffsetXHandleValue),
                    .shadowOffsetY(shadowOffsetYHandleValue)
                )
                
                expect(handleByEnums.jsonString).to(equal(handle.jsonString))
            }
        }
        
        let showAxisPointerValue = true
        let typeAxisPointerValue = RadiusAxis.AxisPointer.Type.line
        let snapAxisPointerValue = true
        let zAxisPointerValue: Float = 0.58364
        let labelAxisPointerValue = label
        let lineStyleAxisPointerValue = LineStyle(
            .opacity(0.8573),
            .shadowBlur(20.57),
            .curveness(200)
        )
        let shadowStyleAxisPointerValue = ShadowStyle(
            .color(Color.rgb(0, 0, 200)),
            .shadowColor(Color.rgba(200, 0, 0, 0.01)),
            .shadowOffsetX(200.0)
        )
        let triggerAxisPointerForTooltipValue = false
        let valueAxisPointerValue: Float = 0.8576
        let stateAxisPointerValue = false
        let handleAxisPointerValue = handle
        
        let axisPointer = RadiusAxis.AxisPointer()
        axisPointer.show = showAxisPointerValue
        axisPointer.type = typeAxisPointerValue
        axisPointer.snap = snapAxisPointerValue
        axisPointer.z = zAxisPointerValue
        axisPointer.label = labelAxisPointerValue
        axisPointer.lineStyle = lineStyleAxisPointerValue
        axisPointer.shadowStyle = shadowStyleAxisPointerValue
        axisPointer.triggerTooltip = triggerAxisPointerForTooltipValue
        axisPointer.value = valueAxisPointerValue
        axisPointer.state = stateAxisPointerValue
        axisPointer.handle = handleAxisPointerValue
        
        describe("For RadiusAxis.AxisPointer") { 
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "show": showAxisPointerValue,
                    "type": typeAxisPointerValue,
                    "snap": snapAxisPointerValue,
                    "z": zAxisPointerValue,
                    "label": labelAxisPointerValue,
                    "lineStyle": lineStyleAxisPointerValue,
                    "shadowStyle": shadowStyleAxisPointerValue,
                    "triggerTooltip": triggerAxisPointerForTooltipValue,
                    "value": valueAxisPointerValue,
                    "state": stateAxisPointerValue,
                    "handle": handleAxisPointerValue
                ]
                
                expect(axisPointer.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let axisPointerByEnums = RadiusAxis.AxisPointer(
                    .show(showAxisPointerValue),
                    .type(typeAxisPointerValue),
                    .snap(snapAxisPointerValue),
                    .z(zAxisPointerValue),
                    .label(labelAxisPointerValue),
                    .lineStyle(lineStyleAxisPointerValue),
                    .shadowStyle(shadowStyleAxisPointerValue),
                    .triggerTooltip(triggerAxisPointerForTooltipValue),
                    .value(valueAxisPointerValue),
                    .state(stateAxisPointerValue),
                    .handle(handleAxisPointerValue)
                )
                
                expect(axisPointerByEnums.jsonString).to(equal(axisPointer.jsonString))
            }
        }
        
        describe("For RadiusAxis") {
            let polarIndexValue: UInt8 = 0
            let typeValue = AxisType.time
            let nameValue = "radiusAxisNameValue"
            let nameLocationValue = Position.bottom
            let nameTextStyleValue = TextStyle(
                .color(Color.green),
                .fontStyle(.italic),
                .align(Position.right)
            )
            let nameGapValue: Float = 20
            let nameRotateValue: Float = 90
            let inverseValue = false
            let boundaryGapValue: BoundaryGap = [9.2873, 200]
            let minValue: Float = 0.47236
            let maxValue: Float = 2000.47346
            let scaleValue = true
            let splitNumberValue: UInt8 = 99
            let minIntervalValue: Float = 1
            let intervalValue: Float = 1000
            let logBaseValue: Float = 0.0000009
            let silentValue = false
            let triggerEventValue = false
            let axisLineValue = AxisLine(
               .show(false)
            )
            let axisLabelValue = AxisLabel(
                .formatter(.string("994.238")),
                .margin(29),
                .rotate(-90)
            )
            let axisTickValue = AxisTick(
                .alignWithLabel(false),
                .length(400),
                .interval(0)
            )
            let splitLineValue = SplitLine(
                .interval(20%)
            )
            let splitAreaValue = SplitArea(
                .show(true),
                .interval(200)
            )
            let dataValue: [Jsonable] = [
                false, "value", 20.57, 20
            ]
            let axisPointerValue = axisPointer
            let zlevelValue: Float = 255.552
            let zValue: Float = 0.58274
            
            let radiusAxis = RadiusAxis()
            radiusAxis.polarIndex = polarIndexValue
            radiusAxis.type = typeValue
            radiusAxis.name = nameValue
            radiusAxis.nameLocation = nameLocationValue
            radiusAxis.nameTextStyle = nameTextStyleValue
            radiusAxis.nameGap = nameGapValue
            radiusAxis.nameRotate = nameRotateValue
            radiusAxis.inverse = inverseValue
            radiusAxis.boundaryGap = boundaryGapValue
            radiusAxis.min = minValue
            radiusAxis.max = maxValue
            radiusAxis.scale = scaleValue
            radiusAxis.splitNumber = splitNumberValue
            radiusAxis.minInterval = minIntervalValue
            radiusAxis.interval = intervalValue
            radiusAxis.logBase = logBaseValue
            radiusAxis.silent = silentValue
            radiusAxis.triggerEvent = triggerEventValue
            radiusAxis.axisLine = axisLineValue
            radiusAxis.axisTick = axisTickValue
            radiusAxis.axisLabel = axisLabelValue
            radiusAxis.splitLine = splitLineValue
            radiusAxis.splitArea = splitAreaValue
            radiusAxis.data = dataValue
            radiusAxis.axisPointer = axisPointerValue
            radiusAxis.zlevel = zlevelValue
            radiusAxis.z = zValue
            
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "polarIndex": polarIndexValue,
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
                    "data": dataValue,
                    "axisPointer": axisPointerValue,
                    "zlevel": zlevelValue,
                    "z": zValue
                ]
                
                expect(radiusAxis.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let radiusAxisByEnums = RadiusAxis(
                    .polarIndex(polarIndexValue),
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
                    .data(dataValue),
                    .axisPointer(axisPointerValue),
                    .zlevel(zlevelValue),
                    .z(zValue)
                )
                
                expect(radiusAxisByEnums.jsonString).to(equal(radiusAxis.jsonString))
            }
        }
    }
}
