//
//  SECMappableSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 07/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
import SwiftyEcharts

class SECMappableSpec: QuickSpec {
    
    struct MappableStructTest: SECMappable {
        var boolVar: Bool = false
        var boolOpt: Bool?
        var intVar: Int = 0
        var intOpt: Int?
        var doubleVar: Double = 0.0
        var doubleOpt: Double?
        var floatVar = 0.0
        var floatOpt: Float?
        var stringVar: String = ""
        var stringOpt: String?
        
        func mapping(inout map: SECMap) {
            map["boolVar"] = boolVar
            map["boolOpt"] = boolOpt
            map["intVar"] = intVar
            map["intOpt"] = intOpt
            map["doubleVar"] = doubleVar
            map["doubleOpt"] = doubleOpt
            map["floatVar"] = floatVar
            map["floatOpt"] = floatOpt
            map["stringVar"] = stringVar
            map["stringOpt"] = stringOpt
        }
    }
    
    
    override func spec() {
        describe("For Mappable") {
            it("need to check the sub-struct of mappable") {
                var mappableStruct = MappableStructTest()
                mappableStruct.boolVar = false
                mappableStruct.boolOpt = nil
                mappableStruct.intVar = 10
                mappableStruct.intOpt = 12
                mappableStruct.doubleVar = 10.0
                mappableStruct.doubleOpt = 11.0
                mappableStruct.floatVar = 3.14
                mappableStruct.floatOpt = nil
                mappableStruct.stringVar = "Pluto"
                mappableStruct.stringOpt = nil
                SECMap.ignoreNil = true
                expect(mappableStruct.jsonString).to(equal("{\n\"boolVar\":false,\n\"doubleOpt\":11.0,\n\"doubleVar\":10.0,\n\"floatVar\":3.14,\n\"intOpt\":12,\n\"intVar\":10,\n\"stringVar\":\"Pluto\"\n}"))
                SECMap.ignoreNil = false
                expect(mappableStruct.jsonString).to(equal("{\n\"boolOpt\":null,\n\"boolVar\":false,\n\"doubleOpt\":11.0,\n\"doubleVar\":10.0,\n\"floatOpt\":null,\n\"floatVar\":3.14,\n\"intOpt\":12,\n\"intVar\":10,\n\"stringOpt\":null,\n\"stringVar\":\"Pluto\"\n}"))
            }
        }
        
        //{"boolOpt":null,"boolVar":false,"doubleOpt":11.0,"doubleVar":10.0,"floatOpt":null,"floatVar":3.14,"intOpt":12,"intVar":10,"stringOpt":null,"stringVar":"Pluto"}
        //{"boolOpt":null,"boolVar":false,"doubleOpt":11.0,"doubleVar":10.0,"floatOpt":null,"floatVar":3.14,"intOpt":12,"intVar":10,"stringOpt":null,"stringVar":"Pluto"}
    }
    
}
