//
//  SECAreaStyle.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 04/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public protocol SECAreaStyleContent: SECColorful, SECShadowable, SECOpacitable, CustomStringConvertible {

}

public struct SECCommonAreaStyleContent: SECAreaStyleContent {
    public var color: SECColor?
    public var shadowBlur: Float?
    public var shadowColor: SECColor?
    public var shadowOffsetX: Float?
    public var shadowOffsetY: Float?
    public var opacity: Float?
    
    public var description: String {
        return ""
    }
}

/// 分隔区域的样式设置。
public struct SECAreaStyle: SECAreaStyleContent {
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
    
    public var description: String {
         return ""
    }
}
