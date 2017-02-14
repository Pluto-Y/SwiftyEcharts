//
//  SECPercentSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 15/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
import SwiftyEcharts

class SECPercentSpec : QuickSpec {
    override func spec() {
        describe("Testing for type named 'SECPercent'") {
            let percent: SECPercent = 32.0
            expect(percent.jsonString).to(equal("\"32.00%\""))
        }
    }
}
