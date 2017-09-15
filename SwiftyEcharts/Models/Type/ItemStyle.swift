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
    public var color0: Color? // 目前只针对 CandlestickSerie, 阴线 图形的颜色。
    public var borderColor: Color?
    public var borderColor0: Color? // 目前只针对 CandlestickSerie, 阴线 图形的描边颜色。
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
    public var areaColor: Color?
    
    public init() { }
}

extension CommonItemStyleContent: Enumable {
    public enum Enums {
        case color(Color), color0(Color), borderColor(Color), borderColor0(Color), borderWidth(Float), borderType(LineType), shadowBlur(Float), shadowColor(Color), shadowOffsetX(Float), shadowOffsetY(Float), opacity(Float), barBorderRadius(Float), areaColor(Color)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .color(color):
                self.color = color
            case let .color0(color0):
                self.color0 = color0
            case let .borderColor(color):
                self.borderColor = color
            case let .borderColor0(color0):
                self.borderColor0 = color0
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
            case let .areaColor(areaColor):
                self.areaColor = areaColor
            }
        }
    }
}

extension CommonItemStyleContent: Mappable {
    public func mapping(_ map: Mapper) {
        map["color"] = color
        map["color0"] = color0
        map["borderColor"] = borderColor
        map["borderColor0"] = borderColor0
        map["borderWidth"] = borderWidth
        map["borderType"] = borderType
        map["shadowBlur"] = shadowBlur
        map["shadowColor"] = shadowColor
        map["shadowOffsetX"] = shadowOffsetX
        map["shadowOffsetY"] = shadowOffsetY
        map["opacity"] = opacity
        map["barBorderRadius"] = barBorderRadius
        map["areaColor"] = areaColor
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
