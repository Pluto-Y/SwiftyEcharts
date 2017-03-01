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
public enum SECColor: SECJsonable {
    
    public enum ImageRepeat : String, SECJsonable {
        case repeatAll = "repeat"
        case repeatX = "repeat-x"
        case repeatY = "repeat-y"
        case noRepeat = "no-repeat"
        
        public var jsonString: String {
            return "\"\(self.rawValue)\""
        }
    }
    
    case rgba(Int, Int, Int, Float)
    case rgb(Int, Int, Int)
    case hexColor(String)
    case array([SECColor])
    case red, blue, green, yellow, transparent
    case image(String, ImageRepeat)
    
    public var jsonString: String {
        switch self {
        case let .rgba(r, g, b, a):
            return "\"rgba(\(r), \(g), \(b), \(a))\""
        case let .rgb(r, g, b):
            return "\"rgba(\(r), \(g), \(b), 1.0)\""
        case let .hexColor(hexColor):
            return "\"\(hexColor)\""
        case .red:
            return "\"red\""
        case .blue:
            return "\"blue\""
        case .yellow:
            return "\"yellow\""
        case .green:
            return "\"green\""
        case .transparent:
            return "\"transparent\""
        case let .array(colors):
            var result = "["
            for color in colors {
                result += "\(color.jsonString)" + ","
            }
            result = result.substringToIndex(result.endIndex.predecessor())
            result += "]"
            return result
        case let .image(base64Str, r):
            let count = SECJsMap.allFunctions().count
            let paramName = "tmp\(count)"
            SECJsMap.add("var \(paramName) = new Image(); \(paramName).src = '\(base64Str)';")
            return "{\"image\": \"\(paramName)\", \"repeat\": \(r.jsonString)}"
        }
    }
}
