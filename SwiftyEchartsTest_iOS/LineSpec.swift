//
//  LineSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 24/04/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
import SwiftyEcharts

class LineSpec: QuickSpec {
    
    override func spec() {
        describe("For line type enum") {
            let solidType: LineType = .solid
            let dashType: LineType = .dashed
            let dottedType: LineType = .dotted
            
            expect(solidType.jsonString).to(equal("solid".jsonString))
            expect(dashType.jsonString).to(equal("dashed".jsonString))
            expect(dottedType.jsonString).to(equal("dotted".jsonString))
        }
    }
}
