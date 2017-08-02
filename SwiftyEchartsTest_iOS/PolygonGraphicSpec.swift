//
//  PolygonGraphicSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 01/08/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class PolygonGraphicSpec: QuickSpec {
    override func spec() {
        describe("For PolygonGraphic.Shape.Smooth") {
            let valValue: Float = 563.5626
            let splineString = "spline"
            
            let valSmooth = PolygonGraphic.Shape.Smooth.val(valValue)
            let splineSmooth = PolygonGraphic.Shape.Smooth.spline
            
            it("needs to check the enum case jsonString") {
                expect(valSmooth.jsonString).to(equal("\(valValue)"))
                expect(splineSmooth.jsonString).to(equal(splineString.jsonString))
            }
        }
        
        let pointShapeValue: [Point] = [[22, 44], [44, 55], [11, 44]]
        let smoothShapeValue = PolygonGraphic.Shape.Smooth.spline
        let smoothConstraintShapeValue = true
        
        let shape = PolygonGraphic.Shape()
        shape.point = pointShapeValue
        shape.smooth = smoothShapeValue
        shape.smoothConstraint = smoothConstraintShapeValue
        
        describe("For PolygonGraphic.Shape") {
            it("needs to check the jsonStrin") {
                let resultDic: [String: Jsonable] = [
                    "point": pointShapeValue,
                    "smooth": smoothShapeValue,
                    "smoothConstraint": smoothConstraintShapeValue
                ]
                
                expect(shape.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let shapeByEnums = PolygonGraphic.Shape(
                    .point(pointShapeValue),
                    .smooth(smoothShapeValue),
                    .smoothConstraint(smoothConstraintShapeValue)
                )
                
                expect(shapeByEnums.jsonString).to(equal(shape.jsonString))
            }
        }
        
        describe("For PolygonGraphic") {
            let typeValue = GraphicType.polygon
            let idValue = "polygonGraphicIdValue"
            let actionValue = GraphicAction.merge
            let leftValue = Position.bottom
            let rightValue = Position.center
            let bottomValue = Position.end
            let topValue = Position.inner
            let boundingValue = GraphicBounding.all
            let zValue: Float = 0.000000001
            let zlevelValue: Float = 10
            let silentValue = false
            let invisibleValue = true
            let cursorValue = "polygonGraphicCursorValue"
            let draggableValue = false
            let progressiveValue = true
            let shapeValue = shape
            let styleValue = CommonGraphicStyle(
                .fill(Color.hexColor("#aabbcc")),
                .stroke(Color.hexColor("#ddeeff")),
                .lineWidth(285.75),
                .shadowColor(Color.hexColor("#667789"))
            )
            
            let polygonGraphic = PolygonGraphic()
            polygonGraphic.id = idValue
            polygonGraphic.action = actionValue
            polygonGraphic.left = leftValue
            polygonGraphic.right = rightValue
            polygonGraphic.top = topValue
            polygonGraphic.bottom = bottomValue
            polygonGraphic.bounding = boundingValue
            polygonGraphic.z = zValue
            polygonGraphic.zlevel = zlevelValue
            polygonGraphic.silent = silentValue
            polygonGraphic.invisible = invisibleValue
            polygonGraphic.cursor = cursorValue
            polygonGraphic.draggable = draggableValue
            polygonGraphic.progressive = progressiveValue
            polygonGraphic.shape = shapeValue
            polygonGraphic.style = styleValue
            
            it("needs to check the typeValue") {
                expect(polygonGraphic.type.jsonString).to(equal(typeValue.jsonString))
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
                
                expect(polygonGraphic.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let polygonGraphicByEnums = PolygonGraphic(
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
                
                expect(polygonGraphicByEnums.jsonString).to(equal(polygonGraphicByEnums.jsonString))
            }
        }
    }
}
