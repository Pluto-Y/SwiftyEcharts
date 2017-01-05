//
//  SECJsonableSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 04/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
import SwiftyEcharts

class SECJsonableSpec: QuickSpec {
    
    
    override func spec() {
        describe("For Jsonable") {
            
            it("needs to check the toJson method") {
                let b = true
                let i = 5
                let d: Double = 3.14
                let f: Float = 1.141421
                let s = "Test Jsonable"
                expect(b.toJson()).to(equal("\(b)"))
                expect(i.toJson()).to(equal("\(i)"))
                expect(d.toJson()).to(equal("\(d)"))
                expect(f.toJson()).to(equal("\(f)"))
                expect(s.toJson()).to(equal("\"\(s)\""))
            }
            
            it("needs to check the optional") {
                let bo: Bool? = false
                let io: Int? = 10
                let dop: Double? = nil
                let fo: Float? = 1.5
                let so: String? = nil
                print("bo.toJson:\(bo.toJson())")
                expect(bo.toJson()).to(equal("\(bo!)"))
                expect(io.toJson()).to(equal("\(io!)"))
                expect(dop.toJson()).to(equal("null"))
                expect(fo.toJson()).to(equal("\(fo!)"))
                expect(so.toJson()).to(equal("null"))
            }
            
            it("needs to check the array") {
                let optionalValue: Float? = 6.5
                let optionalNone: String? = nil
                let arr: [Any?] = [1, true, 3.4, "Hello", optionalValue, optionalNone]
                
                expect(arr.toJson()).to(equal("[\n1,\ntrue,\n3.4,\n\"Hello\",\n6.5,\nnull\n]"))
            }
            
            it("needs to check the dictionary") {
                let optionalValue: Float? = 6.5
                let optionalNone: String? = nil
                let childrenNames: [String?] = ["San Zhang", "Wu Zhao", nil]
                let dic: [String: Any?] = ["age": 5, "childrenNames": childrenNames, "moneyCount": optionalValue, "name": "Si Li", "wifeName": optionalNone, "height": 164.5]
                
                expect(dic.toJson()).to(equal("{\n\"age\":5,\n\"childrenNames\":\(childrenNames.toJson()),\n\"height\":164.5,\n\"moneyCount\":6.5,\n\"name\":\"Si Li\",\n\"wifeName\":null\n}"))
            }
            
        }
    }
    
}
