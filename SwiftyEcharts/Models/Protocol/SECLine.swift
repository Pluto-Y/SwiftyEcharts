//
//  SECLineStyleContainer.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 01/12/2016.
//  Copyright © 2016 com.pluto-y. All rights reserved.
//

import Foundation

/// 线的类型
///
/// - solid: 实线
/// - dashed: 虚线
/// - dotted: 点线
public enum SECLineType: String, SECJsonable {
    case solid = "solid", dashed = "dashed", dotted = "dotted"
}


/// 线条样式
public struct SECLineStyle: SECShadowable, SECColorful, SECOpacitable, SECJsonable {
    /// 线的颜色。
    public var color: SECColor?
    /// 线宽。
    public var width: Float?
    /// 线的类型。
    public var type: SECLineType?
    /// 图形透明度。支持从 0 到 1 的数字，为 0 时不绘制该图形。
    public var opacity: Float? {
        didSet {
            validateOpacity()
        }
    }
    
    // MARK: - SECShadowable
    public var shadowBlur: Float?
    public var shadowColor: SECColor?
    public var shadowOffsetX: Float?
    public var shadowOffsetY: Float?
    
    public init() { }
    
}

extension SECLineStyle : SECMappable {
    public func mapping(map: SECMap) {
        map["color"] = color
        map["width"] = width
        map["type"] = type
        map["opacity"] = opacity
        map["shadowBlur"] = shadowBlur
        map["shadowColor"] = shadowColor
        map["shadowOffsetX"] = shadowOffsetX
        map["shadowOffsetY"] = shadowOffsetY
    }
}

public protocol SECLine {
    var lineStyle: SECLineStyle? { get set }
}

/// 分割线
public struct SECSplitLine: SECDisplayable, SECLine {
    /// 是否显示分隔线。
    public var show: Bool = true
    /// 分隔线的显示间隔
    public var interval: UInt?
    /// 分割线的样式
    public var lineStyle: SECLineStyle?
    
    public init() { }
}

extension SECSplitLine : SECMappable {
    public func mapping(map: SECMap) {
        map["show"] = show
        map["interval"] = interval
        map["lineStyle"] = lineStyle
    }
}
