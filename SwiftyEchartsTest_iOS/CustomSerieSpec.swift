//
//  CustomSerieSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 17/09/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class CustomSerieSpec: QuickSpec {
    override func spec() {
        describe("For CustomSerie") {
            let customString = "custom"
            let nameValue = "customNameValue"
            let legendHoverLinkValue = false
            let coordinateSystemValue = CoordinateSystem.none
            let xAxisIndexValue = UInt.max
            let yAxisIndexValue = UInt.min
            let cursorValue = "pointer"
            let draggableValue = true
            let progressiveValue = false
            let widthValue: LengthValue = 100%
            let heightValue: LengthValue = 20
            let childrenValue: [Jsonable] = [
                "child1", false, Float(2.0), 10, 74.9, [:]
            ]
            let onclickValue = "onClickValue"
            let onmouseoverValue = "onMouseOverValue"
            let onmouseoutValue = "onMouseOutValue"
            let onmousemoveValue = "onMouseMoveValue"
            let onmousewheelValue = "onMouseWheelValue"
            let onmousedownValue = "onMouseDownValue"
            let onmouseupValue = "onMouseUpValue"
            let ondragValue = "onDragValue"
            let ondragstartValue = "onDragStartValue"
            let ondragendValue = "onDragEndValue"
            let ondragenterValue = "onDragEnterValue"
            let ondragleaveValue = "onDragLeaveValue"
            let ondragoverValue = "onDragOverValue"
            let ondropValue = "onDropValue"
            
            let customSerie = CustomSerie()
            customSerie.name = nameValue
            customSerie.legendHoverLink = legendHoverLinkValue
            customSerie.coordinateSystem = coordinateSystemValue
            customSerie.xAxisIndex = xAxisIndexValue
            customSerie.yAxisIndex = yAxisIndexValue
            customSerie.cursor = cursorValue
            customSerie.draggable = draggableValue
            customSerie.progressive = progressiveValue
            customSerie.width = widthValue
            customSerie.height = heightValue
            customSerie.children = childrenValue
            customSerie.onclick = onclickValue
            customSerie.onmouseover = onmouseoverValue
            customSerie.onmouseout = onmouseoutValue
            customSerie.onmousemove = onmousemoveValue
            customSerie.onmousewheel = onmousewheelValue
            customSerie.onmousedown = onmousedownValue
            customSerie.onmouseup = onmouseupValue
            customSerie.ondrag = ondragValue
            customSerie.ondragstart = ondragstartValue
            customSerie.ondragend = ondragendValue
            customSerie.ondragenter = ondragenterValue
            customSerie.ondragleave = ondragleaveValue
            customSerie.ondragover = ondragoverValue
            customSerie.ondrop = ondropValue
            
            it("needs to check the type value") {
                expect(customSerie.type.jsonString).to(equal(customString.jsonString))
            }
            
            it("needs to check the jsonString value") {
                let resultDic: [String: Jsonable] = [
                    "type": customString,
                    "name": nameValue,
                    "legendHoverLink": legendHoverLinkValue,
                    "coordinateSystem": coordinateSystemValue,
                    "xAxisIndex": xAxisIndexValue,
                    "yAxisIndex": yAxisIndexValue,
                    "cursor": cursorValue,
                    "draggable": draggableValue,
                    "progressive": progressiveValue,
                    "width": widthValue,
                    "height": heightValue,
                    "children": childrenValue,
                    "onclick": onclickValue,
                    "onmouseover": onmouseoverValue,
                    "onmouseout": onmouseoutValue,
                    "onmousemove": onmousemoveValue,
                    "onmousewheel": onmousewheelValue,
                    "onmousedown": onmousedownValue,
                    "onmouseup": onmouseupValue,
                    "ondrag": ondragValue,
                    "ondragstart": ondragstartValue,
                    "ondragend": ondragendValue,
                    "ondragenter": ondragenterValue,
                    "ondragleave": ondragleaveValue,
                    "ondragover": ondragoverValue,
                    "ondrop": ondropValue
                ]
                
                expect(customSerie.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let customSerieByEnums = CustomSerie(
                    .name(nameValue),
                    .legendHoverLink(legendHoverLinkValue),
                    .coordinateSystem(coordinateSystemValue),
                    .xAxisIndex(xAxisIndexValue),
                    .yAxisIndex(yAxisIndexValue),
                    .cursor(cursorValue),
                    .draggable(draggableValue),
                    .progressive(progressiveValue),
                    .width(widthValue),
                    .height(heightValue),
                    .children(childrenValue),
                    .onclick(onclickValue),
                    .onmouseover(onmouseoverValue),
                    .onmouseout(onmouseoutValue),
                    .onmousemove(onmousemoveValue),
                    .onmousewheel(onmousewheelValue),
                    .onmousedown(onmousedownValue),
                    .onmouseup(onmouseupValue),
                    .ondrag(ondragValue),
                    .ondragstart(ondragstartValue),
                    .ondragend(ondragendValue),
                    .ondragenter(ondragenterValue),
                    .ondragleave(ondragleaveValue),
                    .ondragover(ondragoverValue),
                    .ondrop(ondropValue)
                )
                
                expect(customSerieByEnums.jsonString).to(equal(customSerie.jsonString))
            }
        }
    }
}
