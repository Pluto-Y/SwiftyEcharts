//
//  MapperSpec.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 25/06/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftyEcharts

class MapperSpec: QuickSpec {
    override func spec() {
        describe("For Mapper") {
            let firstElement = "World"
            let secondElement = 3.14
            let thirdElement = 4
            let fourthElement: Jsonable? = nil
            let finalElement = false
            let oneValue = "Hello"
            let mapper = Mapper()
            mapper.mapDic["firstElement"] = firstElement
            mapper.mapDic["secondElement"] = secondElement
            mapper.mapDic["thirdElement"] = thirdElement
            mapper.mapDic["fourthElement"] = fourthElement
            mapper.mapDic["finalElement"] = finalElement
            mapper.mapDic["oneValue"] = oneValue
            
            let resultWithoutNil: [String: Jsonable] = [
                "firstElement": firstElement,
                "secondElement": secondElement,
                "thirdElement": thirdElement,
                "finalElement": finalElement,
                "oneValue": oneValue
            ]
            
            let resultWithNig: [String: Jsonable?] = [
                "firstElement": firstElement,
                "secondElement": secondElement,
                "thirdElement": thirdElement,
                "fourthElement": fourthElement,
                "finalElement": finalElement,
                "oneValue": oneValue
            ]
            
            it("needs to check the ignoreNil and jsonString") {
                let originIgnoreNil = Mapper.ignoreNil
                
                Mapper.ignoreNil = false
                expect(mapper.jsonString).to(equal(resultWithNig.jsonString))
                
                Mapper.ignoreNil = true
                expect(mapper.jsonString).to(equal(resultWithoutNil.jsonString))
                
                Mapper.ignoreNil = originIgnoreNil
            }
            
            it("needs to check the subscript") {
                let newFirstElement = "One"
                let newSecondElement: Float = 6.66
                let newThirdElement: Jsonable? = nil
                
                mapper["firstElement"] = newFirstElement
                expect(mapper["firstElement"] as? String).notTo(beNil())
                expect(mapper["firstElement"] as? String).to(equal(newFirstElement))
                
                mapper["secondElement"] = newSecondElement
                expect(mapper["secondElement"] as? Float).notTo(beNil())
                expect(mapper["secondElement"] as? Float).to(equal(newSecondElement))
                
                mapper["thirdElement"] = newThirdElement
                expect(mapper["thirdElement"]).to(beNil())
                
                expect(mapper["noThisKey"]).to(beNil())
            }
        }
    }
}
