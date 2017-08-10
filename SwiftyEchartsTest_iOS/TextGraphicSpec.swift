//
//  TextGraphicSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 10/08/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class TextGraphicSpec: QuickSpec {
    override func spec() {
        let textStyleValue = "textGraphicTextValue"
        let xStyleValue: Float = 95.2347
        let yStyleValue: Float = -0.04537
        let fontStyleValue = "font: 'italic bolder 16px cursive'"
        let textAlignStyleValue = Align.left
        let textVerticalStyleValue = VerticalAlign.bottom
        let fillStyleValue = Color.hexColor("#778274")
        let strokeStyleValue = rgba(0, 0, 255, 0.88)
        let lineWidthStyleValue: Float = 957
        let shadowBlurStyleValue: Float = 857.723
        let shadowOffsetXStyleValue: Float = 0.038747
        let shadowOffsetYStyleValue: Float = 0.88888888
        let shadowColorStyleValue: Color = .rgb(0, 0, 111)
        
        let style = TextGraphic.Style()
        style.text = textStyleValue
        style.x = xStyleValue
        style.y = yStyleValue
        style.font = fontStyleValue
        style.textAlign = textAlignStyleValue
        style.textVertical = textVerticalStyleValue
        style.fill = fillStyleValue
        style.stroke = strokeStyleValue
        style.lineWidth = lineWidthStyleValue
        style.shadowBlur = shadowBlurStyleValue
        style.shadowOffsetX = shadowOffsetXStyleValue
        style.shadowOffsetY = shadowOffsetYStyleValue
        style.shadowColor = shadowColorStyleValue
        
        describe("For TextGraphic.Style") { 
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "text": textStyleValue,
                    "x": xStyleValue,
                    "y": yStyleValue,
                    "font": fontStyleValue,
                    "textAlign": textAlignStyleValue,
                    "textVertical": textVerticalStyleValue,
                    "fill": fillStyleValue,
                    "stroke": strokeStyleValue,
                    "lineWidth": lineWidthStyleValue,
                    "shadowBlur": shadowBlurStyleValue,
                    "shadowOffsetX": shadowOffsetXStyleValue,
                    "shadowOffsetY": shadowOffsetYStyleValue,
                    "shadowColor": shadowColorStyleValue
                ]
                
                expect(style.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let styleByEnums = TextGraphic.Style(
                    .text(textStyleValue),
                    .x(xStyleValue),
                    .y(yStyleValue),
                    .font(fontStyleValue),
                    .textAlign(textAlignStyleValue),
                    .textVertical(textVerticalStyleValue),
                    .fill(fillStyleValue),
                    .stroke(strokeStyleValue),
                    .lineWidth(lineWidthStyleValue),
                    .shadowBlur(shadowBlurStyleValue),
                    .shadowOffsetX(shadowOffsetXStyleValue),
                    .shadowOffsetY(shadowOffsetYStyleValue),
                    .shadowColor(shadowColorStyleValue)
                )
                
                expect(styleByEnums.jsonString).to(equal(style.jsonString))
            }
        }
    }
}
