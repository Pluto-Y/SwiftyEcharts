//
//  SECLineStyle.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 03/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public protocol SECLineStyleContent: SECColorful, SECShadowable, SECOpacitable, CustomStringConvertible {
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
    
    public var description: String {
        return ""
    }
}
