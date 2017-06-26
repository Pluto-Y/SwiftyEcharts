//
//  AxisLabelSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 26/06/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
import SwiftyEcharts

class AxisLabelSpec: QuickSpec {
    override func spec() {
        describe("For AxisLabel") {
            let showValue = false
            let intervalValue: UInt = 99
            let insideValue = true
            let rotateValue: Float = 89
            let marginValue: Float = 105
            let formatterValue = Formatter.function("function tooltipAxisPointer(params){ var tar; if(params[1].value != '-') { tar = params[1]; } else { tar = param[0]; } return tar.name + '<br/>' + tar.seriesName + ' : ' + tar.value}")
            let textStyleValue = TextStyle(
                .fontStyle(.oblique),
                .fontWeight(.bold),
                .fontFamily("PingFang"),
                .fontSize(48),
                .align(.center)
            )
            
            let axisLabel = AxisLabel()
            axisLabel.show = showValue
            axisLabel.interval = intervalValue
            axisLabel.inside = insideValue
            axisLabel.rotate = rotateValue
            axisLabel.margin = marginValue
            axisLabel.formatter = formatterValue
            axisLabel.textStyle = textStyleValue
            JsCache.removeAll()
            let axisLabelJsonString = axisLabel.jsonString
            
            beforeEach {
                // 避免重复添加内容到 JsCache 中
                JsCache.removeAll()
            }
            
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "show": showValue,
                    "interval": intervalValue,
                    "inside": insideValue,
                    "rotate": rotateValue,
                    "margin": marginValue,
                    "formatter": formatterValue,
                    "textStyle": textStyleValue
                ]
                
                expect(axisLabelJsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let axisLabelByEnums = AxisLabel(
                    .show(showValue),
                    .interval(intervalValue),
                    .inside(insideValue),
                    .rotate(rotateValue),
                    .margin(marginValue),
                    .formatter(formatterValue),
                    .textStyle(textStyleValue)
                )
                
                expect(axisLabelJsonString).to(equal(axisLabelByEnums.jsonString))
            }
        }
    }
}
