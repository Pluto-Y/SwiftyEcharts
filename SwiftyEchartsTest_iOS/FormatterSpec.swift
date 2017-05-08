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
            it(" needs to check the jsonString for Formatter ") {
                let strFormatter: SwiftyEcharts.Formatter = .string("{c}%")
                let funcFormatter: SwiftyEcharts.Formatter = .function("function (params) {return params[0];}")
                expect(strFormatter.jsonString).to(equal("{c}%".jsonString))
                JsCache.removeAll()
                expect(funcFormatter.jsonString).to(equal("\"\(FormatterFuncPrefix)0\""))
                expect(JsCache.allJsStrings()[0]).to(equal("var \(FormatterFuncPrefix)0 = function (params) {return params[0];};"))
                
            }
        }
    }
}
