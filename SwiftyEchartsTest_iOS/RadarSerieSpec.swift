//
//  RadarSerieSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 03/08/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class RadarSerieSpec: QuickSpec {
    override func spec() {
        let nameDataValue = "dataNameValue"
        let valueDataValue: Jsonable = 74.7263
        let symbolDataOrignValue = Symbol.emptyCircle
        let symbolDataValue = OneOrMore(one: symbolDataOrignValue)
        let symbolSizeDataValue: FunctionOrFloatOrPair = [20, 30]
        let symbolRotateDataValue: Float = 75.364
        let symbolOffsetDataValue: Point = [10%, 50%]
        let labelDataValue = EmphasisLabel(
            .emphasis(LabelStyle(
                .show(false),
                .position(Position.point([20, 100])),
                .interval(2),
                .rotate(75)
                )),
            .normal(LabelStyle(
                .show(true)
                ))
        )
        let itemStyleDataValue = ItemStyle(
            .normal(CommonItemStyleContent(
                .color(Color.array([Color.auto, Color.transparent])),
                .borderWidth(7564.746),
                .shadowOffsetY(1.0)
                ))
        )
        let lineStyleDataValue = EmphasisLineStyle(
            .emphasis(LineStyle(
                .type(LineType.dashed),
                .opacity(0.48573),
                .curveness(1.2847)
                ))
        )
        let areaStyleDataValue = EmphasisAreaStyle(
            .normal(CommonAreaStyleContent(
                .opacity(0.57362),
                .color(Color.green),
                .shadowColor(Color.red)
                ))
        )
        let tooltipDataValue = Tooltip(
            .position(Position.point([50%, 50%])),
            .formatter(.string("tooltipDataFormatterValue")),
            .backgroundColor(rgba(50, 50, 50, 0.7)),
            .borderColor(.hexColor("#333")),
            .borderWidth(0),
            .padding(5),
            .extraCssText("transparent")
        )
        
        let data = RadarSerie.Data()
        data.name = nameDataValue
        data.value = valueDataValue
        data.symbol = symbolDataValue
        data.symbolSize = symbolSizeDataValue
        data.symbolRotate = symbolRotateDataValue
        data.symbolOffset = symbolOffsetDataValue
        data.label = labelDataValue
        data.itemStyle = itemStyleDataValue
        data.lineStyle = lineStyleDataValue
        data.areaStyle = areaStyleDataValue
        data.tooltip = tooltipDataValue
        
        describe("For RadarSerie.Data") { 
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "name": nameDataValue,
                    "value": valueDataValue,
                    "symbol": symbolDataValue,
                    "symbolSize": symbolSizeDataValue,
                    "symbolRotate": symbolRotateDataValue,
                    "symbolOffset": symbolOffsetDataValue,
                    "label": labelDataValue,
                    "itemStyle": itemStyleDataValue,
                    "lineStyle": lineStyleDataValue,
                    "areaStyle": areaStyleDataValue,
                    "tooltip": tooltipDataValue
                ]
                
                expect(data.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let dataByEnums = RadarSerie.Data(
                    .name(nameDataValue),
                    .value(valueDataValue),
                    .symbol(symbolDataOrignValue),
                    .symbolSize(symbolSizeDataValue),
                    .symbolRotate(symbolRotateDataValue),
                    .symbolOffset(symbolOffsetDataValue),
                    .label(labelDataValue),
                    .itemStyle(itemStyleDataValue),
                    .lineStyle(lineStyleDataValue),
                    .areaStyle(areaStyleDataValue),
                    .tooltip(tooltipDataValue)
                )
                
                expect(dataByEnums.jsonString).to(equal(data.jsonString))
            }
        }
        
        describe("For RadarSerie") {
            let typeValue = SerieType.radar
            let nameValue = "radarSerieNameValue"
            let radarIndexValue: UInt8 = 255
            let symbolOriginValue = Symbol.pin
            let symbolValue = OneOrMore(one: symbolOriginValue)
            let symbolSizeValue = FunctionOrFloatOrPair.init(floatLiteral: 0.00000)
            let symbolRotateValue: Float = 0.028111111
            let symbolOffsetValue: Point = [0, 100%]
            let labelValue = EmphasisLabel(
                .emphasis(LabelStyle(
                    .formatter(.string("radarSerieFromatterValue")),
                    .show(true)
                    ))
            )
            let itemStyleValue = ItemStyle(
                .emphasis(CommonItemStyleContent(
                    .shadowBlur(0.8375),
                    .barBorderRadius(2999),
                    .color(rgba(200, 200, 200, 0.5))
                    ))
            )
            let lineStyleValue = EmphasisLineStyle(
                .emphasis(LineStyle(
                    .curveness(9.999999),
                    .opacity(8.888888),
                    .width(7.7777777)
                    ))
            )
            let areaStyleValue = EmphasisAreaStyle(
                .emphasis(AreaStyle(
                    .shadowBlur(0.97457),
                    .shadowColor(Color.hexColor("#887722")),
                    .shadowOffsetX(0.3757),
                    .shadowOffsetY(84723.75)
                    ))
            )
            let dataValue: [Jsonable] = [
                data,
                RadarSerie.Data(
                    .value([4300, 10000, 28000, 35000, 50000, 19000]),
                    .name("预算分配（Allocated Budget）")
                ),
                RadarSerie.Data(
                    .value([5000, 14000, 28000, 31000, 42000, 21000]),
                    .name("实际开销（Actual Spending）")
                )
            ]
            let zlevelValue: Float = 0.57364
            let zValue: Float = 200.002
            let silentValue = true
            let animationValue = true
            let animationThresholdValue: Float = 85.322222
            let animationDurationValue: Time = Time.number(0.927562)
            let animationEasingValue = EasingFunction.circularInOut
            let animationDelayValue: Time = 9000
            let animationDurationUpdateValue: Time = 0.20847
            let animationEasingUpdateValue: EasingFunction = .exponentialInOut
            let animationDelayUpdateValue: Time = 0.0909090909
            let tooltipValue = Tooltip(
                .position(Position.point([20, 100])),
                .formatter(.string("radarTooltipFormatterValue")),
                .backgroundColor(rgba(255, 0, 128, 0.847)),
                .borderColor(.hexColor("#ffffff")),
                .borderWidth(10),
                .padding([20, 10]),
                .extraCssText("background-color: red")
            )
            
            let radarSerie = RadarSerie()
            radarSerie.name = nameValue
            radarSerie.radarIndex = radarIndexValue
            radarSerie.symbol = symbolValue
            radarSerie.symbolSize = symbolSizeValue
            radarSerie.symbolRotate = symbolRotateValue
            radarSerie.symbolOffset = symbolOffsetValue
            radarSerie.label = labelValue
            radarSerie.itemStyle = itemStyleValue
            radarSerie.lineStyle = lineStyleValue
            radarSerie.areaStyle = areaStyleValue
            radarSerie.data = dataValue
            radarSerie.zlevel = zlevelValue
            radarSerie.z = zValue
            radarSerie.silent = silentValue
            radarSerie.animation = animationValue
            radarSerie.animationThreshold = animationThresholdValue
            radarSerie.animationDuration = animationDurationValue
            radarSerie.animationEasing = animationEasingValue
            radarSerie.animationDelay = animationDelayValue
            radarSerie.animationDurationUpdate = animationDurationUpdateValue
            radarSerie.animationEasingUpdate = animationEasingUpdateValue
            radarSerie.animationDelayUpdate = animationDelayUpdateValue
            radarSerie.tooltip = tooltipValue
            
            it("needs to check the Enumable") {
                expect(radarSerie.type.jsonString).to(equal(typeValue.jsonString))
            }
            
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "type": radarSerie.type,
                    "name": nameValue,
                    "radarIndex": radarIndexValue,
                    "symbol": symbolValue,
                    "symbolSize": symbolSizeValue,
                    "symbolRotate": symbolRotateValue,
                    "symbolOffset": symbolOffsetValue,
                    "label": labelValue,
                    "itemStyle": itemStyleValue,
                    "lineStyle": lineStyleValue,
                    "areaStyle": areaStyleValue,
                    "data": dataValue,
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
                    "animationDelayUpdate": animationDelayUpdateValue,
                    "tooltip": tooltipValue
                ]
                
                expect(radarSerie.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let radarSerieByEnums = RadarSerie(
                    .name(nameValue),
                    .radarIndex(radarIndexValue),
                    .symbol(symbolOriginValue),
                    .symbolSize(symbolSizeValue),
                    .symbolRotate(symbolRotateValue),
                    .symbolOffset(symbolOffsetValue),
                    .label(labelValue),
                    .itemStyle(itemStyleValue),
                    .lineStyle(lineStyleValue),
                    .areaStyle(areaStyleValue),
                    .data(dataValue),
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
                    .animationDelayUpdate(animationDelayUpdateValue),
                    .tooltip(tooltipValue)
                )
                
                expect(radarSerieByEnums.jsonString).to(equal(radarSerie.jsonString))
            }
        }
    }
}
