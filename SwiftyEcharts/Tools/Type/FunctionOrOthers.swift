//
//  FunctionOrOthers.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 18/06/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public protocol FunctionOrOthers: Jsonable {
}

public enum FunctionOrFloat: FunctionOrOthers {
    case value(Float)
    case function(Function)
    
    public var jsonString: String {
        switch self {
        case let .value(value):
            return value.jsonString
        case let .function(f):
            return f.jsonString
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
    case function(Function)
    
    public var jsonString: String {
        switch self {
        case let .value(value):
            return value.jsonString
        case let .function(f):
            return f.jsonString
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

public enum FunctionOrString: FunctionOrOthers {
    case string(String)
    case function(Function)
    
    public var jsonString: String {
        switch self {
        case let .string(string):
            return string.jsonString
        case let .function(function):
            return function.jsonString
        }
    }
}
