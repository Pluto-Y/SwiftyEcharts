//
//  SECTwoElements.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 15/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 用来保存只有两个元素的类型，
///
/// 例如一个点, [x, y]
///
/// 例如一个访问， [min, max]
public struct SECTwoElements {
    
    private var first: SECLength?
    private var second: SECLength?
    
}

extension SECTwoElements : ArrayLiteralConvertible {
    
    public init(arrayLiteral elements: SECLength...) {
        if elements.count != 2 {
            printError("The count of the array should only be two.")
        } else {
            self.first = elements[0]
            self.second = elements[1]
        }
    }
    
}

extension SECTwoElements : SECJsonable {
    public var jsonString: String {
        if let first = self.first, let second = self.second {
            return "[\(first.jsonString), \(second.jsonString)]"
        }
        return "null"
    }
}

/// 用于指定坐标点, eg: [x, y]
public typealias SECPoint = SECTwoElements
/// 用于指定范围, eg: [min, max]
public typealias SECRange = SECTwoElements
