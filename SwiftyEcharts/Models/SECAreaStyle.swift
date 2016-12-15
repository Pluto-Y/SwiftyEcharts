//
//  SECAreaStyle.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 06/12/2016.
//  Copyright © 2016 com.pluto-y. All rights reserved.
//

/// 分隔区域的样式设置。
public struct SECAreaStyle: SECColorful, SECShadowable {
    /// 分隔区域颜色。分隔区域会按数组中颜色的顺序依次循环设置颜色。默认是一个深浅的间隔色。
    public var color: SECColor? = SECColor.array([SECColor.rgba(250, 250, 250, 0.3), SECColor.rgba(200, 200, 200, 0.3)])
    /// 阴影设置
    public var shadowBlur: Float?
    public var shadowColor: SECColor?
    public var shadowOffsetX: Float? = 0
    public var shadowOffsetY: Float? = 0
    /// 图形透明度。支持从 0 到 1 的数字，为 0 时不绘制该图形。
    public var opacity: Float?
}
