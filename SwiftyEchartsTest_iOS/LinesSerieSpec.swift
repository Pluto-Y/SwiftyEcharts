//
//  LinesSerieSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 21/07/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class LinesSerieSpec: QuickSpec {
    override func spec() {
        let showEffectValue = true
        let periodEffectValue: Float = 0.5
        let constantSpeedEffectValue: Float = 9.583
        let symbolOriginValue = Symbol.roundRect
        let symbolEffectValue = OneOrMore(one: symbolOriginValue)
        let symbolSizeEffectValue = FunctionOrFloatOrPair.point([20, 88])
        let colorEffectValue = Color.green
        let trailLengthEffectValue: Float = 8.383
        let loopEffectValue = false
        
        let effect = LinesSerie.Effect()
        effect.show = showEffectValue
        effect.period = periodEffectValue
        effect.constantSpeed = constantSpeedEffectValue
        effect.symbol = symbolEffectValue
        effect.symbolSize = symbolSizeEffectValue
        effect.color = colorEffectValue
        effect.trailLength = trailLengthEffectValue
        effect.loop = loopEffectValue
        
        describe("For LinesSerie.Effect") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "show": showEffectValue,
                    "period": periodEffectValue,
                    "constantSpeed": constantSpeedEffectValue,
                    "symbol": symbolEffectValue,
                    "symbolSize": symbolSizeEffectValue,
                    "color": colorEffectValue,
                    "trailLength": trailLengthEffectValue,
                    "loop": loopEffectValue
                ]
                
                expect(effect.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let effectByEnums = LinesSerie.Effect(
                    .show(showEffectValue),
                    .period(periodEffectValue),
                    .constantSpeed(constantSpeedEffectValue),
                    .symbol(symbolOriginValue),
                    .symbolSize(symbolSizeEffectValue),
                    .color(colorEffectValue),
                    .trailLength(trailLengthEffectValue),
                    .loop(loopEffectValue)
                )
                
                expect(effectByEnums.jsonString).to(equal(effect.jsonString))
            }
        }
        
        let nameDataValue = "linesSerieDataNameValue"
        let coordsDataValue: [Point] = [[120, 66], [122, 67]]
        let lineStyleDataValue = LineStyle(
            .color(Color.auto),
            .width(5.3912),
            .type(.dotted),
            .opacity(0.7261)
        )
        let labelDataValue = EmphasisLabel(
            .normal(LabelStyle(
                .show(false),
                .position(.center)
                )),
            .emphasis(LabelStyle(
                .show(true),
                .fontSize(30),
                .fontWeight(.bold)
                ))
        )
        
        let data = LinesSerie.Data()
        data.name = nameDataValue
        data.coords = coordsDataValue
        data.lineStyle = lineStyleDataValue
        data.label = labelDataValue
        
        describe("For LinesSerie.Data") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "name": nameDataValue,
                    "coords": coordsDataValue,
                    "lineStyle": lineStyleDataValue,
                    "label": labelDataValue
                ]
                
                expect(data.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let dataByEnums = LinesSerie.Data(
                    .name(nameDataValue),
                    .coords(coordsDataValue),
                    .lineStyle(lineStyleDataValue),
                    .label(labelDataValue)
                )
                
                expect(dataByEnums.jsonString).to(equal(data.jsonString))
            }
        }
        
        describe("For LinesSerie") {
            let nameValue = "linesSerieNameValue"
            let coordinateSystemValue = CoordinateSystem.polar
            let xAxisIndexValue: UInt8 = 200
            let yAxisIndexValue: UInt8 = 10
            let geoIndexValue: UInt8 = 80
            let polylineValue = true
            let effectValue = effect
            let largeValue = false
            let largeThresholdValue: Float = 28.4
            let symbolOriginValues: [Symbol] = [.none, .arrow]
            let symbolValue = OneOrMore(more: symbolOriginValues)
            let symbolSizeValue = FunctionOrFloatOrPair.value(29)
            let lineStyleValue = EmphasisLineStyle(
                .normal(LineStyle(
                    .color(.hexColor("#884922")),
                    .opacity(0.98372),
                    .shadowOffsetX(0.293)
                    ))
            )
            let labelValue = EmphasisLabel(
                .emphasis(LabelStyle(
                    .show(false),
                    .position(Position.point([0, 73%])),
                    .formatter(.string("{c$}"))
                    ))
            )
            let dataValue: [Jsonable] = [
                data,
                "周二", 3,
                false
            ]
            let markPointValue = MarkPoint(
                .animation(false),
                .animationEasing(EasingFunction.circularOut),
                .animationDelay(Time.number(238.33))
            )
            let markLineValue = MarkLine(
                .symbol(Symbol.pin),
                .precision(3.2),
                .animationDelayUpdate(Time.number(28.3))
            )
            let markAreaValue = MarkArea(
                .silent(true),
                .data(["周一", false, 283, 0.583])
            )
            let zlevelValue: Float = 2.93
            let zValue: Float = 10
            let silentValue = true
            let animationValue = true
            let animationThresholdValue: Float = 8.23
            let animationDurationValue = Time.number(0.0)
            let animationEasingValue = EasingFunction.quadraticIn
            let animationDelayValue: Time = 20.48
            let animationDurationUpdateValue: Time = 0
            let animationEasingUpdateValue: EasingFunction = .quadraticIn
            let animationDelayUpdateValue = Time.init(integerLiteral: Int.max)
            
            let linesSerie = LinesSerie()
            linesSerie.name = nameValue
            linesSerie.coordinateSystem = coordinateSystemValue
            linesSerie.xAxisIndex = xAxisIndexValue
            linesSerie.yAxisIndex = yAxisIndexValue
            linesSerie.geoIndex = geoIndexValue
            linesSerie.polyline = polylineValue
            linesSerie.effect = effectValue
            linesSerie.large = largeValue
            linesSerie.largeThreshold = largeThresholdValue
            linesSerie.symbol = symbolValue
            linesSerie.symbolSize = symbolSizeValue
            linesSerie.lineStyle = lineStyleValue
            linesSerie.label = labelValue
            linesSerie.data = dataValue
            linesSerie.markPoint = markPointValue
            linesSerie.markLine = markLineValue
            linesSerie.markArea = markAreaValue
            linesSerie.zlevel = zlevelValue
            linesSerie.z = zValue
            linesSerie.silent = silentValue
            linesSerie.animation = animationValue
            linesSerie.animationThreshold = animationThresholdValue
            linesSerie.animationDuration = animationDurationValue
            linesSerie.animationEasing = animationEasingValue
            linesSerie.animationDelay = animationDelayValue
            linesSerie.animationDurationUpdate = animationDurationUpdateValue
            linesSerie.animationEasingUpdate = animationEasingUpdateValue
            linesSerie.animationDelayUpdate = animationDelayUpdateValue
            
            it("needs to check the type value") {
                expect(linesSerie.type.jsonString).to(equal(SerieType.lines.jsonString))
            }
            
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "type": SerieType.lines,
                    "name": nameValue,
                    "coordinateSystem": coordinateSystemValue,
                    "xAxisIndex": xAxisIndexValue,
                    "yAxisIndex": yAxisIndexValue,
                    "geoIndex": geoIndexValue,
                    "polyline": polylineValue,
                    "effect": effectValue,
                    "large": largeValue,
                    "largeThreshold": largeThresholdValue,
                    "symbol": symbolValue,
                    "symbolSize": symbolSizeValue,
                    "lineStyle": lineStyleValue,
                    "label": labelValue,
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
                
                expect(linesSerie.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let linesSerieByEnums = LinesSerie(
                    .name(nameValue),
                    .coordinateSystem(coordinateSystemValue),
                    .xAxisIndex(xAxisIndexValue),
                    .yAxisIndex(yAxisIndexValue),
                    .geoIndex(geoIndexValue),
                    .polyline(polylineValue),
                    .effect(effectValue),
                    .large(largeValue),
                    .largeThreshold(largeThresholdValue),
                    .symbols(symbolOriginValues),
                    .symbolSize(symbolSizeValue),
                    .lineStyle(lineStyleValue),
                    .label(labelValue),
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
                
                expect(linesSerieByEnums.jsonString).to(equal(linesSerie.jsonString))
            }
            
            it("needs to check the symbol enum case") {
                let symbolOriginValue = Symbol.triangle
                linesSerie.symbol = OneOrMore(one: symbolOriginValue)
                
                let linesSerieByEnums = LinesSerie(
                    .name(nameValue),
                    .coordinateSystem(coordinateSystemValue),
                    .xAxisIndex(xAxisIndexValue),
                    .yAxisIndex(yAxisIndexValue),
                    .geoIndex(geoIndexValue),
                    .polyline(polylineValue),
                    .effect(effectValue),
                    .large(largeValue),
                    .largeThreshold(largeThresholdValue),
                    .symbol(symbolOriginValue),
                    .symbolSize(symbolSizeValue),
                    .lineStyle(lineStyleValue),
                    .label(labelValue),
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
                
                expect(linesSerieByEnums.jsonString).to(equal(linesSerieByEnums.jsonString))
            }
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }

}
