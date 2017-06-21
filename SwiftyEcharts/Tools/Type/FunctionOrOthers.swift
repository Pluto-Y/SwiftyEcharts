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

extension FunctionOrOthers {
    internal func obtainFunctionJsonString(javascript f: String) -> String {
        guard f != "null" else { return "null" }
        let funcName = "\(FunctionPrefix)\(JsCache.allJsStrings().count)"
        JsCache.add("var \(funcName) = \(f);")
        return funcName.jsonString
    }
}

public enum FunctionOrFloat: FunctionOrOthers {
    case value(Float)
    case function(String)
    
    public var jsonString: String {
        switch self {
        case let .value(value):
            return value.jsonString
        case let .function(f):
            return obtainFunctionJsonString(javascript: f)
        }
    }
}

extension FunctionOrFloat: ExpressibleByFloatLiteral, ExpressibleByIntegerLiteral {
    
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
            return obtainFunctionJsonString(javascript: f)
        case let .point(point):
            return point.jsonString
        }
    }
}

extension FunctionOrFloatOrPair: ExpressibleByFloatLiteral, ExpressibleByIntegerLiteral {
    
    public init(floatLiteral value: Float) {
        self = .value(value)
    }
    
    public init(integerLiteral value: Int) {
        self = .value(Float(value))
    }
    
}

extension FunctionOrFloatOrPair: ExpressibleByArrayLiteral {
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
