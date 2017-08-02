//
//  RadarSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 02/08/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class RadarSpec: QuickSpec {
    override func spec() {
        let showNameValue = false
        let formatterNameValue: Formatter = .string("nameFormatterValue")
        let textStyleNameValue = TextStyle(
            .color(Color.transparent),
            .fontWeight(.lighter),
            .fontSize(20)
        )
        
        let name = Radar.Name()
        name.show = showNameValue
        name.formatter = formatterNameValue
        name.textStyle = textStyleNameValue
        
        describe("For Radar.Name") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "show": showNameValue,
                    "formatter": formatterNameValue,
                    "textStyle": textStyleNameValue
                ]
                
                expect(name.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let nameByEnums = Radar.Name(
                    .show(showNameValue),
                    .formatter(formatterNameValue),
                    .textStyle(textStyleNameValue)
                )
                
                expect(nameByEnums.jsonString).to(equal(name.jsonString))
            }
        }
        
        describe("For Radar.Shape") {
            let polygonString = "polygon"
            let circleString = "circle"
            
            let polygonShape = Radar.Shape.polygon
            let circleShape = Radar.Shape.circle
            
            it("needs to check the enum case jsonString") {
                expect(polygonShape.jsonString).to(equal(polygonString.jsonString))
                expect(circleShape.jsonString).to(equal(circleString.jsonString))
            }
        }
        
        let nameIndicatorValue = "销售（sales）"
        let maxIndicatorValue: Float = 6500
        let minIndicatorValue: Float = 1005
        
        let indicator = Radar.Indicator()
        indicator.name = nameIndicatorValue
        indicator.max = maxIndicatorValue
        indicator.min = minIndicatorValue
        
        describe("For Radar.Indicator") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "name": nameIndicatorValue,
                    "max": maxIndicatorValue,
                    "min": minIndicatorValue
                ]
                
                expect(indicator.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let indicatorByEnums = Radar.Indicator(
                    .name(nameIndicatorValue),
                    .max(maxIndicatorValue),
                    .min(minIndicatorValue)
                )
                
                expect(indicatorByEnums.jsonString).to(equal(indicator.jsonString))
            }
        }
        
        describe("For Radar") {
            let zlevelValue: Float = 95.7364
            let zValue: Float = 0.37462
            let centerValue: Point = [50%, 50%]
            let radiusValue = 20%
            let startAngleValue: Float = 135
            let nameValue = name
            let nameGapValue: Float = 8.5
            let splitNumberValue = 6
            let shapeValue = Radar.Shape.circle
            let scaleValue = false
            let silentValue = false
            let triggerEventValue = true
            let axisLineValue = AxisLine(
                .show(false),
                .onZero(true),
                .lineStyle(LineStyle(
                    .type(LineType.dotted)
                    ))
            )
            let axisTickValue = AxisTick(
                .alignWithLabel(true),
                .interval(50),
                .length(5.0)
            )
            let axisLabelValue = AxisLabel(
                .inside(true)
            )
            let splitLineValue = SplitLine(
                .show(true),
                .interval(20%)
            )
            let splitAreaValue = SplitArea(
                .areaStyle(AreaStyle(
                    .color(Color.red),
                    .opacity(0.03725)
                    ))
            )
            let indicatorValue: [Radar.Indicator] = [
                indicator,
                Radar.Indicator(
                    .name("管理（Administration）"),
                    .max(16000)
                ),
                Radar.Indicator(
                    .name("信息技术（Information Techology）"),
                    .max(30000)
                ),
                Radar.Indicator(
                    .name("客服（Customer Support）"),
                    .max(38000)
                ),
                Radar.Indicator(
                    .name("研发（Development）"),
                    .max(52000)
                ),
                Radar.Indicator(
                    .name("市场（Marketing）"),
                    .max(25000)
                )
            ]
            
            let radar = Radar()
            radar.zlevel = zlevelValue
            radar.z = zValue
            radar.center = centerValue
            radar.radius = radiusValue
            radar.startAngle = startAngleValue
            radar.name = nameValue
            radar.nameGap = nameGapValue
            radar.splitNumber = splitNumberValue
            radar.shape = shapeValue
            radar.scale = scaleValue
            radar.silent = silentValue
            radar.triggerEvent = triggerEventValue
            radar.axisLine = axisLineValue
            radar.axisTick = axisTickValue
            radar.axisLabel = axisLabelValue
            radar.splitLine = splitLineValue
            radar.splitArea = splitAreaValue
            radar.indicator = indicatorValue
            
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "zlevel": zlevelValue,
                    "z": zValue,
                    "center": centerValue,
                    "radius": radiusValue,
                    "startAngle": startAngleValue,
                    "name": nameValue,
                    "nameGap": nameGapValue,
                    "splitNumber": splitNumberValue,
                    "shape": shapeValue,
                    "scale": scaleValue,
                    "silent": silentValue,
                    "triggerEvent": triggerEventValue,
                    "axisLine": axisLineValue,
                    "axisTick": axisTickValue,
                    "axisLabel": axisLabelValue,
                    "splitLine": splitLineValue,
                    "splitArea": splitAreaValue,
                    "indicator": indicatorValue
                ]
                
                expect(radar.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let radarByEnums = Radar(
                    .zlevel(zlevelValue),
                    .z(zValue),
                    .center(centerValue),
                    .radius(radiusValue),
                    .startAngle(startAngleValue),
                    .name(nameValue),
                    .nameGap(nameGapValue),
                    .splitNumber(splitNumberValue),
                    .shape(shapeValue),
                    .scale(scaleValue),
                    .silent(silentValue),
                    .triggerEvent(triggerEventValue),
                    .axisLine(axisLineValue),
                    .axisTick(axisTickValue),
                    .axisLabel(axisLabelValue),
                    .splitLine(splitLineValue),
                    .splitArea(splitAreaValue),
                    .indicator(indicatorValue)
                )
                
                expect(radarByEnums.jsonString).to(equal(radar.jsonString))
            }
        }
    }
}
