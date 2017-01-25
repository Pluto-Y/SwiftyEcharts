//
//  SECScatterSerie.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 25/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public struct SECScatterSerie : SECSeries, SECSymbolized, SECAnimatable {
    public var type: SECSerieType {
        return .scatter
    }
    public var name: String?
    public var coordinateSystem: SECCoordinateSystem?
    public var xAxisIndex: UInt8?
    public var yAxisIndex: UInt8?
    public var polarIndex: UInt8?
    public var geoIndex: UInt8?
    public var hoverAnimation: Bool?
    public var legendHoverLink: Bool?
    public var symbol: SECSymbol?
    public var symbolSize: Float?
    public var symbolRotate: Float?
    public var symbolOffset: [Float]?
    public var large: Bool?
    public var largeThreshold: Float?
    public var label: SECFormattedLabel?
    public var itemStyle: SECItemStyle?
    public var data: [Any]?
    public var markPoint: SECMarkPoint?
    public var markLine: SECMarkLine?
    public var markArea: SECMarkArea?
    public var zlevel: Float?
    public var z: Float?
    public var silent: Bool?
    /// 是否开启动画。
    public var animation: Bool?
    /// 是否开启动画的阈值，当单个系列显示的图形数量大于这个阈值时会关闭动画。
    public var animationThreshold: Float?
    /// 初始动画的时长，支持回调函数，可以通过每个数据返回不同的 delay 时间实现更戏剧的初始动画效果：
    ///
    ///     animationDuration: function (idx) {
    ///         // 越往后的数据延迟越大
    ///         return idx * 100;
    ///     }
    public var animationDuration: SECTime?
    /// 初始动画的缓动效果。不同的缓动效果可以参考
    public var animationEasing: SECAnimation?
    /// 初始动画的延迟，支持回调函数，可以通过每个数据返回不同的 delay 时间实现更戏剧的初始动画效果。
    ///
    /// 如下示例：
    ///
    ///     animationDuration: function (idx) {
    ///         // 越往后的数据延迟越大
    ///         return idx * 100;
    ///     }
    public var animationDelay: SECTime?
    /// 数据更新动画的时长。
    /// 支持回调函数，可以通过每个数据返回不同的 delay 时间实现更戏剧的更新动画效果：
    ///     animationDurationUpdate: function (idx) {
    ///         // 越往后的数据延迟越大
    ///         return idx * 100;
    ///     }
    public var animationDurationUpdate: SECTime?
    /// 数据更新动画的缓动效果。
    public var animationEasingUpdate: SECAnimation?
    /// 数据更新动画的延迟，支持回调函数，可以通过每个数据返回不同的 delay 时间实现更戏剧的更新动画效果。
    /// 如下示例：
    ///
    ///     animationDelayUpdate: function (idx) {
    ///         // 越往后的数据延迟越大
    ///         return idx * 100;
    ///     }
    public var animationDelayUpdate: SECTime?
}
