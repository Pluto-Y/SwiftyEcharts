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
public enum Padding: Jsonable, CustomStringConvertible {
    case all(Float)
    case verticalAndHorizontal(Float, Float)
    case trbl(Float, Float, Float, Float)
    public var description: String {
        switch self {
        case let .all(val):
            return "\(val)"
        case let .verticalAndHorizontal(vVal, hVal):
            return "[\(vVal), \(hVal)]"
        case let .trbl(tVal, rVal, bVal, lVal):
            return "[\(tVal), \(rVal), \(bVal), \(lVal)]"
        }
    }
}

