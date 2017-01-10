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

public struct SECCommonLineStyleContent: SECLineStyleContent {
    public var color: SECColor?
    public var width: Float?
    public var type: SECLineType? = SECLineType.solid
    public var shadowBlur: Float?
    public var shadowColor: SECColor?
    public var shadowOffsetX: Float?
    public var shadowOffsetY: Float?
    public var opacity: Float?
    
    public init() { }
}

extension SECCommonLineStyleContent : SECMappable {
    public func mapping(map: SECMap) {
        map["color"] = color
        map["width"] = width
        map["type"] = type
        map["shadowBlur"] = shadowBlur
        map["shadowColor"] = shadowColor
        map["shadowOffsetX"] = shadowOffsetX
        map["shadowOffsetY"] = shadowOffsetY
        map["opacity"] = opacity
    }
}
