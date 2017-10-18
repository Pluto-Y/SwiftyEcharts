//
//  LegendSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 18/07/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class LegendSpec: QuickSpec {
    override func spec() {
        let nameDataValue = "nameDataValue"
        let iconDataValue = Symbol.none
        let textStyleDataValue = TextStyle(
            .color(rgb(200, 100, 100)),
            .fontWeight(.lighter)
        )
        
        let legendData = Legend.Data()
        legendData.name = nameDataValue
        legendData.icon = iconDataValue
        legendData.textStyle = textStyleDataValue
        
        describe("For Legend.Data") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "name": nameDataValue,
                    "icon": iconDataValue,
                    "textStyle": textStyleDataValue
                ]
                
                expect(legendData.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let legendDataByEnums = Legend.Data(
                    .name(nameDataValue),
                    .icon(iconDataValue),
                    .textStyle(textStyleDataValue)
                )
                
                expect(legendDataByEnums.jsonString).to(equal(legendData.jsonString))
            }
        }
        
        describe("For Legend") {
            let showValue = true
            let zlevelValue: Float = 2.558
            let zValue: Float = 8
            let leftValue = Position.value(20%)
            let topValue = Position.auto
            let rightValue = Position.outside
            let bottomValue = Position.insideTop
            let widthValue: Float = 93.283
            let heightValue: Float = 0.000001
            let orientValue = Orient.horizontal
            let alignValue = Align.none
            let paddingValue = Padding.all(20)
            let itemGapValue: Float = 9.0293
            let itemWidthValue: Float = 8.283
            let itemHeightValue: Float = 8.888
            let formatterValue = Formatter.string("{a} <br/>{b} : {c}%")
            let selectedModeValue = SelectedMode.disable
            let inactiveColorValue = Color.hexColor("#777")
            let selectedValue = ["系列一": true, "系列二": false]
            let textStyleValue = TextStyle(
                .color(.hexColor("#888"))
            )
            let tooltipValue = Tooltip()
            let dataValue: [Jsonable] = ["系列一", "系列二", "系列三", "系列四"]
            let backgroundColorValue = Color.hexColor("#928742")
            let borderColorValue = Color.blue
            let borderWidthValue: Float = 8.0
            let shadowBlurValue: Float = 2.222
            let shadowColorValue = Color.green
            let shadowOffsetXValue: Float = 8.2832
            let shadowOffsetYValue: Float = 10000.00001
            
            let legend = Legend()
            legend.show = showValue
            legend.zlevel = zlevelValue
            legend.z = zValue
            legend.left = leftValue
            legend.top = topValue
            legend.right = rightValue
            legend.bottom = bottomValue
            legend.width = widthValue
            legend.height = heightValue
            legend.orient = orientValue
            legend.align = alignValue
            legend.padding = paddingValue
            legend.itemGap = itemGapValue
            legend.itemWidth = itemWidthValue
            legend.itemHeight = itemHeightValue
            legend.formatter = formatterValue
            legend.selectedMode = selectedModeValue
            legend.inactiveColor = inactiveColorValue
            legend.selected = selectedValue
            legend.textStyle = textStyleValue
            legend.tooltip = tooltipValue
            legend.data = dataValue
            legend.backgroundColor = backgroundColorValue
            legend.borderColor = borderColorValue
            legend.borderWidth = borderWidthValue
            legend.shadowBlur = shadowBlurValue
            legend.shadowColor = shadowColorValue
            legend.shadowOffsetX = shadowOffsetXValue
            legend.shadowOffsetY = shadowOffsetYValue
            
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
                    "orient": orientValue,
                    "align": alignValue,
                    "padding": paddingValue,
                    "itemGap": itemGapValue,
                    "itemWidth": itemWidthValue,
                    "itemHeight": itemHeightValue,
                    "formatter": formatterValue,
                    "selectedMode": selectedModeValue,
                    "inactiveColor": inactiveColorValue,
                    "selected": selectedValue,
                    "textStyle": textStyleValue,
                    "tooltip": tooltipValue,
                    "data": dataValue,
                    "backgroundColor": backgroundColorValue,
                    "borderColor": borderColorValue,
                    "borderWidth": borderWidthValue,
                    "shadowBlur": shadowBlurValue,
                    "shadowColor": shadowColorValue,
                    "shadowOffsetX": shadowOffsetXValue,
                    "shadowOffsetY": shadowOffsetYValue
                ]
                
                expect(legend.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let legendByEnums = Legend(
                    .show(showValue),
                    .zlevel(zlevelValue),
                    .z(zValue),
                    .left(leftValue),
                    .top(topValue),
                    .right(rightValue),
                    .bottom(bottomValue),
                    .width(widthValue),
                    .height(heightValue),
                    .orient(orientValue),
                    .align(alignValue),
                    .padding(paddingValue),
                    .itemGap(itemGapValue),
                    .itemWidth(itemWidthValue),
                    .itemHeight(itemHeightValue),
                    .formatter(formatterValue),
                    .selectedMode(selectedModeValue),
                    .inactiveColor(inactiveColorValue),
                    .selected(selectedValue),
                    .textStyle(textStyleValue),
                    .tooltip(tooltipValue),
                    .data(dataValue),
                    .backgroundColor(backgroundColorValue),
                    .borderColor(borderColorValue),
                    .borderWidth(borderWidthValue),
                    .shadowBlur(shadowBlurValue),
                    .shadowColor(shadowColorValue),
                    .shadowOffsetX(shadowOffsetXValue),
                    .shadowOffsetY(shadowOffsetYValue)
                )
                
                expect(legendByEnums.jsonString).to(equal(legend.jsonString))
            }
            
            it("needs to check the x, y enum case") {
                let legendByEnums = Legend(
                    .show(showValue),
                    .zlevel(zlevelValue),
                    .z(zValue),
                    .x(leftValue),
                    .y(topValue),
                    .right(rightValue),
                    .bottom(bottomValue),
                    .width(widthValue),
                    .height(heightValue),
                    .orient(orientValue),
                    .align(alignValue),
                    .padding(paddingValue),
                    .itemGap(itemGapValue),
                    .itemWidth(itemWidthValue),
                    .itemHeight(itemHeightValue),
                    .formatter(formatterValue),
                    .selectedMode(selectedModeValue),
                    .inactiveColor(inactiveColorValue),
                    .selected(selectedValue),
                    .textStyle(textStyleValue),
                    .tooltip(tooltipValue),
                    .data(dataValue),
                    .backgroundColor(backgroundColorValue),
                    .borderColor(borderColorValue),
                    .borderWidth(borderWidthValue),
                    .shadowBlur(shadowBlurValue),
                    .shadowColor(shadowColorValue),
                    .shadowOffsetX(shadowOffsetXValue),
                    .shadowOffsetY(shadowOffsetYValue)
                )
                
                expect(legendByEnums.jsonString).to(equal(legend.jsonString))
            }
        }
        
        context("For the actions of Legend") {
            describe("For LegendSelect") { 
                let typeValue = EchartsActionType.legendSelect
                let nameValue = "legendSelectName"
                
                let legendSelect = LegendSelect()
                legendSelect.name = nameValue
                
                it("needs to check the typeValue") {
                    expect(legendSelect.type.jsonString).to(equal(typeValue.jsonString))
                }
                
                it("needs to check the jsonString") {
                    let resultDic: [String: Jsonable] = [
                        "type": typeValue,
                        "name": nameValue
                    ]
                    
                    expect(legendSelect.jsonString).to(equal(resultDic.jsonString))
                }
                
                it("needs to check the Enumable") {
                    let legendSelectByEnums = LegendSelect(
                        .name(nameValue)
                    )
                    
                    expect(legendSelectByEnums.jsonString).to(equal(legendSelect.jsonString))
                }
            }
            
            describe("For LegendUnSelect") {
                let typeValue = EchartsActionType.legendUnSelect
                let nameValue = "legendUnSelectName"
                
                let legendUnSelect = LegendUnSelect()
                legendUnSelect.name = nameValue
                
                it("needs to check the typeValue") {
                    expect(legendUnSelect.type.jsonString).to(equal(typeValue.jsonString))
                }
                
                it("needs to check the jsonString") {
                    let resultDic: [String: Jsonable] = [
                        "type": typeValue,
                        "name": nameValue
                    ]
                    
                    expect(legendUnSelect.jsonString).to(equal(resultDic.jsonString))
                }
                
                it("needs to check the Enumable") {
                    let legendUnSelectByEnums = LegendUnSelect(
                        .name(nameValue)
                    )
                    
                    expect(legendUnSelectByEnums.jsonString).to(equal(legendUnSelect.jsonString))
                }
            }
            
            describe("For LegendToggleSelect") {
                let typeValue = EchartsActionType.legendToggleSelect
                let nameValue = "legendToggleSelectName"
                
                let legendToggleSelect = LegendToggleSelect()
                legendToggleSelect.name = nameValue
                
                it("needs to check the typeValue") {
                    expect(legendToggleSelect.type.jsonString).to(equal(typeValue.jsonString))
                }
                
                it("needs to check the jsonString") {
                    let resultDic: [String: Jsonable] = [
                        "type": typeValue,
                        "name": nameValue
                    ]
                    
                    expect(legendToggleSelect.jsonString).to(equal(resultDic.jsonString))
                }
                
                it("needs to check the Enumable") {
                    let legendToggleSelectByEnums = LegendToggleSelect(
                        .name(nameValue)
                    )
                    
                    expect(legendToggleSelectByEnums.jsonString).to(equal(legendToggleSelect.jsonString))
                }
            }
            
            describe("For LegendScroll") {
                let typeValue = EchartsActionType.legendScroll
                let scrollDataIndexValue = 72374832
                let legendIdValue = "legendScrollViewLegendId"
                
                let legendScroll = LegendScroll()
                legendScroll.scrollDataIndex = scrollDataIndexValue
                legendScroll.legendId = legendIdValue
                
                it("needs to check the type value") {
                    expect(legendScroll.type.jsonString).to(equal(typeValue.jsonString))
                }
                
                it("needs to check the jsonString") {
                    let resultDic: [String: Jsonable] = [
                        "type": typeValue,
                        "scrollDataIndex": scrollDataIndexValue,
                        "legendId": legendIdValue
                    ]
                    
                    expect(legendScroll.jsonString).to(equal(resultDic.jsonString))
                }
                
                it("needs to check the Enumable"){
                    let legendScrollByEnums = LegendScroll(
                        .scrollDataIndex(scrollDataIndexValue),
                        .legendId(legendIdValue)
                    )
                    
                    expect(legendScrollByEnums.jsonString).to(equal(legendScroll.jsonString))
                }
            }
        }
    }
}
