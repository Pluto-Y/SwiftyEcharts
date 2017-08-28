//
//  AxisPointerSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 26/08/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class AxisPointerSpec: QuickSpec {
    override func spec() {
        
        context("For AxisPointerForAxis") {
            describe("For AxisPointerForAxis.Type") {
                let lineString = "line"
                let shadowString = "shadow"
                
                let lineType = SwiftyEcharts.AxisPointerForAxis.Type.line
                let shadowType = SwiftyEcharts.AxisPointerForAxis.Type.shadow
                
                it("needs to check the jsonString") {
                    expect(lineType.jsonString).to(equal(lineString.jsonString))
                    expect(shadowType.jsonString).to(equal(shadowString.jsonString))
                }
            }
            
            let showLabelValue = false
            let precisionLabelValue: UInt8 = 4
            let formatterLabelValue = Formatter.string("labelFormatterValue")
            let marginLabelValue: Float = 0.0
            let textStyleLabelValue = TextStyle()
            let paddingLabelValue = Padding.verticalAndHorizontal(5, 10)
            let backgroundColorLabelValue = Color.hexColor("#029573")
            let borderColorLabelValue = Color.red
            let borderWidthLabelValue: Float = 0.8572
            let shadowBlurLabelValue: Float = 10
            let shadowColorLabelValue = rgb(100, 0, 38)
            let shadowOffsetXLabelValue: Float = 0.8572
            let shadowOffsetYLabelValue: Float = 8937462.7623467
            
            let label = Label()
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
            
            let handle = AxisPointerForAxis.Handle()
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
            
            describe("For AxisPointerForAxis.Handle") {
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
                    let handleByEnums = AxisPointerForAxis.Handle(
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
            let typeAxisPointerValue = SwiftyEcharts.AxisPointerForAxis.Type.line
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
            
            let axisPointer = AxisPointerForAxis()
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
            
            describe("For AxisPointerForAxis") {
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
                    let axisPointerByEnums = AxisPointerForAxis(
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
            
        }
        describe("For AxisPointerForTooltip.Type") {
            let lineString = "line"
            let crossString = "cross"
            let shadowString = "shadow"
            let noneString = "none"
            
            let lineType = SwiftyEcharts.AxisPointerForTooltip.Type.line
            let crossType = SwiftyEcharts.AxisPointerForTooltip.Type.cross
            let shadowType = SwiftyEcharts.AxisPointerForTooltip.Type.shadow
            let noneType = SwiftyEcharts.AxisPointerForTooltip.Type.none

            it("needs to check the enum case jsonString") {
                expect(lineType.jsonString).to(equal(lineString.jsonString))
                expect(crossType.jsonString).to(equal(crossString.jsonString))
                expect(shadowType.jsonString).to(equal(shadowString.jsonString))
                expect(noneType.jsonString).to(equal(noneString.jsonString))
            }
        }
        
        describe("For AxisPointerForTooltip.Axis") {
            let xString = "x"
            let yString = "y"
            let radiusString = "radius"
            let angleString = "angle"
            let autoString = "auto"
            
            let xAxis = AxisPointerForTooltip.Axis.x
            let yAxis = AxisPointerForTooltip.Axis.y
            let radiusAxis = AxisPointerForTooltip.Axis.radius
            let angleAxis = AxisPointerForTooltip.Axis.angle
            let autoAxis = AxisPointerForTooltip.Axis.auto
            
            it("needs to check the enum case jsonString") {
                expect(xAxis.jsonString).to(equal(xString.jsonString))
                expect(yAxis.jsonString).to(equal(yString.jsonString))
                expect(radiusAxis.jsonString).to(equal(radiusString.jsonString))
                expect(angleAxis.jsonString).to(equal(angleString.jsonString))
                expect(autoAxis.jsonString).to(equal(autoString.jsonString))
            }
        }
        
        let colorCrossStyleValue = Color.hexColor("#87fabe")
        let widthCrossStyleValue: Float = 85.347
        let typeCrossStyleValue = LineType.dashed
        let shadowBlurCrossStyleValue: Float = 985479
        let shadowColorCrossStyleValue = Color.auto
        let shadowOffsetXCrossStyleValue: Float = 0
        let shadowOffsetYCrossStyleValue: Float = 0.0000038747238
        let textStyleCrossStyleValue = TextStyle(
            .color(Color.blue),
            .fontStyle(FontStyle.italic),
            .fontSize(75)
        )
        
        let crossStyle = AxisPointerForTooltip.CrossStyle()
        crossStyle.color = colorCrossStyleValue
        crossStyle.width = widthCrossStyleValue
        crossStyle.type = typeCrossStyleValue
        crossStyle.shadowBlur = shadowBlurCrossStyleValue
        crossStyle.shadowColor = shadowColorCrossStyleValue
        crossStyle.shadowOffsetX = shadowOffsetXCrossStyleValue
        crossStyle.shadowOffsetY = shadowOffsetYCrossStyleValue
        crossStyle.textStyle = textStyleCrossStyleValue
        
        describe("For AxisPointerForTooltip.CrossStyle") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "color": colorCrossStyleValue,
                    "width": widthCrossStyleValue,
                    "type": typeCrossStyleValue,
                    "shadowBlur": shadowBlurCrossStyleValue,
                    "shadowColor": shadowColorCrossStyleValue,
                    "shadowOffsetX": shadowOffsetXCrossStyleValue,
                    "shadowOffsetY": shadowOffsetYCrossStyleValue,
                    "textStyle": textStyleCrossStyleValue
                ]
                
                expect(crossStyle.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let crossStyleByEnums = AxisPointerForTooltip.CrossStyle(
                    .color(colorCrossStyleValue),
                    .width(widthCrossStyleValue),
                    .type(typeCrossStyleValue),
                    .shadowBlur(shadowBlurCrossStyleValue),
                    .shadowColor(shadowColorCrossStyleValue),
                    .shadowOffsetX(shadowOffsetXCrossStyleValue),
                    .shadowOffsetY(shadowOffsetYCrossStyleValue),
                    .textStyle(textStyleCrossStyleValue)
                )
                
                expect(crossStyleByEnums.jsonString).to(equal(crossStyle.jsonString))
            }
        }
        
        let typeAxisPointerForTooltipValue = SwiftyEcharts.AxisPointerForTooltip.Type.cross
        let axisAxisPointerForTooltipValue = AxisPointerForTooltip.Axis.angle
        let animationAxisPointerForTooltipValue = false
        let animationThresholdAxisPointerForTooltipValue: Float = 0.000000
        let animationDurationAxisPointerForTooltipValue = Time.number(764.7777)
        let animationEasingAxisPointerForTooltipValue = EasingFunction.quarticInOut
        let animationDelayAxisPointerForTooltipValue: Time = 88
        let animationDurationUpdateAxisPointerForTooltipValue: Time = 75.37
        let animationEasingUpdateAxisPointerForTooltipValue: EasingFunction = .cubicInOut
        let animationDelayUpdateAxisPointerForTooltipValue = Time.init(integerLiteral: 84723)
        let lineStyleAxisPointerForTooltipValue = LineStyle(
            .width(7.247),
            .color(rgb(88, 102, 200)),
            .curveness(888.8888),
            .type(LineType.solid)
        )
        let crossStyleAxisPointerForTooltipValue = crossStyle
        let shadowStyleAxisPointerForTooltipValue = ShadowStyle(
            .shadowBlur(10),
            .shadowColor(rgba(0, 0, 0, 0.5))
        )
        
        let axisPointer = AxisPointerForTooltip()
        axisPointer.type = typeAxisPointerForTooltipValue
        axisPointer.axis = axisAxisPointerForTooltipValue
        axisPointer.animation = animationAxisPointerForTooltipValue
        axisPointer.animationThreshold = animationThresholdAxisPointerForTooltipValue
        axisPointer.animationDuration = animationDurationAxisPointerForTooltipValue
        axisPointer.animationEasing = animationEasingAxisPointerForTooltipValue
        axisPointer.animationDelay = animationDelayAxisPointerForTooltipValue
        axisPointer.animationDurationUpdate = animationDurationUpdateAxisPointerForTooltipValue
        axisPointer.animationEasingUpdate = animationEasingUpdateAxisPointerForTooltipValue
        axisPointer.animationDelayUpdate = animationDelayUpdateAxisPointerForTooltipValue
        axisPointer.lineStyle = lineStyleAxisPointerForTooltipValue
        axisPointer.crossStyle = crossStyleAxisPointerForTooltipValue
        axisPointer.shadowStyle = shadowStyleAxisPointerForTooltipValue
        
        describe("For AxisPointerForTooltip") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "type": typeAxisPointerForTooltipValue,
                    "axis": axisAxisPointerForTooltipValue,
                    "animation": animationAxisPointerForTooltipValue,
                    "animationThreshold": animationThresholdAxisPointerForTooltipValue,
                    "animationDuration": animationDurationAxisPointerForTooltipValue,
                    "animationEasing": animationEasingAxisPointerForTooltipValue,
                    "animationDelay": animationDelayAxisPointerForTooltipValue,
                    "animationDurationUpdate": animationDurationUpdateAxisPointerForTooltipValue,
                    "animationEasingUpdate": animationEasingUpdateAxisPointerForTooltipValue,
                    "animationDelayUpdate": animationDelayUpdateAxisPointerForTooltipValue,
                    "lineStyle": lineStyleAxisPointerForTooltipValue,
                    "crossStyle": crossStyleAxisPointerForTooltipValue,
                    "shadowStyle": shadowStyleAxisPointerForTooltipValue
                ]
                
                expect(axisPointer.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let axisPointerByEnums = AxisPointerForTooltip(
                    .type(typeAxisPointerForTooltipValue),
                    .axis(axisAxisPointerForTooltipValue),
                    .animation(animationAxisPointerForTooltipValue),
                    .animationThreshold(animationThresholdAxisPointerForTooltipValue),
                    .animationDuration(animationDurationAxisPointerForTooltipValue),
                    .animationEasing(animationEasingAxisPointerForTooltipValue),
                    .animationDelay(animationDelayAxisPointerForTooltipValue),
                    .animationDurationUpdate(animationDurationUpdateAxisPointerForTooltipValue),
                    .animationEasingUpdate(animationEasingUpdateAxisPointerForTooltipValue),
                    .animationDelayUpdate(animationDelayUpdateAxisPointerForTooltipValue),
                    .lineStyle(lineStyleAxisPointerForTooltipValue),
                    .crossStyle(crossStyleAxisPointerForTooltipValue),
                    .shadowStyle(shadowStyleAxisPointerForTooltipValue)
                )
                
                expect(axisPointerByEnums.jsonString).to(equal(axisPointer.jsonString))
            }
        }
    }
}
