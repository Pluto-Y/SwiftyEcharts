//
//  Polar.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 25/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 极坐标系，可以用于散点图和折线图。每个极坐标系拥有一个角度轴和一个半径轴。
public final class Polar: Zable {
    /// 所有图形的 zlevel 值。
    ///
    /// zlevel用于 Canvas 分层，不同zlevel值的图形会放置在不同的 Canvas 中，Canvas 分层是一种常见的优化手段。我们可以把一些图形变化频繁（例如有动画）的组件设置成一个单独的zlevel。需要注意的是过多的 Canvas 会引起内存开销的增大，在手机端上需要谨慎使用以防崩溃。
    ///
    /// zlevel 大的 Canvas 会放在 zlevel 小的 Canvas 的上面。
    public var zlevel: Float?
    /// 组件的所有图形的z值。控制图形的前后顺序。z值小的图形会被z值大的图形覆盖。
    ///
    /// z相比zlevel优先级更低，而且不会创建新的 Canvas。
    public var z: Float?
    /// 极坐标系的中心（圆心）坐标，数组的第一项是横坐标，第二项是纵坐标。
    ///
    /// 支持设置成百分比，设置成百分比时第一项是相对于容器宽度，第二项是相对于容器高度。
    ///
    /// 使用示例：
    ///
    ///     // 设置成绝对的像素值
    ///     center: [400, 300]
    ///     // 设置成相对的百分比
    ///     center: [50%, 50%]
    public var center: Point?
    /// 极坐标系的半径，数组的第一项是内半径，第二项是外半径。
    ///
    /// 支持设置成百分比，相对于容器高宽中较小的一项的一半。
    public var radius: Range?
}

extension Polar: Enumable {
    public enum Enums {
        case zlevel(Float), z(Float), center(Point), radius(Range)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .zlevel(zlevel):
                self.zlevel = zlevel
            case let .z(z):
                self.z = z
            case let .center(center):
                self.center = center
            case let .radius(radius):
                self.radius = radius
            }
        }
    }
}

extension Polar: Mappable {
    public func mapping(_ map: Mapper) {
        map["zlevel"] = zlevel
        map["z"] = z
        map["center"] = center
        map["radius"] = radius
    }
}
