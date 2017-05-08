//
//  LengthValueSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 08/05/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
import SwiftyEcharts

class LengthValueSpec: QuickSpec {
    
    override func spec() {
        describe("For Length") {
            
            it(" needs to check all the type which conform to length value ") {
                // Float
                let floatLength: LengthValue = 3.14
                // Double
                let intLength: LengthValue = 5
                // Double
                let doubleLength: LengthValue = 10.0
                // Percent
                let percentLength: LengthValue = 20.5%
                
                expect(floatLength.jsonString).to(equal(3.14.jsonString))
                expect(intLength.jsonString).to(equal(5.jsonString))
                expect(doubleLength.jsonString).to(equal(10.0.jsonString))
                expect(percentLength.jsonString).to(equal((20.5%).jsonString))
            }
            
        }
    }

}
