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
            beforeEach {
                JsCache.removeAll()
            }
            
            it(" needs to check the jsonString for Time ") {
                let function: Function = "function (idx) {return idx * 0.65;}"
                let numberTime = Time.number(3.14)
                let functionTime = Time.function(function)
                
                expect(numberTime.jsonString).to(equal("3.14"))
                expect(functionTime.jsonString).to(equal(function.jsonString))
            }
            
            it(" needs to check the convertiable for Time ") {
                let function: Function = "function (idx) {return idx * 100;}"
                let floatTime: Time = 100.0
                let intTime: Time = 85
                let functionTime: Time = Time.function(function)
                
                expect(floatTime.jsonString).to(equal(Time.number(100.0).jsonString))
                expect(intTime.jsonString).to(equal(Time.number(85).jsonString))
                expect(functionTime.jsonString).to(equal(function.jsonString))
            }
        }
        
        describe("For type enum EasingFunction") {
            let linearString = "linear"
            let quadraticInString = "quadraticIn"
            let quadraticOutString = "quadraticOut"
            let quadraticInOutString = "quadraticInOut"
            let cubicInString = "cubicIn"
            let cubicOutString = "cubicOut"
            let cubicInOutString = "cubicInOut"
            let quarticInString = "quarticIn"
            let quarticOutString = "quarticOut"
            let quarticInOutString = "quarticInOut"
            let quinticInString = "quinticIn"
            let quinticOutString = "quinticOut"
            let quinticInOutString =  "quinticInOut"
            let sinusoidalInString = "sinusoidalIn"
            let sinusoidalOutString = "sinusoidalOut"
            let sinusoidalInOutString = "sinusoidalInOut"
            let exponentialInString = "exponentialIn"
            let exponentialOutString = "exponentialOut"
            let exponentialInOutString = "exponentialInOut"
            let circularInString = "circularIn"
            let circularOutString = "circularOut"
            let circularInOutString = "circularInOut"
            let elasticInString = "elasticIn"
            let elasticOutString = "elasticOut"
            let elasticInOutString = "elasticInOut"
            let backInString = "backIn"
            let backOutString = "backOut"
            let backInOutString = "backInOut"
            let bounceInString = "bounceIn"
            let bounceOutString = "bounceOut"
            let bounceInOutString = "bounceInOut"
            
            let linearEasingFunction = EasingFunction.linear
            let quadraticInEasingFunction = EasingFunction.quadraticIn
            let quadraticOutEasingFunction = EasingFunction.quadraticOut
            let quadraticInOutEasingFunction = EasingFunction.quadraticInOut
            let cubicInEasingFunction = EasingFunction.cubicIn
            let cubicOutEasingFunction = EasingFunction.cubicOut
            let cubicInOutEasingFunction = EasingFunction.cubicInOut
            let quarticInEasingFunction = EasingFunction.quarticIn
            let quarticOutEasingFunction = EasingFunction.quarticOut
            let quarticInOutEasingFunction = EasingFunction.quarticInOut
            let quinticInEasingFunction = EasingFunction.quinticIn
            let quinticOutEasingFunction = EasingFunction.quinticOut
            let quinticInOutEasingFunction =  EasingFunction.quinticInOut
            let sinusoidalInEasingFunction = EasingFunction.sinusoidalIn
            let sinusoidalOutEasingFunction = EasingFunction.sinusoidalOut
            let sinusoidalInOutEasingFunction = EasingFunction.sinusoidalInOut
            let exponentialInEasingFunction = EasingFunction.exponentialIn
            let exponentialOutEasingFunction = EasingFunction.exponentialOut
            let exponentialInOutEasingFunction = EasingFunction.exponentialInOut
            let circularInEasingFunction = EasingFunction.circularIn
            let circularOutEasingFunction = EasingFunction.circularOut
            let circularInOutEasingFunction = EasingFunction.circularInOut
            let elasticInEasingFunction = EasingFunction.elasticIn
            let elasticOutEasingFunction = EasingFunction.elasticOut
            let elasticInOutEasingFunction = EasingFunction.elasticInOut
            let backInEasingFunction = EasingFunction.backIn
            let backOutEasingFunction = EasingFunction.backOut
            let backInOutEasingFunction = EasingFunction.backInOut
            let bounceInEasingFunction = EasingFunction.bounceIn
            let bounceOutEasingFunction = EasingFunction.bounceOut
            let bounceInOutEasingFunction = EasingFunction.bounceInOut
            
            it(" needs to check the jsonString ") {
                expect(linearEasingFunction.jsonString).to(equal(linearString.jsonString))
                expect(quadraticInEasingFunction.jsonString).to(equal(quadraticInString.jsonString))
                expect(quadraticOutEasingFunction.jsonString).to(equal(quadraticOutString.jsonString))
                expect(quadraticInOutEasingFunction.jsonString).to(equal(quadraticInOutString.jsonString))
                expect(cubicInEasingFunction.jsonString).to(equal(cubicInString.jsonString))
                expect(cubicOutEasingFunction.jsonString).to(equal(cubicOutString.jsonString))
                expect(cubicInOutEasingFunction.jsonString).to(equal(cubicInOutString.jsonString))
                expect(quarticInEasingFunction.jsonString).to(equal(quarticInString.jsonString))
                expect(quarticOutEasingFunction.jsonString).to(equal(quarticOutString.jsonString))
                expect(quarticInOutEasingFunction.jsonString).to(equal(quarticInOutString.jsonString))
                expect(quinticInEasingFunction.jsonString).to(equal(quinticInString.jsonString))
                expect(quinticOutEasingFunction.jsonString).to(equal(quinticOutString.jsonString))
                expect(quinticInOutEasingFunction.jsonString).to(equal(quinticInOutString.jsonString))
                expect(sinusoidalInEasingFunction.jsonString).to(equal(sinusoidalInString.jsonString))
                expect(sinusoidalOutEasingFunction.jsonString).to(equal(sinusoidalOutString.jsonString))
                expect(sinusoidalInOutEasingFunction.jsonString).to(equal(sinusoidalInOutString.jsonString))
                expect(exponentialInEasingFunction.jsonString).to(equal(exponentialInString.jsonString))
                expect(exponentialOutEasingFunction.jsonString).to(equal(exponentialOutString.jsonString))
                expect(exponentialInOutEasingFunction.jsonString).to(equal(exponentialInOutString.jsonString))
                expect(circularInEasingFunction.jsonString).to(equal(circularInString.jsonString))
                expect(circularOutEasingFunction.jsonString).to(equal(circularOutString.jsonString))
                expect(circularInOutEasingFunction.jsonString).to(equal(circularInOutString.jsonString))
                expect(elasticInEasingFunction.jsonString).to(equal(elasticInString.jsonString))
                expect(elasticOutEasingFunction.jsonString).to(equal(elasticOutString.jsonString))
                expect(elasticInOutEasingFunction.jsonString).to(equal(elasticInOutString.jsonString))
                expect(backInEasingFunction.jsonString).to(equal(backInString.jsonString))
                expect(backOutEasingFunction.jsonString).to(equal(backOutString.jsonString))
                expect(backInOutEasingFunction.jsonString).to(equal(backInOutString.jsonString))
                expect(bounceInEasingFunction.jsonString).to(equal(bounceInString.jsonString))
                expect(bounceOutEasingFunction.jsonString).to(equal(bounceOutString.jsonString))
                expect(bounceInOutEasingFunction.jsonString).to(equal(bounceInOutString.jsonString))
            }
        }
    }
}
