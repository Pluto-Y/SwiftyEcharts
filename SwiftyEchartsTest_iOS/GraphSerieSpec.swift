//
//  GraphSerieSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 26/10/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class GraphSerieSpec: QuickSpec {
    override func spec() {
        describe("For GraphSerie.Layout") {
            let noneString = "none"
            let circularString = "circular"
            let forceString = "force"
            
            let noneLayout = GraphSerie.Layout.none
            let circularLayout = GraphSerie.Layout.circular
            let forceLayout = GraphSerie.Layout.force
            
            it("needs to check the jsonString") {
                expect(noneLayout.jsonString).to(equal(noneString.jsonString))
                expect(circularLayout.jsonString).to(equal(circularString.jsonString))
                expect(forceLayout.jsonString).to(equal(forceString.jsonString))
            }
        }
        
        let rotateLabelCircularValue = false
        
        let circular = GraphSerie.Circular()
        circular.rotateLabel = rotateLabelCircularValue
        
        describe("For GraphSerie.Circular") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "rotateLabel": rotateLabelCircularValue
                ]
                
                expect(circular.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let circularByEnums = GraphSerie.Circular(
                    .rotateLabel(rotateLabelCircularValue)
                )
                
                expect(circularByEnums.jsonString).to(equal(circular.jsonString))
            }
        }
        
        let initLayoutForceValue = "forceInitLayoutValue"
        let repulsionForceValue: Float = 9238.2398329
        let gravityForceValue: Float = 9.82377842
        let edgeLengthsForceOriginValue: [Float] = [20.0, 10.0]
        let edgeLengthForceValue = OneOrMore(more: edgeLengthsForceOriginValue)
        let layoutAnimationForceValue = true
        
        let force = GraphSerie.Force()
        force.initLayout = initLayoutForceValue
        force.repulsion = repulsionForceValue
        force.gravity = gravityForceValue
        force.edgeLength = edgeLengthForceValue
        force.layoutAnimation = layoutAnimationForceValue
        
        describe("For GraphSerie.Force") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "initLayout": initLayoutForceValue,
                    "repulsion": repulsionForceValue,
                    "gravity": gravityForceValue,
                    "edgeLength": edgeLengthForceValue,
                    "layoutAnimation": layoutAnimationForceValue
                ]
                
                expect(force.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let forceByEnums = GraphSerie.Force(
                    .initLayout(initLayoutForceValue),
                    .repulsion(repulsionForceValue),
                    .gravity(gravityForceValue),
                    .edgeLengths(edgeLengthsForceOriginValue),
                    .layoutAnimation(layoutAnimationForceValue)
                )
                
                expect(forceByEnums.jsonString).to(equal(force.jsonString))
            }
            
            it("needs to check the edgeLengths enum case") {
                let edgeLengthForceOriginValue: Float = 92837.239874239847
                let edgeLengthForceValue = OneOrMore(one: edgeLengthForceOriginValue)
                
                force.edgeLength = edgeLengthForceValue
                
                let forceByEnums = GraphSerie.Force(
                    .initLayout(initLayoutForceValue),
                    .repulsion(repulsionForceValue),
                    .gravity(gravityForceValue),
                    .edgeLength(edgeLengthForceOriginValue),
                    .layoutAnimation(layoutAnimationForceValue)
                )
                
                expect(forceByEnums.jsonString).to(equal(force.jsonString))
            }
        }
        
        let nameCategoryValue = "categoryNameValue"
        let symbolOriginValue = Symbol.none
        let symbolCategoryValue = OneOrMore(one: symbolOriginValue)
        let symbolSizeCateogryValue: FunctionOrFloatOrPair = [10, 0]
        let symbolRotateCategoryValue: Float = 8272.23981
        let symbolOffsetCategoryValue: Point = [20, 0.1283798123]
        let itemStyleCategoryValue = ItemStyle(
            .normal(CommonItemStyleContent(
                .color(rgba(200, 100, 0, 0.0002837)),
                .shadowBlur(20),
                .opacity(0.28),
                .borderWidth(20.5)
            ))
        )
        let labelCategoryValue = EmphasisLabel(
            .emphasis(LabelStyle()),
            .normal(LabelStyle())
        )
        
        let category = GraphSerie.Category()
        category.name = nameCategoryValue
        category.symbol = symbolCategoryValue
        category.symbolSize = symbolSizeCateogryValue
        category.symbolRotate = symbolRotateCategoryValue
        category.symbolOffset = symbolOffsetCategoryValue
        category.itemStyle = itemStyleCategoryValue
        category.label = labelCategoryValue
        
        describe("For GraphSerie.Category") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "name": nameCategoryValue,
                    "symbol": symbolCategoryValue,
                    "symbolSize": symbolSizeCateogryValue,
                    "symbolRotate": symbolRotateCategoryValue,
                    "symbolOffset": symbolOffsetCategoryValue,
                    "itemStyle": itemStyleCategoryValue,
                    "label": labelCategoryValue
                ]
                
                expect(category.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let categoryByEnums = GraphSerie.Category(
                    .name(nameCategoryValue),
                    .symbol(symbolOriginValue),
                    .symbolSize(symbolSizeCateogryValue),
                    .symbolRotate(symbolRotateCategoryValue),
                    .symbolOffset(symbolOffsetCategoryValue),
                    .itemStyle(itemStyleCategoryValue),
                    .label(labelCategoryValue)
                )
                
                expect(categoryByEnums.jsonString).to(equal(category.jsonString))
            }
            
            it("needs to check the symbols enum case") {
                let symbolsOriginValue = [Symbol.rect, Symbol.circle]
                
                category.symbol = OneOrMore(more: symbolsOriginValue)
                
                let categoryByEnums = GraphSerie.Category(
                    .name(nameCategoryValue),
                    .symbols(symbolsOriginValue),
                    .symbolSize(symbolSizeCateogryValue),
                    .symbolRotate(symbolRotateCategoryValue),
                    .symbolOffset(symbolOffsetCategoryValue),
                    .itemStyle(itemStyleCategoryValue),
                    .label(labelCategoryValue)
                )
                
                expect(categoryByEnums.jsonString).to(equal(category.jsonString))
            }
        }
        
        let nameDataValue = "dataNameValue"
        let xDataValue: Float = 9238233.2384729
        let yDataValue: Float = 0.0900923048203482390840923
        let fixedDataValue = false
        let valueOriginValue: Float = 8
        let valueDataValue = OneOrMore(one: valueOriginValue)
        let categoryDataValue: Float = 0
        let symbolDataOriginValue = Symbol.emptyCircle
        let symbolDataValue = OneOrMore(one: symbolDataOriginValue)
        let symbolSizeDataValue: FunctionOrFloatOrPair = 84.0238
        let symbolRotateDataValue: Float = 0.000000238823
        let symbolOffsetDataValue: SwiftyEcharts.Range = [20.0000, 0.00001299]
        let itemStyleDataValue = ItemStyle(
            .normal(CommonItemStyleContent()),
            .emphasis(CommonItemStyleContent())
        )
        let labelDataValue = EmphasisLabel(
            .normal(LabelStyle(
                .show(false),
                .position(.center),
                .rotate(20),
                .interval(20)
                ))
        )
        let tooltipDataValue = Tooltip(
            .showContent(false),
            .alwaysShowContent(false),
            .triggerOn(.click),
            .extraCssText("box-shadow: 0 0 3px rgba(0, 0, 0, 0.3)")
        )
        
        let data = GraphSerie.Data()
        data.name = nameDataValue
        data.x = xDataValue
        data.y = yDataValue
        data.fixed = fixedDataValue
        data.value = valueDataValue
        data.category = categoryDataValue
        data.symbol = symbolDataValue
        data.symbolSize = symbolSizeDataValue
        data.symbolRotate = symbolRotateDataValue
        data.symbolOffset = symbolOffsetDataValue
        data.itemStyle = itemStyleDataValue
        data.label = labelDataValue
        data.tooltip = tooltipDataValue
        
        describe("For GraphSerie.Data") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "name": nameDataValue,
                    "x": xDataValue,
                    "y": yDataValue,
                    "fixed": fixedDataValue,
                    "value": valueDataValue,
                    "category": categoryDataValue,
                    "symbol": symbolDataValue,
                    "symbolSize": symbolSizeDataValue,
                    "symbolRotate": symbolRotateDataValue,
                    "symbolOffset": symbolOffsetDataValue,
                    "itemStyle": itemStyleDataValue,
                    "label": labelDataValue,
                    "tooltip": tooltipDataValue
                ]
                
                expect(data.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let dataByEnums = GraphSerie.Data(
                    .name(nameDataValue),
                    .x(xDataValue),
                    .y(yDataValue),
                    .fixed(fixedDataValue),
                    .value(valueOriginValue),
                    .category(categoryDataValue),
                    .symbol(symbolDataOriginValue),
                    .symbolSize(symbolSizeDataValue),
                    .symbolRotate(symbolRotateDataValue),
                    .symbolOffset(symbolOffsetDataValue),
                    .itemStyle(itemStyleDataValue),
                    .label(labelDataValue),
                    .tooltip(tooltipDataValue)
                )
                
                expect(dataByEnums.jsonString).to(equal(data.jsonString))
            }
            
            it("needs to check the values, symbols enum cases") {
                let symbolsDataOriginValue = [Symbol.arrow, Symbol.circle, Symbol.diamond]
                let valuesDataOriginValue: [Float] = [20.0128,  2932.19281, 7912.129812]
                
                data.symbol = OneOrMore(more: symbolsDataOriginValue)
                data.value = OneOrMore(more: valuesDataOriginValue)
                
                let dataByEnums = GraphSerie.Data(
                    .name(nameDataValue),
                    .x(xDataValue),
                    .y(yDataValue),
                    .fixed(fixedDataValue),
                    .values(valuesDataOriginValue),
                    .category(categoryDataValue),
                    .symbols(symbolsDataOriginValue),
                    .symbolSize(symbolSizeDataValue),
                    .symbolRotate(symbolRotateDataValue),
                    .symbolOffset(symbolOffsetDataValue),
                    .itemStyle(itemStyleDataValue),
                    .label(labelDataValue),
                    .tooltip(tooltipDataValue)
                )
                
                expect(dataByEnums.jsonString).to(equal(data.jsonString))
            }
        }
        
        let sourceLinkValue = "linkSourceValue"
        let targetLinkValue = "linkTargetValue"
        let valueLinkValue: Float = 02.209237
        let lineStyleLinkValue = EmphasisLineStyle()
        let labelLinkValue = EmphasisLabel()
        let symbolLinkOriginValue = Symbol.rect
        let symbolLinkValue = OneOrMore(one: symbolLinkOriginValue)
        let symbolSizeLinkValue: FunctionOrFloatOrPair = [20, 918291.129819]
        
        let link = GraphSerie.Link()
        link.source = sourceLinkValue
        link.target = targetLinkValue
        link.value = valueLinkValue
        link.lineStyle = lineStyleLinkValue
        link.label = labelLinkValue
        link.symbol = symbolLinkValue
        link.symbolSize = symbolSizeLinkValue
        
        describe("For GraphSerie.Link") {
            it("needs to check the jsonString") {
                let resultDic: [String: Jsonable] = [
                    "source": sourceLinkValue,
                    "target": targetLinkValue,
                    "value": valueLinkValue,
                    "lineStyle": lineStyleLinkValue,
                    "label": labelLinkValue,
                    "symbol": symbolLinkValue,
                    "symbolSize": symbolSizeLinkValue
                ]
                
                expect(link.jsonString).to(equal(resultDic.jsonString))
            }
            
            it("needs to check the Enumable") {
                let linkByEnums = GraphSerie.Link(
                    .source(sourceLinkValue),
                    .target(targetLinkValue),
                    .value(valueLinkValue),
                    .lineStyle(lineStyleLinkValue),
                    .label(labelLinkValue),
                    .symbol(symbolLinkOriginValue),
                    .symbolSize(symbolSizeLinkValue)
                )
                
                expect(linkByEnums.jsonString).to(equal(link.jsonString))
            }
            
            it("needs to check the symbols enum case") {
                let symbolsLinkOriginValue = [Symbol.rect, Symbol.triangle, Symbol.diamond]
                
                link.symbol = OneOrMore(more: symbolsLinkOriginValue)
                
                let linkByEnums = GraphSerie.Link(
                    .source(sourceLinkValue),
                    .target(targetLinkValue),
                    .value(valueLinkValue),
                    .lineStyle(lineStyleLinkValue),
                    .label(labelLinkValue),
                    .symbols(symbolsLinkOriginValue),
                    .symbolSize(symbolSizeLinkValue)
                )
                
                expect(linkByEnums.jsonString).to(equal(link.jsonString))
            }
        }
    }
}
