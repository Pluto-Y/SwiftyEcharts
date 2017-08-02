//
//  PolylineGraphicSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 02/08/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class PolylineGraphicSpec: QuickSpec {
    override func spec() {
        describe("For PolylineGraphic.Shape.Smooth") {
            let valValue: Float = 563.5626
            let splineString = "spline"
            
            let valSmooth = PolylineGraphic.Shape.Smooth.val(valValue)
            let splineSmooth = PolylineGraphic.Shape.Smooth.spline
            
            it("needs to check the enum case jsonString") {
                expect(valSmooth.jsonString).to(equal("\(valValue)"))
                expect(splineSmooth.jsonString).to(equal(splineString.jsonString))
            }
        }
        
        let pointShapeValue: [Point] = [[22%, 44%], [44%, 55%], [11%, 44%]]
        let smoothShapeValue = PolylineGraphic.Shape.Smooth.val(75.37)
        let smoothConstraintShapeValue = false
        
        let shape = PolylineGraphic.Shape()
        shape.point = pointShapeValue
        shape.smooth = smoothShapeValue
        shape.smoothConstraint = smoothConstraintShapeValue
        
        describe("For PolylineGraphic.Shape") {
            it("needs to check the jsonStrin") {
                let resultDic: [String: Jsonable] = [
                    "point": pointShapeValue,
                    "smooth": smoothShapeValue,
                    "smoothConstraint": smoothConstraintShapeValue
                ]
                
                expect(shape.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let shapeByEnums = PolylineGraphic.Shape(
                    .point(pointShapeValue),
                    .smooth(smoothShapeValue),
                    .smoothConstraint(smoothConstraintShapeValue)
                )
                
                expect(shapeByEnums.jsonString).to(equal(shape.jsonString))
            }
        }
        
        describe("For PolylineGraphic") {
            let typeValue = GraphicType.polyline
            let idValue = "polylineGraphicIdValue"
            let actionValue = GraphicAction.remove
            let leftValue = Position.start
            let rightValue = Position.middle
            let bottomValue = Position.right
            let topValue = Position.insideBottom
            let boundingValue = GraphicBounding.raw
            let zValue: Float = 49575375
            let zlevelValue: Float = 0.3746324823
            let silentValue = true
            let invisibleValue = true
            let cursorValue = "polylineGraphicCursorValue"
            let draggableValue = false
            let progressiveValue = false
            let shapeValue = shape
            let styleValue = CommonGraphicStyle(
                .lineWidth(5.0),
                .shadowColor(Color.red),
                .shadowOffsetY(5.7364),
                .stroke(Color.green)
            )
            
            let polylineGraphic = PolylineGraphic()
            polylineGraphic.id = idValue
            polylineGraphic.action = actionValue
            polylineGraphic.left = leftValue
            polylineGraphic.right = rightValue
            polylineGraphic.top = topValue
            polylineGraphic.bottom = bottomValue
            polylineGraphic.bounding = boundingValue
            polylineGraphic.z = zValue
            polylineGraphic.zlevel = zlevelValue
            polylineGraphic.silent = silentValue
            polylineGraphic.invisible = invisibleValue
            polylineGraphic.cursor = cursorValue
            polylineGraphic.draggable = draggableValue
            polylineGraphic.progressive = progressiveValue
            polylineGraphic.shape = shapeValue
            polylineGraphic.style = styleValue
            
            it("needs to check the typeValue") {
                expect(polylineGraphic.type.jsonString).to(equal(typeValue.jsonString))
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
                
                expect(polylineGraphic.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let polylineGraphicByEnums = PolylineGraphic(
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
                
                expect(polylineGraphicByEnums.jsonString).to(equal(polylineGraphicByEnums.jsonString))
            }
        }
    }
}
