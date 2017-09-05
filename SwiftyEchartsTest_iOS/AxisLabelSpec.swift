//
//  AxisLabelSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 26/06/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class AxisLabelSpec: QuickSpec {
    override func spec() {
        describe("For AxisLabel") {
            let showValue = false
            let intervalValue: UInt = 99
            let insideValue = true
            let rotateValue: Float = 89
            let marginValue: Float = 105
            let formatterValue = Formatter.string("function tooltipAxisPointer(params){ var tar; if(params[1].value != '-') { tar = params[1]; } else { tar = param[0]; } return tar.name + '<br/>' + tar.seriesName + ' : ' + tar.value}")
            let showMinLabelValue = false
            let showMaxLabelValue = true
            let colorValue = Color.hexColor("#5a6d88")
            let fontStyleValue = FontStyle.italic
            let fontWeightValue = FontWeight.weight(20)
            let fontFamilyValue = "axisLabelFontFamilyValue"
            let fontSizeValue: UInt8 = UInt8.max
            let alignValue = Align.auto
            let verticalAlignValue = VerticalAlign.top
            let lineHeightValue: Float = 120.0
            let backgroundColorValue = Color.rgb(200, 100, 2)
            let borderColorValue = Color.blue
            let borderWidthValue: Float = 5.0
            let borderRadiusValue: Float = 2.0
            let paddingValue: Padding = [20, 100]
            let shadowColorValue = rgba(200, 200, 200, 0.5)
            let shadowBlurValue: Float = 10.0
            let shadowOffsetXValue: Float = 0.55
            let shadowOffsetYValue: Float = 100.0
            let widthValue = 80%
            let heightValue = 100
            let textBorderColorValue = Color.auto
            let textBorderWidthValue: Float = 48.0
            let textShadowColorValue = Color.transparent
            let textShadowBlurValue: Float = 10.0
            let textShadowOffsetXValue: Float = 0.0
            let textShadowOffsetYValue: Float = 0.0
            let richValue: [String: Jsonable] = [
                "a": ["color": "red", "lineHeight": 10],
                "b": ["backgroundColor": ["image": "xxx/xx.jpg"]],
                "c": ["fontSize": 18, "fontFamily": "Microsoft YaHei", "borderColor": "#449933", "borderRadius": 4]
            ]
            
            let axisLabel = AxisLabel()
            axisLabel.show = showValue
            axisLabel.interval = intervalValue
            axisLabel.inside = insideValue
            axisLabel.rotate = rotateValue
            axisLabel.margin = marginValue
            axisLabel.formatter = formatterValue
            axisLabel.showMinLabel = showMinLabelValue
            axisLabel.showMaxLabel = showMaxLabelValue
            axisLabel.color = colorValue
            axisLabel.fontStyle = fontStyleValue
            axisLabel.fontWeight = fontWeightValue
            axisLabel.fontFamily = fontFamilyValue
            axisLabel.fontSize = fontSizeValue
            axisLabel.align = alignValue
            axisLabel.verticalAlign = verticalAlignValue
            axisLabel.lineHeight = lineHeightValue
            axisLabel.backgroundColor = backgroundColorValue
            axisLabel.borderColor = borderColorValue
            axisLabel.borderWidth = borderWidthValue
            axisLabel.borderRadius = borderRadiusValue
            axisLabel.padding = paddingValue
            axisLabel.shadowColor = shadowColorValue
            axisLabel.shadowBlur = shadowBlurValue
            axisLabel.shadowOffsetX = shadowOffsetXValue
            axisLabel.shadowOffsetY = shadowOffsetYValue
            axisLabel.width = widthValue
            axisLabel.height = heightValue
            axisLabel.textBorderColor = textBorderColorValue
            axisLabel.textBorderWidth = textBorderWidthValue
            axisLabel.textShadowColor = textShadowColorValue
            axisLabel.textShadowBlur = textShadowBlurValue
            axisLabel.textShadowOffsetX = textShadowOffsetXValue
            axisLabel.textShadowOffsetY = textShadowOffsetYValue
            axisLabel.rich = richValue
            JsCache.removeAll()
            
            beforeEach {
                // 避免重复添加内容到 JsCache 中
                JsCache.removeAll()
            }
            
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "show": showValue,
                    "interval": intervalValue,
                    "inside": insideValue,
                    "rotate": rotateValue,
                    "margin": marginValue,
                    "formatter": formatterValue,
                    "showMinLabel": showMinLabelValue,
                    "showMaxLabel": showMaxLabelValue,
                    "color": colorValue,
                    "fontStyle": fontStyleValue,
                    "fontWeight": fontWeightValue,
                    "fontFamily": fontFamilyValue,
                    "fontSize": fontSizeValue,
                    "align": alignValue,
                    "verticalAlign": verticalAlignValue,
                    "lineHeight": lineHeightValue,
                    "backgroundColor": backgroundColorValue,
                    "borderColor": borderColorValue,
                    "borderWidth": borderWidthValue,
                    "borderRadius": borderRadiusValue,
                    "padding": paddingValue,
                    "shadowColor": shadowColorValue,
                    "shadowBlur": shadowBlurValue,
                    "shadowOffsetX": shadowOffsetXValue,
                    "shadowOffsetY": shadowOffsetYValue,
                    "width": widthValue,
                    "height": heightValue,
                    "textBorderColor": textBorderColorValue,
                    "textBorderWidth": textBorderWidthValue,
                    "textShadowColor": textShadowColorValue,
                    "textShadowBlur": textShadowBlurValue,
                    "textShadowOffsetX": textShadowOffsetXValue,
                    "textShadowOffsetY": textShadowOffsetYValue,
                    "rich": richValue
                ]
                
                expect(axisLabel.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let axisLabelByEnums = AxisLabel(
                    .show(showValue),
                    .interval(intervalValue),
                    .inside(insideValue),
                    .rotate(rotateValue),
                    .margin(marginValue),
                    .formatter(formatterValue),
                    .showMinLabel(showMinLabelValue),
                    .showMaxLabel(showMaxLabelValue),
                    .color(colorValue),
                    .fontStyle(fontStyleValue),
                    .fontWeight(fontWeightValue),
                    .fontFamily(fontFamilyValue),
                    .fontSize(fontSizeValue),
                    .align(alignValue),
                    .verticalAlign(verticalAlignValue),
                    .lineHeight(lineHeightValue),
                    .backgroundColor(backgroundColorValue),
                    .borderColor(borderColorValue),
                    .borderWidth(borderWidthValue),
                    .borderRadius(borderRadiusValue),
                    .padding(paddingValue),
                    .shadowColor(shadowColorValue),
                    .shadowBlur(shadowBlurValue),
                    .shadowOffsetX(shadowOffsetXValue),
                    .shadowOffsetY(shadowOffsetYValue),
                    .width(widthValue),
                    .height(heightValue),
                    .textBorderColor(textBorderColorValue),
                    .textBorderWidth(textBorderWidthValue),
                    .textShadowColor(textShadowColorValue),
                    .textShadowBlur(textShadowBlurValue),
                    .textShadowOffsetX(textShadowOffsetXValue),
                    .textShadowOffsetY(textShadowOffsetYValue),
                    .rich(richValue)
                )
                
                expect(axisLabel.jsonString).to(equal(axisLabelByEnums.jsonString))
            }
        }
    }
}
