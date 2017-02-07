//
//  SECScatterSerie.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 25/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public struct SECScatterSerie : SECSeries, SECSymbolized, SECAnimatable, SECZable {
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
    public var data: [SECJsonable]?
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

extension SECScatterSerie : SECEnumable {
    public enum Enums {
        case name(String), coordinateSystem(SECCoordinateSystem), xAxisIndex(UInt8), yAxisIndex(UInt8), polarIndex(UInt8), geoIndex(UInt8), hoverAnimation(Bool), legendHoverLink(Bool), symbol(SECSymbol), symbolSize(Float), symbolRotate(Float), symbolOffset([Float]), large(Bool), largeThreshold(Float), label(SECFormattedLabel), itemStyle(SECItemStyle), data([SECJsonable]), markPoint(SECMarkPoint), markLine(SECMarkLine), markArea(SECMarkArea), zlevel(Float), z(Float), silent(Bool), animation(Bool), animationThreshold(Float), animationDuration(SECTime), animationEasing(SECAnimation), animationDelay(SECTime), animationDurationUpdate(SECTime), animationEasingUpdate(SECAnimation), animationDelayUpdate(SECTime)
    }
    
    public typealias ContentEnum = Enums

    public init(_ elements: [Enums]) {
        for ele in elements {
            switch ele {
            case let .name(name):
                self.name = name
            case let .coordinateSystem(coordinateSystem):
                self.coordinateSystem = coordinateSystem
            case let .xAxisIndex(xAxisIndex):
                self.xAxisIndex = xAxisIndex
            case let .yAxisIndex(yAxisIndex):
                self.yAxisIndex = yAxisIndex
            case let .polarIndex(polarIndex):
                self.polarIndex = polarIndex
            case let .geoIndex(geoIndex):
                self.geoIndex = geoIndex
            case let .hoverAnimation(hoverAnimation):
                self.hoverAnimation = hoverAnimation
            case let .legendHoverLink(legendHoverLink):
                self.legendHoverLink = legendHoverLink
            case let .symbol(symbol):
                self.symbol = symbol
            case let .symbolSize(symbolSize):
                self.symbolSize = symbolSize
            case let .symbolRotate(symbolRotate):
                self.symbolRotate = symbolRotate
            case let .symbolOffset(symbolOffset):
                self.symbolOffset = symbolOffset
            case let .large(large):
                self.large = large
            case let .largeThreshold(largeThreshold):
                self.largeThreshold = largeThreshold
            case let .label(label):
                self.label = label
            case let .itemStyle(itemStyle):
                self.itemStyle = itemStyle
            case let .data(data):
                self.data = data
            case let .markPoint(markPoint):
                self.markPoint = markPoint
            case let .markLine(markLine):
                self.markLine = markLine
            case let .markArea(markArea):
                self.markArea = markArea
            case let .zlevel(zlevel):
                self.zlevel = zlevel
            case let .z(z):
                self.z = z
            case let .silent(silent):
                self.silent = silent
            case let .animation(animation):
                self.animation = animation
            case let .animationThreshold(animationThreshold):
                self.animationThreshold = animationThreshold
            case let .animationDuration(animationDuration):
                self.animationDuration = animationDuration
            case let .animationEasing(animationEasing):
                self.animationEasing = animationEasing
            case let .animationDelay(animationDelay):
                self.animationDelay = animationDelay
            case let .animationDurationUpdate(animationDurationUpdate):
                self.animationDurationUpdate = animationDurationUpdate
            case let .animationEasingUpdate(animationEasingUpdate):
                self.animationEasingUpdate = animationEasingUpdate
            case let .animationDelayUpdate(animationDelayUpdate):
                self.animationDelayUpdate = animationDelayUpdate
            }
        }
    }
}

extension SECScatterSerie : SECMappable {
    public func mapping(map: SECMap) {
        map["type"] = type
        map["name"] = name
        map["coordinateSystem"] = coordinateSystem
        map["xAxisIndex"] = xAxisIndex
        map["yAxisIndex"] = yAxisIndex
        map["polarIndex"] = polarIndex
        map["geoIndex"] = geoIndex
        map["hoverAnimation"] = hoverAnimation
        map["legendHoverLink"] = legendHoverLink
        map["symbol"] = symbol
        map["symbolSize"] = symbolSize
        map["symbolRotate"] = symbolRotate
        map["symbolOffset"] = symbolOffset
        map["large"] = large
        map["largeThreshold"] = largeThreshold
        map["label"] = label
        map["itemStyle"] = itemStyle
        map["data"] = data
        map["markPoint"] = markPoint
        map["markLine"] = markLine
        map["markArea"] = markArea
        map["zlevel"] = zlevel
        map["z"] = z
        map["silent"] = silent
        map["animation"] = animation
        map["animationThreshold"] = animationThreshold
        map["animationDuration"] = animationDuration
        map["animationEasing"] = animationEasing
        map["animationDelay"] = animationDelay
        map["animationDurationUpdate"] = animationDurationUpdate
        map["animationEasingUpdate"] = animationEasingUpdate
        map["animationDelayUpdate"] = animationDelayUpdate
    }
}
