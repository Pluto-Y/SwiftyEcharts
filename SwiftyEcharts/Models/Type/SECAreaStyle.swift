//
//  SECAreaStyle.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 04/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public protocol SECAreaStyleContent : SECColorful, SECShadowable, SECOpacitable {

}

public struct SECCommonAreaStyleContent : SECAreaStyleContent {
    public var color: SECColor?
    public var shadowBlur: Float?
    public var shadowColor: SECColor?
    public var shadowOffsetX: Float?
    public var shadowOffsetY: Float?
    public var opacity: Float?
}

extension SECCommonAreaStyleContent : SECEnumable {
    public enum Enums {
        case color(SECColor), shadowBlur(Float), shadowColor(SECColor), shadowOffsetX(Float), shadowOffsetY(Float), opacity(Float)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
        for ele in elements {
            switch ele {
            case let .color(color):
                self.color = color
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

extension SECCommonAreaStyleContent : SECMappable {
    public func mapping(map: SECMap) {
        map["color"] = color
        map["shadowBlur"] = shadowBlur
        map["shadowColor"] = shadowColor
        map["shadowOffsetX"] = shadowOffsetX
        map["shadowOffsetY"] = shadowOffsetY
        map["opacity"] = opacity
    }
}


/// 分隔区域的样式设置。
public struct SECAreaStyle : SECAreaStyleContent {
    /// 分隔区域颜色。分隔区域会按数组中颜色的顺序依次循环设置颜色。默认是一个深浅的间隔色。
    public var color: SECColor? = SECColor.array([SECColor.rgba(250, 250, 250, 0.3), SECColor.rgba(200, 200, 200, 0.3)])
    /// 阴影设置
    public var shadowBlur: Float?
    public var shadowColor: SECColor?
    public var shadowOffsetX: Float? = 0
    public var shadowOffsetY: Float? = 0
    /// 图形透明度。支持从 0 到 1 的数字，为 0 时不绘制该图形。
    public var opacity: Float? {
        didSet {
            validateOpacity()
        }
    }
}

extension SECAreaStyle : SECEnumable {
    public enum Enums {
        case color(SECColor), shadowBlur(Float), shadowColor(SECColor), shadowOffsetX(Float), shadowOffsetY(Float), opacity(Float)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
        for ele in elements {
            switch ele {
            case let .color(color):
                self.color = color
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

extension SECAreaStyle : SECMappable {
    public func mapping(map: SECMap) {
        map["color"] = color
        map["shadowBlur"] = shadowBlur
        map["shadowColor"] = shadowColor
        map["shadowOffsetX"] = shadowOffsetX
        map["shadowOffsetY"] = shadowOffsetY
        map["opacity"] = opacity
    }
}
