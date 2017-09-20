//
//  FunctionSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 19/09/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class FunctionSpec: QuickSpec {
    override func spec() {
        let errorJsonString = "null"
        let functionString = "function (idx) {return idx * 0.65;}"
        let functionPrefix = "_echartsFunc"
        
        describe("For Function") {
            beforeEach {
                JsCache.removeAll()
            }
            
            it("needs to check the prefix string") {
                expect(EchartsFunctionPrefix).to(equal(functionPrefix))
            }
            
            it("needs to check the jsonString") {
                let nullFunction = Function("null")
                
                expect(nullFunction.jsonString).to(equal(errorJsonString))
                expect(JsCache.allJsStrings().count).to(equal(0))

                let function = Function(functionString)
                
                expect(function.jsonString).to(equal("\(EchartsFunctionPrefix)0".jsonString))
                expect(function.jsonString).to(equal("\(EchartsFunctionPrefix)0".jsonString))
                expect(JsCache.allJsStrings().count).to(equal(1))
                expect(JsCache.allJsStrings().first).to(equal("var \(EchartsFunctionPrefix)0 = \(functionString);"))
            }
            
            it("needs to check the StringLiteralConvertible") {
                let function: Function = "function (idx) {return idx * 0.65;}"
                
                expect(function.jsonString).to(equal("\(EchartsFunctionPrefix)0".jsonString))
                expect(JsCache.allJsStrings().count).to(equal(1))
                expect(JsCache.allJsStrings().first).to(equal("var \(EchartsFunctionPrefix)0 = \(functionString);"))
            }
        }
    }
}
