//
//  LineGraphicSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 18/07/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class LineGraphicSpec: QuickSpec {
    override func spec() {
        let x1DataValue: Float = 8.823
        let y1DataValue: Float = 999.999
        let x2DataValue: Float = 382.381
        let y2DataValue: Float = 93.0
        let percentDataValue: Float = 0.283
        
        let shape = LineGraphic.Shape()
        shape.x1 = x1DataValue
        shape.y1 = y1DataValue
        shape.x2 = x2DataValue
        shape.y2 = y2DataValue
        shape.percent = percentDataValue
        
        describe("For LineGraphic.Shape") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "x1": x1DataValue,
                    "y1": y1DataValue,
                    "x2": x2DataValue,
                    "y2": y2DataValue,
                    "percent": percentDataValue
                ]
                
                expect(shape.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let shapeByEnums = LineGraphic.Shape(
                    .x1(x1DataValue),
                    .y1(y1DataValue),
                    .x2(x2DataValue),
                    .y2(y2DataValue),
                    .percent(percentDataValue)
                )
                
                expect(shapeByEnums.jsonString).to(equal(shape.jsonString))
            }
        }
        
        describe("For LineGraphic") {
            let idValue = "lineGraphicIdValue"
            let actionValue = GraphicAction.remove
            let leftValue = Position.right
            let rightValue = Position.insideBottomRight
            let topValue = Position.end
            let bottomValue = Position.insideBottomRight
            let boundingValue = GraphicBounding.all
            let zValue: Float = 0.284
            let zlevelValue: Float = 82.83
            let silentValue = false
            let invisibleValue = true
            let cursorValue = "lineGraphicCursorValue"
            let draggableValue = false
            let progressiveValue = true
            let shapeValue = shape
            let styleValue = CommonGraphicStyle(
                .shadowColor(rgba(200, 100, 20, 0.832))
            )
            
            let lineGraphic = LineGraphic()
            lineGraphic.id = idValue
            lineGraphic.action = actionValue
            lineGraphic.left = leftValue
            lineGraphic.right = rightValue
            lineGraphic.top = topValue
            lineGraphic.bottom = bottomValue
            lineGraphic.bounding = boundingValue
            lineGraphic.z = zValue
            lineGraphic.zlevel = zlevelValue
            lineGraphic.silent = silentValue
            lineGraphic.invisible = invisibleValue
            lineGraphic.cursor = cursorValue
            lineGraphic.draggable = draggableValue
            lineGraphic.progressive = progressiveValue
            lineGraphic.shape = shapeValue
            lineGraphic.style = styleValue
            
            it("needs to check the type value") {
                expect(lineGraphic.type).to(equal(GraphicType.line))
            }
            
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "type": GraphicType.line,
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

                expect(lineGraphic.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let lineGraphicByEnums = LineGraphic(
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
                
                expect(lineGraphicByEnums.jsonString).to(equal(lineGraphic.jsonString))
            }
        }
    }
}
