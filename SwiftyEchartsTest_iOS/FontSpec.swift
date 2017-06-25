//
//  FontSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 30/11/2016.
//  Copyright © 2016 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
import SwiftyEcharts

class FontSpec: QuickSpec {
    
    override func spec() {
        describe("For font style ") {
            
            let normalStyle = FontStyle.normal
            let italicStyle = FontStyle.italic
            let obliqueStyle = FontStyle.oblique

            it("needs to check the description") {
                expect(normalStyle.description).to(equal("normal"))
                expect(italicStyle.description).to(equal("italic"))
                expect(obliqueStyle.description).to(equal("oblique"))
            }
        }
        
        describe("For font weight") {
            let weightValue = 100
            let valueWeight = FontWeight.weight(weightValue)
            
            it("needs to check the description") {
                let normalWeight = FontWeight.normal
                let boldWeight = FontWeight.bold
                let bolderWeight = FontWeight.bolder
                let lighterWeight = FontWeight.lighter
                
                
                expect(normalWeight.description).to(equal("normal"))
                expect(boldWeight.description).to(equal("bold"))
                expect(bolderWeight.description).to(equal("bolder"))
                expect(lighterWeight.description).to(equal("lighter"))
                expect(valueWeight.description).to(equal("\(weightValue)"))
            }
            
            it("needs to create from Int") {
                let intWeight: FontWeight = 100
                expect(intWeight.description).to(equal(valueWeight.description))
                
            }
            
        }
    }

}
