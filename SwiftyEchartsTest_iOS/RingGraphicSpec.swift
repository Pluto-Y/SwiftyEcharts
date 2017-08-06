//
//  RingGraphicSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 06/08/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class RingGraphicSpec: QuickSpec {
    override func spec() {
        let cxShapeValue: Float = 85.3747
        let cyShapeValue: Float = 0.48347
        let rShapeValue: Float = 7675834
        let r0ShapeValue: Float = 94757.83732
        
        let shape = RingGraphic.Shape()
        shape.cx = cxShapeValue
        shape.cy = cyShapeValue
        shape.r = rShapeValue
        shape.r0 = r0ShapeValue
        
        describe("For RingGraphic.Shape") { 
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "cx": cxShapeValue,
                    "cy": cyShapeValue,
                    "r": rShapeValue,
                    "r0": r0ShapeValue
                ]
                
                expect(shape.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let shapeByEnums = RingGraphic.Shape(
                    .cx(cxShapeValue),
                    .cy(cyShapeValue),
                    .r(rShapeValue),
                    .r0(r0ShapeValue)
                )
                
                expect(shapeByEnums.jsonString).to(equal(shape.jsonString))
            }
        }
        
        describe("For RingGraphic") {
            let typeValue = GraphicType.ring
            let idValue = "ringGraphicIdValue"
            let actionValue = GraphicAction.merge
            let leftValue = Position.insideRight
            let rightValue = Position.insideLeft
            let topValue = Position.insideBottom
            let bottomValue = Position.insideTop
            let boundingValue = GraphicBounding.raw
            let zValue: Float = 474.237
            let zlevelValue: Float = 95.347
            let silentValue = false
            let invisibleValue = true
            let cursorValue = "ringGraphicCursorValue"
            let draggableValue = false
            let progressiveValue = true
            let shapeValue = shape
            let styleValue = CommonGraphicStyle(
                .shadowBlur(99.2836),
                .stroke(Color.array([Color.red, Color.transparent]))
            )
            
            let ringGraphic = RingGraphic()
            ringGraphic.id = idValue
            ringGraphic.action = actionValue
            ringGraphic.left = leftValue
            ringGraphic.right = rightValue
            ringGraphic.top = topValue
            ringGraphic.bottom = bottomValue
            ringGraphic.bounding = boundingValue
            ringGraphic.z = zValue
            ringGraphic.zlevel = zlevelValue
            ringGraphic.silent = silentValue
            ringGraphic.invisible = invisibleValue
            ringGraphic.cursor = cursorValue
            ringGraphic.draggable = draggableValue
            ringGraphic.progressive = progressiveValue
            ringGraphic.shape = shapeValue
            ringGraphic.style = styleValue
            
            it("needs to check the typeValue") {
                expect(ringGraphic.type.jsonString).to(equal(typeValue.jsonString))
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
                
                expect(ringGraphic.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let ringGraphicByEnums = RingGraphic(
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
                
                expect(ringGraphicByEnums.jsonString).to(equal(ringGraphic.jsonString))
            }
        }
    }
}
