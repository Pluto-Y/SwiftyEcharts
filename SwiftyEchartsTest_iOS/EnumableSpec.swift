//
//  EnumableSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 13/07/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class EnumableSpec: QuickSpec {
    override func spec() {
        describe("For Enumable") {
            it("needs to check the constructor with only one enum") {
                let fontFamily = "fontFamilyValue"
                
                let textStyle = TextStyle()
                textStyle.fontFamily = fontFamily
                
                let textStyleByEnum = TextStyle(
                    .fontFamily(fontFamily)
                )
                
                expect(textStyleByEnum.jsonString).to(equal(textStyle.jsonString))
            }
        }
    }
}
