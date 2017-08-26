//
//  TooltipSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 26/08/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class TooltipSpec: QuickSpec {
    override func spec() {
        describe("For Tooltip.Trigger.TriggerOn") {
            let mousemoveString = "mousemove"
            let clickString = "click"
            let noneString = "none"
            
            let mousemoveTriggerOn = Tooltip.Trigger.TriggerOn.mousemove
            let clickTriggerOn = Tooltip.Trigger.TriggerOn.click
            let noneTriggerOn = Tooltip.Trigger.TriggerOn.none
            
            it("needs to check the enum case jsonString") {
                expect(mousemoveTriggerOn.jsonString).to(equal(mousemoveString.jsonString))
                expect(clickTriggerOn.jsonString).to(equal(clickString.jsonString))
                expect(noneTriggerOn.jsonString).to(equal(noneString.jsonString))
            }
        }
        
        describe("For Tooltip.Trigger") {
            let itemString = "item"
            let axisString = "axis"
            let noneString = "none"
            
            let itemTrigger = Tooltip.Trigger.item
            let axisTrigger = Tooltip.Trigger.axis
            let noneTrigger = Tooltip.Trigger.none
            
            it("needs to check the enum case jsonString") {
                expect(itemTrigger.jsonString).to(equal(itemString.jsonString))
                expect(axisTrigger.jsonString).to(equal(axisString.jsonString))
                expect(noneTrigger.jsonString).to(equal(noneString.jsonString))
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
        
        let crossStyle = AxisPointer.CrossStyle()
        crossStyle.color = colorCrossStyleValue
        crossStyle.width = widthCrossStyleValue
        crossStyle.type = typeCrossStyleValue
        crossStyle.shadowBlur = shadowBlurCrossStyleValue
        crossStyle.shadowColor = shadowColorCrossStyleValue
        crossStyle.shadowOffsetX = shadowOffsetXCrossStyleValue
        crossStyle.shadowOffsetY = shadowOffsetYCrossStyleValue
        crossStyle.textStyle = textStyleCrossStyleValue
        
        let typeAxisPointerValue = SwiftyEcharts.AxisPointer.Type.cross
        let axisAxisPointerValue = AxisPointer.Axis.angle
        let animationAxisPointerValue = false
        let animationThresholdAxisPointerValue: Float = 0.000000
        let animationDurationAxisPointerValue = Time.number(764.7777)
        let animationEasingAxisPointerValue = EasingFunction.quarticInOut
        let animationDelayAxisPointerValue: Time = 88
        let animationDurationUpdateAxisPointerValue: Time = 75.37
        let animationEasingUpdateAxisPointerValue: EasingFunction = .cubicInOut
        let animationDelayUpdateAxisPointerValue = Time.init(integerLiteral: 84723)
        let lineStyleAxisPointerValue = LineStyle(
            .width(7.247),
            .color(rgb(88, 102, 200)),
            .curveness(888.8888),
            .type(LineType.solid)
        )
        let crossStyleAxisPointerValue = crossStyle
        let shadowStyleAxisPointerValue = ShadowStyle(
            .shadowBlur(10),
            .shadowColor(rgba(0, 0, 0, 0.5))
        )
        
        let axisPointer = AxisPointer()
        axisPointer.type = typeAxisPointerValue
        axisPointer.axis = axisAxisPointerValue
        axisPointer.animation = animationAxisPointerValue
        axisPointer.animationThreshold = animationThresholdAxisPointerValue
        axisPointer.animationDuration = animationDurationAxisPointerValue
        axisPointer.animationEasing = animationEasingAxisPointerValue
        axisPointer.animationDelay = animationDelayAxisPointerValue
        axisPointer.animationDurationUpdate = animationDurationUpdateAxisPointerValue
        axisPointer.animationEasingUpdate = animationEasingUpdateAxisPointerValue
        axisPointer.animationDelayUpdate = animationDelayUpdateAxisPointerValue
        axisPointer.lineStyle = lineStyleAxisPointerValue
        axisPointer.crossStyle = crossStyleAxisPointerValue
        axisPointer.shadowStyle = shadowStyleAxisPointerValue
        
        describe("For Tooltip") {
            let showValue = true
            let showContentValue = true
            let triggerValue = Tooltip.Trigger.axis
            let triggerOnValue = Tooltip.Trigger.TriggerOn.none
            let alwaysShowContentValue = false
            let showDelayValue: Float = 85.7346
            let hideDelayValue: Float = 0.75723
            let positionValue = Position.inside
            let confineValue = false
            let transitionDurationValue: Float = 5555
            let formatterValue = Formatter.string("tooltipFormatterValue")
            let backgroundColorValue = Color.hexColor("#fff000")
            let borderColorValue = Color.rgb(0, 0, 255)
            let borderWidthValue: Float = 8573.273
            let paddingValue = Padding.all(88)
            let textStyleValue = TextStyle(
                .color(Color.rgb(255, 255, 255)),
                .fontWeight(FontWeight.bold),
                .fontSize(16)
            )
            let extraCssTextValue = "box-shadow: 0 0 3px rgba(0, 0, 0, 0.3);"
            let axisPointerValue = axisPointer
            
            let tooltip = Tooltip()
            tooltip.show = showValue
            tooltip.showContent = showContentValue
            tooltip.trigger = triggerValue
            tooltip.triggerOn = triggerOnValue
            tooltip.alwaysShowContent = alwaysShowContentValue
            tooltip.showDelay = showDelayValue
            tooltip.hideDelay = hideDelayValue
            tooltip.position = positionValue
            tooltip.confine = confineValue
            tooltip.transitionDuration = transitionDurationValue
            tooltip.formatter = formatterValue
            tooltip.backgroundColor = backgroundColorValue
            tooltip.borderColor = borderColorValue
            tooltip.borderWidth = borderWidthValue
            tooltip.padding = paddingValue
            tooltip.textStyle = textStyleValue
            tooltip.extraCssText = extraCssTextValue
            tooltip.axisPointer = axisPointerValue
            
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "show": showValue,
                    "showContent": showContentValue,
                    "trigger": triggerValue,
                    "triggerOn": triggerOnValue,
                    "alwaysShowContent": alwaysShowContentValue,
                    "showDelay": showDelayValue,
                    "hideDelay": hideDelayValue,
                    "position": positionValue,
                    "confine": confineValue,
                    "transitionDuration": transitionDurationValue,
                    "formatter": formatterValue,
                    "backgroundColor": backgroundColorValue,
                    "borderColor": borderColorValue,
                    "borderWidth": borderWidthValue,
                    "padding": paddingValue,
                    "textStyle": textStyleValue,
                    "extraCssText": extraCssTextValue,
                    "axisPointer": axisPointerValue
                ]
                
                expect(tooltip.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let tooltipByEnums = Tooltip(
                    .show(showValue),
                    .showContent(showContentValue),
                    .trigger(triggerValue),
                    .triggerOn(triggerOnValue),
                    .alwaysShowContent(alwaysShowContentValue),
                    .showDelay(showDelayValue),
                    .hideDelay(hideDelayValue),
                    .position(positionValue),
                    .confine(confineValue),
                    .transitionDuration(transitionDurationValue),
                    .formatter(formatterValue),
                    .backgroundColor(backgroundColorValue),
                    .borderColor(borderColorValue),
                    .borderWidth(borderWidthValue),
                    .padding(paddingValue),
                    .textStyle(textStyleValue),
                    .extraCssText(extraCssTextValue),
                    .axisPointer(axisPointerValue)
                )
                
                expect(tooltipByEnums.jsonString).to(equal(tooltip.jsonString))
            }
        }
    }
}
