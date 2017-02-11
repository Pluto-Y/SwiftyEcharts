//
//  SECGraphicStyle.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 11/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public protocol SECGraphicStyle : SECShadowable {
    var fill: SECColor? { get set }
    var stroke: SECColor? { get set }
    var lineWidth: Float? { get set }
}

public struct SECCommonGraphicStyle : SECGraphicStyle {
    public var fill: SECColor?
    public var stroke: SECColor?
    public var lineWidth: Float?
    public var shadowBlur: Float?
    public var shadowOffsetX: Float?
    public var shadowOffsetY: Float?
    public var shadowColor: SECColor?
}
