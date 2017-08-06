//
//  Shadowable.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 02/12/2016.
//  Copyright © 2016 com.pluto-y. All rights reserved.
//

/// 对于可以阴影化的对象的接口
public protocol Shadowable {
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
    var shadowColor: Color? { get set }
    /// 阴影水平方向上的偏移距离。
    var shadowOffsetX: Float? { get set }
    /// 阴影垂直方向上的偏移距离。
    var shadowOffsetY: Float? { get set }
}

public final class ShadowStyle: Shadowable, Opacitable {
    
    /// 填充的颜色。
    ///
    /// 颜色可以使用 RGB 表示，比如 'rgb(128, 128, 128)'，如果想要加上 alpha 通道表示不透明度，可以使用 RGBA，比如 'rgba(128, 128, 128, 0.5)'，也可以使用十六进制格式，比如 '#ccc'。除了纯色之外颜色也支持渐变色和纹理填充
    ///
    ///     // 线性渐变，前四个参数分别是 x0, y0, x2, y2, 范围从 0 - 1，相当于在图形包围盒中的百分比，如果 globalCoord 为 `true`，则该四个值是绝对的像素位置
    ///     color: {
    ///         type: 'linear',
    ///         x: 0,
    ///         y: 0,
    ///         x2: 0,
    ///         y2: 1,
    ///         colorStops: [{
    ///             offset: 0, color: 'red' // 0% 处的颜色
    ///         }, {
    ///             offset: 1, color: 'blue' // 100% 处的颜色
    ///         }],
    ///         globalCoord: false // 缺省为 false
    ///     }
    ///     // 径向渐变，前三个参数分别是圆心 x, y 和半径，取值同线性渐变
    ///     color: {
    ///         type: 'radial',
    ///         x: 0.5,
    ///         y: 0.5,
    ///         r: 0.5,
    ///         colorStops: [{
    ///             offset: 0, color: 'red' // 0% 处的颜色
    ///         }, {
    ///             offset: 1, color: 'blue' // 100% 处的颜色
    ///         }],
    ///         globalCoord: false // 缺省为 false
    ///     }
    ///     // 纹理填充
    ///     color: {
    ///         image: imageDom, // 支持为 HTMLImageElement, HTMLCanvasElement，不支持路径字符串
    ///         repeat: 'repeat' // 是否平铺, 可以是 'repeat-x', 'repeat-y', 'no-repeat'
    ///     }
    public var color: Color?
    /// 图形阴影的模糊大小。该属性配合 shadowColor,shadowOffsetX, shadowOffsetY 一起设置图形的阴影效果。
    ///
    /// 示例：
    ///
    ///     {
    ///         shadowColor: 'rgba(0, 0, 0, 0.5)',
    ///         shadowBlur: 10
    ///     }
    public var shadowBlur: Float?
    /// 阴影颜色。支持的格式同color。
    public var shadowColor: Color?
    /// 阴影水平方向上的偏移距离。
    public var shadowOffsetX: Float?
    /// 阴影垂直方向上的偏移距离。
    public var shadowOffsetY: Float?
    /// 图形透明度。支持从 0 到 1 的数字，为 0 时不绘制该图形。
    public var opacity: Float?
    
    public init() { }
}

extension ShadowStyle: Enumable {
    public enum Enums {
        case color(Color), shadowBlur(Float), shadowColor(Color), shadowOffsetX(Float), shadowOffsetY(Float), opacity(Float)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
                case let .color(color):
                    self.color = color
                case let .shadowBlur(shadowBlur):
                    self.shadowBlur = shadowBlur
                case let .shadowColor(shadowColor):
                    self.shadowColor = shadowColor
                case let .shadowOffsetX(shadowOffsetX):
                    self.shadowOffsetX = shadowOffsetX
                case let .shadowOffsetY(shadowOffsetY):
                    self.shadowOffsetY = shadowOffsetY
                case let .opacity(opacity):
                    self.opacity = opacity
            
            }
        }
    }
}

extension ShadowStyle: Mappable {
    public func mapping(_ map: Mapper) {
        map["color"] = color
        map["shadowBlur"] = shadowBlur
        map["shadowColor"] = shadowColor
        map["shadowOffsetX"] = shadowOffsetX
        map["shadowOffsetY"] = shadowOffsetY
        map["opacity"] = opacity
    }
}
