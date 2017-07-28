//
//  ParallelSerieSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 28/07/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class ParallelSerieSpec: QuickSpec {
    override func spec() {
        describe("For ParallelSerie") {
            
            let coordinateSystemValue = CoordinateSystem.parallel
            let parallelIndexValue: UInt8 = 255
            let nameValue = "parallelSerieNameValue"
            let lineStyleValue = EmphasisLineStyle(
                .emphasis(LineStyle(
                    .shadowBlur(2.582),
                    .opacity(0.572),
                    .curveness(8)
                    ))
            )
            let inactiveOpacityValue: Float = 0.8572
            let activeOpacityValue: Float = 0.1734
            let realtimeValue = false
            let dataValue: [Jsonable] = [
                        [1,  55,  9,   56,  0.46,  18,  6,  "良"],
                        [2,  25,  11,  21,  0.65,  34,  9,  "优"],
                        [3,  56,  7,   63,  0.3,   14,  5,  "良"],
                        [4,  33,  7,   29,  0.33,  16,  6,  "优"],
                        [
                            "value": [5,  42,  24,  44,  0.76,  40,  16, "优"]
                        ]
            ]
            let zlevelValue: Float = 74.2375
            let zValue: Float = 75.2732
            let silentValue = true
            let animationValue = true
            let animationThresholdValue: Float = 3.2374
            let animationDurationValue: Time = Time.number(275.374)
            let animationEasingValue = EasingFunction.backOut
            let animationDelayValue: Time = 1000
            let animationDurationUpdateValue: Time = 9.9999
            let animationEasingUpdateValue: EasingFunction = .circularInOut
            let animationDelayUpdateValue: Time = 0
            
            let parallelSerie = ParallelSerie()
            parallelSerie.coordinateSystem = coordinateSystemValue
            parallelSerie.parallelIndex = parallelIndexValue
            parallelSerie.name = nameValue
            parallelSerie.lineStyle = lineStyleValue
            parallelSerie.inactiveOpacity = inactiveOpacityValue
            parallelSerie.activeOpacity = activeOpacityValue
            parallelSerie.realtime = realtimeValue
            parallelSerie.data = dataValue
            parallelSerie.zlevel = zlevelValue
            parallelSerie.z = zValue
            parallelSerie.silent = silentValue
            parallelSerie.animation = animationValue
            parallelSerie.animationThreshold = animationThresholdValue
            parallelSerie.animationDuration = animationDurationValue
            parallelSerie.animationEasing = animationEasingValue
            parallelSerie.animationDelay = animationDelayValue
            parallelSerie.animationDurationUpdate = animationDurationUpdateValue
            parallelSerie.animationEasingUpdate = animationEasingUpdateValue
            parallelSerie.animationDelayUpdate = animationDelayUpdateValue
            
            it("needs to check the type value") {
                expect(parallelSerie.type.jsonString).to(equal(SerieType.parallel.jsonString))
            }
            
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "type": SerieType.parallel,
                    "coordinateSystem": coordinateSystemValue,
                    "parallelIndex": parallelIndexValue,
                    "name": nameValue,
                    "lineStyle": lineStyleValue,
                    "inactiveOpacity": inactiveOpacityValue,
                    "activeOpacity": activeOpacityValue,
                    "realtime": realtimeValue,
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
                    "animationDelayUpdate": animationDelayUpdateValue
                ]
                
                expect(parallelSerie.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let parallelSerieByEnums = ParallelSerie(
                    .coordinateSystem(coordinateSystemValue),
                    .parallelIndex(parallelIndexValue),
                    .name(nameValue),
                    .lineStyle(lineStyleValue),
                    .inactiveOpacity(inactiveOpacityValue),
                    .activeOpacity(activeOpacityValue),
                    .realtime(realtimeValue),
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
                    .animationDelayUpdate(animationDelayUpdateValue)
                )
                
                expect(parallelSerieByEnums.jsonString).to(equal(parallelSerie.jsonString))
            }
        }
    }
}
