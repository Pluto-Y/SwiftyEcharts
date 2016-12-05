//
//  SECFontSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 30/11/2016.
//  Copyright © 2016 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
import SwiftyEcharts

class SECFontSpec: QuickSpec {
    
    
    override func spec() {
        describe("For font style ") {
            
            let normalStyle = SECFontStyle.normal
            let italicStyle = SECFontStyle.italic
            let obliqueStyle = SECFontStyle.oblique

            it("needs to check the description") {
                expect(normalStyle.description).to(equal("normal"))
                expect(italicStyle.description).to(equal("italic"))
                expect(obliqueStyle.description).to(equal("oblique"))
            }
        }
        
        describe("For font weight") {
            let weightValue = 100
            let normalWeight = SECFontWeight.normal
            let boldWeight = SECFontWeight.bold
            let bolderWeight = SECFontWeight.bolder
            let lighterWeight = SECFontWeight.lighter
            let valueWeight = SECFontWeight.weight(weightValue)
            
            it("needs to check the description") {
                expect(normalWeight.description).to(equal("normal"))
                expect(boldWeight.description).to(equal("bold"))
                expect(bolderWeight.description).to(equal("bolder"))
                expect(lighterWeight.description).to(equal("lighter"))
                expect(valueWeight.description).to(equal("\(weightValue)"))
            }
            
        }
    }

}
