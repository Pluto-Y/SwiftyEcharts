//
//  SECItemStyle.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 03/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public protocol SECItemStyleContent: SECColorful, SECBorderable, SECShadowable, SECOpacitable, CustomStringConvertible {
    var borderType: SECLineType? { get set }
}

public struct SECCommonItemStyleContent: SECItemStyleContent {
    
    public var color: SECColor?
    public var borderColor: SECColor?
    public var borderWidth: Float = 0.0
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
    
    public var description: String {
        return ""
    }
}

public struct SECItemStyle: SECEmphasisable {
    public typealias Style = SECCommonItemStyleContent
    
    public var normal: Style?
    public var emphasis: Style?
    
    public var description: String {
        return ""
    }
}
