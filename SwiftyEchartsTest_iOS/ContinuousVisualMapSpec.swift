//
//  ContinuousVisualMapSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 09/07/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class ContinuousVisualMapSpec: QuickSpec {
    override func spec() {
        describe("For ContinuousVisualMap") {
            let typeValue = "continuous"
            let minValue: Float = 4.21
            let maxValue: Float = 1.024
            let rangeValue: SwiftyEcharts.Range = [0, 400]
            let calculableValue = false
            let realtimeValue = true
            let inverseValue = false
            let precisionValue: Float = 2
            let itemWidthValue: Float = 3.12
            let itemHeightValue: Float = 20.0
            let alignValue = Align.auto
            let textValue: PiecewiseText = ["High", "Low"]
            let textGapValue: Float = 5.29
            let showValue = false
            let dimensionValue: Float = 3.29
            let seriesIndexValue: [UInt8] = [2, 3, 9]
            let hoverLinkValue = false
            let inRangeValue: [String: Jsonable] = ["colorLightness": [0.4, 0.8]]
            let outRangeValue: [String: Jsonable] = ["color": Color.hexColor("#bbb")]
            let controllerValue = VisualMapController(
                .inRange([
                    "color": ["#c23531"]
                    ]),
                .outRange([
                    "color": ["#444"]
                    ])
            )
            let zlevelValue: Float = 8.77
            let zValue: Float = 4.2
            let leftValue = Position.auto
            let rightValue = Position.inside
            let bottomValue = Position.right
            let topValue = Position.middle
            let orientValue = Orient.vertical
            let paddingValue = Padding.all(5)
            let backgroundColorValue = Color.rgba(200, 100, 21, 0.5)
            let borderColorValue = Color.green
            let borderWidthValue: Float = 1.0
            let colorValue = Color.array([Color.red, Color.yellow])
            let textStyleValue = TextStyle(
                .fontWeight(FontWeight.lighter)
            )
            let formatterValue = Formatter.string("{d}, b")
            
            let continuousVisualMap = ContinuousVisualMap()
            continuousVisualMap.min = minValue
            continuousVisualMap.max = maxValue
            continuousVisualMap.range = rangeValue
            continuousVisualMap.calculable = calculableValue
            continuousVisualMap.realtime = realtimeValue
            continuousVisualMap.inverse = inverseValue
            continuousVisualMap.precision = precisionValue
            continuousVisualMap.itemWidth = itemWidthValue
            continuousVisualMap.itemHeight = itemHeightValue
            continuousVisualMap.align = alignValue
            continuousVisualMap.text = textValue
            continuousVisualMap.textGap = textGapValue
            continuousVisualMap.show = showValue
            continuousVisualMap.dimension = dimensionValue
            continuousVisualMap.seriesIndex = seriesIndexValue
            continuousVisualMap.hoverLink = hoverLinkValue
            continuousVisualMap.inRange = inRangeValue
            continuousVisualMap.outRange = outRangeValue
            continuousVisualMap.controller = controllerValue
            continuousVisualMap.zlevel = zlevelValue
            continuousVisualMap.z = zValue
            continuousVisualMap.left = leftValue
            continuousVisualMap.top = topValue
            continuousVisualMap.right = rightValue
            continuousVisualMap.bottom = bottomValue
            continuousVisualMap.orient = orientValue
            continuousVisualMap.padding = paddingValue
            continuousVisualMap.backgroundColor = backgroundColorValue
            continuousVisualMap.borderColor = borderColorValue
            continuousVisualMap.borderWidth = borderWidthValue
            continuousVisualMap.color = colorValue
            continuousVisualMap.textStyle = textStyleValue
            continuousVisualMap.formatter = formatterValue
            
            it("needs to check the type value") {
                expect(continuousVisualMap.type.jsonString).to(equal(typeValue.jsonString))
            }
            
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "type": typeValue,
                    "min": minValue,
                    "max": maxValue,
                    "range": rangeValue,
                    "calculable": calculableValue,
                    "realtime": realtimeValue,
                    "inverse": inverseValue,
                    "precision": precisionValue,
                    "itemWidth": itemWidthValue,
                    "itemHeight": itemHeightValue,
                    "align": alignValue,
                    "text": textValue,
                    "textGap": textGapValue,
                    "show": showValue,
                    "dimension": dimensionValue,
                    "seriesIndex": seriesIndexValue,
                    "hoverLink": hoverLinkValue,
                    "inRange": inRangeValue,
                    "outRange": outRangeValue,
                    "controller": controllerValue,
                    "zlevel": zlevelValue,
                    "z": zValue,
                    "left": leftValue,
                    "top": topValue,
                    "right": rightValue,
                    "bottom": bottomValue,
                    "orient": orientValue,
                    "padding": paddingValue,
                    "backgroundColor": backgroundColorValue,
                    "borderColor": borderColorValue,
                    "borderWidth": borderWidthValue,
                    "color": colorValue,
                    "textStyle": textStyleValue,
                    "formatter": formatterValue
                ]
                
                expect(continuousVisualMap.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let continuousVisualMapByEnums = ContinuousVisualMap(
                    .min(minValue),
                    .max(maxValue),
                    .range(rangeValue),
                    .calculable(calculableValue),
                    .realtime(realtimeValue),
                    .inverse(inverseValue),
                    .precision(precisionValue),
                    .itemWidth(itemWidthValue),
                    .itemHeight(itemHeightValue),
                    .align(alignValue),
                    .text(textValue),
                    .textGap(textGapValue),
                    .show(showValue),
                    .dimension(dimensionValue),
                    .seriesIndex(seriesIndexValue),
                    .hoverLink(hoverLinkValue),
                    .inRange(inRangeValue),
                    .outRange(outRangeValue),
                    .controller(controllerValue),
                    .zlevel(zlevelValue),
                    .z(zValue),
                    .left(leftValue),
                    .top(topValue),
                    .right(rightValue),
                    .bottom(bottomValue),
                    .orient(orientValue),
                    .padding(paddingValue),
                    .backgroundColor(backgroundColorValue),
                    .borderColor(borderColorValue),
                    .borderWidth(borderWidthValue),
                    .color(colorValue),
                    .textStyle(textStyleValue),
                    .formatter(formatterValue)
                )
                
                expect(continuousVisualMapByEnums.jsonString).to(equal(continuousVisualMap.jsonString))
            }
        }
    }
}
