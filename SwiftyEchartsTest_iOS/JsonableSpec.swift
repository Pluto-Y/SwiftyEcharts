//
//  JsonableSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 04/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class JsonableSpec: QuickSpec {
    
    private struct StructExtension: Jsonable {
        
    }
    
    private class ClassExtension: Jsonable {
        
    }
    
    private class SomeClass {
    }
    
    private struct SomeStruct {
    }
    
    override func spec() {
        describe("For Jsonable") {
            it("needs to check the default extension of Jsonable") {
                let structExtension = StructExtension()
                let classExtension = ClassExtension()
                
                expect(structExtension.jsonString).to(equal("\(structExtension)"))
                expect(classExtension.jsonString).to(equal("\(classExtension)"))
            }
            
            it("needs to check the basic type of jsonString property") {
                let b = true
                let i = 5
                let i8: Int8 = Int8.max
                let i16: Int16 = Int16.min
                let i32: Int32 = 12387123
                let i64: Int64 = Int64.max
                let ui: UInt = UInt.max
                let ui8: UInt8 = 0
                let ui16: UInt16 = 857
                let ui32: UInt32 = 7777
                let ui64: UInt64 = 85734
                let d: Double = 3.14
                let f: Float = 1.141421
                let s = "Test Jsonable"
                expect(b.jsonString).to(equal("\(b)"))
                expect(i.jsonString).to(equal("\(i)"))
                expect(i8.jsonString).to(equal("\(i8)"))
                expect(i16.jsonString).to(equal("\(i16)"))
                expect(i32.jsonString).to(equal("\(i32)"))
                expect(i64.jsonString).to(equal("\(i64)"))
                expect(ui.jsonString).to(equal("\(ui)"))
                expect(ui8.jsonString).to(equal("\(ui8)"))
                expect(ui16.jsonString).to(equal("\(ui16)"))
                expect(ui32.jsonString).to(equal("\(ui32)"))
                expect(ui64.jsonString).to(equal("\(ui64)"))
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
                
                let someClass: SomeClass? = SomeClass()
                let someStruct: SomeStruct? = SomeStruct()
                
                expect(someClass.jsonString).to(equal("\(someClass!)"))
                expect(someStruct.jsonString).to(equal("\(someStruct!)"))
            }
            
            it("needs to check the array") {
                let optionalValue: Float? = 6.5
                let optionalNone: String? = nil
                let dic: [String: Any?] = ["name": "Tom", "age": 6, "money": nil]
                let arr: [Any?] = [1, true, 3.4, "Hello", optionalValue, optionalNone, dic]
                
                let nsarray: NSArray = [1, true, 3.4, "Hello", optionalValue!]
                
                expect(arr.jsonString).to(equal("[\n1,\ntrue,\n3.4,\n\"Hello\",\n6.5,\nnull,\n\(dic.jsonString)\n]"))
                expect(nsarray.jsonString).to(equal("[\n1,\n1,\n3.4,\n\"Hello\",\n6.5\n]"))
                expect(arr.jsonString).notTo(equal(nsarray.jsonString))
            }
            
            it("needs to check the dictionary") {
                let optionalValue: Float? = 6.5
                let optionalNone: String? = nil
                let childrenNames: [String?] = ["San Zhang", "Wu Zhao", nil]
                let dic: [String: Any?] = ["age": 5, "childrenNames": childrenNames, "moneyCount": optionalValue, "name": "Si Li", "wifeName": optionalNone, "height": 164.5]
                let nsdictionary: NSDictionary = ["age": 5, "moneyCount": optionalValue!, "name": "Si Li", "height": 164.5]
                
                expect(dic.jsonString).to(equal("{\n\"age\":5,\n\"childrenNames\":\(childrenNames.jsonString),\n\"height\":164.5,\n\"moneyCount\":6.5,\n\"name\":\"Si Li\",\n\"wifeName\":null\n}"))
                expect(nsdictionary.jsonString).to(equal("{\n\"age\":5,\n\"height\":164.5,\n\"moneyCount\":6.5,\n\"name\":\"Si Li\"\n}"))
                expect(dic.jsonString).notTo(equal(nsdictionary.jsonString))
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
