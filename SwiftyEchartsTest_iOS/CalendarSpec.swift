//
//  CalendarSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 21/09/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class CalendarSpec: QuickSpec {
    override func spec() {
        let showLabelValue = true
        let firstDayLabelValue: UInt8 = 1
        let marginLabelValue: Float = 2.0
        let positionLabelValue = Position.start
        let nameMapLabelValue = "en"
        let colorLabelValue = rgb(200, 172, 27)
        let formatterLabelValue = Formatter.string("formatterLabelValue")
        let fontStyleLabelValue = FontStyle.oblique
        let fontWeightLabelValue = FontWeight.bolder
        let fontFamilyLabelValue = "labelFontFamilyValue"
        let fontSizeLabelValue: UInt = 22
        let alignLabelValue = Align.right
        let verticalAlignLabelValue = VerticalAlign.top
        let lineHeightLabelValue: Float = 56
        let backgroundColorLabelValue = Color.red
        let borderColorLabelValue = Color.hexColor("#fff")
        let borderWidthLabelValue: Float = 2.0
        let borderRadiusLabelValue: Float = 5
        let paddingLabelValue: Padding = [3, 4, 3, 4]
        let shadowColorLabelValue = Color.yellow
        let shadowBlurLabelValue: Float = 8.88
        let shadowOffsetXLabelValue: Float = 2.0
        let shadowOffsetYLabelValue: Float = 8.88888
        let widthLabelValue: LengthValue = 80%
        let heightLabelValue: LengthValue = 20
        let textBorderColorLabelValue = Color.rgb(100, 100, 100)
        let textBorderWidthLabelValue: Float = 84.0
        let textShadowColorLabelValue: Color = rgba(88, 99, 0, 0.27)
        let textShadowBlurLabelValue: Float = 82.0
        let textShadowOffsetXLabelValue: Float = 8247734.29387492
        let textShadowOffsetYLabelValue: Float = 0.023842397
        let richLabelValue: [String: Jsonable] = [
            "a": ["color": "red", "lineHeight": 10],
            "b": ["backgroundColor": ["image": "xxx/xxx.jpg"], "height": 40],
            "x": ["fontSize": 40, "fontFamily": "Microsoft YaHei", "borderColor": "#449933"]
        ]
        
        let baseLabel = Calendar.BaseLabel()
        baseLabel.show = showLabelValue
        baseLabel.firstDay = firstDayLabelValue
        baseLabel.margin = marginLabelValue
        baseLabel.position = positionLabelValue
        baseLabel.nameMap = OneOrMore(one: nameMapLabelValue)
        baseLabel.color = colorLabelValue
        baseLabel.formatter = formatterLabelValue
        baseLabel.fontStyle = fontStyleLabelValue
        baseLabel.fontWeight = fontWeightLabelValue
        baseLabel.fontFamily = fontFamilyLabelValue
        baseLabel.fontSize = fontSizeLabelValue
        baseLabel.align = alignLabelValue
        baseLabel.verticalAlign = verticalAlignLabelValue
        baseLabel.lineHeight = lineHeightLabelValue
        baseLabel.backgroundColor = backgroundColorLabelValue
        baseLabel.borderColor = borderColorLabelValue
        baseLabel.borderWidth = borderWidthLabelValue
        baseLabel.borderRadius = borderRadiusLabelValue
        baseLabel.padding = paddingLabelValue
        baseLabel.shadowColor = shadowColorLabelValue
        baseLabel.shadowBlur = shadowBlurLabelValue
        baseLabel.shadowOffsetX = shadowOffsetXLabelValue
        baseLabel.shadowOffsetY = shadowOffsetYLabelValue
        baseLabel.width = widthLabelValue
        baseLabel.height = heightLabelValue
        baseLabel.textBorderColor = textBorderColorLabelValue
        baseLabel.textBorderWidth = textBorderWidthLabelValue
        baseLabel.textShadowColor = textShadowColorLabelValue
        baseLabel.textShadowBlur = textShadowBlurLabelValue
        baseLabel.textShadowOffsetX = textShadowOffsetXLabelValue
        baseLabel.textShadowOffsetY = textShadowOffsetYLabelValue
        baseLabel.rich = richLabelValue
        
        describe("For BarSerie.BaseLabel") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "show": showLabelValue,
                    "firstDay": firstDayLabelValue,
                    "margin": marginLabelValue,
                    "position": positionLabelValue,
                    "nameMap": nameMapLabelValue,
                    "color": colorLabelValue,
                    "formatter": formatterLabelValue,
                    "fontStyle": fontStyleLabelValue,
                    "fontWeight": fontWeightLabelValue,
                    "fontFamily": fontFamilyLabelValue,
                    "fontSize": fontSizeLabelValue,
                    "align": alignLabelValue,
                    "verticalAlign": verticalAlignLabelValue,
                    "lineHeight": lineHeightLabelValue,
                    "backgroundColor": backgroundColorLabelValue,
                    "borderColor": borderColorLabelValue,
                    "borderWidth": borderWidthLabelValue,
                    "borderRadius": borderRadiusLabelValue,
                    "padding": paddingLabelValue,
                    "shadowColor": shadowColorLabelValue,
                    "shadowBlur": shadowBlurLabelValue,
                    "shadowOffsetX": shadowOffsetXLabelValue,
                    "shadowOffsetY": shadowOffsetYLabelValue,
                    "width": widthLabelValue,
                    "height": heightLabelValue,
                    "textBorderColor": textBorderColorLabelValue,
                    "textBorderWidth": textBorderWidthLabelValue,
                    "textShadowColor": textShadowColorLabelValue,
                    "textShadowBlur": textShadowBlurLabelValue,
                    "textShadowOffsetX": textShadowOffsetXLabelValue,
                    "textShadowOffsetY": textShadowOffsetYLabelValue,
                    "rich": richLabelValue
                ]
                
                expect(baseLabel.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let baseLabelByEnums = Calendar.BaseLabel(
                    .show(showLabelValue),
                    .firstDay(firstDayLabelValue),
                    .margin(marginLabelValue),
                    .position(positionLabelValue),
                    .nameMap(nameMapLabelValue),
                    .color(colorLabelValue),
                    .formatter(formatterLabelValue),
                    .fontStyle(fontStyleLabelValue),
                    .fontWeight(fontWeightLabelValue),
                    .fontFamily(fontFamilyLabelValue),
                    .fontSize(fontSizeLabelValue),
                    .align(alignLabelValue),
                    .verticalAlign(verticalAlignLabelValue),
                    .lineHeight(lineHeightLabelValue),
                    .backgroundColor(backgroundColorLabelValue),
                    .borderColor(borderColorLabelValue),
                    .borderWidth(borderWidthLabelValue),
                    .borderRadius(borderRadiusLabelValue),
                    .padding(paddingLabelValue),
                    .shadowColor(shadowColorLabelValue),
                    .shadowBlur(shadowBlurLabelValue),
                    .shadowOffsetX(shadowOffsetXLabelValue),
                    .shadowOffsetY(shadowOffsetYLabelValue),
                    .width(widthLabelValue),
                    .height(heightLabelValue),
                    .textBorderColor(textBorderColorLabelValue),
                    .textBorderWidth(textBorderWidthLabelValue),
                    .textShadowColor(textShadowColorLabelValue),
                    .textShadowBlur(textShadowBlurLabelValue),
                    .textShadowOffsetX(textShadowOffsetXLabelValue),
                    .textShadowOffsetY(textShadowOffsetYLabelValue),
                    .rich(richLabelValue)
                )
                
                expect(baseLabelByEnums.jsonString).to(equal(baseLabel.jsonString))
            }
            
            it("needs to check the nameMaps enum case") {
                let nameMapsLabelValue: [String] = [
                    "一月", "二月", "三月",
                    "四月", "五月", "六月",
                    "七月", "八月", "九月",
                    "十月", "十一月", "十二"
                ]
                baseLabel.nameMap = OneOrMore(more: nameMapsLabelValue)
                
                let baseLabelByEnums = Calendar.BaseLabel(
                    .show(showLabelValue),
                    .firstDay(firstDayLabelValue),
                    .margin(marginLabelValue),
                    .position(positionLabelValue),
                    .nameMaps(nameMapsLabelValue),
                    .color(colorLabelValue),
                    .formatter(formatterLabelValue),
                    .fontStyle(fontStyleLabelValue),
                    .fontWeight(fontWeightLabelValue),
                    .fontFamily(fontFamilyLabelValue),
                    .fontSize(fontSizeLabelValue),
                    .align(alignLabelValue),
                    .verticalAlign(verticalAlignLabelValue),
                    .lineHeight(lineHeightLabelValue),
                    .backgroundColor(backgroundColorLabelValue),
                    .borderColor(borderColorLabelValue),
                    .borderWidth(borderWidthLabelValue),
                    .borderRadius(borderRadiusLabelValue),
                    .padding(paddingLabelValue),
                    .shadowColor(shadowColorLabelValue),
                    .shadowBlur(shadowBlurLabelValue),
                    .shadowOffsetX(shadowOffsetXLabelValue),
                    .shadowOffsetY(shadowOffsetYLabelValue),
                    .width(widthLabelValue),
                    .height(heightLabelValue),
                    .textBorderColor(textBorderColorLabelValue),
                    .textBorderWidth(textBorderWidthLabelValue),
                    .textShadowColor(textShadowColorLabelValue),
                    .textShadowBlur(textShadowBlurLabelValue),
                    .textShadowOffsetX(textShadowOffsetXLabelValue),
                    .textShadowOffsetY(textShadowOffsetYLabelValue),
                    .rich(richLabelValue)
                )
                
                expect(baseLabelByEnums.jsonString).to(equal(baseLabel.jsonString))
            }
        }
        
        describe("For Calendar") {
            let zlevelValue: Float = 2.0
            let zValue: Float = 0.00002384782
            let leftValue = Position.right
            let topValue = Position.bottom
            let rightValue = Position.left
            let bottomValue = Position.top
            let widthValue: LengthValue = 20%
            let heightValue: LengthValue = 80
            let rangeValue: Jsonable = 2017
            let cellSizeValue: Float = 20
            let orientValue = Orient.horizontal
            let splitLineValue = SplitLine(
                .show(false),
                .lineStyle(LineStyle(
                    .show(false),
                    .width(20)
                    ))
            )
            let itemStyleValue = ItemStyle(
                .normal(CommonItemStyleContent(
                    .opacity(0.23878),
                    .shadowOffsetX(283.0),
                    .borderColor(Color.red),
                    .borderType(LineType.dotted),
                    .areaColor(Color.yellow)
                    ))
            )
            let dayLabelValue = baseLabel
            let monthLabelValue = MonthLabel(
                .show(true),
                .position(Position.end),
                .margin(8.0),
                .nameMap("cn"),
                .fontStyle(FontStyle.normal),
                .fontWeight(FontWeight.bold)
                )
            let yearLabelValue = YearLabel(
                .align(Align.left),
                .verticalAlign(VerticalAlign.bottom),
                .lineHeight(74.829),
                .shadowBlur(20.000),
                .textShadowBlur(8.00)
            )
            let silentValue = true
            
            let calendar = Calendar()
            calendar.zlevel = zlevelValue
            calendar.z = zValue
            calendar.left = leftValue
            calendar.top = topValue
            calendar.right = rightValue
            calendar.bottom = bottomValue
            calendar.width = widthValue
            calendar.height = heightValue
            calendar.range = rangeValue
            calendar.cellSize = OneOrMore(one: cellSizeValue)
            calendar.orient = orientValue
            calendar.splitLine = splitLineValue
            calendar.itemStyle = itemStyleValue
            calendar.dayLabel = dayLabelValue
            calendar.monthLabel = monthLabelValue
            calendar.yearLabel = yearLabelValue
            calendar.silent = silentValue
            
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "zlevel": zlevelValue,
                    "z": zValue,
                    "left": leftValue,
                    "top": topValue,
                    "right": rightValue,
                    "bottom": bottomValue,
                    "width": widthValue,
                    "height": heightValue,
                    "range": rangeValue,
                    "cellSize": cellSizeValue,
                    "orient": orientValue,
                    "splitLine": splitLineValue,
                    "itemStyle": itemStyleValue,
                    "dayLabel": dayLabelValue,
                    "monthLabel": monthLabelValue,
                    "yearLabel": yearLabelValue,
                    "silent": silentValue
                ]
                
                expect(calendar.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let calendarByEnums = Calendar(
                    .zlevel(zlevelValue),
                    .z(zValue),
                    .left(leftValue),
                    .top(topValue),
                    .right(rightValue),
                    .bottom(bottomValue),
                    .width(widthValue),
                    .height(heightValue),
                    .range(rangeValue),
                    .cellSize(cellSizeValue),
                    .orient(orientValue),
                    .splitLine(splitLineValue),
                    .itemStyle(itemStyleValue),
                    .dayLabel(dayLabelValue),
                    .monthLabel(monthLabelValue),
                    .yearLabel(yearLabelValue),
                    .silent(silentValue)
                )
                
                expect(calendarByEnums.jsonString).to(equal(calendar.jsonString))
            }
            
            it("needs to check the cellSizes enum case") {
                let cellSizesValue: [Jsonable] = [20, 40]
                calendar.cellSize = OneOrMore(more: cellSizesValue)
                
                let calendarByEnums = Calendar(
                    .zlevel(zlevelValue),
                    .z(zValue),
                    .left(leftValue),
                    .top(topValue),
                    .right(rightValue),
                    .bottom(bottomValue),
                    .width(widthValue),
                    .height(heightValue),
                    .range(rangeValue),
                    .cellSizes(cellSizesValue),
                    .orient(orientValue),
                    .splitLine(splitLineValue),
                    .itemStyle(itemStyleValue),
                    .dayLabel(dayLabelValue),
                    .monthLabel(monthLabelValue),
                    .yearLabel(yearLabelValue),
                    .silent(silentValue)
                )
                
                expect(calendarByEnums.jsonString).to(equal(calendar.jsonString))
            }
        }
    }
}
