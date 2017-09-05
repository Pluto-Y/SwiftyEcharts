//
//  Padding.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 12/04/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 内边距
///
/// - all: 所有
/// - verticalAndHorizontal: 垂直和水平方向
/// - trbl: 上右下左
/// - null: 为空的情况
public enum Padding: Jsonable {
    case all(Float)
    case verticalAndHorizontal(Float, Float)
    case trbl(Float, Float, Float, Float)
    case null
    public var jsonString: String {
        switch self {
        case let .all(val):
            return "\(val)"
        case let .verticalAndHorizontal(vVal, hVal):
            return "[\(vVal), \(hVal)]"
        case let .trbl(tVal, rVal, bVal, lVal):
            return "[\(tVal), \(rVal), \(bVal), \(lVal)]"
        case .null:
            return "null"
        }
    }
}


// MARK: - 使其能通过浮点数，整数来创建创建
extension Padding: ExpressibleByFloatLiteral {
    public init(floatLiteral value: Float) {
        self = .all(value)
    }
}

extension Padding: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) {
        self = .all(Float(value))
    }
}

// MARK: - 使其能通过数组来创建
extension Padding: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: Float...) {
        if elements.count == 1 {
            self = .all(elements.first!)
        } else if elements.count == 2 {
            self = .verticalAndHorizontal(elements.first!, elements.last!)
        } else if elements.count == 4 {
            self = .trbl(elements[0], elements[1], elements[2], elements[3])
        } else {
            self = .null
        }
    }
}

