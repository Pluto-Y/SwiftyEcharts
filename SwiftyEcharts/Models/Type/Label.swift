//
//  Label.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 03/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public final class Label: Displayable, Formatted, Shadowable, Textful, Borderable {
    public var show: Bool?
    public var precision: UInt8?
    public var formatter: Formatter?
    public var margin: Float?
    public var textStyle: TextStyle?
    public var padding: Padding?
    public var backgroundColor: Color?
    public var borderColor: Color?
    public var borderWidth: Float?
    public var shadowBlur: Float?
    public var shadowColor: Color?
    public var shadowOffsetX: Float?
    public var shadowOffsetY: Float?
}

extension Label: Enumable {
    public enum Enums {
        case show(Bool), precision(UInt8), formatter(Formatter), margin(Float), textStyle(TextStyle), padding(Padding), backgroundColor(Color), borderColor(Color), borderWidth(Float), shadowBlur(Float), shadowColor(Color), shadowOffsetX(Float), shadowOffsetY(Float)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .show(show):
                self.show = show
            case let .precision(precision):
                self.precision = precision
            case let .formatter(formatter):
                self.formatter = formatter
            case let .margin(margin):
                self.margin = margin
            case let .textStyle(textStyle):
                self.textStyle = textStyle
            case let .padding(padding):
                self.padding = padding
            case let .backgroundColor(backgroundColor):
                self.backgroundColor = backgroundColor
            case let .borderColor(borderColor):
                self.borderColor = borderColor
            case let .borderWidth(borderWidth):
                self.borderWidth = borderWidth
            case let .shadowBlur(shadowBlur):
                self.shadowBlur = shadowBlur
            case let .shadowColor(shadowColor):
                self.shadowColor = shadowColor
            case let .shadowOffsetX(shadowOffsetX):
                self.shadowOffsetX = shadowOffsetX
            case let .shadowOffsetY(shadowOffsetY):
                self.shadowOffsetY = shadowOffsetY
            }
        }
    }
}

extension Label: Mappable {
    public func mapping(map: Mapper) {
        map["show"] = show
        map["precision"] = precision
        map["formatter"] = formatter
        map["margin"] = margin
        map["textStyle"] = textStyle
        map["padding"] = padding
        map["backgroundColor"] = backgroundColor
        map["borderColor"] = borderColor
        map["borderWidth"] = borderWidth
        map["shadowBlur"] = shadowBlur
        map["shadowColor"] = shadowColor
        map["shadowOffsetX"] = shadowOffsetX
        map["shadowOffsetY"] = shadowOffsetY
    }
}

public protocol LabelStyle: Displayable, Textful{
    
    var position: Position? { get set }
}

public final class FormattedLabelStyle: LabelStyle, Formatted {
    
    public var show: Bool?
    public var position: Position?
    public var formatter: Formatter?
    public var offset: Point?
    public var textStyle: TextStyle?
    
    public init() { }
    
}

extension FormattedLabelStyle: Enumable {
    public enum Enums {
        case show(Bool), position(Position), formatter(Formatter), offset(Point), textStyle(TextStyle)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .show(show):
                self.show = show
            case let .position(position):
                self.position = position
            case let .formatter(formatter):
                self.formatter = formatter
            case let .offset(offset):
                self.offset = offset
            case let .textStyle(textStyle):
                self.textStyle = textStyle
            }
        }
    }
}

extension FormattedLabelStyle: Mappable {
    public func mapping(map: Mapper) {
        map["show"] = show
        map["position"] = position
        map["formatter"] = formatter
        map["offset"] = offset
        map["textStyle"] = textStyle
    }
}

public final class FormattedLabel: Emphasisable {
    public typealias Style = FormattedLabelStyle
    
    public var normal: Style?
    public var emphasis: Style?
    
    public init() {}
    
}

public typealias EmphasisFormattedLabel = FormattedLabel

extension FormattedLabel: Enumable {
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

extension FormattedLabel: Mappable {
    public func mapping(map: Mapper) {
        map["normal"] = normal
        map["emphasis"] = emphasis
    }
}
