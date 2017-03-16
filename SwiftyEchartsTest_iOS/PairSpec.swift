//
//  PairSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 15/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
import SwiftyEcharts

class PairSpec : QuickSpec {
    
    override func spec() {
        
        describe("Testing for type named 'SECTwoElement'") {
            
            it(" needs to check constructor and jsonString ") {
                let noArgElements = Pair<LengthValue>()
                
                expect(noArgElements.jsonString).to(equal("null"))
                
                let percentValue: Float = 3
                let floatValue: Float = 2
                let twoElements: Pair<LengthValue> = [floatValue, percentValue%]
                let precisionFomatStr = String(format: "\"%%.%df%%%%\"", Percent.precision)
                let percentJson = String(format: precisionFomatStr, percentValue)
                
                expect(twoElements.jsonString).to(equal("[\(floatValue), \(percentJson)]"))
                
                let toMuchElements: Pair<LengthValue> = [3, 4, 5, 6%]
                expect(toMuchElements.jsonString).to(equal("null"))
                
                // 如果不是 LengthValue 的话，就会产生编译错误
//                let errorType: Pair = ["hello", 4]
            }
            
        }
        
    }
    
}
