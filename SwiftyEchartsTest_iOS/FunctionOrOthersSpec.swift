//
//  FunctionOrOthersSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 20/06/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class FunctionOrOthersSpec: QuickSpec {
    
    override func spec() {
        let errorJsonString = "null"
        let function: Function = "function (idx) {return idx * 0.65;}"
        let floatValue: Float = 3.1415
        let integerValue: Int = 10
        
        beforeEach {
            JsCache.removeAll()
        }
        
        describe("For FunctionOrFloat") {
            it(" needs to check the jsonString ") {
                let floatCase = FunctionOrFloat.value(floatValue)
                expect(floatCase.jsonString).to(equal(floatValue.jsonString))
                
                let functionCase = FunctionOrFloat.function(function)
                expect(functionCase.jsonString).to(equal(function.jsonString))
            }
            
            it(" needs to check the literal convertible ") {
                let floatLiteralCase: FunctionOrFloat = 3.1415
                let integerLieteralCase: FunctionOrFloat = 10
                
                expect(floatLiteralCase.jsonString).to(equal(floatValue.jsonString))
                expect(integerLieteralCase.jsonString).to(equal(Float(integerValue).jsonString))
            }
        }
        
        describe("For FunctionOrFloatOrPair") {
            let arrayLiteralValue: Point = [floatValue, 100%]
            
            it(" needs to check the jsonString ") {
                let floatCase = FunctionOrFloatOrPair.value(floatValue)
                expect(floatCase.jsonString).to(equal(floatValue.jsonString))
                
                let functionCase = FunctionOrFloatOrPair.function(function)
                expect(functionCase.jsonString).to(equal(function.jsonString))
                
                let pointCase = FunctionOrFloatOrPair.point(arrayLiteralValue)
                expect(pointCase.jsonString).to(equal(arrayLiteralValue.jsonString))
            }
            
            it(" need to check the literal convertible ") {
                let floatLiteralCase: FunctionOrFloatOrPair = 3.1415
                let integerLieteralCase: FunctionOrFloatOrPair = 10
                let errorArrayLiteralCase: FunctionOrFloatOrPair = [1]
                let arrayLiteralCase: FunctionOrFloatOrPair = [floatValue, 100%]
                
                expect(floatLiteralCase.jsonString).to(equal(floatValue.jsonString))
                expect(integerLieteralCase.jsonString).to(equal(Float(integerValue).jsonString))
                expect(arrayLiteralCase.jsonString).to(equal(arrayLiteralValue.jsonString))
                expect(errorArrayLiteralCase.jsonString).to(equal(errorJsonString))
            }
        }
    }

}
