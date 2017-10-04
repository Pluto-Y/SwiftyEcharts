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
        
        let crossStyle = AxisPointerForTooltip.CrossStyle()
        crossStyle.color = colorCrossStyleValue
        crossStyle.width = widthCrossStyleValue
        crossStyle.type = typeCrossStyleValue
        crossStyle.shadowBlur = shadowBlurCrossStyleValue
        crossStyle.shadowColor = shadowColorCrossStyleValue
        crossStyle.shadowOffsetX = shadowOffsetXCrossStyleValue
        crossStyle.shadowOffsetY = shadowOffsetYCrossStyleValue
        crossStyle.textStyle = textStyleCrossStyleValue
        
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
        
        context("Test Action of Tooltip") {
            describe("For ShowTipAction") { 
                let typeValue = EchartsActionType.showTip
                let xValue: Float = 100.0
                let yValue: Float = -10
                let positionValue = Position.center
                let seriesIndexValue: Int = 200
                let dataIndexValue: Int = 0
                let nameValue = "showTipActionName"
                
                let showTipAction = Tooltip.ShowTipAction()
                showTipAction.x = xValue
                showTipAction.y = yValue
                showTipAction.position = positionValue
                showTipAction.seriesIndex = seriesIndexValue
                showTipAction.dataIndex = dataIndexValue
                showTipAction.name = nameValue
                
                it("needs to check the type value") {
                    expect(showTipAction.type.jsonString).to(equal(typeValue.jsonString))
                }
                
                it("needs to check the jsonString") {
                    let resultDic: [String: Jsonable] = [
                        "type": typeValue,
                        "x": xValue,
                        "y": yValue,
                        "position": positionValue,
                        "seriesIndex": seriesIndexValue,
                        "dataIndex": dataIndexValue,
                        "name": nameValue
                    ]
                    
                    expect(showTipAction.jsonString).to(equal(resultDic.jsonString))
                }
                
                it("needs to check the Enumable") {
                    let showTipActionByEnums = Tooltip.ShowTipAction(
                        .x(xValue),
                        .y(yValue),
                        .position(positionValue),
                        .seriesIndex(seriesIndexValue),
                        .dataIndex(dataIndexValue),
                        .name(nameValue)
                    )
                    
                    expect(showTipActionByEnums.jsonString).to(equal(showTipAction.jsonString))
                }
            }
            
            describe("For HideTipAction", {
                let typeValue = EchartsActionType.hideTip
                
                let hideTipAction = Tooltip.HideTipAction()
                
                it("needs to check the jsonString") {
                    expect(hideTipAction.type.jsonString).to(equal(typeValue.jsonString))
                }
                
                it("needs to check the jsonString") {
                    let resultDic: [String: Jsonable] = [
                        "type": typeValue
                    ]
                    
                    expect(hideTipAction.jsonString).to(equal(resultDic.jsonString))
                }
            })
        }
    }
}
