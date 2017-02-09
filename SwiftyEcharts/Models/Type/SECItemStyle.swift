//
//  SECItemStyle.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 03/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public protocol SECItemStyleContent : SECColorful, SECBorderable, SECShadowable, SECOpacitable {
    var borderType: SECLineType? { get set }
}

public struct SECCommonItemStyleContent : SECItemStyleContent {
    
    public var color: SECColor?
    public var borderColor: SECColor?
    public var borderWidth: Float?
    public var borderType: SECLineType? = SECLineType.solid
    public var shadowBlur: Float?
    public var shadowColor: SECColor?
    public var shadowOffsetX: Float?
    public var shadowOffsetY: Float?
    public var opacity: Float? {
        didSet {
            validateOpacity()
        }
    }
    
    public init() { }
}

extension SECCommonItemStyleContent : SECEnumable {
    public enum Enums {
        case color(SECColor), borderColor(SECColor), borderWidth(Float), borderType(SECLineType), shadowBlur(Float), shadowColor(SECColor), shadowOffsetX(Float), shadowOffsetY(Float), opacity(Float)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
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
            }
        }
    }
}

extension SECCommonItemStyleContent : SECMappable {
    public func mapping(map: SECMap) {
        map["color"] = color
        map["borderColor"] = borderColor
        map["borderWidth"] = borderWidth
        map["borderType"] = borderType
        map["shadowBlur"] = shadowBlur
        map["shadowColor"] = shadowColor
        map["shadowOffsetX"] = shadowOffsetX
        map["shadowOffsetY"] = shadowOffsetY
        map["opacity"] = opacity
    }
}

public struct SECItemStyle : SECEmphasisable {
    public typealias Style = SECCommonItemStyleContent
    
    public var normal: Style?
    public var emphasis: Style?
    
    public init() { }
}

extension SECItemStyle : SECEnumable {
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

extension SECItemStyle : SECMappable {
    public func mapping(map: SECMap) {
        map["normal"] = normal
        map["emphasis"] = emphasis
    }
}
