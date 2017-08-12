//
//  TitleSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 12/08/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class TitleSpec: QuickSpec {
    override func spec() {
        describe("For Title") {
            let showValue = true
            let textValue = "titleTextValue"
            let linkValue = "http://titleLinkValue"
            let targetValue = Target.blank
            let textStyleValue = TextStyle(
                .color(Color.auto),
                .fontWeight(FontWeight.bold)
            )
            let textAlignValue = Align.auto
            let textBaselineValue = VerticalAlign.bottom
            let subtextValue = "titleSubtextValue"
            let sublinkValue = "http://titleSublinkValue"
            let subtargetValue = Target.`self`
            let subtextStyleValue = TextStyle(
                .fontFamily("fontFamily"),
                .align(Position.right)
            )
            let paddingValue = Padding.null
            let itemGapValue: Float = 857834.734758
            let zlevelValue: Float = 84.7263
            let zValue: Float = 66463.723
            let leftValue = Position.left
            let rightValue = Position.right
            let topValue = Position.top
            let bottomValue = Position.bottom
            let backgroundColorValue = Color.red
            let borderColorValue = Color.hexColor("#83478f")
            let borderWidthValue: Float = 843758
            let shadowBlurValue: Float = 0
            let shadowColorValue = Color.yellow
            let shadowOffsetXValue: Float = 7.77777777
            let shadowOffsetYValue: Float = 0.000000000
            
            let title = Title()
            title.show = showValue
            title.text = textValue
            title.link = linkValue
            title.target = targetValue
            title.textStyle = textStyleValue
            title.textAlign = textAlignValue
            title.textBaseline = textBaselineValue
            title.subtext = subtextValue
            title.sublink = sublinkValue
            title.subtarget = subtargetValue
            title.subtextStyle = subtextStyleValue
            title.padding = paddingValue
            title.itemGap = itemGapValue
            title.zlevel = zlevelValue
            title.z = zValue
            title.left = leftValue
            title.top = topValue
            title.right = rightValue
            title.bottom = bottomValue
            title.backgroundColor = backgroundColorValue
            title.borderColor = borderColorValue
            title.borderWidth = borderWidthValue
            title.shadowBlur = shadowBlurValue
            title.shadowColor = shadowColorValue
            title.shadowOffsetX = shadowOffsetXValue
            title.shadowOffsetY = shadowOffsetYValue
            
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "show": showValue,
                    "text": textValue,
                    "link": linkValue,
                    "target": targetValue,
                    "textStyle": textStyleValue,
                    "textAlign": textAlignValue,
                    "textBaseline": textBaselineValue,
                    "subtext": subtextValue,
                    "sublink": sublinkValue,
                    "subtarget": subtargetValue,
                    "subtextStyle": subtextStyleValue,
                    "padding": paddingValue,
                    "itemGap": itemGapValue,
                    "zlevel": zlevelValue,
                    "z": zValue,
                    "left": leftValue,
                    "top": topValue,
                    "right": rightValue,
                    "bottom": bottomValue,
                    "backgroundColor": backgroundColorValue,
                    "borderColor": borderColorValue,
                    "borderWidth": borderWidthValue,
                    "shadowBlur": shadowBlurValue,
                    "shadowColor": shadowColorValue,
                    "shadowOffsetX": shadowOffsetXValue,
                    "shadowOffsetY": shadowOffsetYValue
                ]
                
                expect(title.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let titleByEnums = Title(
                    .show(showValue),
                    .text(textValue),
                    .link(linkValue),
                    .target(targetValue),
                    .textStyle(textStyleValue),
                    .textAlign(textAlignValue),
                    .textBaseline(textBaselineValue),
                    .subtext(subtextValue),
                    .sublink(sublinkValue),
                    .subtarget(subtargetValue),
                    .subtextStyle(subtextStyleValue),
                    .padding(paddingValue),
                    .itemGap(itemGapValue),
                    .zlevel(zlevelValue),
                    .z(zValue),
                    .left(leftValue),
                    .top(topValue),
                    .right(rightValue),
                    .bottom(bottomValue),
                    .backgroundColor(backgroundColorValue),
                    .borderColor(borderColorValue),
                    .borderWidth(borderWidthValue),
                    .shadowBlur(shadowBlurValue),
                    .shadowColor(shadowColorValue),
                    .shadowOffsetX(shadowOffsetXValue),
                    .shadowOffsetY(shadowOffsetYValue)
                )
                
                expect(titleByEnums.jsonString).to(equal(title.jsonString))
            }
            
            it("needs to check the x, y") {
                let xValue = Position.value(587.23872)
                let yValue = Position.value(0.57237)
                
                title.left = xValue
                title.top = yValue
                
                let titleByEnums = Title(
                    .show(showValue),
                    .text(textValue),
                    .link(linkValue),
                    .target(targetValue),
                    .textStyle(textStyleValue),
                    .textAlign(textAlignValue),
                    .textBaseline(textBaselineValue),
                    .subtext(subtextValue),
                    .sublink(sublinkValue),
                    .subtarget(subtargetValue),
                    .subtextStyle(subtextStyleValue),
                    .padding(paddingValue),
                    .itemGap(itemGapValue),
                    .zlevel(zlevelValue),
                    .z(zValue),
                    .x(xValue),
                    .y(yValue),
                    .right(rightValue),
                    .bottom(bottomValue),
                    .backgroundColor(backgroundColorValue),
                    .borderColor(borderColorValue),
                    .borderWidth(borderWidthValue),
                    .shadowBlur(shadowBlurValue),
                    .shadowColor(shadowColorValue),
                    .shadowOffsetX(shadowOffsetXValue),
                    .shadowOffsetY(shadowOffsetYValue)
                )
                
                expect(titleByEnums.jsonString).to(equal(title.jsonString))
            }
        }
    }
}
