//
//  FunctionOrValue.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 18/06/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

internal let FunctionPrefix = "echartsFunc"

public protocol FunctionOrValue: Jsonable {
}

public enum FunctionOrFloat: FunctionOrValue {
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
