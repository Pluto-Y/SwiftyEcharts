//
//  ArcGraphicSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 27/06/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class ArcGraphicSpec: QuickSpec {
    override func spec() {
        let cxValue: Float = 56.2
        let cyValue: Float = 22.5
        let rValue: Float = 5.5
        let r0Value: Float = 9.2
        let startAngleValue: Float = 45
        let endAngleValue: Float = 270
        let clockwiseValue: Float = 2.345
        
        let shape = ArcGraphic.Shape()
        shape.cx = cxValue
        shape.cy = cyValue
        shape.r = rValue
        shape.r0 = r0Value
        shape.startAngle = startAngleValue
        shape.endAngle = endAngleValue
        shape.clockwise = clockwiseValue
        
        describe("For ArcGraphic.Shape") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "cx": cxValue,
                    "cy": cyValue,
                    "r": rValue,
                    "r0": r0Value,
                    "startAngle": startAngleValue,
                    "endAngle": endAngleValue,
                    "clockwise": clockwiseValue
                ]
                
                expect(shape.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let shapeByEnums = ArcGraphic.Shape(
                    .cx(cxValue),
                    .cy(cyValue),
                    .r(rValue),
                    .r0(r0Value),
                    .startAngle(startAngleValue),
                    .endAngle(endAngleValue),
                    .clockwise(clockwiseValue)
                )
                
                expect(shapeByEnums.jsonString).to(equal(shape.jsonString))
            }
        }
        
        describe("For ArcGraphic") {
            let idValue = "argraphicId"
            let actionValue = GraphicAction.merge
            let leftValue = Position.inside
            let rightValue = Position.right
            let topValue = Position.bottom
            let bottomValue = Position.end
            let boundingValue = GraphicBounding.raw
            let zValue: Float = 23.5
            let zlevelValue: Float = 11.11
            let silentValue = false
            let invisibleValue = true
            let cursorValue = "graphicArcCursor"
            let draggableValue = false
            let progressiveValue = true
            let shapeValue = shape
            let styleValue = CommonGraphicStyle(
                .fill(Color.red),
                .lineWidth(12.5),
                .shadowColor(Color.green),
                .shadowOffsetY(5.55)
            )
            
            let arcGraphic = ArcGraphic()
            arcGraphic.id = idValue
            arcGraphic.action = actionValue
            arcGraphic.left = leftValue
            arcGraphic.right = rightValue
            arcGraphic.top = topValue
            arcGraphic.bottom = bottomValue
            arcGraphic.bounding = boundingValue
            arcGraphic.z = zValue
            arcGraphic.zlevel = zlevelValue
            arcGraphic.silent = silentValue
            arcGraphic.invisible = invisibleValue
            arcGraphic.cursor = cursorValue
            arcGraphic.draggable = draggableValue
            arcGraphic.progressive = progressiveValue
            arcGraphic.shape = shapeValue
            arcGraphic.style = styleValue
            
            it("needs to check the type value") {
                expect(arcGraphic.type).to(equal(GraphicType.arc))
            }
            
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "type": GraphicType.arc,
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

                expect(arcGraphic.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let arcGraphicByEnums = ArcGraphic(
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
                
                expect(arcGraphicByEnums.jsonString).to(equal(arcGraphic.jsonString))
            }
        }
    }
}
