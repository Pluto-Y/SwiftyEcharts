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
        var boolVar: Bool?
        var intVar: Int = 0
        var doubleVar: Double = 0.0
        var floatVar: Float?
        var stringVar: String = ""
        
        var description: String {
            return ""
        }
        
        func mapping(inout map: [String: SECJsonable]) {
            var map = map
            boolVar  /> map["boolValue"]
            intVar  /> map["intVar"]
            doubleVar  /> map["doubleVar"]
            floatVar  /> map["floatVar"]
            stringVar  /> map["stringVar"]
            print("After:\(map)")
        }
    }
    
    
    override func spec() {
        describe("For Mappable") {
            it("need to check the sub-struct of mappable") {
                var mappableStruct = MappableStructTest()
                mappableStruct.boolVar = false
                mappableStruct.intVar = 10
                mappableStruct.doubleVar = 10.0
                mappableStruct.floatVar = nil
                mappableStruct.stringVar = "Pluto"
                print("-----------------------\(mappableStruct.jsonString)")
            }
        }
    }
    
}
