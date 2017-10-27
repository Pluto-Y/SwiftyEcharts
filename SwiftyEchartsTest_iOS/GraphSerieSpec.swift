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
        let edgeLengthForceValue: SwiftyEcharts.Range = [20.0, 10.0]
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
                    .edgeLength(edgeLengthForceValue),
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
    }
}
