//
//  SECOneOrMoreSepc.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 20/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Quick
import Nimble
import SwiftyEcharts

class SECOneOrMoreSepc : QuickSpec {
    
    override func spec() {
        describe("Testing for type named 'SECOneOrMore' ") {
            let oneValue = "Hello"
            let moreValue: [Any] = ["World", 3.14, 4, false]
            it(" needs to check the construct and jsonString") {
                // 测试默认构造器以及 jsonString 是否正确
                let one = SECOneOrMore(one: oneValue)
                expect(one.jsonString).to(equal(oneValue.jsonString))
                
                // 测试默认构造器以及 jsonString 是否正确
                let more = SECOneOrMore(more: moreValue)
                expect(more.jsonString).to(equal(moreValue.jsonString))
            }
            
            it(" needs to check the operator contstruct") {
                let one = |oneValue
                expect(one.jsonString).to(equal(SECOneOrMore(one: oneValue).jsonString))
                
                let more = ||moreValue
                expect(more.jsonString).to(equal(SECOneOrMore(more: moreValue).jsonString))
            }
        }
    }
    
}
