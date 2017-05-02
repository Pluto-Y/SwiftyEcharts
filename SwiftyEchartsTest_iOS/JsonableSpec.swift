//
//  JsonableSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 04/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
import SwiftyEcharts

class JsonableSpec: QuickSpec {
    
    
    override func spec() {
        describe("For Jsonable") {
            
            it("needs to check the toJson method") {
                let b = true
                let i = 5
                let d: Double = 3.14
                let f: Float = 1.141421
                let s = "Test Jsonable"
                expect(b.jsonString).to(equal("\(b)"))
                expect(i.jsonString).to(equal("\(i)"))
                expect(d.jsonString).to(equal("\(d)"))
                expect(f.jsonString).to(equal("\(f)"))
                expect(s.jsonString).to(equal("\"\(s)\""))
            }
            
            it("needs to check the optional") {
                let bo: Bool? = false
                let io: Int? = 10
                let dop: Double? = nil
                let fo: Float? = 1.5
                let so: String? = nil
                expect(bo.jsonString).to(equal("\(bo!)"))
                expect(io.jsonString).to(equal("\(io!)"))
                expect(dop.jsonString).to(equal("null"))
                expect(fo.jsonString).to(equal("\(fo!)"))
                expect(so.jsonString).to(equal("null"))
            }
            
            it("needs to check the array") {
                let optionalValue: Float? = 6.5
                let optionalNone: String? = nil
                let dic: [String: Any?] = ["name": "Tom", "age": 6, "money": nil]
                let arr: [Any?] = [1, true, 3.4, "Hello", optionalValue, optionalNone, dic]
                
                expect(arr.jsonString).to(equal("[\n1,\ntrue,\n3.4,\n\"Hello\",\n6.5,\nnull,\n\(dic.jsonString)\n]"))
            }
            
            it("needs to check the dictionary") {
                let optionalValue: Float? = 6.5
                let optionalNone: String? = nil
                let childrenNames: [String?] = ["San Zhang", "Wu Zhao", nil]
                let dic: [String: Any?] = ["age": 5, "childrenNames": childrenNames, "moneyCount": optionalValue, "name": "Si Li", "wifeName": optionalNone, "height": 164.5]
                
                expect(dic.jsonString).to(equal("{\n\"age\":5,\n\"childrenNames\":\(childrenNames.jsonString),\n\"height\":164.5,\n\"moneyCount\":6.5,\n\"name\":\"Si Li\",\n\"wifeName\":null\n}"))
            }
            
            it("need to check the dictionary when it does no have any key") {
                let dic: [String: Any?] = [:]
                expect(dic.jsonString).to(equal("{\n\n}"))
            }
            
            it("needs to check the NSNull") {
                let nsnull = NSNull()
                
                expect(nsnull.jsonString).to(equal("null"))
            }
            
        }
    }
    
}
