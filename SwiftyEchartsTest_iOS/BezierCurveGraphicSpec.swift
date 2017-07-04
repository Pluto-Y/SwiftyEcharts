//
//  BezierCurveGraphicSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 03/07/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class BezierCurveGraphicSpec: QuickSpec {
    override func spec() {
        let x1Value: Float = 7.5
        let y1Value: Float = 1500.22
        let x2Value: Float = 382.12
        let y2Value: Float = 0.11
        let cpx1Value: Float = 2.55
        let cpy1Value: Float = 5.55
        let cpx2Value: Float = 7.882
        let cpy2Value: Float = 8.2356
        let percentValue: Float = 0.5
        
        let bezierCurveGraphicShape = BezierCurveGraphic.Shape()
        bezierCurveGraphicShape.x1 = x1Value
        bezierCurveGraphicShape.y1 = y1Value
        bezierCurveGraphicShape.x2 = x2Value
        bezierCurveGraphicShape.y2 = y2Value
        bezierCurveGraphicShape.cpx1 = cpx1Value
        bezierCurveGraphicShape.cpy1 = cpy1Value
        bezierCurveGraphicShape.cpx2 = cpx2Value
        bezierCurveGraphicShape.cpy2 = cpy2Value
        bezierCurveGraphicShape.percent = percentValue
        
        describe("For BezierCurverGraphic.Shape") { 
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "x1": x1Value,
                    "y1": y1Value,
                    "x2": x2Value,
                    "y2": y2Value,
                    "cpx1": cpx1Value,
                    "cpy1": cpy1Value,
                    "cpx2": cpx2Value,
                    "cpy2": cpy2Value,
                    "percent": percentValue
                ]
                
                expect(bezierCurveGraphicShape.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let bezierCurveGraphicShapeByEnums = BezierCurveGraphic.Shape(
                    .x1(x1Value),
                    .y1(y1Value),
                    .x2(x2Value),
                    .y2(y2Value),
                    .cpx1(cpx1Value),
                    .cpy1(cpy1Value),
                    .cpx2(cpx2Value),
                    .cpy2(cpy2Value),
                    .percent(percentValue)
                )
                
                expect(bezierCurveGraphicShapeByEnums.jsonString).to(equal(bezierCurveGraphicShape.jsonString))
            }
        }
        
        describe("For BezierCurveGraphic") {
            let idValue = "bezierCurveGraphicIdValue"
            let actionValue = GraphicAction.replace
            let leftValue = Position.insideBottom
            let rightValue = Position.inner
            let topValue = Position.insideTop
            let bottomValue = Position.auto
            let boundingValue = GraphicBounding.all
            let zValue: Float = 2.398
            let zlevelValue: Float = 8.442
            let silentValue = false
            let invisibleValue = true
            let cursorValue = "cursorValue"
            let draggableValue = true
            let progressiveValue = false
            let shapeValue = bezierCurveGraphicShape
            let styleValue = CommonGraphicStyle(
                .fill(Color.auto),
                .shadowOffsetY(8.52),
                .lineWidth(7.22),
                .shadowColor(Color.green)
            )
            
            let bezierCurveGraphic = BezierCurveGraphic()
            bezierCurveGraphic.id = idValue
            bezierCurveGraphic.action = actionValue
            bezierCurveGraphic.left = leftValue
            bezierCurveGraphic.right = rightValue
            bezierCurveGraphic.top = topValue
            bezierCurveGraphic.bottom = bottomValue
            bezierCurveGraphic.bounding = boundingValue
            bezierCurveGraphic.z = zValue
            bezierCurveGraphic.zlevel = zlevelValue
            bezierCurveGraphic.silent = silentValue
            bezierCurveGraphic.invisible = invisibleValue
            bezierCurveGraphic.cursor = cursorValue
            bezierCurveGraphic.draggable = draggableValue
            bezierCurveGraphic.progressive = progressiveValue
            bezierCurveGraphic.shape = shapeValue
            bezierCurveGraphic.style = styleValue
            
            it("needs to check the type value") {
                expect(bezierCurveGraphic.type.jsonString).to(equal(GraphicType.bezierCurve.jsonString))
            }
            
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "type": GraphicType.bezierCurve,
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

                expect(bezierCurveGraphic.jsonString).to(equal(resultDic.jsonString))
                
            }
            
            it("needs to check the Enumable") {
                let bezierCurveGraphicByEnums = BezierCurveGraphic(
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
                
                expect(bezierCurveGraphicByEnums.jsonString).to(equal(bezierCurveGraphic.jsonString))
            }
        }
    }
}
