//
//  GeoSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 08/06/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class GeoSpec: QuickSpec {
    override func spec() {
        let minScaleLimitValue: Float = 2.552
        let maxScaleLimitValue: Float = 100.100
        
        let scaleLimit = Geo.ScaleLimit()
        scaleLimit.min = minScaleLimitValue
        scaleLimit.max = maxScaleLimitValue
        
        describe("For Geo.ScaleLimit") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "min": minScaleLimitValue,
                    "max": maxScaleLimitValue
                ]
                
                expect(scaleLimit.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let scaleLimitByEnums = Geo.ScaleLimit(
                    .min(minScaleLimitValue),
                    .max(maxScaleLimitValue)
                )
                
                expect(scaleLimitByEnums.jsonString).to(equal(scaleLimit.jsonString))
            }
        }
        
        let nameRegionValue = "regionNameValue"
        let selectedRegionValue = false
        let itemStyleRegionValue = ItemStyle(
            .normal(CommonItemStyleContent()),
            .emphasis(CommonItemStyleContent(
                .shadowBlur(10),
                .shadowOffsetX(0),
                .shadowOffsetY(0),
                .shadowColor(.rgba(0, 0, 0, 0.5))
                ))
        )
        let labelRegionValue = EmphasisLabel(
            .normal(LabelStyle(.show(true))),
            .emphasis(LabelStyle(.show(true)))
        )
        
        let region = Geo.Region()
        region.name = nameRegionValue
        region.selected = selectedRegionValue
        region.itemStyle = itemStyleRegionValue
        region.label = labelRegionValue
        
        describe("For Geo.Region") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "name": nameRegionValue,
                    "selected": selectedRegionValue,
                    "itemStyle": itemStyleRegionValue,
                    "label": labelRegionValue
                ]
                
                expect(region.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let regionByEnums = Geo.Region(
                    .name(nameRegionValue),
                    .selected(selectedRegionValue),
                    .itemStyle(itemStyleRegionValue),
                    .label(labelRegionValue)
                )
                
                expect(regionByEnums.jsonString).to(equal(region.jsonString))
            }
        }
        
        describe("For Geo") {
            let showValue = true
            let mapValue = "China"
            let roamValue = false
            let centerValue: Point = [1.28521, 4832.273]
            let aspectScaleValue: Float = 4.245
            let zoomValue: Float = 3.245
            let scaleLimitValue = scaleLimit
            let nameMapValue: String = "{'China': '中国'}"
            let selectedModeValue = SelectedMode.multiple
            let labelValue = EmphasisLabel(
                .normal(LabelStyle(
                    .show(true),
                    .position(.outside),
                    .fontSize(6),
                    .rich([:])
                    ))
            )
            let itemStyleValue = ItemStyle(
                .normal(CommonItemStyleContent(
                    .opacity(0.8),
                    .shadowBlur(10),
                    .shadowOffsetX(0),
                    .shadowOffsetY(0),
                    .shadowColor(.rgba(0, 0, 0, 0.5))
                    ))
            )
            let zlevelValue: Float = 5.22
            let zValue: Float = 2.1023
            let leftValue = Position.insideLeft
            let rightValue = Position.insideRight
            let bottomValue = Position.insideBottom
            let topValue = Position.insideTop
            let layoutCenterValue = "bottom"
            let layoutSizeValue = "['30%', '30%']"
            let regionsValue: [Geo.Region] = [region]
            let silentValue = true
            
            let geo = Geo()
            geo.show = showValue
            geo.map = mapValue
            geo.roam = roamValue
            geo.center = centerValue
            geo.aspectScale = aspectScaleValue
            geo.zoom = zoomValue
            geo.scaleLimit = scaleLimitValue
            geo.nameMap = nameMapValue
            geo.selectedMode = selectedModeValue
            geo.label = labelValue
            geo.itemStyle = itemStyleValue
            geo.zlevel = zlevelValue
            geo.z = zValue
            geo.left = leftValue
            geo.top = topValue
            geo.right = rightValue
            geo.bottom = bottomValue
            geo.layoutCenter = layoutCenterValue
            geo.layoutSize = layoutSizeValue
            geo.regions = regionsValue
            geo.silent = silentValue
            
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "show": showValue,
                    "map": mapValue,
                    "roam": roamValue,
                    "center": centerValue,
                    "aspectScale": aspectScaleValue,
                    "zoom": zoomValue,
                    "scaleLimit": scaleLimitValue,
                    "nameMap": nameMapValue,
                    "selectedMode": selectedModeValue,
                    "label": labelValue,
                    "itemStyle": itemStyleValue,
                    "zlevel": zlevelValue,
                    "z": zValue,
                    "left": leftValue,
                    "top": topValue,
                    "right": rightValue,
                    "bottom": bottomValue,
                    "layoutCenter": layoutCenterValue,
                    "layoutSize": layoutSizeValue,
                    "regions": regionsValue,
                    "silent": silentValue
                ]
                
                expect(geo.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let geoByEnums = Geo(
                    .show(showValue),
                    .map(mapValue),
                    .roam(roamValue),
                    .center(centerValue),
                    .aspectScale(aspectScaleValue),
                    .zoom(zoomValue),
                    .scaleLimit(scaleLimitValue),
                    .nameMap(nameMapValue),
                    .selectedMode(selectedModeValue),
                    .label(labelValue),
                    .itemStyle(itemStyleValue),
                    .zlevel(zlevelValue),
                    .z(zValue),
                    .left(leftValue),
                    .top(topValue),
                    .right(rightValue),
                    .bottom(bottomValue),
                    .layoutCenter(layoutCenterValue),
                    .layoutSize(layoutSizeValue),
                    .regions(regionsValue),
                    .silent(silentValue)
                )
                
                expect(geoByEnums.jsonString).to(equal(geo.jsonString))
            }
        }
        
        context("For the actions of GeoSerie") {
            describe("For GeoSelectAction") {
                let typeValue = EchartsActionType.geoSelect
                let seriesIndexOriginValue: Int = 20
                let seriesIndexValue = OneOrMore(one: seriesIndexOriginValue)
                let seriesNameOriginValue = "geoSelectActionSeriesName"
                let seriesNameValue = OneOrMore(one: seriesNameOriginValue)
                let dataIndexValue: Int = Int.max
                let nameValue = "geoSelectActionName"
                
                let geoSelectAction = GeoSelectAction()
                geoSelectAction.seriesName = seriesNameValue
                geoSelectAction.seriesIndex = seriesIndexValue
                geoSelectAction.dataIndex = dataIndexValue
                geoSelectAction.name = nameValue
                
                it("needs to check the type value") {
                    expect(geoSelectAction.type.jsonString).to(equal(typeValue.jsonString))
                }
                
                it("needs to check the jsonString") {
                    let resultDic: [String: Jsonable] = [
                        "type": typeValue,
                        "seriesName": seriesNameValue,
                        "seriesIndex": seriesIndexValue,
                        "dataIndex": dataIndexValue,
                        "name": nameValue
                    ]
                    expect(geoSelectAction.jsonString).to(equal(resultDic.jsonString))
                }
                
                it("needs to check the Enumable") {
                    let geoSelectActionByEnums = GeoSelectAction(
                        .seriesName(seriesNameOriginValue),
                        .seriesIndex(seriesIndexOriginValue),
                        .dataIndex(dataIndexValue),
                        .name(nameValue)
                    )
                    
                    expect(geoSelectActionByEnums.jsonString).to(equal(geoSelectAction.jsonString))
                }
                
                it("needs to check the seriesIndexes and seriesNames enum case") {
                    let seriesIndexOriginValues: [Int] = [Int.min, Int.max]
                    let seriesNameOriginValues: [String] = ["seriesName1", "seriesName2", "seriesName3"]
                    
                    geoSelectAction.seriesIndex = OneOrMore(more: seriesIndexOriginValues)
                    geoSelectAction.seriesName = OneOrMore(more: seriesNameOriginValues)
                    
                    let geoSelectActionByEnums = GeoSelectAction(
                        .seriesNames(seriesNameOriginValues),
                        .seriesIndexes(seriesIndexOriginValues),
                        .dataIndex(dataIndexValue),
                        .name(nameValue)
                    )
                    
                    expect(geoSelectActionByEnums.jsonString).to(equal(geoSelectAction.jsonString))
                }
            }
            
            describe("For GeoUnSelectAction") {
                let typeValue = EchartsActionType.geoUnSelect
                let seriesIndexOriginValue: Int = 874
                let seriesIndexValue = OneOrMore(one: seriesIndexOriginValue)
                let seriesNameOriginValue = "geoUnSelectActionSeriesName"
                let seriesNameValue = OneOrMore(one: seriesNameOriginValue)
                let dataIndexValue: Int = Int.min
                let nameValue = "geoUnSelectActionName"
                
                let geoUnSelectAction = GeoUnSelectAction()
                geoUnSelectAction.seriesName = seriesNameValue
                geoUnSelectAction.seriesIndex = seriesIndexValue
                geoUnSelectAction.dataIndex = dataIndexValue
                geoUnSelectAction.name = nameValue
                
                it("needs to check the type value") {
                    expect(geoUnSelectAction.type.jsonString).to(equal(typeValue.jsonString))
                }
                
                it("needs to check the jsonString") {
                    let resultDic: [String: Jsonable] = [
                        "type": typeValue,
                        "seriesName": seriesNameValue,
                        "seriesIndex": seriesIndexValue,
                        "dataIndex": dataIndexValue,
                        "name": nameValue
                    ]
                    expect(geoUnSelectAction.jsonString).to(equal(resultDic.jsonString))
                }
                
                it("needs to check the Enumable") {
                    let geoUnSelectActionByEnums = GeoUnSelectAction(
                        .seriesName(seriesNameOriginValue),
                        .seriesIndex(seriesIndexOriginValue),
                        .dataIndex(dataIndexValue),
                        .name(nameValue)
                    )
                    
                    expect(geoUnSelectActionByEnums.jsonString).to(equal(geoUnSelectAction.jsonString))
                }
                
                it("needs to check the seriesIndexes and seriesNames enum case") {
                    let seriesIndexOriginValues: [Int] = [Int.min, Int.max]
                    let seriesNameOriginValues: [String] = ["seriesName1", "seriesName2", "seriesName3"]
                    
                    geoUnSelectAction.seriesIndex = OneOrMore(more: seriesIndexOriginValues)
                    geoUnSelectAction.seriesName = OneOrMore(more: seriesNameOriginValues)
                    
                    let geoUnSelectActionByEnums = GeoUnSelectAction(
                        .seriesNames(seriesNameOriginValues),
                        .seriesIndexes(seriesIndexOriginValues),
                        .dataIndex(dataIndexValue),
                        .name(nameValue)
                    )
                    
                    expect(geoUnSelectActionByEnums.jsonString).to(equal(geoUnSelectAction.jsonString))
                }
            }
            
            describe("For GeoToggleSelectAction") {
                let typeValue = EchartsActionType.geoToggleSelect
                let seriesIndexOriginValue: Int = 2827
                let seriesIndexValue = OneOrMore(one: seriesIndexOriginValue)
                let seriesNameOriginValue = "geoToggleSelectActionSeriesName"
                let seriesNameValue = OneOrMore(one: seriesNameOriginValue)
                let dataIndexValue: Int = 23489
                let nameValue = "geoToggleSelectActionName"
                
                let geoToggleSelectAction = GeoToggleSelectAction()
                geoToggleSelectAction.seriesName = seriesNameValue
                geoToggleSelectAction.seriesIndex = seriesIndexValue
                geoToggleSelectAction.dataIndex = dataIndexValue
                geoToggleSelectAction.name = nameValue
                
                it("needs to check the type value") {
                    expect(geoToggleSelectAction.type.jsonString).to(equal(typeValue.jsonString))
                }
                
                it("needs to check the jsonString") {
                    let resultDic: [String: Jsonable] = [
                        "type": typeValue,
                        "seriesName": seriesNameValue,
                        "seriesIndex": seriesIndexValue,
                        "dataIndex": dataIndexValue,
                        "name": nameValue
                    ]
                    expect(geoToggleSelectAction.jsonString).to(equal(resultDic.jsonString))
                }
                
                it("needs to check the Enumable") {
                    let geoToggleSelectActionByEnums = GeoToggleSelectAction(
                        .seriesName(seriesNameOriginValue),
                        .seriesIndex(seriesIndexOriginValue),
                        .dataIndex(dataIndexValue),
                        .name(nameValue)
                    )
                    
                    expect(geoToggleSelectActionByEnums.jsonString).to(equal(geoToggleSelectAction.jsonString))
                }
                
                it("needs to check the seriesIndexes and seriesNames enum case") {
                    let seriesIndexOriginValues: [Int] = [Int.min, Int.max]
                    let seriesNameOriginValues: [String] = ["seriesName1", "seriesName2", "seriesName3"]
                    
                    geoToggleSelectAction.seriesIndex = OneOrMore(more: seriesIndexOriginValues)
                    geoToggleSelectAction.seriesName = OneOrMore(more: seriesNameOriginValues)
                    
                    let geoToggleSelectActionByEnums = GeoToggleSelectAction(
                        .seriesNames(seriesNameOriginValues),
                        .seriesIndexes(seriesIndexOriginValues),
                        .dataIndex(dataIndexValue),
                        .name(nameValue)
                    )
                    
                    expect(geoToggleSelectActionByEnums.jsonString).to(equal(geoToggleSelectAction.jsonString))
                }
            }
        }
    }
}
