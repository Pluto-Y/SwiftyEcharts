//
//  PiecewiseVisualMapSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 29/07/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class PiecewiseVisualMapSpec: QuickSpec {
    override func spec() {
        describe("For PicewiseVisualMap") {
            let typeValue = "piecewise"
            let splitNumberValue = Int.min
            let piecesValue: [Jsonable] = [
                [ "gt": 1500 ],
                [ "gt": 900, "lte": 1500 ],
                [ "gt": 310, "lte": 1000 ],
                [ "gt": 200, "lte": 300 ],
                [ "gt": 10, "lte": 200, "label": "10 到 200（自定义label）" ],
                [ "value": 123, "label": "123（自定义特殊颜色）", "color": "grey" ],
                [ "lt": 5 ]
            ]
            let minValue: Float = 200
            let maxValue: Float = 999.8999
            let minOpenValue = false
            let maxOpenValue = true
            let selectedModeValue = SelectedMode.disable
            let inverseValue = true
            let precisionValue: UInt = UInt.min
            let itemWidthValue: Float = 82.4752
            let itemHeightValue: Float = 85.73475
            let alignValue = Align.center
            let textValue: PiecewiseText = ["High", "Low"]
            let textGapValue: Float = 2000.0
            let showLabelValue = false
            let itemGapValue: Float = 83.285
            let itemSymbolValue = Symbol.arrow
            let showValue = true
            let dimensionValue: Float = 84.28
            let seriesIndexValue: [UInt8] = [255, 0, 128]
            let hoverLinkValue = false
            let inRangeValue: [String: Jsonable] = [
                "color": ["#313695", "#4575b4", "#74add1", "#abd9e9", "#e0f3f8", "#ffffbf", "#fee090", "#fdae61", "#f46d43", "#d73027", "#a50026"]
            ]
            let outRangeValue: [String: Jsonable] = [
                "symbolSize": [10, 70],
                "color": ["rgba(255, 255, 255, 0.2"]
            ]
            let controllerValue = VisualMapController(
                .inRange([
                    "color": ["#c23531"]
                    ]),
                .outRange([
                    "color": ["#444"]
                    ])
            )
            let zlevelValue: Float = 28.583
            let zValue: Float = 85.273
            let leftValue = Position.value(80%)
            let topValue = Position.value(285.74)
            let rightValue = Position.right
            let bottomValue = Position.end
            let orientValue = Orient.vertical
            let paddingValue = Padding.all(205.87)
            let backgroundColorValue = Color.green
            let borderColorValue = Color.transparent
            let borderWidthValue: Float = 85.7573
            let colorValue = Color.rgb(200, 205, 375)
            let textStyleValue = TextStyle(
                .fontFamily("pieceseVisualMapFontFamily"),
                .align(.top)
            )
            let formatterValue = Formatter.string("aaaa{value}bbbb{value2}")
            
            let piecewiseVisualMap = PiecewiseVisualMap()
            piecewiseVisualMap.splitNumber = splitNumberValue
            piecewiseVisualMap.pieces = piecesValue
            piecewiseVisualMap.min = minValue
            piecewiseVisualMap.max = maxValue
            piecewiseVisualMap.minOpen = minOpenValue
            piecewiseVisualMap.maxOpen = maxOpenValue
            piecewiseVisualMap.selectedMode = selectedModeValue
            piecewiseVisualMap.inverse = inverseValue
            piecewiseVisualMap.precision = precisionValue
            piecewiseVisualMap.itemWidth = itemWidthValue
            piecewiseVisualMap.itemHeight = itemHeightValue
            piecewiseVisualMap.align = alignValue
            piecewiseVisualMap.text = textValue
            piecewiseVisualMap.textGap = textGapValue
            piecewiseVisualMap.showLabel = showLabelValue
            piecewiseVisualMap.itemGap = itemGapValue
            piecewiseVisualMap.itemSymbol = itemSymbolValue
            piecewiseVisualMap.show = showValue
            piecewiseVisualMap.dimension = dimensionValue
            piecewiseVisualMap.seriesIndex = seriesIndexValue
            piecewiseVisualMap.hoverLink = hoverLinkValue
            piecewiseVisualMap.inRange = inRangeValue
            piecewiseVisualMap.outRange = outRangeValue
            piecewiseVisualMap.controller = controllerValue
            piecewiseVisualMap.zlevel = zlevelValue
            piecewiseVisualMap.z = zValue
            piecewiseVisualMap.left = leftValue
            piecewiseVisualMap.top = topValue
            piecewiseVisualMap.right = rightValue
            piecewiseVisualMap.bottom = bottomValue
            piecewiseVisualMap.orient = orientValue
            piecewiseVisualMap.padding = paddingValue
            piecewiseVisualMap.backgroundColor = backgroundColorValue
            piecewiseVisualMap.borderColor = borderColorValue
            piecewiseVisualMap.borderWidth = borderWidthValue
            piecewiseVisualMap.color = colorValue
            piecewiseVisualMap.textStyle = textStyleValue
            piecewiseVisualMap.formatter = formatterValue
            
            it("needs to check the type value") {
                expect(piecewiseVisualMap.type.jsonString).to(equal(typeValue.jsonString))
            }
            
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "type": typeValue,
                    "splitNumber": splitNumberValue,
                    "pieces": piecesValue,
                    "min": minValue,
                    "max": maxValue,
                    "minOpen": minOpenValue,
                    "maxOpen": maxOpenValue,
                    "selectedMode": selectedModeValue,
                    "inverse": inverseValue,
                    "precision": precisionValue,
                    "itemWidth": itemWidthValue,
                    "itemHeight": itemHeightValue,
                    "align": alignValue,
                    "text": textValue,
                    "textGap": textGapValue,
                    "showLabel": showLabelValue,
                    "itemGap": itemGapValue,
                    "itemSymbol": itemSymbolValue,
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
                
                expect(piecewiseVisualMap.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let piecewiseVisualMapByEnums = PiecewiseVisualMap(
                    .splitNumber(splitNumberValue),
                    .pieces(piecesValue),
                    .min(minValue),
                    .max(maxValue),
                    .minOpen(minOpenValue),
                    .maxOpen(maxOpenValue),
                    .selectedMode(selectedModeValue),
                    .inverse(inverseValue),
                    .precision(precisionValue),
                    .itemWidth(itemWidthValue),
                    .itemHeight(itemHeightValue),
                    .align(alignValue),
                    .text(textValue),
                    .textGap(textGapValue),
                    .showLabel(showLabelValue),
                    .itemGap(itemGapValue),
                    .itemSymbol(itemSymbolValue),
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
                
                expect(piecewiseVisualMapByEnums.jsonString).to(equal(piecewiseVisualMap.jsonString))
            }
        }
    }
}
