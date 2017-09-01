//
//  MarkAreaSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 25/07/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class MarkAreaSpec: QuickSpec {
    override func spec() {
        describe("For MarkArea") {
            let silentValue = true
            let labelValue = EmphasisLabel(
                .emphasis(LabelStyle(
                    .show(false),
                    .position(Position.insideBottomLeft)
                    ))
            )
            let itemStyleValue = ItemStyle(
                .normal(CommonItemStyleContent(
                    .areaColor(rgba(28, 94, 174, 0.2873)),
                    .shadowOffsetX(283.8),
                    .borderWidth(2)
                    ))
            )
            let dataValue: [Jsonable] = [
                ["avg": "最大值"],
                "false",
                true,
                283.82
            ]
            let animationValue = false
            let animationThresholdValue: Float = 82.375
            let animationDurationValue: Time = 1000
            let animationEasingValue = EasingFunction.elasticIn
            let animationDelayValue: Time = 3832
            let animationDurationUpdateValue: Time = 28.372
            let animationEasingUpdateValue = EasingFunction.backIn
            let animationDelayUpdateValue = Time.init(floatLiteral: 28.482)
            
            let markArea = MarkArea()
            markArea.silent = silentValue
            markArea.label = labelValue
            markArea.itemStyle = itemStyleValue
            markArea.data = dataValue
            markArea.animation = animationValue
            markArea.animationThreshold = animationThresholdValue
            markArea.animationDuration = animationDurationValue
            markArea.animationEasing = animationEasingValue
            markArea.animationDelay = animationDelayValue
            markArea.animationDurationUpdate = animationDurationUpdateValue
            markArea.animationEasingUpdate = animationEasingUpdateValue
            markArea.animationDelayUpdate = animationDelayUpdateValue
            
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "silent": silentValue,
                    "label": labelValue,
                    "itemStyle": itemStyleValue,
                    "data": dataValue,
                    "animation": animationValue,
                    "animationThreshold": animationThresholdValue,
                    "animationDuration": animationDurationValue,
                    "animationEasing": animationEasingValue,
                    "animationDelay": animationDelayValue,
                    "animationDurationUpdate": animationDurationUpdateValue,
                    "animationEasingUpdate": animationEasingUpdateValue,
                    "animationDelayUpdate": animationDelayUpdateValue
                ]
                
                expect(markArea.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let markAreaByEnums = MarkArea(
                    .silent(silentValue),
                    .label(labelValue),
                    .itemStyle(itemStyleValue),
                    .data(dataValue),
                    .animation(animationValue),
                    .animationThreshold(animationThresholdValue),
                    .animationDuration(animationDurationValue),
                    .animationEasing(animationEasingValue),
                    .animationDelay(animationDelayValue),
                    .animationDurationUpdate(animationDurationUpdateValue),
                    .animationEasingUpdate(animationEasingUpdateValue),
                    .animationDelayUpdate(animationDelayUpdateValue)
                )
                
                expect(markAreaByEnums.jsonString).to(equal(markArea.jsonString))
            }
        }
    }
}
