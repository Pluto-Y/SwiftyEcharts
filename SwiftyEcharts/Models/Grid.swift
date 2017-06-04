//
//  Grid.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 06/12/2016.
//  Copyright © 2016 com.pluto-y. All rights reserved.
//

/// 直角坐标系内绘图网格，单个 grid 内最多可以放置上下两个 X 轴，左右两个 Y 轴。可以在网格上绘制折线图，柱状图，散点图（气泡图）。
/// 在 ECharts 2.x 里单个 echarts 实例中最多只能存在一个 grid 组件，在 ECharts 3 中可以存在任意个 grid 组件。
public final class Grid: Borderable, Displayable, Shadowable, Zable {
    /// 是否显示直角坐标系网格。
    public var show: Bool?
    /// 所有图形的 zlevel 值。
    /// zlevel用于 Canvas 分层，不同zlevel值的图形会放置在不同的 Canvas 中，Canvas 分层是一种常见的优化手段。我们可以把一些图形变化频繁（例如有动画）的组件设置成一个单独的zlevel。需要注意的是过多的 Canvas 会引起内存开销的增大，在手机端上需要谨慎使用以防崩溃。
    /// zlevel 大的 Canvas 会放在 zlevel 小的 Canvas 的上面。
    public var zlevel: Float?
    /// 组件的所有图形的z值。控制图形的前后顺序。z值小的图形会被z值大的图形覆盖。
    /// z相比zlevel优先级更低，而且不会创建新的 Canvas。
    public var z: Float?
    /// grid 组件离容器左侧的距离。
    public var left: Position?
    /// grid 组件离容器上侧的距离。
    public var top: Position?
    /// grid 组件离容器右侧的距离。
    public var right: Position?
    /// grid 组件离容器下侧的距离。
    public var bottom: Position?
    /// grid 组件的宽度。默认自适应。
    public var width: LengthValue?
    /// grid 组件的高度。默认自适应。
    public var height: LengthValue?
    /// grid 区域是否包含坐标轴的刻度标签，在无法确定坐标轴标签的宽度，容器又比较小无法预留较多空间的时候，可以设为 true 防止标签溢出容器。
    public var containLabel: Bool?
    /// 网格背景色，默认透明。
    /// - Note: 注意：此配置项生效的前提是，设置了 show: true。
    public var background: Color?
    /// 网格的边框颜色。支持的颜色格式同 backgroundColor。 
    /// - Note: 注意：此配置项生效的前提是，设置了 show: true。
    public var borderColor: Color?
    /// 网格的边框线宽。
    /// - Note:  注意：此配置项生效的前提是，设置了 show: true。
    public var borderWidth: Float?
    
    /// 图形阴影的模糊大小。该属性配合 shadowColor,shadowOffsetX, shadowOffsetY 一起设置图形的阴影效果
    /// 注意：此配置项生效的前提是，设置了 show: true 以及值不为 tranparent 的背景色 backgroundColor。
    public var shadowBlur: Float?
    /// 阴影颜色
    /// 注意：此配置项生效的前提是，设置了 show: true。
    public var shadowColor: Color?
    /// 阴影水平方向上的偏移距离。
    /// 注意：此配置项生效的前提是，设置了 show: true。
    public var shadowOffsetX: Float?
    /// 阴影水平方向上的偏移距离。
    /// 注意：此配置项生效的前提是，设置了 show: true。
    public var shadowOffsetY: Float?

    public init() { }
}

extension Grid: Enumable {
    public enum Enums {
        case show(Bool), zlevel(Float), z(Float), x(Position), left(Position), y(Position), top(Position), x2(Position), right(Position), y2(Position), bottom(Position), width(LengthValue), height(LengthValue), containLabel(Bool), background(Color), borderColor(Color), borderWidth(Float), shadowBlur(Float), shadowColor(Color), shadowOffsetX(Float), shadowOffsetY(Float)
    }
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .show(show):
                self.show = show
            case let .zlevel(zlevel):
                self.zlevel = zlevel
            case let .z(z):
                self.z = z
            case let .left(left):
                self.left = left
            case let .x(left):
                self.left = left
            case let .top(top):
                self.top = top
            case let .y(top):
                self.top = top
            case let .right(right):
                self.right = right
            case let .x2(right):
                self.right = right
            case let .bottom(bottom):
                self.bottom = bottom
            case let .y2(bottom):
                self.bottom = bottom
            case let .width(width):
                self.width = width
            case let .height(height):
                self.height = height
            case let .containLabel(containLabel):
                self.containLabel = containLabel
            case let .background(background):
                self.background = background
            case let .borderColor(color):
                self.borderColor = color
            case let .borderWidth(width):
                self.borderWidth = width
            case let .shadowBlur(blur):
                self.shadowBlur = blur
            case let .shadowColor(color):
                self.shadowColor = color
            case let .shadowOffsetX(x):
                self.shadowOffsetX = x
            case let .shadowOffsetY(y):
                self.shadowOffsetY = y
            }
        }
    }
}

extension Grid: Mappable {
    public func mapping(_ map: Mapper) {
        map["show"] = show
        map["zlevel"] = zlevel
        map["z"] = z
        map["left"] = left
        map["top"] = top
        map["right"] = right
        map["bottom"] = bottom
        map["width"] = width
        map["height"] = height
        map["containLabel"] = containLabel
        map["background"] = background
        map["borderColor"] = borderColor
        map["borderWidth"] = borderWidth
        map["shadowBlur"] = shadowBlur
        map["shadowColor"] = shadowColor
        map["shadowOffsetX"] = shadowOffsetX
        map["shadowOffsetY"] = shadowOffsetY
    }
}
