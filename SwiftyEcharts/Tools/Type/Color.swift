//
//  Color.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 30/11/2016.
//  Copyright © 2016 com.pluto-y. All rights reserved.
//

import Foundation

public protocol Colorful {
    var color: Color? { get set }
}

/// 颜色
///
/// - rgba: 以RGBA形式创建的颜色
/// - rgb: 以RGB形式创建的颜色
/// - hexColor: 以16进制字符串创建的颜色
public enum Color: Jsonable {
    
    public enum ImageRepeat: String, Jsonable {
        case repeatAll = "repeat"
        case repeatX = "repeat-x"
        case repeatY = "repeat-y"
        case noRepeat = "no-repeat"
        
        public var jsonString: String {
            return self.rawValue.jsonString
        }
    }
    
    case rgba(Int, Int, Int, Float)
    case rgb(Int, Int, Int)
    case hexColor(String)
    case array([Color])
    case image(String, ImageRepeat)
    case linearGradient(Float, Float, Float, Float, [GradientColorElement], Bool)
    case radialGradient(Float, Float, Float, [GradientColorElement], Bool)
    case auto, red, blue, green, yellow, transparent
    
    private func validate(red: Int, _ green: Int, _ blue: Int, _ alpha: Float = 1.0) -> Bool {
        guard red >= 0 && red <= 255 else {
            printError("Please check the red element")
            return false
        }
        
        guard green >= 0 && green <= 255 else {
            printError("Please check the green element")
            return false
        }
        guard blue >= 0 && blue <= 255 else {
            printError("Please check the blue element")
            return false
        }
        
        guard alpha >= 0 && alpha <= 1.0 else {
            printError("Please check the alpha element")
            return false
        }
        
        return true
    }
    
    public var jsonString: String {
        switch self {
        case let .rgba(r, g, b, a):
            if validate(r, g, b, a) {
                return "\"rgba(\(r), \(g), \(b), \(a))\""
            }
            return "\"null\""
        case let .rgb(r, g, b):
            if validate(r, g, b) {
                return "\"rgba(\(r), \(g), \(b), 1.0)\""
            }
            return "\"null\""
        case let .hexColor(hexColor):
            return "\"\(hexColor)\""
        case .auto:
            return "\"auto\""
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
        case let .linearGradient(x0, y0, x2, y2, colors, absolute):
            var result = "null"
            if colors.count > 0 {
                var jsStr = "new echarts.graphic.LinearGradient(\(x0), \(y0), \(x2), \(y2), ["
                for color in colors {
                    if color.jsonString != "null" {
                        jsStr += "\(color.jsonString),"
                    }
                }
                jsStr = jsStr.substringToIndex(jsStr.endIndex.predecessor())
                jsStr += "], \(absolute))"
                let count = JsCache.allJsStrings().count
                let paramName = "linearGradient\(count)"
                JsCache.add("var \(paramName) = \(jsStr);")
                result = "\"\(paramName)\""
            }
            return result
        case let .radialGradient(x, y, r, colors, absolute):
            var result = "null"
            if colors.count > 0 {
                var jsStr = "new echarts.graphic.RadialGradient(\(x), \(y), \(r), ["
                for color in colors {
                    if color.jsonString != "null" {
                        jsStr += "\(color.jsonString),"
                    }
                }
                jsStr = jsStr.substringToIndex(jsStr.endIndex.predecessor())
                jsStr += "], \(absolute))"
                let count = JsCache.allJsStrings().count
                let paramName = "radialGradient\(count)"
                JsCache.add("var \(paramName) = \(jsStr);")
                result = "\"\(paramName)\""
            }
            return result
        case let .array(colors):
            var result = "["
            if colors.count > 0 {
                for color in colors {
                    result += "\(color.jsonString)" + ","
                }
                result = result.substringToIndex(result.endIndex.predecessor())
            }
            result += "]"
            return result
        case let .image(base64Str, r):
            let count = JsCache.allJsStrings().count
            let paramName = "imgColor\(count)"
            JsCache.add("var \(paramName) = new Image(); \(paramName).src = '\(base64Str)';")
            return "{\"image\": \"\(paramName)\", \"repeat\": \(r.jsonString)}"
        }
    }
    
}

// 通过 `rgba` 以及 `rgb`的方法能直接创建出对象
public func rgba(red: Int, _ green: Int, _ blue: Int, _ alpha: Float) -> Color {
    return Color.rgba(red, green, blue, alpha)
}

public func rgb(red: Int, _ green: Int, _ blue: Int) -> Color {
    return Color.rgb(red, green, blue)
}

// 通过字符串能直接产生颜色
extension Color : StringLiteralConvertible {
    public init(stringLiteral value: String) {
       self = Color.hexColor(value)
    }
    
    public init(unicodeScalarLiteral value: String) {
       self = Color.hexColor(value)
    }
    
    public init(extendedGraphemeClusterLiteral value: String) {
       self = Color.hexColor(value)
    }
}

/// 渐变颜色的元素
public struct GradientColorElement {
    private var offset: Float?
    private var color: Color?
    
    public init() { }
    
    public init(_ offset: Float, _ color: Color) {
        self.offset = offset
        self.color = color
    }
}

extension GradientColorElement: Jsonable {
    public var jsonString: String {
        if let o = offset, let c = color {
            return "{\"offset\": \(o.jsonString), \"color\": \(c.jsonString)}"
        }
        return "null"
    }
}

// MARK: - 保证渐变颜色的元素能通过Dictionary进行创建
extension GradientColorElement: DictionaryLiteralConvertible {
    public typealias Key = String
    public typealias Value = Jsonable
    
    public init(dictionaryLiteral elements: (String, Jsonable)...) {
        var offset: Float?
        var color: Color?
        for (key, value) in elements {
            if key == "offset" {
                if let v = value as? Int{
                    offset = Float(v)
                } else if let v = value as? Float {
                    offset = v
                }
            } else if key == "color", let v = value as? Color {
                color = v
            }
            if let o = offset, let c = color {
                self = GradientColorElement(o, c)
                break
            }
        }
    }
}
