//
//  SECSelectedModeSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 10/03/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
import SwiftyEcharts

class SECSelectedModeSpec: QuickSpec {
    
    override func spec() {
        
        describe("For SECSelectedMode") {
            let enableMode: SECSelectedMode = .enable
            let disableMode: SECSelectedMode = .disable
            let singleMode: SECSelectedMode = .single
            let multipMode: SECSelectedMode = .multiple
            
            let trueLiteralMode: SECSelectedMode = true
            let falseLiteralMode: SECSelectedMode = false
            
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
