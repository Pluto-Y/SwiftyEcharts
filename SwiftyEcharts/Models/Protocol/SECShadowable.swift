//
//  SECShadowable.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 02/12/2016.
//  Copyright © 2016 com.pluto-y. All rights reserved.
//

/// 对于可以阴影化的对象的接口
public protocol SECShadowable {
    /// 图形阴影的模糊大小。该属性配合 shadowColor,shadowOffsetX, shadowOffsetY 一起设置图形的阴影效果。
    ///
    /// 实例
    /// 
    ///     {
    ///         shadowColor: 'rgba(0, 0, 0, 0.5)',
    ///         shadowBlur: 10
    ///     }
    var shadowBlur: Float? { get set }
    /// 阴影颜色。支持的格式同color。
    var shadowColor: SECColor? { get set }
    /// 阴影水平方向上的偏移距离。
    var shadowOffsetX: Float? { get set }
    /// 阴影垂直方向上的偏移距离。
    var shadowOffsetY: Float? { get set }
}
