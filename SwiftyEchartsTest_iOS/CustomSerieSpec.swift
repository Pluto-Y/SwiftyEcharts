//
//  CustomSerieSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 17/09/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class CustomSerieSpec: QuickSpec {
    override func spec() {
        describe("For CustomSerie") {
            let customString = "custom"
            let nameValue = "customNameValue"
            let legendHoverLinkValue = false
            let coordinateSystemValue = CoordinateSystem.none
            let xAxisIndexValue = UInt.max
            let yAxisIndexValue = UInt.min
            let polarIndexValue: UInt = 75
            let geoIndexValue: UInt = 200
            let calendarIndexValue: UInt = 0
            let renderItemValue = "customSerieRenderItemValue"
            let itemStyleValue = ItemStyle(
                
            )
            let dimensionsValue: [Jsonable] = ["date", "open", "close", "highest", "lowest"]
            let encodeValue: [String: Jsonable] = [
                "x": "date",
                "y": ["open", "close", "highest", "lowest"]
            ]
            let dataValue: [Jsonable] = [
                [12, 44, 55, 66, 2],
                [23, 6, 16, 23, 1]
            ]
            let zlevelValue: Float = 8.3477
            let zValue: Float = 8888888.9999999
            let silentValue = false
            let animationValue = true
            let animationThresholdValue: Float = 84.2732
            let animationDurationValue: Time = 8
            let animationEasingValue = EasingFunction.circularOut
            let animationDelayValue = Time.number(8.237)
            let animationDurationUpdateValue = Time.number(73.7236)
            let animationEasingUpdateValue = EasingFunction.circularOut
            let animationDelayUpdateValue = Time.number(0.000000001)
            let tooltipValue = Tooltip(
            )
            
            let customSerie = CustomSerie()
            customSerie.name = nameValue
            customSerie.legendHoverLink = legendHoverLinkValue
            customSerie.coordinateSystem = coordinateSystemValue
            customSerie.xAxisIndex = xAxisIndexValue
            customSerie.yAxisIndex = yAxisIndexValue
            customSerie.polarIndex = polarIndexValue
            customSerie.geoIndex = geoIndexValue
            customSerie.calendarIndex = calendarIndexValue
            customSerie.renderItem = renderItemValue
            customSerie.itemStyle = itemStyleValue
            customSerie.dimensions = dimensionsValue
            customSerie.encode = encodeValue
            customSerie.data = dataValue
            customSerie.zlevel = zlevelValue
            customSerie.z = zValue
            customSerie.silent = silentValue
            customSerie.animation = animationValue
            customSerie.animationThreshold = animationThresholdValue
            customSerie.animationDuration = animationDurationValue
            customSerie.animationEasing = animationEasingValue
            customSerie.animationDelay = animationDelayValue
            customSerie.animationDurationUpdate = animationDurationUpdateValue
            customSerie.animationEasingUpdate = animationEasingUpdateValue
            customSerie.animationDelayUpdate = animationDelayUpdateValue
            customSerie.tooltip = tooltipValue
            
            it("needs to check the type value") {
                expect(customSerie.type.jsonString).to(equal(customString.jsonString))
            }
            
            it("needs to check the jsonString value") {
                let resultDic: [String: Jsonable] = [
                    "type": customString,
                    "name": nameValue,
                    "legendHoverLink": legendHoverLinkValue,
                    "coordinateSystem": coordinateSystemValue,
                    "xAxisIndex": xAxisIndexValue,
                    "yAxisIndex": yAxisIndexValue,
                    "polarIndex": polarIndexValue,
                    "geoIndex": geoIndexValue,
                    "calendarIndex": calendarIndexValue,
                    "renderItem": renderItemValue,
                    "itemStyle": itemStyleValue,
                    "dimensions": dimensionsValue,
                    "encode": encodeValue,
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
                
                expect(customSerie.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let customSerieByEnums = CustomSerie(
                    .name(nameValue),
                    .legendHoverLink(legendHoverLinkValue),
                    .coordinateSystem(coordinateSystemValue),
                    .xAxisIndex(xAxisIndexValue),
                    .yAxisIndex(yAxisIndexValue),
                    .polarIndex(polarIndexValue),
                    .geoIndex(geoIndexValue),
                    .calendarIndex(calendarIndexValue),
                    .renderItem(renderItemValue),
                    .itemStyle(itemStyleValue),
                    .dimensions(dimensionsValue),
                    .encode(encodeValue),
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
                
                expect(customSerieByEnums.jsonString).to(equal(customSerie.jsonString))
            }
        }
    }
}
