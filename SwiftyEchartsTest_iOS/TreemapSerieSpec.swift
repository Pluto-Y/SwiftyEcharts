//
//  TreemapSerieSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 20/08/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class TreemapSerieSpec: QuickSpec {
    override func spec() {
        describe("For TreemapSerie.NodeClick") {
            let disableString = "false"
            let zoomToNodeString = "zoomToNode"
            let linkString = "link"
            
            let disableNodeClick = TreemapSerie.NodeClick.disable
            let zoomToNodeNodeClick = TreemapSerie.NodeClick.zoomToNode
            let linkNodeClick = TreemapSerie.NodeClick.link
            
            it("needs to check the enum case jsonString") {
                expect(disableNodeClick.jsonString).to(equal(disableString.jsonString))
                expect(zoomToNodeNodeClick.jsonString).to(equal(zoomToNodeString.jsonString))
                expect(linkNodeClick.jsonString).to(equal(linkString.jsonString))
            }
        }
        
        describe("For TreemapSerie.ColorMappingBy") {
            let valueString = "value"
            let indexString = "index"
            let idString = "id"
            
            let valueColorMappingBy = TreemapSerie.ColorMappingBy.value
            let indexColorMappingBy = TreemapSerie.ColorMappingBy.index
            let idColorMappingBy = TreemapSerie.ColorMappingBy.id
            
            it("needs to check the enum case jsonString") {
                expect(valueColorMappingBy.jsonString).to(equal(valueString.jsonString))
                expect(indexColorMappingBy.jsonString).to(equal(indexString.jsonString))
                expect(idColorMappingBy.jsonString).to(equal(idString.jsonString))
            }
        }
        
        let visualDimensionLevelValue: Float = 85734.74
        let visualMinLevelValue: Float = 2.238
        let visualMaxLevelValue: Float = 999999
        let colorLevelValue: [Color] = [Color.auto, Color.red, Color.yellow, Color.blue, Color.red]
        let colorAlphaLevelValue: SwiftyEcharts.Range = [0.3, 1]
        let colorSaturationLevelValue: SwiftyEcharts.Range = [0.9, 0.999]
        let colorMappingByLevelValue = TreemapSerie.ColorMappingBy.id
        let visibleMinLevelValue: Float = 0.0
        let childrenVisibleMinLevelValue: Float = 1.04823
        let labelLevelValue = Label(
            .emphasis(CommonLabelStyle(
                .show(false),
                .position(Position.right)
                ))
        )
        let itemStyleLevelValue = ItemStyle(
            .normal(CommonItemStyleContent(
                .opacity(0.8237),
                .borderType(LineType.dashed)
                ))
        )
        
        let level = TreemapSerie.Level()
        level.visualDimension = visualDimensionLevelValue
        level.visualMin = visualMinLevelValue
        level.visualMax = visualMaxLevelValue
        level.color = colorLevelValue
        level.colorAlpha = colorAlphaLevelValue
        level.colorSaturation = colorSaturationLevelValue
        level.colorMappingBy = colorMappingByLevelValue
        level.visibleMin = visibleMinLevelValue
        level.childrenVisibleMin = childrenVisibleMinLevelValue
        level.label = labelLevelValue
        level.itemStyle = itemStyleLevelValue
        
        describe("For TreemapSerie.Level") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "visualDimension": visualDimensionLevelValue,
                    "visualMin": visualMinLevelValue,
                    "visualMax": visualMaxLevelValue,
                    "color": colorLevelValue,
                    "colorAlpha": colorAlphaLevelValue,
                    "colorSaturation": colorSaturationLevelValue,
                    "colorMappingBy": colorMappingByLevelValue,
                    "visibleMin": visibleMinLevelValue,
                    "childrenVisibleMin": childrenVisibleMinLevelValue,
                    "label": labelLevelValue,
                    "itemStyle": itemStyleLevelValue
                ]
                
                expect(level.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let levelByEnums = TreemapSerie.Level(
                    .visualDimension(visualDimensionLevelValue),
                    .visualMin(visualMinLevelValue),
                    .visualMax(visualMaxLevelValue),
                    .color(colorLevelValue),
                    .colorAlpha(colorAlphaLevelValue),
                    .colorSaturation(colorSaturationLevelValue),
                    .colorMappingBy(colorMappingByLevelValue),
                    .visibleMin(visibleMinLevelValue),
                    .childrenVisibleMin(childrenVisibleMinLevelValue),
                    .label(labelLevelValue),
                    .itemStyle(itemStyleLevelValue)
                )
                
                expect(levelByEnums.jsonString).to(equal(level.jsonString))
            }
        }
        
        let linkSilentValue = "silentLinkValue"
        let targetSilentValue = Target.blank
        let childrenSilent: [Jsonable] = [
            "silentChildrenValue", false, 8572.8, 8, Int.max, "null"
        ]
        
        let silent = TreemapSerie.Silent()
        silent.link = linkSilentValue
        silent.target = targetSilentValue
        silent.children = childrenSilent
        
        describe("For TreemapSerie.Silent") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "link": linkSilentValue,
                    "target": targetSilentValue,
                    "children": childrenSilent
                ]
                
                expect(silent.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the jsonString") {
                let silentByEnums = TreemapSerie.Silent(
                    .link(linkSilentValue),
                    .target(targetSilentValue),
                    .children(childrenSilent)
                )
                
                expect(silentByEnums.jsonString).to(equal(silent.jsonString))
            }
        }
    }
}
