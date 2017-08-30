//
//  EffectScatterSerieSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 09/07/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class EffectScatterSerieSpec: QuickSpec {
    override func spec() {
        let renderShowEffectOn = EffectScatterSerie.ShowEffectOn.render
        let emphasisShowEffectOn = EffectScatterSerie.ShowEffectOn.emphasis
        
        describe("For EffectScatterSerie.ShowEffectOn") {
            it("needs to check the jsonString") {
                let renderString = "render"
                let emphasisString = "emphasis"
                
                expect(renderShowEffectOn.jsonString).to(equal(renderString.jsonString))
                expect(emphasisShowEffectOn.jsonString).to(equal(emphasisString.jsonString))
            }
        }
        
        let strokeBrushType = EffectScatterSerie.RippleEffect.BrushType.stroke
        let fillBrushType = EffectScatterSerie.RippleEffect.BrushType.fill
        
        describe("For EffectScatterSerie.RippleEffect.BrushType") {
            it("needs to chekc the jsonString") {
                let strokeString = "stroke"
                let fillString = "fill"
                
                expect(strokeBrushType.jsonString).to(equal(strokeString.jsonString))
                expect(fillBrushType.jsonString).to(equal(fillString.jsonString))
            }
        }
        
        let periodValue: Float = 5.0
        let scaleValue: Float = 1.5
        let brushTypeValue = strokeBrushType
        
        let rippleEffect = EffectScatterSerie.RippleEffect()
        rippleEffect.period = periodValue
        rippleEffect.scale = scaleValue
        rippleEffect.brushType = brushTypeValue
        
        describe("For EffectScatterSerie.RippleEffect") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "period": periodValue,
                    "scale": scaleValue,
                    "brushType": brushTypeValue
                ]
                
                expect(rippleEffect.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let rippleEffectByEnums = EffectScatterSerie.RippleEffect(
                    .period(periodValue),
                    .scale(scaleValue),
                    .brushType(brushTypeValue)
                )
                
                expect(rippleEffectByEnums.jsonString).to(equal(rippleEffect.jsonString))
            }
        }
        
        describe("For EffectScatterSerie") {
            let nameValue = "effectScatterSerieName"
            let legendHoverLinkValue = false
            let showEffectOnValue = renderShowEffectOn
            let rippleEffectValue = rippleEffect
            let coordinateSystemValue = CoordinateSystem.geo
            let xAxisIndexValue: UInt8 = 2
            let yAxisIndexValue: UInt8 = 8
            let polarIndexValue: UInt8 = 255
            let geoIndexValue: UInt8 = 0
            let symbolOriginValue = Symbol.emptyCircle
            let symbolValue = OneOrMore(one: symbolOriginValue)
            let symbolSizeValue = FunctionOrFloatOrPair.value(28.5)
            let symbolRotateValue: Float = 7.421
            let symbolOffsetValue: Point = [20, 50%]
            let labelValue = EmphasisLabel(
                .normal(LabelStyle(
                    .show(true),
                    .position(.top),
                    .textShadowBlur(2.0002),
                    .textShadowOffsetY(10),
                    .color(Color.red)
                    ))
            )
            let itemStyleValue = ItemStyle(
                .emphasis(CommonItemStyleContent(
                    .shadowBlur(10),
                    .shadowOffsetX(0),
                    .shadowColor(.rgba(0, 0, 0, 0.5))
                    ))
            )
            let dataValue: [Jsonable] = [
                12, 34, ["value": 56, "itemStyle": [:]], 10
            ]
            let markPointValue = MarkPoint(
                .animation(false),
                .silent(true),
                .symbolRotate(45)
            )
            let markLineValue = MarkLine(
                .symbol(.rect),
                .precision(12.5),
                .animationDelay(5.0),
                .data([["yAxis": "max", "x": 90%], ["name": "两个屏幕坐标之间的标线", "x": 100, "y": 100]])
            )
            let markAreaValue = MarkArea(
                .animation(false)
            )
            let zlevelValue: Float = 8.72
            let zValue: Float = 0.12
            let silentValue = false
            let hoverAnimationValue = true
            let animationValue = false
            let animationThresholdValue: Float = 8.523
            let animationDurationValue = Time.number(2.0)
            let animationEasingValue = EasingFunction.circularInOut
            let animationDelayValue = Time.number(1.23456)
            let animationDurationUpdateValue = Time.number(9.8765)
            let animationEasingUpdateValue = EasingFunction.quarticOut
            let animationDelayUpdateValue = Time.number(0.00)
            
            let typeValue = SerieType.effectScatter
            let effectTypeString = "effectType"
            
            let effectScatterSerie = EffectScatterSerie()
            effectScatterSerie.name = nameValue
            effectScatterSerie.legendHoverLink = legendHoverLinkValue
            effectScatterSerie.showEffectOn = showEffectOnValue
            effectScatterSerie.rippleEffect = rippleEffectValue
            effectScatterSerie.coordinateSystem = coordinateSystemValue
            effectScatterSerie.xAxisIndex = xAxisIndexValue
            effectScatterSerie.yAxisIndex = yAxisIndexValue
            effectScatterSerie.polarIndex = polarIndexValue
            effectScatterSerie.geoIndex = geoIndexValue
            effectScatterSerie.symbol = symbolValue
            effectScatterSerie.symbolSize = symbolSizeValue
            effectScatterSerie.symbolRotate = symbolRotateValue
            effectScatterSerie.symbolOffset = symbolOffsetValue
            effectScatterSerie.label = labelValue
            effectScatterSerie.itemStyle = itemStyleValue
            effectScatterSerie.data = dataValue
            effectScatterSerie.markPoint = markPointValue
            effectScatterSerie.markLine = markLineValue
            effectScatterSerie.markArea = markAreaValue
            effectScatterSerie.zlevel = zlevelValue
            effectScatterSerie.z = zValue
            effectScatterSerie.silent = silentValue
            effectScatterSerie.hoverAnimation = hoverAnimationValue
            effectScatterSerie.animation = animationValue
            effectScatterSerie.animationThreshold = animationThresholdValue
            effectScatterSerie.animationDuration = animationDurationValue
            effectScatterSerie.animationEasing = animationEasingValue
            effectScatterSerie.animationDelay = animationDelayValue
            effectScatterSerie.animationDurationUpdate = animationDurationUpdateValue
            effectScatterSerie.animationEasingUpdate = animationEasingUpdateValue
            effectScatterSerie.animationDelayUpdate = animationDelayUpdateValue
            
            it("needs to check the type and effectType value") {
                expect(effectScatterSerie.type.jsonString).to(equal(typeValue.jsonString))
                expect(effectScatterSerie.effectType.jsonString).to(equal(effectTypeString.jsonString))
            }
            
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "type": effectScatterSerie.type,
                    "name": nameValue,
                    "legendHoverLink": legendHoverLinkValue,
                    "effectType": effectScatterSerie.effectType,
                    "showEffectOn": showEffectOnValue,
                    "rippleEffect": rippleEffectValue,
                    "coordinateSystem": coordinateSystemValue,
                    "xAxisIndex": xAxisIndexValue,
                    "yAxisIndex": yAxisIndexValue,
                    "polarIndex": polarIndexValue,
                    "geoIndex": geoIndexValue,
                    "symbol": symbolValue,
                    "symbolSize": symbolSizeValue,
                    "symbolRotate": symbolRotateValue,
                    "symbolOffset": symbolOffsetValue,
                    "label": labelValue,
                    "itemStyle": itemStyleValue,
                    "data": dataValue,
                    "markPoint": markPointValue,
                    "markLine": markLineValue,
                    "markArea": markAreaValue,
                    "zlevel": zlevelValue,
                    "z": zValue,
                    "silent": silentValue,
                    "hoverAnimation": hoverAnimationValue,
                    "animation": animationValue,
                    "animationThreshold": animationThresholdValue,
                    "animationDuration": animationDurationValue,
                    "animationEasing": animationEasingValue,
                    "animationDelay": animationDelayValue,
                    "animationDurationUpdate": animationDurationUpdateValue,
                    "animationEasingUpdate": animationEasingUpdateValue,
                    "animationDelayUpdate": animationDelayUpdateValue
                ]
                
                expect(effectScatterSerie.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let effectScatterSerieByEnums = EffectScatterSerie(
                    .name(nameValue),
                    .legendHoverLink(legendHoverLinkValue),
                    .showEffectOn(showEffectOnValue),
                    .rippleEffect(rippleEffectValue),
                    .coordinateSystem(coordinateSystemValue),
                    .xAxisIndex(xAxisIndexValue),
                    .yAxisIndex(yAxisIndexValue),
                    .polarIndex(polarIndexValue),
                    .geoIndex(geoIndexValue),
                    .symbol(symbolOriginValue),
                    .symbolSize(symbolSizeValue),
                    .symbolRotate(symbolRotateValue),
                    .symbolOffset(symbolOffsetValue),
                    .label(labelValue),
                    .itemStyle(itemStyleValue),
                    .data(dataValue),
                    .markPoint(markPointValue),
                    .markLine(markLineValue),
                    .markArea(markAreaValue),
                    .zlevel(zlevelValue),
                    .z(zValue),
                    .silent(silentValue),
                    .hoverAnimation(hoverAnimationValue),
                    .animation(animationValue),
                    .animationThreshold(animationThresholdValue),
                    .animationDuration(animationDurationValue),
                    .animationEasing(animationEasingValue),
                    .animationDelay(animationDelayValue),
                    .animationDurationUpdate(animationDurationUpdateValue),
                    .animationEasingUpdate(animationEasingUpdateValue),
                    .animationDelayUpdate(animationDelayUpdateValue)
                )
                
                expect(effectScatterSerieByEnums.jsonString).to(equal(effectScatterSerie.jsonString))
            }

        }
    }
}
