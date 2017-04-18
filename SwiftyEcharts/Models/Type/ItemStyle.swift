//
//  ItemStyle.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 03/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public protocol ItemStyleContent: Colorful, Borderable, Shadowable, Opacitable {
    var borderType: LineType? { get set }
}

public final class CommonItemStyleContent: ItemStyleContent {
    
    public var color: Color?
    public var borderColor: Color?
    public var borderWidth: Float?
    public var borderType: LineType?
    public var shadowBlur: Float?
    public var shadowColor: Color?
    public var shadowOffsetX: Float?
    public var shadowOffsetY: Float?
    public var opacity: Float? {
        didSet {
            validateOpacity()
        }
    }
    /// 目前只针对 `BarSerie`
    public var barBorderRadius: Float?
    
    public init() { }
}

extension CommonItemStyleContent: Enumable {
    public enum Enums {
        case color(Color), borderColor(Color), borderWidth(Float), borderType(LineType), shadowBlur(Float), shadowColor(Color), shadowOffsetX(Float), shadowOffsetY(Float), opacity(Float), barBorderRadius(Float)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .color(color):
                self.color = color
            case let .borderColor(color):
                self.borderColor = color
            case let .borderWidth(width):
                self.borderWidth = width
            case let .borderType(borderType):
                self.borderType = borderType
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
            case let .barBorderRadius(barBorderRadius):
                self.barBorderRadius = barBorderRadius
            }
        }
    }
}

extension CommonItemStyleContent: Mappable {
    public func mapping(_ map: Mapper) {
        map["color"] = color
        map["borderColor"] = borderColor
        map["borderWidth"] = borderWidth
        map["borderType"] = borderType
        map["shadowBlur"] = shadowBlur
        map["shadowColor"] = shadowColor
        map["shadowOffsetX"] = shadowOffsetX
        map["shadowOffsetY"] = shadowOffsetY
        map["opacity"] = opacity
        map["barBorderRadius"] = barBorderRadius
    }
}

public final class ItemStyle: Emphasisable {
    public typealias Style = CommonItemStyleContent
    
    public var normal: Style?
    public var emphasis: Style?
    
    public init() { }
}

public typealias EmphasisItemStyle = ItemStyle

extension ItemStyle: Enumable {
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

extension ItemStyle: Mappable {
    public func mapping(_ map: Mapper) {
        map["normal"] = normal
        map["emphasis"] = emphasis
    }
}
