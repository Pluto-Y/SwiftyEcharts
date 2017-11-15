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
/// - hexColor: 以16进制字符串创建的颜色， 并且只能为以 '#' 开头 3位16进制数或者6位16进制数
/// - array: 颜色的数组
/// - image: 以图片形式来展示颜色
/// - linearGradient: 线性渐变的颜色
/// - radialGradient: 圆形内外的渐变的颜色
/// - others: 其他一些颜色常量
public enum Color: Jsonable {
    
    /// 图片平铺的方式
    ///
    /// - repeatAll: 以x轴和y轴的方式平铺
    /// - repeatX: 以x轴的方式平铺
    /// - repeatY: 以x轴的方式平铺
    /// - noRepeat: 不平铺
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
    case function(Function)
    case array([Color])
    case image(String, ImageRepeat)
    case linearGradient(Float, Float, Float, Float, [GradientColorElement], Bool)
    case radialGradient(Float, Float, Float, [GradientColorElement], Bool)
    case auto, red, blue, green, yellow, transparent, black
    
    /// 用来校验 rgb 或者 rgba 是否符合 Echarts 颜色的限制
    ///
    /// - Parameters:
    ///   - red: 红色的数值
    ///   - green: 绿色的数值
    ///   - blue: 蓝色的数值
    ///   - alpha: 透明度的数值
    /// - Returns: 如果校验成功则返回 true , 反之返回 false
    internal static func validate(_ red: Int, _ green: Int, _ blue: Int, _ alpha: Float = 1.0) -> Bool {
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
    
    /// 用来校验 hexString 是否符合 ECharts 16进制字符串颜色的限制
    ///
    /// - Note: 只有以 '#' 开头，并且后面跟三位或者六位十六进制字符串才可以
    ///
    /// - Parameter hexString: 需要校验的16进制颜色字符串
    /// - returns: 如果校验成功则返回 true , 反之返回 false
    internal static func validate(_ hexString: String) -> Bool {
        var cString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        guard cString.hasPrefix("#") else {
            return false
        }
        
        cString.remove(at: cString.startIndex)
        
        guard cString.characters.count == 6 || cString.characters.count == 3 else {
            return false
        }
        
        var rgbValue: UInt64 = 0
        return Scanner(string: cString).scanHexInt64(&rgbValue)
    }
    
    public var jsonString: String {
        switch self {
        case let .rgba(r, g, b, a):
            if Color.validate(r, g, b, a) {
                return "rgba(\(r), \(g), \(b), \(a))".jsonString
            }
            return "null".jsonString
        case let .rgb(r, g, b):
            if Color.validate(r, g, b) {
                return "rgba(\(r), \(g), \(b), 1.0)".jsonString
            }
            return "null".jsonString
        case let .hexColor(hexColor):
            if !Color.validate(hexColor) {
                return "null".jsonString
            }
            return "\(hexColor)".jsonString
        case let .function(function):
            return function.jsonString
        case .auto:
            return "auto".jsonString
        case .red:
            return "red".jsonString
        case .blue:
            return "blue".jsonString
        case .yellow:
            return "yellow".jsonString
        case .green:
            return "green".jsonString
        case .transparent:
            return "transparent".jsonString
        case .black:
            return "black".jsonString
        case let .linearGradient(x0, y0, x2, y2, colors, absolute):
            var result = "null"
            if colors.count > 0 {
                var jsStr = "new echarts.graphic.LinearGradient(\(x0), \(y0), \(x2), \(y2), ["
                for color in colors {
                    if color.jsonString != "null" {
                        jsStr += "\(color.jsonString),"
                    }
                }
                jsStr = jsStr.substring(to: jsStr.characters.index(before: jsStr.endIndex))
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
                jsStr = jsStr.substring(to: jsStr.characters.index(before: jsStr.endIndex))
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
                result = result.substring(to: result.characters.index(before: result.endIndex))
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
public func rgba(_ red: Int, _ green: Int, _ blue: Int, _ alpha: Float) -> Color {
    return Color.rgba(red, green, blue, alpha)
}

public func rgb(_ red: Int, _ green: Int, _ blue: Int) -> Color {
    return Color.rgb(red, green, blue)
}

// 通过字符串能直接产生颜色
extension Color: ExpressibleByStringLiteral {
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
public final class GradientColorElement {
    fileprivate var offset: Float?
    fileprivate var color: Color?
    
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
extension GradientColorElement: ExpressibleByDictionaryLiteral {
    public typealias Key = String
    public typealias Value = Jsonable
    
    public convenience init(dictionaryLiteral elements: (String, Jsonable)...) {
        
        var offset: Float?
        var color: Color?
        for (key, value) in elements {
            
            if key == "offset" {
                if let v = value as? Int{
                    offset = Float(v)
                } else if let v = value as? Float {
                    offset = v
                }
            } else if key == "color" {
                if let v = value as? Color {
                    color = v
                } else if let v = value as? String {
                    color = Color(stringLiteral: v)
                }
            }
        }
        if let o = offset, let c = color {
            self.init(o, c)
        } else {
            self.init()
        }
    }
}
