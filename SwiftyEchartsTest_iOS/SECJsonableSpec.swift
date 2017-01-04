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
                
                let arrJson = arr.toJson()
                    .stringByReplacingOccurrencesOfString("\n", withString: "")
                    .stringByReplacingOccurrencesOfString(" ", withString: "")
                print("arr.toJson:\(arrJson)")
                expect(arr.toJson()
                    .stringByReplacingOccurrencesOfString("\n", withString: "")
                    .stringByReplacingOccurrencesOfString(" ", withString: "")).to(equal("[1,true,3.4,\"Hello\",6.5,null]"))
            }
        }
    }
    
}
