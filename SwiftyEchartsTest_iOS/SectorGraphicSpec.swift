//
//  SectorGraphicSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 08/08/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class SectorGraphicSpec: QuickSpec {
    override func spec() {
        let cxShapeValue: Float = 84.2736
        let cyShapeValue: Float = 0.99999999
        let rShapeValue: Float = 8888
        let r0ShapeValue: Float = 0.547
        let startAngleShapeValue: Float = 5736.973
        let endAngleShapeValue: Float = 0.57346
        let clockwiseShapeValue = false
        
        let shape = SectorGraphic.Shape()
        shape.cx = cxShapeValue
        shape.cy = cyShapeValue
        shape.r = rShapeValue
        shape.r0 = r0ShapeValue
        shape.startAngle = startAngleShapeValue
        shape.endAngle = endAngleShapeValue
        shape.clockwise = clockwiseShapeValue
        
        describe("For SectorGraphic.Shape") { 
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "cx": cxShapeValue,
                    "cy": cyShapeValue,
                    "r": rShapeValue,
                    "r0": r0ShapeValue,
                    "startAngle": startAngleShapeValue,
                    "endAngle": endAngleShapeValue,
                    "clockwise": clockwiseShapeValue
                ]
                
                expect(shape.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let shapeByEnums = SectorGraphic.Shape(
                    .cx(cxShapeValue),
                    .cy(cyShapeValue),
                    .r(rShapeValue),
                    .r0(r0ShapeValue),
                    .startAngle(startAngleShapeValue),
                    .endAngle(endAngleShapeValue),
                    .clockwise(clockwiseShapeValue)
                )
                
                expect(shapeByEnums.jsonString).to(equal(shape.jsonString))
            }
        }
        
        describe("For SectorGraphic") {
            let typeValue = GraphicType.sector
            let idValue = "sectorGraphicIdValue"
            let actionValue = GraphicAction.remove
            let leftValue = Position.insideTop
            let topValue = Position.insideLeft
            let rightValue = Position.insideBottom
            let bottomValue = Position.insideRight
            let boundingValue = GraphicBounding.all
            let zValue: Float = 75.2764
            let zlevelValue: Float = 0.02746
            let silentValue = false
            let invisibleValue = false
            let cursorValue = "sectorGraphicCursorValue"
            let draggableValue = true
            let progressiveValue = true
            let shapeValue = shape
            let styleValue = CommonGraphicStyle(
                .fill(Color.transparent),
                .stroke(Color.red),
                .lineWidth(0.000001),
                .shadowBlur(7.7777777),
                .shadowOffsetX(8),
                .shadowOffsetY(0),
                .shadowColor(Color.green)
            )
            
            let sectorGraphic = SectorGraphic()
            sectorGraphic.id = idValue
            sectorGraphic.action = actionValue
            sectorGraphic.left = leftValue
            sectorGraphic.right = rightValue
            sectorGraphic.top = topValue
            sectorGraphic.bottom = bottomValue
            sectorGraphic.bounding = boundingValue
            sectorGraphic.z = zValue
            sectorGraphic.zlevel = zlevelValue
            sectorGraphic.silent = silentValue
            sectorGraphic.invisible = invisibleValue
            sectorGraphic.cursor = cursorValue
            sectorGraphic.draggable = draggableValue
            sectorGraphic.progressive = progressiveValue
            sectorGraphic.shape = shapeValue
            sectorGraphic.style = styleValue
            
            it("needs to check the type value") {
                expect(sectorGraphic.type.jsonString).to(equal(typeValue.jsonString))
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
                
                expect(sectorGraphic.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let sectorGraphicByEnums = SectorGraphic(
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
                
                expect(sectorGraphicByEnums.jsonString).to(equal(sectorGraphic.jsonString))
            }
        }
    }
}
