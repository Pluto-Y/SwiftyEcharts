//
//  ImageGraphicSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 17/07/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class ImageGraphicSpec: QuickSpec {
    override func spec() {
        
        let imageStyleValue = "imageGraphicNameValue"
        let xStyleValue: Float = 2.3823
        let yStyleValue: Float = 84.28324
        let widthStyleValue: Float = 382582.23424
        let heightStyleValue: Float = 2.983
        let fillStyleValue = Color.rgb(200, 100, 50)
        let strokeStyleValue = Color.rgba(200, 50, 25, 0.55)
        let lineWidthStyleValue: Float = 2.0
        let shadowBlurStyleValue: Float = 1.00
        let shadowOffsetXStyleValue: Float = 10
        let shadowOffsetYStyleValue: Float = 0.0
        let shadowColorStyleValue = Color.rgba(0, 0, 0, 0.5)
        
        let style = ImageGraphic.Style()
        style.image = imageStyleValue
        style.x = xStyleValue
        style.y = yStyleValue
        style.width = widthStyleValue
        style.height = heightStyleValue
        style.fill = fillStyleValue
        style.stroke = strokeStyleValue
        style.lineWidth = lineWidthStyleValue
        style.shadowBlur = shadowBlurStyleValue
        style.shadowOffsetX = shadowOffsetXStyleValue
        style.shadowOffsetY = shadowOffsetYStyleValue
        style.shadowColor = shadowColorStyleValue
        
        describe("For ImageGraphic.Data") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "image": imageStyleValue,
                    "x": xStyleValue,
                    "y": yStyleValue,
                    "width": widthStyleValue,
                    "height": heightStyleValue,
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
                let styleByEnums = ImageGraphic.Style(
                    .image(imageStyleValue),
                    .x(xStyleValue),
                    .y(yStyleValue),
                    .width(widthStyleValue),
                    .height(heightStyleValue),
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
        
        describe("For ImageGraphic") {
            let idValue = "imageGraphicIdValue"
            let actionValue = GraphicAction.remove
            let leftValue = Position.middle
            let rightValue = Position.start
            let topValue = Position.point([20, 300])
            let bottomValue = Position.outside
            let boundingValue = GraphicBounding.all
            let zValue: Float = 2.852
            let zlevelValue: Float = 0.0001
            let silentValue = true
            let invisibleValue = false
            let cursorValue = "imageGraphicCursorValue"
            let draggableValue = false
            let progressiveValue = true
            let styleValue = style
            
            let imageGraphic = ImageGraphic()
            imageGraphic.id = idValue
            imageGraphic.action = actionValue
            imageGraphic.left = leftValue
            imageGraphic.right = rightValue
            imageGraphic.top = topValue
            imageGraphic.bottom = bottomValue
            imageGraphic.bounding = boundingValue
            imageGraphic.z = zValue
            imageGraphic.zlevel = zlevelValue
            imageGraphic.silent = silentValue
            imageGraphic.invisible = invisibleValue
            imageGraphic.cursor = cursorValue
            imageGraphic.draggable = draggableValue
            imageGraphic.progressive = progressiveValue
            imageGraphic.style = styleValue
            
            it("needs to check the type value") {
                expect(imageGraphic.type.jsonString).to(equal(GraphicType.image.jsonString))
            }
            
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "type": GraphicType.image,
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
                
                expect(imageGraphic.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let imageGraphicByEnunms = ImageGraphic(
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
                
                expect(imageGraphicByEnunms.jsonString).to(equal(imageGraphic.jsonString))
            }
        }
    }
}
