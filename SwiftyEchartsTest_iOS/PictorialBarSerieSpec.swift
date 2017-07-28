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
        let symbolOriginValue = Symbol.triangle
        let symbolDataValue = OneOrMore(one: symbolOriginValue)
        let symbolSizeDataValue: FunctionOrFloatOrPair = [10, 20%]
        let symbolPositionDataValue = Position.left
        let symbolOffsetDataValue: Point = [0%, 20.1]
        let symbolRotateDataValue: Float = 0.274
        let symbolRepeatDataValue = "dataSymbolRepeatValue"
        let symbolRepeatDirectionDataValue = "vertical"
        let symbolMarginDataValue = "dataSymbolMarginValue"
        let symbolClipDataValue = "dataSymbolClipValue"
        let symbolBoundingDataDataValue = "dataSymbolBoundingDataValue"
        let symbolPatterSizeDataValue: Float = 20.854
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
        let labelDataValue = FormattedLabel(
            .normal(FormattedLabelStyle(
                .show(false),
                .position(Position.center),
                .formatter(.string("12345")),
                .offset([20, 40])
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
        pictorialBarSerieData.symbolPatterSize = symbolPatterSizeDataValue
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
                    "symbolPatterSize": symbolPatterSizeDataValue,
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
                    .symbol(symbolOriginValue),
                    .symbolSize(symbolSizeDataValue),
                    .symbolPosition(symbolPositionDataValue),
                    .symbolOffset(symbolOffsetDataValue),
                    .symbolRotate(symbolRotateDataValue),
                    .symbolRepeat(symbolRepeatDataValue),
                    .symbolRepeatDirection(symbolRepeatDirectionDataValue),
                    .symbolMargin(symbolMarginDataValue),
                    .symbolClip(symbolClipDataValue),
                    .symbolBoundingData(symbolBoundingDataDataValue),
                    .symbolPatterSize(symbolPatterSizeDataValue),
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
    }
}
