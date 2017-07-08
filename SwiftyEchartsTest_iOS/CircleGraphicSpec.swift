//
//  CircleGraphicSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 08/07/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class CircleGraphicSpec: QuickSpec {
    override func spec() {
        let cxValue: Float = 5.2356
        let cyValue: Float = 8.2714
        let rValue: Float = 5.0
        
        let shape = CircleGraphic.Shape()
        shape.cx = cxValue
        shape.cy = cyValue
        shape.r = rValue
        
        describe("For CircleGraphic.Shape") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "cx": cxValue,
                    "cy": cyValue,
                    "r": rValue
                ]
                expect(shape.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let shapeByEnums = CircleGraphic.Shape(
                    .cx(cxValue),
                    .cy(cyValue),
                    .r(rValue)
                )
                
                expect(shapeByEnums.jsonString).to(equal(shape.jsonString))
            }
        }
        
        describe("For CircleGraphic") {
            let idValue = "circleGraphicIdValue"
            let actionValue = GraphicAction.remove
            let leftValue = Position.left
            let rightValue = Position.right
            let topValue = Position.top
            let bottomValue = Position.bottom
            let boundingValue = GraphicBounding.all
            let zValue: Float = 5.2234
            let zlevelValue: Float = 521
            let silentValue = false
            let invisibleValue = true
            let cursorValue = "cicleGraphicCursor"
            let draggableValue = false
            let progressiveValue = true
            let shapeValue = shape
            let styleValue = CommonGraphicStyle(
                .shadowOffsetX(123.5),
                .stroke(Color.hexColor("#582521")),
                .lineWidth(23.5)
            )
            
            let circleGraphic = CircleGraphic()
            circleGraphic.id = idValue
            circleGraphic.action = actionValue
            circleGraphic.left = leftValue
            circleGraphic.right = rightValue
            circleGraphic.top = topValue
            circleGraphic.bottom = bottomValue
            circleGraphic.bounding = boundingValue
            circleGraphic.z = zValue
            circleGraphic.zlevel = zlevelValue
            circleGraphic.silent = silentValue
            circleGraphic.invisible = invisibleValue
            circleGraphic.cursor = cursorValue
            circleGraphic.draggable = draggableValue
            circleGraphic.progressive = progressiveValue
            circleGraphic.shape = shapeValue
            circleGraphic.style = styleValue
            
            
            it("needs to check the type value") {
                expect(circleGraphic.type).to(equal(GraphicType.circle))
            }
            
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "type": GraphicType.circle,
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
                
                expect(circleGraphic.jsonString).to(equal(resultDic.jsonString))
            }

            it("needs to check the Enumable") {
                let circleGraphicByEnums = CircleGraphic(
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
                
                expect(circleGraphicByEnums.jsonString).to(equal(circleGraphic.jsonString))
            }
        }
    }
}
