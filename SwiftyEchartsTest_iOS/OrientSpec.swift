//
//  OrientSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 07/05/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
import SwiftyEcharts

class OrientSpec: QuickSpec {
    
    override func spec() {
        
        describe("For Orient") {
            
            it(" needs to check the jsonString for the Orient") {
                let vertical = Orient.vertical
                let horizontal = Orient.horizontal
                
                expect(vertical.jsonString).to(equal("vertical".jsonString))
                expect(horizontal.jsonString).to(equal("horizontal".jsonString))
            }
            
        }
        
    }

}
