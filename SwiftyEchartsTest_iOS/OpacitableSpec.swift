//
//  OpacitableSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 25/06/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
import SwiftyEcharts

class OpacitableSpec: QuickSpec {
    
    private class OpacitableClass: Opacitable {
        var opacity: Float?
    }
    
    override func spec() {
        describe("For Opacitable") { 
            let opacitableInstance = OpacitableClass()
            
            it("needs to check the validate function") {
                opacitableInstance.opacity = 0.0
                expect(opacitableInstance.validateOpacity()).to(equal(true))
                expect(opacitableInstance.opacity).to(equal(0.0))
                opacitableInstance.opacity = -0.01
                expect(opacitableInstance.validateOpacity()).to(equal(false))
                expect(opacitableInstance.opacity).to(equal(0.0))
                opacitableInstance.opacity = 0.99
                expect(opacitableInstance.validateOpacity()).to(equal(true))
                expect(opacitableInstance.opacity).to(equal(0.99))
                opacitableInstance.opacity = 1.0
                expect(opacitableInstance.validateOpacity()).to(equal(true))
                expect(opacitableInstance.opacity).to(equal(1.0))
                opacitableInstance.opacity = 1.01
                expect(opacitableInstance.validateOpacity()).to(equal(false))
                expect(opacitableInstance.opacity).to(equal(1.0))
            }
        }
    }
}
