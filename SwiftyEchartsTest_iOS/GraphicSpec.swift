//
//  GraphicSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 28/06/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class GraphicSpec: QuickSpec {
    override func spec() {
        describe("For GraphicAction") {
            it("needs to check the jsonString") {
                let mergeString = "merge"
                let replaceString = "replace"
                let removeString = "remove"
                
                let mergeGraphicAction = GraphicAction.merge
                let replaceGraphicAction = GraphicAction.replace
                let removeGraphicAction = GraphicAction.remove
                
                expect(mergeGraphicAction.jsonString).to(equal(mergeString.jsonString))
                expect(replaceGraphicAction.jsonString).to(equal(replaceString.jsonString))
                expect(removeGraphicAction.jsonString).to(equal(removeString.jsonString))
            }
        }
        
        describe("For GraphicBounding") {
            let allString = "all"
            let rawString = "raw"
            
            let allGraphicBounding = GraphicBounding.all
            let rawGraphicBounding = GraphicBounding.raw
            
            expect(allGraphicBounding.jsonString).to(equal(allString.jsonString))
            expect(rawGraphicBounding.jsonString).to(equal(rawString.jsonString))
        }
        
        context("For the actions of Graphic") {
            describe("For GraphFocusNodeAdjacencyAction") {
                let typeValue = EchartsActionType.focusNodeAdjacency
                
                let seriesIdValue = "xxx"
                let seriesIndexValue = 0
                let seriesNameValue = "nnn"
                let dataIndexValue = 12
                
                let graphFocusNodeAdjacencyAction = GraphFocusNodeAdjacencyAction()
                graphFocusNodeAdjacencyAction.seriesId = seriesIdValue
                graphFocusNodeAdjacencyAction.seriesIndex = seriesIndexValue
                graphFocusNodeAdjacencyAction.seriesName = seriesNameValue
                graphFocusNodeAdjacencyAction.dataIndex = dataIndexValue
                
                it("needs to check the type value") {
                    expect(graphFocusNodeAdjacencyAction.type.jsonString).to(equal(typeValue.jsonString))
                }
                
                it("needs to check the json string") {
                    let resultDic: [String: Jsonable] = [
                        "type": typeValue,
                        "seriesId": seriesIdValue,
                        "seriesIndex": seriesIndexValue,
                        "seriesName": seriesNameValue,
                        "dataIndex": dataIndexValue
                    ]
                    
                    expect(graphFocusNodeAdjacencyAction.jsonString).to(equal(resultDic.jsonString))
                }
                
                it("needs to check the Enumable"){
                    let graphFocusNodeAdjacencyActionByEnums = GraphFocusNodeAdjacencyAction(
                        .seriesId(seriesIdValue),
                        .seriesIndex(seriesIndexValue),
                        .seriesName(seriesNameValue),
                        .dataIndex(dataIndexValue)
                    )
                    
                    expect(graphFocusNodeAdjacencyActionByEnums.jsonString).to(equal(graphFocusNodeAdjacencyAction.jsonString))
                }
            }
            
            describe("For GraphUnfocusNodeAdjacencyAction") {
                let typeValue = EchartsActionType.unfocusNodeAdjacency
                
                let seriesIdValue = "xxxxxxxxxx"
                let seriesIndexValue = 128
                let seriesNameValue = "nnnnnnnnn"
                
                let graphUnfocusNodeAdjacencyAction = GraphUnfocusNodeAdjacencyAction()
                graphUnfocusNodeAdjacencyAction.seriesId = seriesIdValue
                graphUnfocusNodeAdjacencyAction.seriesIndex = seriesIndexValue
                graphUnfocusNodeAdjacencyAction.seriesName = seriesNameValue
                
                it("needs to check the type value") {
                    expect(graphUnfocusNodeAdjacencyAction.type.jsonString).to(equal(typeValue.jsonString))
                }
                
                it("needs to check the json string") {
                    let resultDic: [String: Jsonable] = [
                        "type": typeValue,
                        "seriesId": seriesIdValue,
                        "seriesIndex": seriesIndexValue,
                        "seriesName": seriesNameValue
                    ]
                    
                    expect(graphUnfocusNodeAdjacencyAction.jsonString).to(equal(resultDic.jsonString))
                }
                
                it("needs to check the Enumable"){
                    let graphUnfocusNodeAdjacencyActionByEnums = GraphUnfocusNodeAdjacencyAction(
                        .seriesId(seriesIdValue),
                        .seriesIndex(seriesIndexValue),
                        .seriesName(seriesNameValue)
                    )
                    
                    expect(graphUnfocusNodeAdjacencyActionByEnums.jsonString).to(equal(graphUnfocusNodeAdjacencyAction.jsonString))
                }
            }
        }
    }
}
