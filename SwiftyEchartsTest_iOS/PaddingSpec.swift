//
//  PaddingSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 08/05/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
import SwiftyEcharts

class PaddingSpec: QuickSpec {
    
    override func spec() {
        describe("For Padding") {
            
            let allPadding = Padding.all(5.0)
            let allPadding2 = Padding.all(10)
            let verticalAndHorizontalPadding = Padding.verticalAndHorizontal(2.5, 10.2)
            let tlbrPadding = Padding.trbl(2.3, 3.14, 6.9, 2.7)
            let nullPadding = Padding.null
            it(" needs to check the jsonString ") {
                expect(allPadding.jsonString).to(equal("5.0"))
                expect(verticalAndHorizontalPadding.jsonString).to(equal("[2.5, 10.2]"))
                expect(tlbrPadding.jsonString).to(equal("[2.3, 3.14, 6.9, 2.7]"))
                expect(nullPadding.jsonString).to(equal("null"))
            }
            
            it(" needs to check the literal constructor ") {
                let floatPadding: Padding = 5.0
                let intPadding: Padding = 10
                let oneElementPadding: Padding = [5]
                let twoElementsPadding:Padding = [2.5, 10.2]
                let fourElementsPadding: Padding = [2.3, 3.14, 6.9, 2.7]
                let errorElemntPadding: Padding = [2.3, 5.2, 222]
                
                expect(floatPadding.jsonString).to(equal(allPadding.jsonString))
                expect(intPadding.jsonString).to(equal(allPadding2.jsonString))
                expect(oneElementPadding.jsonString).to(equal(allPadding.jsonString))
                expect(twoElementsPadding.jsonString).to(equal(verticalAndHorizontalPadding.jsonString))
                expect(fourElementsPadding.jsonString).to(equal(tlbrPadding.jsonString))
                expect(errorElemntPadding.jsonString).to(equal(nullPadding.jsonString))
                
            }
            
        }
    }
    
}
