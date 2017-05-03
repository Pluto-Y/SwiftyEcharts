//
//  SymbolSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 03/05/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
import SwiftyEcharts

class SymbolSpec: QuickSpec {
    override func spec() {
        describe("For enum named `Symbol`") {
            
            it(" needs to check the support enum ") {
                let emptyCircle = Symbol.emptyCircle
                let circle = Symbol.circle
                let rect = Symbol.rect
                let roundRect = Symbol.roundRect
                let triangle = Symbol.triangle
                let diamond = Symbol.diamond
                let pin = Symbol.pin
                let arrow = Symbol.arrow
                let none = Symbol.none
                
                expect(emptyCircle.jsonString).to(equal("emptyCircle".jsonString))
                expect(circle.jsonString).to(equal("circle".jsonString))
                expect(rect.jsonString).to(equal("rect".jsonString))
                expect(roundRect.jsonString).to(equal("roundRect".jsonString))
                expect(triangle.jsonString).to(equal("triangle".jsonString))
                expect(diamond.jsonString).to(equal("diamond".jsonString))
                expect(pin.jsonString).to(equal("pin".jsonString))
                expect(arrow.jsonString).to(equal("arrow".jsonString))
                expect(none.jsonString).to(equal("none".jsonString))
            }
            
        }
    }
}

