//
//  SECColor.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 30/11/2016.
//  Copyright © 2016 com.pluto-y. All rights reserved.
//

import Foundation

public protocol SECColorful {
    var color: SECColor? { get set }
}

/// 颜色
///
/// - rgba: 以RGBA形式创建的颜色
/// - rgb: 以RGB形式创建的颜色
/// - hexColor: 以16进制字符串创建的颜色
public enum SECColor: SECJsonable, CustomStringConvertible {
    case rgba(Int, Int, Int, Float)
    case rgb(Int, Int, Int)
    case hexColor(String)
    case array([SECColor])
    case red, blue, green, transparent
    
    public var description: String {
        switch self {
        case let .rgba(r, g, b, a):
            return "rbga(\(r), \(g), \(b), \(a))"
        case let .rgb(r, g, b):
            return "rbga(\(r), \(g), \(b), 1.0)"
        case let .hexColor(hexColor):
            return "\(hexColor)"
        case .red:
            return "red"
        case .blue:
            return "blue"
        case .green:
            return "green"
        case .transparent:
            return "transparent"
        case let .array(colors):
            var result = "["
            for color in colors {
                result += "\(color.description)" + ","
            }
            result = result.substringFromIndex(result.endIndex.predecessor())
            result += "]"
            return result
        }
    }
}
