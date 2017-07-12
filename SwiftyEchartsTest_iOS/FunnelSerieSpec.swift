//
//  FunnelSerieSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 12/07/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class FunnelSerieSpec: QuickSpec {
    override func spec() {
        let ascendingSort = FunnelSerie.Sort.ascending
        let descendingSort = FunnelSerie.Sort.descending
        
        describe("For FunnelSerie.Sort") {
            let ascendingString = "ascending"
            let descendingString = "descending"
            it("needs to check the jsonString") {
                expect(ascendingSort.jsonString).to(equal(ascendingString.jsonString))
                expect(descendingSort.jsonString).to(equal(descendingString.jsonString))
            }
        }
        
        let labelLineShowValue = false
        let labelLineLengthValue: Float = 0.512
        let labelLineLineStyleValue = LineStyle(
            .opacity(0.62),
            .width(0.22)
        )
        
        let normalLabelLineContent = FunnelSerie.LabelLineContent()
        normalLabelLineContent.show = labelLineShowValue
        normalLabelLineContent.length = labelLineLengthValue
        normalLabelLineContent.lineStyle = labelLineLineStyleValue
        
        describe("For FunnelSerie.LabelLineContent") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "show": labelLineShowValue,
                    "length": labelLineLengthValue,
                    "lineStyle": labelLineLineStyleValue
                ]
                
                expect(normalLabelLineContent.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let labelLineContentByEnums = FunnelSerie.LabelLineContent(
                    .show(labelLineShowValue),
                    .length(labelLineLengthValue),
                    .lineStyle(labelLineLineStyleValue)
                )
                
                expect(labelLineContentByEnums.jsonString).to(equal(normalLabelLineContent.jsonString))
            }
        }
        
        let normalValue = normalLabelLineContent
        let emphasisValue = FunnelSerie.LabelLineContent(
            .show(true),
            .length(0.0),
            .lineStyle(LineStyle(
                .width(2.486),
                .type(LineType.dotted),
                .opacity(1.0)
                ))
        )
        
        let labelLine = FunnelSerie.LabelLine()
        labelLine.normal = normalValue
        labelLine.emphasis = emphasisValue
        
        describe("For FunnelSerie.LabelLine") {
            it("needs to check the jsonString") {
                let resutlDic: [String: Jsonable] = [
                    "normal": normalValue,
                    "emphasis": emphasisValue,
                ]
                
                expect(labelLine.jsonString).to(equal(resutlDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let labelLineByEnums = FunnelSerie.LabelLine(
                    .normal(normalValue),
                    .emphasis(emphasisValue)
                )
                
                expect(labelLineByEnums.jsonString).to(equal(labelLine.jsonString))
            }
        }
        
        let dataNameValue = "dataNameValue"
        let dataValueValue: Float = 2
        let dataLabelValue = Label(
            .normal(CommonLabelStyle(
                .show(true),
                .position(Position.point(Point([20, 30])))
                ))
        )
        let dataLabelLineValue = labelLine
        let dataItemStyleValue = ItemStyle(
            .emphasis(CommonItemStyleContent(
                ))
        )
        
        let funnelSerieData = FunnelSerie.Data()
        funnelSerieData.name = dataNameValue
        funnelSerieData.value = dataValueValue
        funnelSerieData.label = dataLabelValue
        funnelSerieData.labelLine = dataLabelLineValue
        funnelSerieData.itemStyle = dataItemStyleValue
        
        describe("For FunnelSerie.Data") { 
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "name": dataNameValue,
                    "value": dataValueValue,
                    "label": dataLabelValue,
                    "labelLine": dataLabelLineValue,
                    "itemStyle": dataItemStyleValue
                ]
                
                expect(funnelSerieData.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let funnelSerieDataByEnums = FunnelSerieData(
                    .name(dataNameValue),
                    .value(dataValueValue),
                    .label(dataLabelValue),
                    .labelLine(dataLabelLineValue),
                    .itemStyle(dataItemStyleValue)
                )
                
                expect(funnelSerieDataByEnums.jsonString).to(equal(funnelSerieData.jsonString))
            }
        }
        
    }
}
