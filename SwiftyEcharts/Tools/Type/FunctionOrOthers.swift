//
//  FunctionOrOthers.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 18/06/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

internal let FunctionPrefix = "echartsFunc"

public protocol FunctionOrOthers: Jsonable {
}

public enum FunctionOrFloat: FunctionOrOthers {
    case value(Float)
    case function(String)
    
    public var jsonString: String {
        switch self {
        case let .value(value):
            return value.jsonString
        case let .function(f):
            let funcName = "\(FunctionPrefix)\(JsCache.allJsStrings().count)"
            JsCache.add("var \(funcName) = \(f);")
            return funcName.jsonString
        }
    }
}

extension FunctionOrFloat: FloatLiteralConvertible, IntegerLiteralConvertible {
    
    public init(floatLiteral value: Float) {
        self = .value(value)
    }
    
    public init(integerLiteral value: Int) {
        self = .value(Float(value))
    }
    
}

public enum FunctionOrFloatOrPair: FunctionOrOthers {
    case value(Float)
    case point(Point)
    case function(String)
    
    public var jsonString: String {
        switch self {
        case let .value(value):
            return value.jsonString
        case let .function(f):
            let funcName = "\(FunctionPrefix)\(JsCache.allJsStrings().count)"
            JsCache.add("var \(funcName) = \(f);")
            return funcName.jsonString
        case let .point(point):
            return point.jsonString
        }
    }
}

extension FunctionOrFloatOrPair: FloatLiteralConvertible, IntegerLiteralConvertible {
    
    public init(floatLiteral value: Float) {
        self = .value(value)
    }
    
    public init(integerLiteral value: Int) {
        self = .value(Float(value))
    }
    
}

extension FunctionOrFloatOrPair: ArrayLiteralConvertible {
    public typealias Element = LengthValue
    public init(arrayLiteral elements: FunctionOrFloatOrPair.Element...) {
        if elements.count != 2 {
            printError("The count of the array should only be two.")
            self = .function("null")
        } else {
            let point = Pair(elements)
            self = .point(point)
        }
    }
}
