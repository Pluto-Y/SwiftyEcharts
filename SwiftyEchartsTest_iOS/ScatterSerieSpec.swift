//
//  ScatterSerieSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 08/08/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class ScatterSerieSpec: QuickSpec {
    override func spec() {
        let nameDataValue = "dataNameValue"
        let valueDataValue = "dataValueValue"
        let symbolOriginDataValue = Symbol.rect
        let symbolDataValue = OneOrMore<Symbol>(one: symbolOriginDataValue)
        let symbolSizeDataValue = FunctionOrFloatOrPair.value(20.582)
        let symbolRotateDataValue: Float = 7.75634
        let symbolOffsetDataValue: Point = [20.57, 57246]
        let labelDataValue = EmphasisLabel(
            .emphasis(LabelStyle(
                .position(Position.point([0.0, 100%])),
                .fontWeight(FontWeight.bold)
                ))
        )
        let itemStyleDataValue = ItemStyle(
            .normal(CommonItemStyleContent(
                .borderColor(Color.hexColor("#090342")),
                .opacity(574.7437),
                .areaColor(Color.hexColor("#ffffff")),
                .shadowOffsetY(0.000757)
                ))
        )
        
        let data = ScatterSerie.Data()
        data.name = nameDataValue
        data.value = valueDataValue
        data.symbol = symbolDataValue
        data.symbolSize = symbolSizeDataValue
        data.symbolRotate = symbolRotateDataValue
        data.symbolOffset = symbolOffsetDataValue
        data.label = labelDataValue
        data.itemStyle = itemStyleDataValue
        
        describe("For ScatterSerie.Data") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "name": nameDataValue,
                    "value": valueDataValue,
                    "symbol": symbolDataValue,
                    "symbolSize": symbolSizeDataValue,
                    "symbolRotate": symbolRotateDataValue,
                    "symbolOffset": symbolOffsetDataValue,
                    "label": labelDataValue,
                    "itemStyle": itemStyleDataValue
                ]
                
                expect(data.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let dataByEnums = ScatterSerie.Data(
                    .name(nameDataValue),
                    .value(valueDataValue),
                    .symbol(symbolOriginDataValue),
                    .symbolSize(symbolSizeDataValue),
                    .symbolRotate(symbolRotateDataValue),
                    .symbolOffset(symbolOffsetDataValue),
                    .label(labelDataValue),
                    .itemStyle(itemStyleDataValue)
                )
                
                expect(dataByEnums.jsonString).to(equal(data.jsonString))
            }
        }
        
        let typeValue = SerieType.scatter
        let nameValue = "scatterSerieNameValue"
        let coordinateSystemValue = CoordinateSystem.geo
        let xAxisIndexValue: UInt8 = 85
        let yAxisIndexValue: UInt8 = 107
        let polarIndexValue: UInt8 = 88
        let geoIndexValue: UInt8 = 5
        let hoverAnimationValue = false
        let legendHoverLinkValue = true
        let symbolOriginValue = Symbol.arrow
        let symbolValue = OneOrMore<Symbol>(one: symbolOriginValue)
        let symbolSizeValue: FunctionOrFloatOrPair = [0.01, 57.27]
        let symbolRotateValue: Float = 77
        let symbolOffsetValue: Point = [0.0, 0]
        let largeValue = false
        let largeThresholdValue: Float = 463.93
        let labelValue = EmphasisLabel(
            .normal(LabelStyle(
                .show(false),
                .formatter(.string("formatterValue"))
                ))
        )
        let itemStyleValue = ItemStyle(
            .normal(CommonItemStyleContent(
                .shadowBlur(0.57),
                .shadowColor(Color.red),
                .opacity(0.5727),
                .shadowOffsetX(58237)
                ))
        )
        let dataValue: [Jsonable] = [
            data,
            [12, 33],
            [34, 313],
            [
                "value": [56, 44],
                "label": Label(),
                "itemStyle":ItemStyle()
            ],
            [10, 33]
        ]
        let markPointValue = MarkPoint(
            .symbol(.none),
            .silent(false)
        )
        let markLineValue = MarkLine(
            .symbol(.arrow),
            .precision(85723)
        )
        let markAreaValue = MarkArea(
            .animationEasing(.elasticIn),
            .animationDuration(.number(482632)),
            .animationDelayUpdate(.number(8.88888))
        )
        let zlevelValue: Float = 0.5827
        let zValue: Float = 65.27
        let silentValue = true
        let animationValue = false
        let animationThresholdValue: Float = 8573.837
        let animationDurationValue: Time = 0.00847
        let animationEasingValue: EasingFunction = .bounceIn
        let animationDelayValue: Time = 7562
        let animationDurationUpdateValue: Time = Time.init(integerLiteral: 7563)
        let animationEasingUpdateValue: EasingFunction = .cubicIn
        let animationDelayUpdateValue = Time.number(0.756349)
        
        let scatterSerie = ScatterSerie()
        scatterSerie.name = nameValue
        scatterSerie.coordinateSystem = coordinateSystemValue
        scatterSerie.xAxisIndex = xAxisIndexValue
        scatterSerie.yAxisIndex = yAxisIndexValue
        scatterSerie.polarIndex = polarIndexValue
        scatterSerie.geoIndex = geoIndexValue
        scatterSerie.hoverAnimation = hoverAnimationValue
        scatterSerie.legendHoverLink = legendHoverLinkValue
        scatterSerie.symbol = symbolValue
        scatterSerie.symbolSize = symbolSizeValue
        scatterSerie.symbolRotate = symbolRotateValue
        scatterSerie.symbolOffset = symbolOffsetValue
        scatterSerie.large = largeValue
        scatterSerie.largeThreshold = largeThresholdValue
        scatterSerie.label = labelValue
        scatterSerie.itemStyle = itemStyleValue
        scatterSerie.data = dataValue
        scatterSerie.markPoint = markPointValue
        scatterSerie.markLine = markLineValue
        scatterSerie.markArea = markAreaValue
        scatterSerie.zlevel = zlevelValue
        scatterSerie.z = zValue
        scatterSerie.silent = silentValue
        scatterSerie.animation = animationValue
        scatterSerie.animationThreshold = animationThresholdValue
        scatterSerie.animationDuration = animationDurationValue
        scatterSerie.animationEasing = animationEasingValue
        scatterSerie.animationDelay = animationDelayValue
        scatterSerie.animationDurationUpdate = animationDurationUpdateValue
        scatterSerie.animationEasingUpdate = animationEasingUpdateValue
        scatterSerie.animationDelayUpdate = animationDelayUpdateValue
        
        describe("For ScatterSerie") {
            it("needs to check the type value") {
                expect(scatterSerie.type.jsonString).to(equal(typeValue.jsonString))
            }
            
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "type": typeValue,
                    "name": nameValue,
                    "coordinateSystem": coordinateSystemValue,
                    "xAxisIndex": xAxisIndexValue,
                    "yAxisIndex": yAxisIndexValue,
                    "polarIndex": polarIndexValue,
                    "geoIndex": geoIndexValue,
                    "hoverAnimation": hoverAnimationValue,
                    "legendHoverLink": legendHoverLinkValue,
                    "symbol": symbolValue,
                    "symbolSize": symbolSizeValue,
                    "symbolRotate": symbolRotateValue,
                    "symbolOffset": symbolOffsetValue,
                    "large": largeValue,
                    "largeThreshold": largeThresholdValue,
                    "label": labelValue,
                    "itemStyle": itemStyleValue,
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
                    "animationDelay": animationDelayValue,
                    "animationDurationUpdate": animationDurationUpdateValue,
                    "animationEasingUpdate": animationEasingUpdateValue,
                    "animationDelayUpdate": animationDelayUpdateValue
                ]
                
                expect(scatterSerie.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let scatterSerieByEnums = ScatterSerie(
                    .name(nameValue),
                    .coordinateSystem(coordinateSystemValue),
                    .xAxisIndex(xAxisIndexValue),
                    .yAxisIndex(yAxisIndexValue),
                    .polarIndex(polarIndexValue),
                    .geoIndex(geoIndexValue),
                    .hoverAnimation(hoverAnimationValue),
                    .legendHoverLink(legendHoverLinkValue),
                    .symbol(symbolOriginValue),
                    .symbolSize(symbolSizeValue),
                    .symbolRotate(symbolRotateValue),
                    .symbolOffset(symbolOffsetValue),
                    .large(largeValue),
                    .largeThreshold(largeThresholdValue),
                    .label(labelValue),
                    .itemStyle(itemStyleValue),
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
                    .animationDelay(animationDelayValue),
                    .animationDurationUpdate(animationDurationUpdateValue),
                    .animationEasingUpdate(animationEasingUpdateValue),
                    .animationDelayUpdate(animationDelayUpdateValue)
                )
                
                expect(scatterSerieByEnums.jsonString).to(equal(scatterSerie.jsonString))
            }
        }
    }
}
