//
//  SECPair.swift
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
public struct SECPair<T>: ArrayLiteralConvertible {
    
    private var first: T?
    private var second: T?
    
    public init(arrayLiteral elements: T...) {
        if elements.count != 2 {
            printError("The count of the array should only be two.")
        } else {
            self.first = elements[0]
            self.second = elements[1]
        }
    }
    
    public init (_ elements: [T]) {
        if elements.count != 2 {
            printError("The count of the array should only be two.")
        } else {
            self.first = elements[0]
            self.second = elements[1]
        }
    }
}

extension SECPair : SECJsonable {
    public var jsonString: String {
        if let first = self.first as? SECJsonable, let second = self.second as? SECJsonable {
            return "[\(first.jsonString), \(second.jsonString)]"
        }
        return "null"
    }
}

/// 用于指定坐标点, eg: [x, y]
public typealias SECPoint = SECPair<SECLength>
/// 用于指定范围, eg: [min, max]
public typealias SECRange = SECPair<SECLength>
/// 用来指定两端的文本 , eg: SECContinuousVisualMap.text
public typealias SECPiecewiseText = SECPair<String>
