//
//  GridSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 15/07/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class GridSpec: QuickSpec {
    override func spec() {
        describe("For Grid") {
            let showValue = false
            let zlevelValue: Float = 2.482
            let zValue: Float = 2.00
            let leftValue = Position.insideRight
            let rightValue = Position.insideLeft
            let bottomValue = Position.insideTop
            let topValue = Position.insideBottom
            let widthValue = 20%
            let heightValue = 100%
            let containLabelValue = true
            let backgroundValue = Color.transparent
            let borderColorValue = Color.red
            let borderWidthValue: Float = 2.34
            let shadowBlurValue: Float = 5.293
            let shadowColorValue = Color.hexColor("#872")
            let shadowOffsetXValue: Float = 2
            let shadowOffsetYValue: Float = 5.29
            
            let grid = Grid()
            grid.show = showValue
            grid.zlevel = zlevelValue
            grid.z = zValue
            grid.left = leftValue
            grid.top = topValue
            grid.right = rightValue
            grid.bottom = bottomValue
            grid.width = widthValue
            grid.height = heightValue
            grid.containLabel = containLabelValue
            grid.background = backgroundValue
            grid.borderColor = borderColorValue
            grid.borderWidth = borderWidthValue
            grid.shadowBlur = shadowBlurValue
            grid.shadowColor = shadowColorValue
            grid.shadowOffsetX = shadowOffsetXValue
            grid.shadowOffsetY = shadowOffsetYValue
            
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "show": showValue,
                    "zlevel": zlevelValue,
                    "z": zValue,
                    "left": leftValue,
                    "top": topValue,
                    "right": rightValue,
                    "bottom": bottomValue,
                    "width": widthValue,
                    "height": heightValue,
                    "containLabel": containLabelValue,
                    "background": backgroundValue,
                    "borderColor": borderColorValue,
                    "borderWidth": borderWidthValue,
                    "shadowBlur": shadowBlurValue,
                    "shadowColor": shadowColorValue,
                    "shadowOffsetX": shadowOffsetXValue,
                    "shadowOffsetY": shadowOffsetYValue
                ]
                
                expect(grid.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let gridByEnums = Grid(
                    .show(showValue),
                    .zlevel(zlevelValue),
                    .z(zValue),
                    .left(leftValue),
                    .top(topValue),
                    .right(rightValue),
                    .bottom(bottomValue),
                    .width(widthValue),
                    .height(heightValue),
                    .containLabel(containLabelValue),
                    .background(backgroundValue),
                    .borderColor(borderColorValue),
                    .borderWidth(borderWidthValue),
                    .shadowBlur(shadowBlurValue),
                    .shadowColor(shadowColorValue),
                    .shadowOffsetX(shadowOffsetXValue),
                    .shadowOffsetY(shadowOffsetYValue)
                )
                
                expect(gridByEnums.jsonString).to(equal(grid.jsonString))
            }
            
            it("needs to check the x, y, x2, y2 equal to left, top, right, bottom") {
                let gridByEnums = Grid(
                    .show(showValue),
                    .zlevel(zlevelValue),
                    .z(zValue),
                    .x(leftValue),
                    .y(topValue),
                    .x2(rightValue),
                    .y2(bottomValue),
                    .width(widthValue),
                    .height(heightValue),
                    .containLabel(containLabelValue),
                    .background(backgroundValue),
                    .borderColor(borderColorValue),
                    .borderWidth(borderWidthValue),
                    .shadowBlur(shadowBlurValue),
                    .shadowColor(shadowColorValue),
                    .shadowOffsetX(shadowOffsetXValue),
                    .shadowOffsetY(shadowOffsetYValue)
                )
                
                expect(gridByEnums.jsonString).to(equal(grid.jsonString))
            }
        }
    }
}
