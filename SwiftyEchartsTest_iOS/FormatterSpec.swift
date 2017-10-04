//
//  FormatterSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 26/04/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class FormatterSpec: QuickSpec {
    override func spec() {
        describe("For Formatter") {
            beforeEach {
                JsCache.removeAll()
            }
            
            it(" needs to check the jsonString for Formatter ") {
                let function: Function = "function (params) {return params[0];}"
                let strFormatter: SwiftyEcharts.Formatter = .string("{c}%")
                let funcFormatter: SwiftyEcharts.Formatter = .function(function)
                expect(strFormatter.jsonString).to(equal("{c}%".jsonString))
                expect(funcFormatter.jsonString).to(equal(function.jsonString))
            }
        }
    }
}
