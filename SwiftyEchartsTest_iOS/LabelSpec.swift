//
//  LabelSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 03/07/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class LabelSpec: QuickSpec {
    override func spec() {
        describe("For Label") {
            let showValue = false
            let precisionValue: UInt8 = 255
            let formatterValue = Formatter.string("labelFormatterValue")
            let marginValue: Float = 7462.238
            let textStyleValue = TextStyle(
                .align(Position.center),
                .fontSize(8),
                .fontStyle(.normal),
                .color(Color.red)
            )
            let paddingValue = Padding.all(10)
            let backgroundColorValue = Color.hexColor("#f829ba")
            let borderColorValue = Color.rgb(0, 76, 99)
            let borderWidthValue: Float = 8573.237
            let shadowBlurValue: Float = 837.2783
            let shadowColorValue = rgba(76, 127, 44, 0.8888)
            let shadowOffsetXValue: Float = 0.0000023874823
            let shadowOffsetYValue: Float = 4763.2398
            
            let label = Label()
            label.show = showValue
            label.precision = precisionValue
            label.formatter = formatterValue
            label.margin = marginValue
            label.textStyle = textStyleValue
            label.padding = paddingValue
            label.backgroundColor = backgroundColorValue
            label.borderColor = borderColorValue
            label.borderWidth = borderWidthValue
            label.shadowBlur = shadowBlurValue
            label.shadowColor = shadowColorValue
            label.shadowOffsetX = shadowOffsetXValue
            label.shadowOffsetY = shadowOffsetYValue
            
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "show": showValue,
                    "precision": precisionValue,
                    "formatter": formatterValue,
                    "margin": marginValue,
                    "textStyle": textStyleValue,
                    "padding": paddingValue,
                    "backgroundColor": backgroundColorValue,
                    "borderColor": borderColorValue,
                    "borderWidth": borderWidthValue,
                    "shadowBlur": shadowBlurValue,
                    "shadowColor": shadowColorValue,
                    "shadowOffsetX": shadowOffsetXValue,
                    "shadowOffsetY": shadowOffsetYValue
                ]
                
                expect(label.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let labelByEnums = Label(
                    .show(showValue),
                    .precision(precisionValue),
                    .formatter(formatterValue),
                    .margin(marginValue),
                    .textStyle(textStyleValue),
                    .padding(paddingValue),
                    .backgroundColor(backgroundColorValue),
                    .borderColor(borderColorValue),
                    .borderWidth(borderWidthValue),
                    .shadowBlur(shadowBlurValue),
                    .shadowColor(shadowColorValue),
                    .shadowOffsetX(shadowOffsetXValue),
                    .shadowOffsetY(shadowOffsetYValue)
                )
                
                expect(labelByEnums.jsonString).to(equal(label.jsonString))
            }
        }
        
        context("For EmphasisLabel") {
            let positionLabelStyleValue = Position.center
            let showLabelStyleValue = false
            let intervalLabelStyleValue: UInt8 = 44
            let rotateLabelStyleValue: Float = 3874.92
            let formatterLabelStyleValue = Formatter.string("labelStyleFormatterValue")
            let colorLabelStyleValue = Color.hexColor("876543")
            let fontStyleLabelStyleValue = FontStyle.oblique
            let fontWeightLabelStyleValue = FontWeight.lighter
            let fontFamilyLabelStyleValue = "Arial"
            let fontSizeLabelStyleValue: UInt = 18
            let alignLabelStyleValue = Align.none
            let verticalAlignLabelStyleValue = VerticalAlign.bottom
            let lineHeightLabelStyleValue: Float = 85723.1
            let backgroundColorLabelStyleValue = Color.rgb(76, 12, 45)
            let borderColorLabelStyleValue = Color.yellow
            let borderWidthLabelStyleValue: Float = 0
            let borderRadiusLabelStyleValue: Float = 2.0
            let paddingLabelStyleValue = Padding.trbl(0, 0, 20, 10)
            let shadowColorLabelStyleValue = Color.transparent
            let shadowBlurLabelStyleValue: Float = 2.0
            let shadowOffsetXLabelStyleValue: Float = 10.0
            let shadowOffsetYLabelStyleValue: Float = 857234.4
            let widthLabelStyleValue = 20%
            let heightLabelStyleValue = 80%
            let textBorderColorLabelStyleValue = Color.auto
            let textBorderWidthLabelStyleValue: Float = 5.0
            let textShadowColorLabelStyleValue = Color.blue
            let textShadowBlurLabelStyleValue: Float = 8572
            let textShadowOffsetXLabelStyleValue: Float = 4444444
            let textShadowOffsetYLabelStyleValue: Float = 0.11111111111
            let richLabelStyleValue: [String: Jsonable] = ["key": "value1", "intkey": 28, "doubleKey": 84.28, "boolKey": false]
            
            let labelStyle = LabelStyle()
            labelStyle.position = positionLabelStyleValue
            labelStyle.show = showLabelStyleValue
            labelStyle.interval = intervalLabelStyleValue
            labelStyle.rotate = rotateLabelStyleValue
            labelStyle.formatter = formatterLabelStyleValue
            labelStyle.color = colorLabelStyleValue
            labelStyle.fontStyle = fontStyleLabelStyleValue
            labelStyle.fontWeight = fontWeightLabelStyleValue
            labelStyle.fontFamily = fontFamilyLabelStyleValue
            labelStyle.fontSize = fontSizeLabelStyleValue
            labelStyle.align = alignLabelStyleValue
            labelStyle.verticalAlign = verticalAlignLabelStyleValue
            labelStyle.lineHeight = lineHeightLabelStyleValue
            labelStyle.backgroundColor = backgroundColorLabelStyleValue
            labelStyle.borderColor = borderColorLabelStyleValue
            labelStyle.borderWidth = borderWidthLabelStyleValue
            labelStyle.borderRadius = borderRadiusLabelStyleValue
            labelStyle.padding = paddingLabelStyleValue
            labelStyle.shadowColor = shadowColorLabelStyleValue
            labelStyle.shadowBlur = shadowBlurLabelStyleValue
            labelStyle.shadowOffsetX = shadowOffsetXLabelStyleValue
            labelStyle.shadowOffsetY = shadowOffsetYLabelStyleValue
            labelStyle.width = widthLabelStyleValue
            labelStyle.height = heightLabelStyleValue
            labelStyle.textBorderColor = textBorderColorLabelStyleValue
            labelStyle.textBorderWidth = textBorderWidthLabelStyleValue
            labelStyle.textShadowColor = textShadowColorLabelStyleValue
            labelStyle.textShadowBlur = textShadowBlurLabelStyleValue
            labelStyle.textShadowOffsetX = textShadowOffsetXLabelStyleValue
            labelStyle.textShadowOffsetY = textShadowOffsetYLabelStyleValue
            labelStyle.rich = richLabelStyleValue
            
            describe("For LabelStyle") {
                it("needs to check the jsonString") {
                    let resultDic: [String: Jsonable] = [
                        "position": positionLabelStyleValue,
                        "show": showLabelStyleValue,
                        "interval": intervalLabelStyleValue,
                        "rotate": rotateLabelStyleValue,
                        "formatter": formatterLabelStyleValue,
                        "color": colorLabelStyleValue,
                        "fontStyle": fontStyleLabelStyleValue,
                        "fontWeight": fontWeightLabelStyleValue,
                        "fontFamily": fontFamilyLabelStyleValue,
                        "fontSize": fontSizeLabelStyleValue,
                        "align": alignLabelStyleValue,
                        "verticalAlign": verticalAlignLabelStyleValue,
                        "lineHeight": lineHeightLabelStyleValue,
                        "backgroundColor": backgroundColorLabelStyleValue,
                        "borderColor": borderColorLabelStyleValue,
                        "borderWidth": borderWidthLabelStyleValue,
                        "borderRadius": borderRadiusLabelStyleValue,
                        "padding": paddingLabelStyleValue,
                        "shadowColor": shadowColorLabelStyleValue,
                        "shadowBlur": shadowBlurLabelStyleValue,
                        "shadowOffsetX": shadowOffsetXLabelStyleValue,
                        "shadowOffsetY": shadowOffsetYLabelStyleValue,
                        "width": widthLabelStyleValue,
                        "height": heightLabelStyleValue,
                        "textBorderColor": textBorderColorLabelStyleValue,
                        "textBorderWidth": textBorderWidthLabelStyleValue,
                        "textShadowColor": textShadowColorLabelStyleValue,
                        "textShadowBlur": textShadowBlurLabelStyleValue,
                        "textShadowOffsetX": textShadowOffsetXLabelStyleValue,
                        "textShadowOffsetY": textShadowOffsetYLabelStyleValue,
                        "rich": richLabelStyleValue
                    ]
                    
                    expect(labelStyle.jsonString).to(equal(resultDic.jsonString))
                }
                
                it("needs to check the Enumable") {
                    let labelStyleByEnums = LabelStyle(
                        .position(positionLabelStyleValue),
                        .show(showLabelStyleValue),
                        .interval(intervalLabelStyleValue),
                        .rotate(rotateLabelStyleValue),
                        .formatter(formatterLabelStyleValue),
                        .color(colorLabelStyleValue),
                        .fontStyle(fontStyleLabelStyleValue),
                        .fontWeight(fontWeightLabelStyleValue),
                        .fontFamily(fontFamilyLabelStyleValue),
                        .fontSize(fontSizeLabelStyleValue),
                        .align(alignLabelStyleValue),
                        .verticalAlign(verticalAlignLabelStyleValue),
                        .lineHeight(lineHeightLabelStyleValue),
                        .backgroundColor(backgroundColorLabelStyleValue),
                        .borderColor(borderColorLabelStyleValue),
                        .borderWidth(borderWidthLabelStyleValue),
                        .borderRadius(borderRadiusLabelStyleValue),
                        .padding(paddingLabelStyleValue),
                        .shadowColor(shadowColorLabelStyleValue),
                        .shadowBlur(shadowBlurLabelStyleValue),
                        .shadowOffsetX(shadowOffsetXLabelStyleValue),
                        .shadowOffsetY(shadowOffsetYLabelStyleValue),
                        .width(widthLabelStyleValue),
                        .height(heightLabelStyleValue),
                        .textBorderColor(textBorderColorLabelStyleValue),
                        .textBorderWidth(textBorderWidthLabelStyleValue),
                        .textShadowColor(textShadowColorLabelStyleValue),
                        .textShadowBlur(textShadowBlurLabelStyleValue),
                        .textShadowOffsetX(textShadowOffsetXLabelStyleValue),
                        .textShadowOffsetY(textShadowOffsetYLabelStyleValue),
                        .rich(richLabelStyleValue)
                    )
                    
                    expect(labelStyleByEnums.jsonString).to(equal(labelStyle.jsonString))
                }
            }
            
            let normalLabelValue = labelStyle
            let emphasisLabelValue = LabelStyle(
                .show(false),
                .position(Position.auto),
                .fontStyle(FontStyle.oblique),
                .fontWeight(FontWeight.bold),
                .borderColor(Color.hexColor("#fedcba")),
                .backgroundColor(Color.transparent)
            )
            
            let label = EmphasisLabel()
            label.normal = normalLabelValue
            label.emphasis = emphasisLabelValue
            
            describe("For EmphasisLabel") {
                it("needs to check the jsonString") {
                    let resultDic: [String: Jsonable] = [
                        "normal": normalLabelValue,
                        "emphasis": emphasisLabelValue
                    ]
                    
                    expect(label.jsonString).to(equal(resultDic.jsonString))
                }
                
                it("needs to check the Enumable") {
                    let labelByEnums = EmphasisLabel(
                        .normal(normalLabelValue),
                        .emphasis(emphasisLabelValue)
                    )
                    
                    expect(labelByEnums.jsonString).to(equal(label.jsonString))
                }
            }
        }
        
        
        let showValue1 = true
        let positionValue1 = Position.point([5%, 122])
        let formatterValue = Formatter.string("{b}")
        let offsetValue: Point = [5, 100%]
        let textStyleValue1 = TextStyle(
            .color("#eee")
        )
        
        let normalFormattedLabelStyle = FormattedLabelStyle()
        normalFormattedLabelStyle.show = showValue1
        normalFormattedLabelStyle.position = positionValue1
        normalFormattedLabelStyle.formatter = formatterValue
        normalFormattedLabelStyle.offset = offsetValue
        normalFormattedLabelStyle.textStyle = textStyleValue1
        
        describe("For FormattedLabelStyle") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "show": showValue1,
                    "position": positionValue1,
                    "formatter": formatterValue,
                    "offset": offsetValue,
                    "textStyle": textStyleValue1
                ]
                
                expect(normalFormattedLabelStyle.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let formattedLabelStyle = FormattedLabelStyle(
                    .show(showValue1),
                    .position(positionValue1),
                    .formatter(formatterValue),
                    .offset(offsetValue),
                    .textStyle(textStyleValue1)
                )
                
                expect(formattedLabelStyle.jsonString).to(equal(normalFormattedLabelStyle.jsonString))
            }
        }
        
        describe("For FormattedLabel") { 
            let normalValue = normalFormattedLabelStyle
            let emphasisValue = FormattedLabelStyle(
                .show(false),
                .position(Position.bottom),
                .formatter(.string("{b} $")),
                .offset([2, 100]),
                .textStyle(TextStyle(.fontWeight(.bolder)))
            )
            
            let formattedLabel = FormattedLabel()
            formattedLabel.normal = normalValue
            formattedLabel.emphasis = emphasisValue
            
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "normal": normalValue,
                    "emphasis": emphasisValue
                ]
                
                expect(formattedLabel.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let formattedLabelByEnums = FormattedLabel(
                    .normal(normalValue),
                    .emphasis(emphasisValue)
                )
                
                expect(formattedLabelByEnums.jsonString).to(equal(formattedLabel.jsonString))
            }
        }
    }
}
