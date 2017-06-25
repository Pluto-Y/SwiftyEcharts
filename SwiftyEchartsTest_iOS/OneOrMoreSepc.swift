//
//  OneOrMoreSepc.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 20/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
import SwiftyEcharts

class OneOrMoreSepc : QuickSpec {
    
    override func spec() {
        describe("Testing for type named 'OneOrMore' ") {
            let firstElement = "World"
            let secondElement = 3.14
            let thirdElement = 4
            let finalElement = false
            let oneValue = "Hello"
            let moreValue: [Any] = [firstElement, secondElement, thirdElement, finalElement]
            it("needs to check the construct and jsonString") {
                // 测试默认构造器以及 jsonString 是否正确
                let one = OneOrMore(one: oneValue)
                expect(one.jsonString).to(equal(oneValue.jsonString))
                
                // 测试默认构造器以及 jsonString 是否正确
                let more = OneOrMore(more: moreValue)
                expect(more.jsonString).to(equal(moreValue.jsonString))
                
                // 测试默认数组只有一个元素的情况
                let onlyOneElements = OneOrMore(more: [firstElement])
                expect(onlyOneElements.jsonString).to(equal(firstElement.jsonString))
                expect(onlyOneElements.jsonString).notTo(equal([firstElement].jsonString))
                
                // 测试另一个构造器的情况
                let onlyOneElements2 = OneOrMore(arrayLiteral: firstElement)
                expect(onlyOneElements2.jsonString).to(equal(firstElement.jsonString))
                expect(onlyOneElements2.jsonString).notTo(equal([firstElement].jsonString))
            }
            
            // 测试数组常量的构造器
            it("needs to check the ArrayLiteralConvertible") {
                let more: OneOrMore<Any> = [firstElement, secondElement, thirdElement, finalElement]
                expect(more.jsonString).to(equal(moreValue.jsonString))
                
                let more1: OneOrMore<Any> = []
                let emptyArray: Array<Any> = []
                expect(more1.jsonString).to(equal(emptyArray.jsonString))
            }
            
            it("needs to check the subscript ") {
                // 测试下标是否能其作用
                expect(moreValue[0] as? String).to(equal(firstElement))
                expect(moreValue[1] as? Double).to(equal(secondElement))
                expect(moreValue[2] as? Int).to(equal(thirdElement))
                expect(moreValue[3] as? Bool).to(equal(finalElement))
                
                let intValue = 10
                let intValue2 = 18
                let oneInt = OneOrMore<Int>(one: intValue)
                expect(oneInt[0]).to(equal(intValue))
                expect(oneInt[1]).to(beNil())
                
                let moreInts = OneOrMore(more: [intValue, intValue2])
                expect(moreInts[0]).to(equal(intValue))
                expect(moreInts[1]).to(equal(intValue2))
            }
            
        }
    }
    
}
