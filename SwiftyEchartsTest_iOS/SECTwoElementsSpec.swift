//
//  SECTwoElementsSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 15/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
import SwiftyEcharts

class SECTwoElementsSpec : QuickSpec {
    
    override func spec() {
        
        describe("Testing for type named 'SECTwoElement'") {
            
            it(" needs to check constructor and jsonString ") {
                let noArgElements = SECTwoElements()
                
                expect(noArgElements.jsonString).to(equal("null"))
                
                let percentValue: Float = 3
                let floatValue: Float = 2
                let twoElements: SECTwoElements = [floatValue, percentValue%]
                let precisionFomatStr = String(format: "\"%%.%df%%%%\"", SECPercent.precision)
                let percentJson = String(format: precisionFomatStr, percentValue)
                
                expect(twoElements.jsonString).to(equal("[\(floatValue), \(percentJson)]"))
            }
            
        }
        
    }
    
}
