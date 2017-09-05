//
//  PictorialBarSerieSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 28/07/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class PictorialBarSerieSpec: QuickSpec {
    override func spec() {
        let nameDataValue = "dataNameValue"
        let valueDataValue: Jsonable = 84.23873
        let symbolOriginDataValue = Symbol.triangle
        let symbolDataValue = OneOrMore(one: symbolOriginDataValue)
        let symbolSizeDataValue: FunctionOrFloatOrPair = [10, 20%]
        let symbolPositionDataValue = Position.left
        let symbolOffsetDataValue: Point = [0%, 20.1]
        let symbolRotateDataValue: Float = 0.274
        let symbolRepeatDataValue = "dataSymbolRepeatValue"
        let symbolRepeatDirectionDataValue = "vertical"
        let symbolMarginDataValue = "dataSymbolMarginValue"
        let symbolClipDataValue = true
        let symbolBoundingDataDataValue = "dataSymbolBoundingDataValue"
        let symbolPatternSizeDataValue: Float = 20.854
        let zDataValue: Float = 75.273
        let hoverAnimationDataValue = false
        let animationDataValue = true
        let animationThresholdDataValue: Float = 2874.283
        let animationDurationDataValue: Time = Time.number(285.2)
        let animationEasingDataValue = EasingFunction.cubicOut
        let animationDelayDataValue: Time = 82.473
        let animationDurationUpdateDataValue: Time = 8.27464
        let animationEasingUpdateDataValue: EasingFunction = .exponentialOut
        let animationDelayUpdateDataValue: Time = 1000.3820
        let labelDataValue = EmphasisLabel(
            .normal(LabelStyle(
                .show(false),
                .position(Position.center),
                .formatter(.string("12345")),
                .interval(255)
                ))
        )
        let itemStyleDataValue = ItemStyle(
            .emphasis(CommonItemStyleContent(
                .opacity(0.28545),
                .color(Color.hexColor("#204744")),
                .shadowOffsetY(472.73),
                .barBorderRadius(82.8172)
                ))
        )
        let tooltipDataValue = Tooltip(
            .show(false)
        )
        
        let pictorialBarSerieData = PictorialBarSerie.Data()
        pictorialBarSerieData.name = nameDataValue
        pictorialBarSerieData.value = valueDataValue
        pictorialBarSerieData.symbol = symbolDataValue
        pictorialBarSerieData.symbolSize = symbolSizeDataValue
        pictorialBarSerieData.symbolPosition = symbolPositionDataValue
        pictorialBarSerieData.symbolOffset = symbolOffsetDataValue
        pictorialBarSerieData.symbolRotate = symbolRotateDataValue
        pictorialBarSerieData.symbolRepeat = symbolRepeatDataValue
        pictorialBarSerieData.symbolRepeatDirection = symbolRepeatDirectionDataValue
        pictorialBarSerieData.symbolMargin = symbolMarginDataValue
        pictorialBarSerieData.symbolClip = symbolClipDataValue
        pictorialBarSerieData.symbolBoundingData = symbolBoundingDataDataValue
        pictorialBarSerieData.symbolPatternSize = symbolPatternSizeDataValue
        pictorialBarSerieData.z = zDataValue
        pictorialBarSerieData.hoverAnimation = hoverAnimationDataValue
        pictorialBarSerieData.animation = animationDataValue
        pictorialBarSerieData.animationThreshold = animationThresholdDataValue
        pictorialBarSerieData.animationDuration = animationDurationDataValue
        pictorialBarSerieData.animationEasing = animationEasingDataValue
        pictorialBarSerieData.animationDurationUpdate = animationDurationUpdateDataValue
        pictorialBarSerieData.animationEasingUpdate = animationEasingUpdateDataValue
        pictorialBarSerieData.animationDelay = animationDelayDataValue
        pictorialBarSerieData.animationDelayUpdate = animationDelayUpdateDataValue
        pictorialBarSerieData.label = labelDataValue
        pictorialBarSerieData.itemStyle = itemStyleDataValue
        pictorialBarSerieData.tooltip = tooltipDataValue
        
        describe("For PictorialBarSerie.Data") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "name": nameDataValue,
                    "value": valueDataValue,
                    "symbol": symbolDataValue,
                    "symbolSize": symbolSizeDataValue,
                    "symbolPosition": symbolPositionDataValue,
                    "symbolOffset": symbolOffsetDataValue,
                    "symbolRotate": symbolRotateDataValue,
                    "symbolRepeat": symbolRepeatDataValue,
                    "symbolRepeatDirection": symbolRepeatDirectionDataValue,
                    "symbolMargin": symbolMarginDataValue,
                    "symbolClip": symbolClipDataValue,
                    "symbolBoundingData": symbolBoundingDataDataValue,
                    "symbolPatternSize": symbolPatternSizeDataValue,
                    "z": zDataValue,
                    "hoverAnimation": hoverAnimationDataValue,
                    "animation": animationDataValue,
                    "animationThreshold": animationThresholdDataValue,
                    "animationDuration": animationDurationDataValue,
                    "animationEasing": animationEasingDataValue,
                    "animationDurationUpdate": animationDurationUpdateDataValue,
                    "animationEasingUpdate": animationEasingUpdateDataValue,
                    "animationDelay": animationDelayDataValue,
                    "animationDelayUpdate": animationDelayUpdateDataValue,
                    "label": labelDataValue,
                    "itemStyle": itemStyleDataValue,
                    "tooltip": tooltipDataValue
                ]

                expect(pictorialBarSerieData.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let pictorialBarSerieDataByEnums = PictorialBarSerie.Data(
                    .name(nameDataValue),
                    .value(valueDataValue),
                    .symbol(symbolOriginDataValue),
                    .symbolSize(symbolSizeDataValue),
                    .symbolPosition(symbolPositionDataValue),
                    .symbolOffset(symbolOffsetDataValue),
                    .symbolRotate(symbolRotateDataValue),
                    .symbolRepeat(symbolRepeatDataValue),
                    .symbolRepeatDirection(symbolRepeatDirectionDataValue),
                    .symbolMargin(symbolMarginDataValue),
                    .symbolClip(symbolClipDataValue),
                    .symbolBoundingData(symbolBoundingDataDataValue),
                    .symbolPatternSize(symbolPatternSizeDataValue),
                    .z(zDataValue),
                    .hoverAnimation(hoverAnimationDataValue),
                    .animation(animationDataValue),
                    .animationThreshold(animationThresholdDataValue),
                    .animationDuration(animationDurationDataValue),
                    .animationEasing(animationEasingDataValue),
                    .animationDurationUpdate(animationDurationUpdateDataValue),
                    .animationEasingUpdate(animationEasingUpdateDataValue),
                    .animationDelay(animationDelayDataValue),
                    .animationDelayUpdate(animationDelayUpdateDataValue),
                    .label(labelDataValue),
                    .itemStyle(itemStyleDataValue),
                    .tooltip(tooltipDataValue)
                )
                
                expect(pictorialBarSerieDataByEnums.jsonString).to(equal(pictorialBarSerieData.jsonString))
            }
        }
        
        describe("For PictorialBarSerie") {
            let nameValue = "pictorialBarSerieNameValue"
            let legendHoverLinkValue = false
            let coordinateSystemValue = CoordinateSystem.geo
            let xAxisIndexValue: UInt8 = 37
            let yAxisIndexValue: UInt8 = 88
            let cursorValue = "pointer"
            let labelValue = EmphasisLabel(
                .normal(LabelStyle(
                    .show(true),
                    .position(Position.auto),
                    .align(Align.center)
                    )),
                .emphasis(LabelStyle(
                    .show(false)
                    ))
            )
            let itemStyleValue = ItemStyle(
                .normal(CommonItemStyleContent(
                    .opacity(0.74652),
                    .borderType(LineType.solid),
                    .shadowBlur(47562.742),
                    .color(Color.red)
                    ))
            )
            let barWidthValue: LengthValue = 28%
            let barMaxWidthValue: LengthValue = 70
            let barMinHeightValue: LengthValue = 20
            let barGapValue = 55%
            let barCategoryGapValue = 29%
            let symbolOriginValue = Symbol.arrow
            let symbolValue = OneOrMore(one: symbolOriginValue)
            let symbolSizeValue = FunctionOrFloatOrPair.point([20.35, 3%])
            let symbolPositionValue = Position.point([2%, 88])
            let symbolOffsetValue: Point = [2, 77]
            let symbolRotateValue: Float = 275
            let symbolRepeatValue = "none"
            let symbolRepeatDirectionValue = "horizontal"
            let symbolMarginValue = "marginValue"
            let symbolClipValue = true
            let symbolBoundingDataValue = "boudingDataValue"
            let symbolPatternSizeValue: Float = 84.2
            let hoverAnimationValue = false
            let dimensionsValue: [Jsonable] = [
                "null",
                ["type": "ordinal"],
                ["name": "good", "type": "number"],
                "bad"
            ]
            let encodeValue: [String: Jsonable] = [
                "x": [3, 1, 5],
                "y": 2,
                "tooltip": [3, 2, 4],
                "label": 3
            ]
            let dataValue: [Jsonable] = [
                false, true, "dataValu", pictorialBarSerieData, 28.58, 5
            ]
            let markPointValue = MarkPoint(
                .silent(true),
                .symbol(Symbol.triangle),
                .symbolOffset([50%, 0]),
                .animationDuration(Time.number(300))
            )
            let markLineValue = MarkLine(
                .symbol(Symbol.emptyCircle),
                .data(["100", 200, ["name": "hello", "Value": 300.0]])
            )
            let markAreaValue = MarkArea(
                .animationEasing(EasingFunction.sinusoidalInOut),
                .animationEasingUpdate(.sinusoidalInOut)
            )
            let zlevelValue: Float = 7563.2
            let zValue: Float = 873.321
            let silentValue = true
            let animationValue = false
            let animationThresholdValue: Float = 2874.283
            let animationDurationValue: Time = Time.number(88888888)
            let animationEasingValue = EasingFunction.backIn
            let animationDelayValue: Time = 75348.438
            let animationDurationUpdateValue: Time = 84.27323
            let animationEasingUpdateValue: EasingFunction = .exponentialOut
            let animationDelayUpdateValue: Time = 474
            let tooltipValue = Tooltip(
                .trigger(Tooltip.Trigger.item),
                .alwaysShowContent(false),
                .borderColor(Color.yellow)
            )
            
            let pictorialBarSerie = PictorialBarSerie()
            pictorialBarSerie.name = nameValue
            pictorialBarSerie.legendHoverLink = legendHoverLinkValue
            pictorialBarSerie.coordinateSystem = coordinateSystemValue
            pictorialBarSerie.xAxisIndex = xAxisIndexValue
            pictorialBarSerie.yAxisIndex = yAxisIndexValue
            pictorialBarSerie.cursor = cursorValue
            pictorialBarSerie.label = labelValue
            pictorialBarSerie.itemStyle = itemStyleValue
            pictorialBarSerie.barWidth = barWidthValue
            pictorialBarSerie.barMaxWidth = barMaxWidthValue
            pictorialBarSerie.barMinHeight = barMinHeightValue
            pictorialBarSerie.barGap = barGapValue
            pictorialBarSerie.barCategoryGap = barCategoryGapValue
            pictorialBarSerie.symbol = symbolValue
            pictorialBarSerie.symbolSize = symbolSizeValue
            pictorialBarSerie.symbolPosition = symbolPositionValue
            pictorialBarSerie.symbolOffset = symbolOffsetValue
            pictorialBarSerie.symbolRotate = symbolRotateValue
            pictorialBarSerie.symbolRepeat = symbolRepeatValue
            pictorialBarSerie.symbolRepeatDirection = symbolRepeatDirectionValue
            pictorialBarSerie.symbolMargin = symbolMarginValue
            pictorialBarSerie.symbolClip = symbolClipValue
            pictorialBarSerie.symbolBoundingData = symbolBoundingDataValue
            pictorialBarSerie.symbolPatternSize = symbolPatternSizeValue
            pictorialBarSerie.hoverAnimation = hoverAnimationValue
            pictorialBarSerie.dimensions = dimensionsValue
            pictorialBarSerie.encode = encodeValue
            pictorialBarSerie.data = dataValue
            pictorialBarSerie.markPoint = markPointValue
            pictorialBarSerie.markLine = markLineValue
            pictorialBarSerie.markArea = markAreaValue
            pictorialBarSerie.zlevel = zlevelValue
            pictorialBarSerie.z = zValue
            pictorialBarSerie.silent = silentValue
            pictorialBarSerie.animation = animationValue
            pictorialBarSerie.animationThreshold = animationThresholdValue
            pictorialBarSerie.animationDuration = animationDurationValue
            pictorialBarSerie.animationEasing = animationEasingValue
            pictorialBarSerie.animationDurationUpdate = animationDurationUpdateValue
            pictorialBarSerie.animationDelayUpdate = animationDelayUpdateValue
            pictorialBarSerie.animationDelay = animationDelayValue
            pictorialBarSerie.animationEasingUpdate = animationEasingUpdateValue
            pictorialBarSerie.tooltip = tooltipValue
            
            it("needs to check the type value") {
                expect(pictorialBarSerie.type.jsonString).to(equal(SerieType.pictorialBar.jsonString))
            }
            
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "type": SerieType.pictorialBar,
                    "name": nameValue,
                    "legendHoverLink": legendHoverLinkValue,
                    "coordinateSystem": coordinateSystemValue,
                    "xAxisIndex": xAxisIndexValue,
                    "yAxisIndex": yAxisIndexValue,
                    "cursor": cursorValue,
                    "label": labelValue,
                    "itemStyle": itemStyleValue,
                    "barWidth": barWidthValue,
                    "barMaxWidth": barMaxWidthValue,
                    "barMinHeight": barMinHeightValue,
                    "barGap": barGapValue,
                    "barCategoryGap": barCategoryGapValue,
                    "symbol": symbolValue,
                    "symbolSize": symbolSizeValue,
                    "symbolPosition": symbolPositionValue,
                    "symbolOffset": symbolOffsetValue,
                    "symbolRotate": symbolRotateValue,
                    "symbolRepeat": symbolRepeatValue,
                    "symbolRepeatDirection": symbolRepeatDirectionValue,
                    "symbolMargin": symbolMarginValue,
                    "symbolClip": symbolClipValue,
                    "symbolBoundingData": symbolBoundingDataValue,
                    "symbolPatternSize": symbolPatternSizeValue,
                    "hoverAnimation": hoverAnimationValue,
                    "dimensions": dimensionsValue,
                    "encode": encodeValue,
                    "data": dataValue,
                    "markPoint": markPointValue,
                    "markLine": markLineValue,
                    "markArea": markAreaValue,
                    "zlevel": zlevelValue,
                    "z": zValue,
                    "silent": silentValue,
                    "animation": animationValue,
                    "animationThreshold": animationThresholdValue,
                    "animationDuration": animationDurationValue,
                    "animationEasing": animationEasingValue,
                    "animationDurationUpdate": animationDurationUpdateValue,
                    "animationDelayUpdate": animationDelayUpdateValue,
                    "animationDelay": animationDelayValue,
                    "animationEasingUpdate": animationEasingUpdateValue,
                    "tooltip": tooltipValue
                ]
                
                expect(pictorialBarSerie.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let pictorialBarSerieByEnums = PictorialBarSerie(
                    .name(nameValue),
                    .legendHoverLink(legendHoverLinkValue),
                    .coordinateSystem(coordinateSystemValue),
                    .xAxisIndex(xAxisIndexValue),
                    .yAxisIndex(yAxisIndexValue),
                    .cursor(cursorValue),
                    .label(labelValue),
                    .itemStyle(itemStyleValue),
                    .barWidth(barWidthValue),
                    .barMaxWidth(barMaxWidthValue),
                    .barMinHeight(barMinHeightValue),
                    .barGap(barGapValue),
                    .barCategoryGap(barCategoryGapValue),
                    .symbol(symbolOriginValue),
                    .symbolSize(symbolSizeValue),
                    .symbolPosition(symbolPositionValue),
                    .symbolOffset(symbolOffsetValue),
                    .symbolRotate(symbolRotateValue),
                    .symbolRepeat(symbolRepeatValue),
                    .symbolRepeatDirection(symbolRepeatDirectionValue),
                    .symbolMargin(symbolMarginValue),
                    .symbolClip(symbolClipValue),
                    .symbolBoundingData(symbolBoundingDataValue),
                    .symbolPatternSize(symbolPatternSizeValue),
                    .hoverAnimation(hoverAnimationValue),
                    .dimensions(dimensionsValue),
                    .encode(encodeValue),
                    .data(dataValue),
                    .markPoint(markPointValue),
                    .markLine(markLineValue),
                    .markArea(markAreaValue),
                    .zlevel(zlevelValue),
                    .z(zValue),
                    .silent(silentValue),
                    .animation(animationValue),
                    .animationThreshold(animationThresholdValue),
                    .animationDuration(animationDurationValue),
                    .animationEasing(animationEasingValue),
                    .animationDurationUpdate(animationDurationUpdateValue),
                    .animationDelayUpdate(animationDelayUpdateValue),
                    .animationDelay(animationDelayValue),
                    .animationEasingUpdate(animationEasingUpdateValue),
                    .tooltip(tooltipValue)
                )
                
                expect(pictorialBarSerieByEnums.jsonString).to(equal(pictorialBarSerie.jsonString))
            }
        }
    }
}
