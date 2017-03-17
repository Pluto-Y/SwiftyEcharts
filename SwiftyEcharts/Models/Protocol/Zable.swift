//
//  Zable.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 07/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public protocol Zable {
    /// 所有图形的 zlevel 值。
    ///
    /// zlevel用于 Canvas 分层，不同zlevel值的图形会放置在不同的 Canvas 中，Canvas 分层是一种常见的优化手段。我们可以把一些图形变化频繁（例如有动画）的组件设置成一个单独的zlevel。需要注意的是过多的 Canvas 会引起内存开销的增大，在手机端上需要谨慎使用以防崩溃。
    /// 
    /// zlevel 大的 Canvas 会放在 zlevel 小的 Canvas 的上面。0000000
    var zlevel: Float? { get set }
    /// 组件的所有图形的z值。控制图形的前后顺序。z值小的图形会被z值大的图形覆盖。
    ///
    /// z相比zlevel优先级更低，而且不会创建新的 Canvas。
    var z: Float? { get set }
}
