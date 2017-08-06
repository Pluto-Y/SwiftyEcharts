//
//  RectGraphicSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 06/08/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class RectGraphicSpec: QuickSpec {
    override func spec() {
        let xShapeValue: Float = 0.2785
        let yShapeValue: Float = 555.863
        let widthShapeValue: Float = 888888
        let heightShapeValue: Float = 55.99999
        
        let shape = RectGraphic.Shape()
        shape.x = xShapeValue
        shape.y = yShapeValue
        shape.width = widthShapeValue
        shape.height = heightShapeValue
        
        describe("For RectGraphic.Shap") { 
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "x": xShapeValue,
                    "y": yShapeValue,
                    "width": widthShapeValue,
                    "height": heightShapeValue
                ]
                
                expect(shape.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let shapeByEnums = RectGraphic.Shape(
                    .x(xShapeValue),
                    .y(yShapeValue),
                    .width(widthShapeValue),
                    .height(heightShapeValue)
                )
                
                expect(shapeByEnums.jsonString).to(equal(shapeByEnums.jsonString))
            }
        }
        
        describe("For RectGraphic") { 
            let typeValue = GraphicType.rect
            let idValue = "rectGraphicIdValue"
            let actionValue = GraphicAction.remove
            let leftValue = Position.end
            let rightValue = Position.insideLeft
            let topValue = Position.insideTopRight
            let bottomValue = Position.insideTopLeft
            let boundingValue = GraphicBounding.all
            let zValue: Float = 0.0000009
            let zlevelValue: Float = 99999999999.000000001
            let silentValue = true
            let invisibleValue = false
            let cursorValue = "rectGraphicCursorValue"
            let draggableValue = false
            let progressiveValue = false
            let shapeValue = shape
            let styleValue = CommonGraphicStyle(
                .lineWidth(777.555),
                .shadowColor(Color.hexColor("#998844")),
                .shadowOffsetY(200)
            )
            
            let rectGraphic = RectGraphic()
            rectGraphic.id = idValue
            rectGraphic.action = actionValue
            rectGraphic.left = leftValue
            rectGraphic.right = rightValue
            rectGraphic.top = topValue
            rectGraphic.bottom = bottomValue
            rectGraphic.bounding = boundingValue
            rectGraphic.z = zValue
            rectGraphic.zlevel = zlevelValue
            rectGraphic.silent = silentValue
            rectGraphic.invisible = invisibleValue
            rectGraphic.cursor = cursorValue
            rectGraphic.draggable = draggableValue
            rectGraphic.progressive = progressiveValue
            rectGraphic.shape = shapeValue
            rectGraphic.style = styleValue
            
            it("needs to check the type value") {
                expect(rectGraphic.type.jsonString).to(equal(typeValue.jsonString))
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
                    "shape": shapeValue,
                    "style": styleValue
                ]
                
                expect(rectGraphic.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let rectGraphicByEnums = RectGraphic(
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
                    .shape(shapeValue),
                    .style(styleValue)
                )
                
                expect(rectGraphicByEnums.jsonString).to(equal(rectGraphic.jsonString))
            }
        }
    }
}
