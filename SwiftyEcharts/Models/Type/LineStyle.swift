//
//  LineStyle.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 03/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public protocol LineStyleContent: Colorful, Shadowable, Opacitable {
    var width: Float? { get set }
    var type: LineType? { get set }
}


/// 线条样式
public final class LineStyle: Displayable, Shadowable, Colorful, Opacitable, Jsonable {
    
    /// 是否显示
    public var show: Bool?
    /// 线的颜色。
    public var color: Color?
    /// 线宽。
    public var width: Float?
    /// 线的类型。
    public var type: LineType?
    /// 图形透明度。支持从 0 到 1 的数字，为 0 时不绘制该图形。
    public var opacity: Float? {
        didSet {
            validateOpacity()
        }
    }
    
    // MARK: - Shadowable
    public var shadowBlur: Float?
    public var shadowColor: Color?
    public var shadowOffsetX: Float?
    public var shadowOffsetY: Float?
    
    public var curveness: Float?
    
    public init() { }
    
}


extension LineStyle: Enumable {
    public enum Enums {
        case show(Bool), color(Color), width(Float), type(LineType), shadowBlur(Float), shadowColor(Color), shadowOffsetX(Float), shadowOffsetY(Float), opacity(Float), curveness(Float)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .show(show):
                self.show = show
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

extension LineStyle: Mappable {
    public func mapping(_ map: Mapper) {
        map["show"] = show
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

public final class EmphasisLineStyle: Emphasisable {
    public typealias Style = LineStyle
    
    public var normal: Style?
    public var emphasis: Style?
    
    public init() { }
}

extension EmphasisLineStyle: Enumable {
    public enum Enums {
        case normal(Style), emphasis(Style)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
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

extension EmphasisLineStyle: Mappable {
    public func mapping(_ map: Mapper) {
        map["normal"] = normal
        map["emphasis"] = emphasis
    }
}
