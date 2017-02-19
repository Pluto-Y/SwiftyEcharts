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
            it(" needs to check the construct and jsonString") {
                let oneValue = "Hello"
                let one = SECOneOrMore(one: oneValue)
                
                expect(one.jsonString).to(equal(oneValue.jsonString))
                
                let moreValue: [Any] = ["World", 3.14, 4, false]
                let more = SECOneOrMore(more: moreValue)
                
                expect(more.jsonString).to(equal(moreValue.jsonString))
            }
        }
    }
    
}
