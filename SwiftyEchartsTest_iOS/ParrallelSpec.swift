//
//  ParrallelSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 28/07/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class ParrallelSpec: QuickSpec {
    override func spec() {
        describe("For Parrallel") {
            let zlevelValue: Float = 28.45734
            let zValue: Float = 573.45
            let leftValue = Position.auto
            let topValue = Position.right
            let rightValue = Position.start
            let bottomValue = Position.end
            let widthValue: Float = 473.27
            let heightValue: Float = 284.574
            let layoutValue = Orient.vertical
            let axisExpandableValue = true
            let axisExpandCenterValue: Float = 294.37
            let axisExpandCountValue: Float = 4
            let axisExpandWidthValue: Float = 75.2
            
            let dimValue: Float = 1
            let parallelIndexValue: UInt8 = 4
            let realtimeValue = true
            let typeValue = AxisType.log
            let nameValue = "parallelAxisNameValue"
            let nameTextStyleValue = TextStyle(
                .color(Color.red),
                .fontStyle(.normal),
                .fontWeight(.bolder),
                .fontFamily("parallelAxis")
            )
            let nameLocationValue = Location.middle
            let nameGapValue: Float = 20.5
            let nameRotateValue: Float = 85
            let inverseValue = false
            let boundaryGapValue: BoundaryGap = [40%, 40%]
            let minValue: Float = -3
            let maxValue: Float = 285.2
            let scaleValue = true
            let splitNumberValue: UInt8 = 6
            let minIntervalValue: UInt8 = 1
            let intervalValue = 38
            let logBaseValue: Float = 674.2
            let silentValue = true
            let triggerEventValue = false
            let axisLineValue = AxisLine(
                .show(false),
                .onZero(true),
                .lineStyle(LineStyle(
                    .type(LineType.dotted)
                    ))
            )
            let axisTickValue = AxisTick(
                .show(false),
                .alignWithLabel(false),
                .inside(true)
            )
            let axisLabelValue = AxisLabel(
                .rotate(28.5),
                .margin(299),
                .interval(8),
                .inside(true)
            )
            let dataValue: [Jsonable] = [
                [
                    "value": "周一",
                    "textStyle": [
                        "fontSize": 20,
                        "color": "red"
                    ]
                ], "周二", "周三", "周四", "周五", "周六", "周日"
            ]
            
            let parallelAxis = ParallelAxis()
            parallelAxis.dim = dimValue
            parallelAxis.parallelIndex = parallelIndexValue
            parallelAxis.realtime = realtimeValue
            parallelAxis.type = typeValue
            parallelAxis.name = nameValue
            parallelAxis.nameTextStyle = nameTextStyleValue
            parallelAxis.nameLocation = nameLocationValue
            parallelAxis.nameGap = nameGapValue
            parallelAxis.nameRotate = nameRotateValue
            parallelAxis.inverse = inverseValue
            parallelAxis.boundaryGap = boundaryGapValue
            parallelAxis.min = minValue
            parallelAxis.max = maxValue
            parallelAxis.scale = scaleValue
            parallelAxis.splitNumber = splitNumberValue
            parallelAxis.minInterval = minIntervalValue
            parallelAxis.interval = intervalValue
            parallelAxis.logBase = logBaseValue
            parallelAxis.silent = silentValue
            parallelAxis.triggerEvent = triggerEventValue
            parallelAxis.axisLine = axisLineValue
            parallelAxis.axisTick = axisTickValue
            parallelAxis.axisLabel = axisLabelValue
            parallelAxis.data = dataValue
            
            
            let parallelAxisDefaultValue = parallelAxis
            
            let parallel = Parallel()
            parallel.zlevel = zlevelValue
            parallel.z = zValue
            parallel.left = leftValue
            parallel.top = topValue
            parallel.right = rightValue
            parallel.bottom = bottomValue
            parallel.width = widthValue
            parallel.height = heightValue
            parallel.layout = layoutValue
            parallel.axisExpandable = axisExpandableValue
            parallel.axisExpandCenter = axisExpandCenterValue
            parallel.axisExpandCount = axisExpandCountValue
            parallel.axisExpandWidth = axisExpandWidthValue
            parallel.parallelAxisDefault = parallelAxisDefaultValue
            
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "zlevel": zlevelValue,
                    "z": zValue,
                    "left": leftValue,
                    "top": topValue,
                    "right": rightValue,
                    "bottom": bottomValue,
                    "width": widthValue,
                    "height": heightValue,
                    "layout": layoutValue,
                    "axisExpandable": axisExpandableValue,
                    "axisExpandCenter": axisExpandCenterValue,
                    "axisExpandCount": axisExpandCountValue,
                    "axisExpandWidth": axisExpandWidthValue,
                    "parallelAxisDefault": parallelAxisDefaultValue
                ]
                
                expect(parallel.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let parallelByEnums = Parallel(
                    .zlevel(zlevelValue),
                    .z(zValue),
                    .left(leftValue),
                    .top(topValue),
                    .right(rightValue),
                    .bottom(bottomValue),
                    .width(widthValue),
                    .height(heightValue),
                    .layout(layoutValue),
                    .axisExpandable(axisExpandableValue),
                    .axisExpandCenter(axisExpandCenterValue),
                    .axisExpandCount(axisExpandCountValue),
                    .axisExpandWidth(axisExpandWidthValue),
                    .parallelAxisDefault(parallelAxisDefaultValue)
                )
                
                expect(parallelByEnums.jsonString).to(equal(parallel.jsonString))
            }
        }
    }
}
