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
    
    public var color: Color?
    public var shadowBlur: Float?
    public var shadowColor: Color?
    public var shadowOffsetX: Float?
    public var shadowOffsetY: Float?
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
    public func mapping(map: Mapper) {
        map["color"] = color
        map["shadowBlur"] = shadowBlur
        map["shadowColor"] = shadowColor
        map["shadowOffsetX"] = shadowOffsetX
        map["shadowOffsetY"] = shadowOffsetY
        map["opacity"] = opacity
    }
}
