//
//  SECLineStyleContainer.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 01/12/2016.
//  Copyright © 2016 com.pluto-y. All rights reserved.
//

/// 线的类型
///
/// - solid: 实线
/// - dashed: 虚线
/// - dotted: 点线
public enum SECLineType: String, SECJsonable {
    case solid = "solid", dashed = "dashed", dotted = "dotted"
    
    public var jsonString: String {
        return "\"\(self.rawValue)\""
    }
}


/// 线条样式
public struct SECLineStyle: SECShadowable, SECColorful, SECOpacitable, SECJsonable {
    /// 线的颜色。
    public var color: SECColor?
    /// 线宽。
    public var width: Float?
    /// 线的类型。
    public var type: SECLineType?
    /// 图形透明度。支持从 0 到 1 的数字，为 0 时不绘制该图形。
    public var opacity: Float? {
        didSet {
            validateOpacity()
        }
    }
    
    // MARK: - SECShadowable
    public var shadowBlur: Float?
    public var shadowColor: SECColor?
    public var shadowOffsetX: Float?
    public var shadowOffsetY: Float?
    
    public init() { }
    
}

extension SECLineStyle : SECEnumable {
    public enum Enums {
        case color(SECColor), width(Float), type(SECLineType), shadowBlur(Float), shadowColor(SECColor), shadowOffsetX(Float), shadowOffsetY(Float), opacity(Float)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: [Enums]) {
        for ele in elements {
            switch ele {
            case let .color(color):
                self.color = color
            case let .width(width):
                self.width = width
            case let .type(type):
                self.type = type
            case let .opacity(opacity):
                self.opacity = opacity
            case let .shadowBlur(blur):
                self.shadowBlur = blur
            case let .shadowColor(color):
                self.shadowColor = color
            case let .shadowOffsetX(x):
                self.shadowOffsetX = x
            case let .shadowOffsetY(y):
                self.shadowOffsetY = y
            }
        }
    }
}

extension SECLineStyle : SECMappable {
    public func mapping(map: SECMap) {
        map["color"] = color
        map["width"] = width
        map["type"] = type
        map["opacity"] = opacity
        map["shadowBlur"] = shadowBlur
        map["shadowColor"] = shadowColor
        map["shadowOffsetX"] = shadowOffsetX
        map["shadowOffsetY"] = shadowOffsetY
    }
}

public protocol SECLine {
    var lineStyle: SECLineStyle? { get set }
}
