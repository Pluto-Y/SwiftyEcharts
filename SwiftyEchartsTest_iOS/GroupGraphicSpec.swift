//
//  GroupGraphicSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 16/07/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class GroupGraphicSpec: QuickSpec {
    override func spec() {
        describe("For GroupGraphic") {
            
            let arcCxValue: Float = 56.2
            let arcCyValue: Float = 22.5
            let arcRValue: Float = 5.5
            let arcR0Value: Float = 9.2
            let arcStartAngleValue: Float = 45
            let arcEndAngleValue: Float = 270
            let arcClockwiseValue: Float = 2.345
            
            let arcShape = ArcGraphic.Shape()
            arcShape.cx = arcCxValue
            arcShape.cy = arcCyValue
            arcShape.r = arcRValue
            arcShape.r0 = arcR0Value
            arcShape.startAngle = arcStartAngleValue
            arcShape.endAngle = arcEndAngleValue
            arcShape.clockwise = arcClockwiseValue
            
            let arcIdValue = "argraphicId"
            let arcActionValue = GraphicAction.merge
            let arcLeftValue = Position.inside
            let arcRightValue = Position.right
            let arcTopValue = Position.bottom
            let arcBottomValue = Position.end
            let arcBoundingValue = GraphicBounding.raw
            let arcZValue: Float = 23.5
            let arcZlevelValue: Float = 11.11
            let arcSilentValue = false
            let arcInvisibleValue = true
            let arcCursorValue = "graphicArcCursor"
            let arcDraggableValue = false
            let arcProgressiveValue = true
            let arcShapeValue = arcShape
            let arcStyleValue = CommonGraphicStyle(
                .fill(Color.red),
                .lineWidth(12.5),
                .shadowColor(Color.green),
                .shadowOffsetY(5.55)
            )
            
            let arcGraphic = ArcGraphic()
            arcGraphic.id = arcIdValue
            arcGraphic.action = arcActionValue
            arcGraphic.left = arcLeftValue
            arcGraphic.right = arcRightValue
            arcGraphic.top = arcTopValue
            arcGraphic.bottom = arcBottomValue
            arcGraphic.bounding = arcBoundingValue
            arcGraphic.z = arcZValue
            arcGraphic.zlevel = arcZlevelValue
            arcGraphic.silent = arcSilentValue
            arcGraphic.invisible = arcInvisibleValue
            arcGraphic.cursor = arcCursorValue
            arcGraphic.draggable = arcDraggableValue
            arcGraphic.progressive = arcProgressiveValue
            arcGraphic.shape = arcShape
            arcGraphic.style = arcStyleValue
            
            let circleCxValue: Float = 5.2356
            let circleCyValue: Float = 8.2714
            let circleRValue: Float = 5.0
            
            let circleShape = CircleGraphic.Shape()
            circleShape.cx = circleCxValue
            circleShape.cy = circleCyValue
            circleShape.r = circleRValue
            
            let circleIdValue = "circleGraphicIdValue"
            let circleActionValue = GraphicAction.remove
            let circleLeftValue = Position.left
            let circleRightValue = Position.right
            let circleTopValue = Position.top
            let circleBottomValue = Position.bottom
            let circleBoundingValue = GraphicBounding.all
            let circleZValue: Float = 5.2234
            let circleZlevelValue: Float = 521
            let circleSilentValue = false
            let circleInvisibleValue = true
            let circleCursorValue = "cicleGraphicCursor"
            let circleDraggableValue = false
            let circleProgressiveValue = true
            let circleShapeValue = circleShape
            let circleStyleValue = CommonGraphicStyle(
                .shadowOffsetX(123.5),
                .stroke(Color.hexColor("#582521")),
                .lineWidth(23.5)
            )
            
            let circleGraphic = CircleGraphic(
                .id(circleIdValue),
                .action(circleActionValue),
                .left(circleLeftValue),
                .right(circleRightValue),
                .top(circleTopValue),
                .bottom(circleBottomValue),
                .bounding(circleBoundingValue),
                .z(circleZValue),
                .zlevel(circleZlevelValue),
                .silent(circleSilentValue),
                .invisible(circleInvisibleValue),
                .cursor(circleCursorValue),
                .draggable(circleDraggableValue),
                .progressive(circleProgressiveValue),
                .shape(circleShapeValue),
                .style(circleStyleValue)
            )
            
            
            
            let idValue = "groupGraphicIdValue"
            let actionValue = GraphicAction.replace
            let leftValue = Position.insideTopLeft
            let rightValue = Position.insideBottomRight
            let topValue = Position.insideTopRight
            let bottomValue = Position.insideBottomLeft
            let boundingValue = GraphicBounding.raw
            let zValue: Float = 2.58
            let zlevelValue: Float = 9.999
            let silentValue = false
            let invisibleValue = true
            let cursorValue = "groupGraphicCursorValue"
            let draggableValue = true
            let progressiveValue = false
            let widthValue: Float = 8.2412
            let heightValue: Float = 0.0000
            let childrenValue: [Graphic] = [arcGraphic, circleGraphic]
            
            let groupGraphic = GroupGraphic()
            groupGraphic.id = idValue
            groupGraphic.action = actionValue
            groupGraphic.left = leftValue
            groupGraphic.right = rightValue
            groupGraphic.top = topValue
            groupGraphic.bottom = bottomValue
            groupGraphic.bounding = boundingValue
            groupGraphic.z = zValue
            groupGraphic.zlevel = zlevelValue
            groupGraphic.silent = silentValue
            groupGraphic.invisible = invisibleValue
            groupGraphic.cursor = cursorValue
            groupGraphic.draggable = draggableValue
            groupGraphic.progressive = progressiveValue
            groupGraphic.width = widthValue
            groupGraphic.height = heightValue
            groupGraphic.children = childrenValue
            
            it("needs to check the type value") {
                expect(groupGraphic.type.jsonString).to(equal(GraphicType.group.jsonString))
            }
            
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "type": GraphicType.group,
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
                    "width": widthValue,
                    "height": heightValue,
                    "children": childrenValue
                ]
                
                expect(groupGraphic.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let groupGraphicByEnums = GroupGraphic(
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
                    .width(widthValue),
                    .height(heightValue),
                    .children(childrenValue)
                )
                
                expect(groupGraphicByEnums.jsonString).to(equal(groupGraphic.jsonString))
            }
        }
    }
}
