//
//  TextStyle.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 30/11/2016.
//  Copyright © 2016 com.pluto-y. All rights reserved.
//

/// 水平对齐
///
/// - left: 左边
/// - right: 右边
/// - center: 中间
public enum Align: String, Jsonable {
    case left = "left"
    case right = "right"
    case center = "center"
    case auto = "auto"
    case none = ""
    
    public var jsonString: String {
        return self.rawValue.jsonString
    }
}

/// 文本垂直对齐
///
/// - top: 顶部
/// - middle: 中间
/// - bottom: 底部
public enum VerticalAlign: String, Jsonable {
    case top = "top"
    case middle = "middle"
    case bottom = "bottom"
    
    public var jsonString: String {
        return self.rawValue.jsonString
    }
}

/// 文字样式
public final class TextStyle: Colorful {
    /// 颜色
    public var color: Color?
    /// 文字字体的风格
    public var fontStyle: FontStyle?
    /// 文字字体的粗细
    public var fontWeight: FontWeight?
    /// 文字的字体系列
    public var fontFamily: String?
    /// 文字的字体大小
    public var fontSize: UInt?
    /// 父控件的相对位置的对齐
    public var align: Position?
    
    public init() { }
}

extension TextStyle: Enumable {
    
    public enum Enums {
        case color(Color), fontStyle(FontStyle), fontWeight(FontWeight), fontFamily(String), fontSize(UInt), align(Position)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .color(color):
                self.color = color;
            case let .fontStyle(fontStyle):
                self.fontStyle = fontStyle
            case let .fontWeight(fontWeight):
                self.fontWeight = fontWeight
            case let .fontFamily(fontFamily):
                self.fontFamily = fontFamily
            case let .fontSize(fontSize):
                self.fontSize = fontSize
            case let .align(align):
                self.align = align
            }
        }
    }
}

extension TextStyle: Mappable {
    public func mapping(_ map: Mapper) {
        map["color"] = color
        map["fontStyle"] = fontStyle
        map["fontWeight"] = fontWeight
        map["fontFamily"] = fontFamily
        map["fontSize"] = fontSize
        map["align"] = align
    }
}

public protocol Textful {
    var textStyle: TextStyle? { get set }
}
