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
        
        describe("For TextGraphic") {
            let typeValue = GraphicType.text
            let idValue = "textGraphicIdValue"
            let actionValue = GraphicAction.replace
            let leftValue = Position.insideLeft
            let topValue = Position.insideTop
            let rightValue = Position.insideRight
            let bottomValue = Position.insideBottom
            let boundingValue = GraphicBounding.all
            let zValue: Float = -0.5
            let zlevelValue: Float = 875723.3247
            let silentValue = true
            let invisibleValue = false
            let cursorValue = "textGraphicCursorValue"
            let draggableValue = false
            let progressiveValue = true
            let styleValue = style
            
            let textGraphic = TextGraphic()
            textGraphic.id = idValue
            textGraphic.action = actionValue
            textGraphic.left = leftValue
            textGraphic.right = rightValue
            textGraphic.top = topValue
            textGraphic.bottom = bottomValue
            textGraphic.bounding = boundingValue
            textGraphic.z = zValue
            textGraphic.zlevel = zlevelValue
            textGraphic.silent = silentValue
            textGraphic.invisible = invisibleValue
            textGraphic.cursor = cursorValue
            textGraphic.draggable = draggableValue
            textGraphic.progressive = progressiveValue
            textGraphic.style = styleValue
            
            it("needs to check the type value") {
                expect(textGraphic.type.jsonString).to(equal(typeValue.jsonString))
            }
            
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "type": typeValue,
                    "id": idValue,
                    "$action": actionValue,
                    "left": leftValue,
                    "right": rightValue,
                    "top": topValue,
                    "bottom": bottomValue,
                    "bounding": boundingValue,
                    "z": zValue,
                    "zlevel": zlevelValue,
                    "silent": silentValue,
                    "invisible": invisibleValue,
                    "cursor": cursorValue,
                    "draggable": draggableValue,
                    "progressive": progressiveValue,
                    "style": styleValue
                ]
                
                expect(textGraphic.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let textGraphicByEnums = TextGraphic(
                    .id(idValue),
                    .action(actionValue),
                    .left(leftValue),
                    .right(rightValue),
                    .top(topValue),
                    .bottom(bottomValue),
                    .bounding(boundingValue),
                    .z(zValue),
                    .zlevel(zlevelValue),
                    .silent(silentValue),
                    .invisible(invisibleValue),
                    .cursor(cursorValue),
                    .draggable(draggableValue),
                    .progressive(progressiveValue),
                    .style(styleValue)
                )
                
                expect(textGraphicByEnums.jsonString).to(equal(textGraphic.jsonString))
            }
        }
    }
}
