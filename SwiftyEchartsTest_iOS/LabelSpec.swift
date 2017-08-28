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
        
        describe("") { 
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
