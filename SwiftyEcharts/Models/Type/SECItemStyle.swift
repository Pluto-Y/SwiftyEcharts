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

extension SECItemStyle : SECMappable {
    public func mapping(map: SECMap) {
        map["normal"] = normal
        map["emphasis"] = emphasis
    }
}
