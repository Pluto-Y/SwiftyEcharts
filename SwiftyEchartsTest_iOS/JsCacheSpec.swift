//
//  JsCacheSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 22/05/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
import SwiftyEcharts

class JsCacheSpec: QuickSpec {
    override func spec() {
        describe("For JsCache") {
            it("needs to check the methods") {
                let jsString1 = "function (idx) {return idx * 100;};"
                let jsString2 = "function (idx) {return idx * 0.65;};"
                
                JsCache.removeAll()
                
                JsCache.add(jsString1)
                expect(JsCache.allJsStrings()).to(equal([jsString1]))
                expect(JsCache.contain(jsString1)).to(beTrue())
                expect(JsCache.contain(jsString2)).to(beFalse())
                
                JsCache.add(jsString2)
                expect(JsCache.allJsStrings()).to(equal([jsString1, jsString2]))
                expect(JsCache.contain(jsString1)).to(beTrue())
                expect(JsCache.contain(jsString2)).to(beTrue())
                
                JsCache.removeAll()
                expect(JsCache.allJsStrings()).to(equal([]))
                expect(JsCache.contain(jsString1)).to(beFalse())
                expect(JsCache.contain(jsString2)).to(beFalse())
            }
        }
    }
}
