//
//  SECLineStyle.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 03/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public protocol SECLineStyleContent: SECColorful, SECShadowable, SECOpacitable {
    var width: Float? { get set }
    var type: SECLineType? { get set }
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
    
    public var curveness: Float?
    
    public init() { }
    
}


extension SECLineStyle : SECEnumable {
    public enum Enums {
        case color(SECColor), width(Float), type(SECLineType), shadowBlur(Float), shadowColor(SECColor), shadowOffsetX(Float), shadowOffsetY(Float), opacity(Float), curveness(Float)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
        for ele in elements {
            switch ele {
            case let .color(color):
                self.color = color
            case let .width(width):
                self.width = width
            case let .type(type):
                self.type = type
            case let .shadowBlur(blur):
                self.shadowBlur = blur
            case let .shadowColor(color):
                self.shadowColor = color
            case let .shadowOffsetX(x):
                self.shadowOffsetX = x
            case let .shadowOffsetY(y):
                self.shadowOffsetY = y
            case let .opacity(opacity):
                self.opacity = opacity
            case let .curveness(curveness):
                self.curveness = curveness
            }
        }
    }
}

extension SECLineStyle : SECMappable {
    public func mapping(map: SECMap) {
        map["color"] = color
        map["width"] = width
        map["type"] = type
        map["shadowBlur"] = shadowBlur
        map["shadowColor"] = shadowColor
        map["shadowOffsetX"] = shadowOffsetX
        map["shadowOffsetY"] = shadowOffsetY
        map["opacity"] = opacity
        map["curveness"] = curveness
    }
}

public struct SECEmphasisLineStyle : SECEmphasisable {
    public typealias Style = SECLineStyle
    
    public var normal: Style?
    public var emphasis: Style?
    
    public init() { }
}

extension SECEmphasisLineStyle : SECEnumable {
    public enum Enums {
        case normal(Style), emphasis(Style)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
        for ele in elements {
            switch ele {
            case let .normal(normal):
                self.normal = normal
            case let .emphasis(emphasis):
                self.emphasis = emphasis
            }
        }
    }
}

extension SECEmphasisLineStyle : SECMappable {
    public func mapping(map: SECMap) {
        map["normal"] = normal
        map["emphasis"] = emphasis
    }
}
