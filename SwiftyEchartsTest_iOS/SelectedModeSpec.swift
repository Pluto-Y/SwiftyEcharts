//
//  SelectedModeSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 10/03/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
import SwiftyEcharts

class SelectedModeSpec: QuickSpec {
    
    override func spec() {
        
        describe("For SelectedMode") {
            let enableMode: SelectedMode = .enable
            let disableMode: SelectedMode = .disable
            let singleMode: SelectedMode = .single
            let multipMode: SelectedMode = .multiple
            
            let trueLiteralMode: SelectedMode = true
            let falseLiteralMode: SelectedMode = false
            
            it(" needs to check the BooleanLiteral Constructor") {
                expect(trueLiteralMode.rawValue).to(equal(enableMode.rawValue))
                expect(falseLiteralMode.rawValue).to(equal(disableMode.rawValue))
                expect(trueLiteralMode.jsonString).to(equal("true"))
                expect(falseLiteralMode.jsonString).to(equal("false"))
            }
            
            it(" needs to check the jsonString ") {
                expect(enableMode.jsonString).to(equal("true"))
                expect(disableMode.jsonString).to(equal("false"))
                expect(singleMode.jsonString).to(equal("\"single\""))
                expect(multipMode.jsonString).to(equal("\"multiple\""))
            }
            
        }
        
    }
}
