//
//  Echarts.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 18/09/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
import JavaScriptCore
@testable import SwiftyEcharts

class EchartsSpec: QuickSpec {
    override func spec() {
        describe("For Echarts") {
            it("needs to check the framworkBundle") {
                expect(Echarts.frameworkBundle).toNot(beNil())
            }
            
            it("needs to check the loadEcharts") {
                let jsContext: JSContext! = JSContext()
                Echarts.loadEcharts(jsContext)
                let echartsValue = jsContext.evaluateScript("echarts")!
                let nullValue = jsContext.evaluateScript("echartsaaaaa")!
                expect(echartsValue.isUndefined).toNot(beTrue())
                expect(echartsValue.isObject).to(beTrue())
                expect(nullValue.isUndefined).to(beTrue())
            }
        }
        
        describe("For Echarts.DataTool") {
            it("needs to check the loadDataTool") {
                let jsContext: JSContext! = JSContext()
                Echarts.DataTool.loadDataTool(jsContext)
                let dataToolValue = jsContext.evaluateScript("echarts.dataTool")!
                let prepareBoxplotDataFuncValue = jsContext.evaluateScript("echarts.dataTool.prepareBoxplotData")!
                expect(dataToolValue.isUndefined).notTo(beTrue())
                expect(dataToolValue.isObject).to(beTrue())
                expect(prepareBoxplotDataFuncValue.isUndefined).notTo(beTrue())
            }
            
            it("needs to check the result of prepareBoxplotData") {
                let originDatas: [[Float]] = [
                    [850, 740, 900, 1070, 930, 850, 950, 980, 980, 880, 1000, 980, 930, 650, 760, 810, 1000, 1000, 960, 960],
                    [960, 940, 960, 940, 880, 800, 850, 880, 900, 840, 830, 790, 810, 880, 880, 830, 800, 790, 760, 800],
                    [880, 880, 880, 860, 720, 720, 620, 860, 970, 950, 880, 910, 850, 870, 840, 840, 850, 840, 840, 840],
                    [890, 810, 810, 820, 800, 770, 760, 740, 750, 760, 910, 920, 890, 860, 880, 720, 840, 850, 850, 780],
                    [890, 840, 780, 810, 760, 810, 790, 810, 820, 850, 870, 870, 810, 740, 810, 940, 950, 800, 810, 870]
                ]
                let result: [String: [Jsonable]] = [
                    "boxData": [[655.0, 850.0, 940.0, 980.0, 1175.0], [672.5, 800.0, 845.0, 885.0, 1012.5], [780.0, 840.0, 855.0, 880.0, 940.0], [621.25, 767.5, 815.0, 865.0, 1011.25], [713.75, 807.5, 810.0, 870.0, 963.75]],
                    "outliers": [[0.0, 650.0], [2.0, 620.0], [2.0, 720.0], [2.0, 720.0], [2.0, 950.0], [2.0, 970.0]],
                    "axisData": ["0", "1", "2", "3", "4"]
                ]
                
                expect(Echarts.DataTool.prepareBoxplotData(originDatas).jsonString).to(equal(result.jsonString))
                
                let emptyDatas: [[Float]] = []
                let emptyResult = [
                    "boxData": [],
                    "outliers": [],
                    "axisData": []
                ]
                
                expect(Echarts.DataTool.prepareBoxplotData(emptyDatas).jsonString).to(equal(emptyResult.jsonString))
                
                let data2: [[Float]] = [
                    [850, 740, 900, 1070, 930, 850, 950, 980, 980, 880, 1000, 980, 930, 650, 760, 810, 1000, 1000, 960, 960],
                    [960, 940, 960, 940, 880, 800, 850, 880, 900, 840, 830, 790, 810, 880, 880, 830, 800, 790, 760, 800],
                    [880, 880, 880, 860, 720, 720, 620, 860, 970, 950, 880, 910, 850, 870, 840, 840, 850, 840, 840, 840],
                    [890, 810, 810, 820, 800, 770, 760, 740, 750, 760, 910, 920, 890, 860, 880, 720, 840, 850, 850, 780],
                    [890, 840, 780, 810, 760, 810, 790, 810, 820, 850, 870, 870, 810, 740, 810, 940, 950, 800, 810, 870]
                ]
                let option: [String: String] = [
                    "layout": "vertical"
                ]
                
                let dataWithOptionResult: [String: [Jsonable]] = [
                    "boxData": [[655.0, 850.0, 940.0, 980.0, 1175.0], [672.5, 800.0, 845.0, 885.0, 1012.5], [780.0, 840.0, 855.0, 880.0, 940.0], [621.25, 767.5, 815.0, 865.0, 1011.25], [713.75, 807.5, 810.0, 870.0, 963.75]],
                    "outliers": [[650.0, 0.0], [620.0, 2.0], [720.0, 2.0], [720.0, 2.0], [950.0, 2.0], [970.0, 2.0]],
                    "axisData": ["0", "1", "2", "3", "4"]
                ]
                
                expect(Echarts.DataTool.prepareBoxplotData(data2, option).jsonString).to(equal(dataWithOptionResult.jsonString))
            }
        }
    }
}
