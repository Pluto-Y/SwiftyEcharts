//
//  AnimatableSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 22/03/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import UIKit
import Quick
import Nimble
@testable import SwiftyEcharts

class AnimatableSpec: QuickSpec {
    override func spec() {
        describe("For type enum Time") {
            
            it(" needs to check the jsonString for Time ") {
                let numberTime = Time.number(3.14)
                let functionTime = Time.function("function (idx) {return idx * 0.65;}")
                
                expect(numberTime.jsonString).to(equal("3.14"))
                JsCache.removeAll()
                expect(functionTime.jsonString).to(equal("\"\(TimeFuncPrefix)0\""))
                expect(JsCache.allJsStrings()[0]).to(equal("var \(TimeFuncPrefix)0 = function (idx) {return idx * 0.65;};"))
            }
            
            it(" needs to check the convertiable for Time ") {
                let floatTime: Time = 100.0
                let intTime: Time = 85
                let functionTime: Time = "function (idx) {return idx * 100;}"
                
                expect(floatTime.jsonString).to(equal(Time.number(100.0).jsonString))
                expect(intTime.jsonString).to(equal(Time.number(85).jsonString))
                JsCache.removeAll()
                expect(functionTime.jsonString).to(equal("\"\(TimeFuncPrefix)0\""))
                expect(JsCache.allJsStrings()[0]).to(equal("var \(TimeFuncPrefix)0 = function (idx) {return idx * 100;};"))
            }
        }
    }
}
