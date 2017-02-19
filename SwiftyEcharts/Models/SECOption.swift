//
//  SECOption.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 09/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public struct SECOption : SECTextful, SECAnimatable {
    public var title: SECTitle?
    public var legend: SECLegend?
    public var grid: SECOneOrMore<SECGrid>?
    public var xAxis: [SECAxis]?
    public var yAxis: [SECAxis]?
    public var polar: SECPolar?
    public var radiusAxis: [SECRadiusAxis]?
    public var angleAxis: [SECAngleAxis]?
    public var radar: SECRadar?
    public var dataZoom: [SECDataZoom]?
    public var visualMap: SECVisualMap?
    public var tooltip: SECTooltip?
    public var toolbox: SECToolbox?
    public var brush: SECBrush?
    public var geo: SECGeo?
    public var parallel: SECParallel?
    public var parallelAxis: [SECParallelAxis]?
    public var singleAxis: [SECSingleAxis]?
    public var timeline: SECTimeline?
    public var graphic: [SECGraphic]?
    public var series: [SECSeries]?
    public var color: [SECColor]?
    public var backgroundColor: SECColor?
    public var textStyle: SECTextStyle?
    
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
    
    public init() { }
}

extension SECOption : SECEnumable {
    public enum Enums {
        case title(SECTitle), legend(SECLegend), grid(SECGrid), grids([SECGrid]), xAxis([SECAxis]), yAxis([SECAxis]), polar(SECPolar), radiusAxis([SECRadiusAxis]), angleAxis([SECAngleAxis]), radar(SECRadar), dataZoom([SECDataZoom]), visualMap(SECVisualMap), tooltip(SECTooltip), toolbox(SECToolbox), brush(SECBrush), geo(SECGeo), parallel(SECParallel), parallelAxis([SECParallelAxis]), singleAxis([SECSingleAxis]), timeline(SECTimeline), graphic([SECGraphic]), series([SECSeries]), color([SECColor]), backgroundColor(SECColor), textStyle(SECTextStyle), animation(Bool), animationThreshold(Float), animationDuration(SECTime), animationEasing(SECAnimation), animationDelay(SECTime), animationDurationUpdate(SECTime), animationEasingUpdate(SECAnimation), animationDelayUpdate(SECTime)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
        for ele in elements {
            switch ele {
            case let .title(title):
                self.title = title
            case let .legend(legend):
                self.legend = legend
            case let .grid(grid):
                self.grid = SECOneOrMore(one: grid)
            case let .grids(grids):
                self.grid = SECOneOrMore(more: grids)
            case let .xAxis(xAxis):
                self.xAxis = xAxis
            case let .yAxis(yAxis):
                self.yAxis = yAxis
            case let .polar(polar):
                self.polar = polar
            case let .radiusAxis(radiusAxis):
                self.radiusAxis = radiusAxis
            case let .angleAxis(angleAxis):
                self.angleAxis = angleAxis
            case let .radar(radar):
                self.radar = radar
            case let .dataZoom(dataZoom):
                self.dataZoom = dataZoom
            case let .visualMap(visualMap):
                self.visualMap = visualMap
            case let .tooltip(tooltip):
                self.tooltip = tooltip
            case let .toolbox(toolbox):
                self.toolbox = toolbox
            case let .brush(brush):
                self.brush = brush
            case let .geo(geo):
                self.geo = geo
            case let .parallel(parallel):
                self.parallel = parallel
            case let .parallelAxis(parallelAxis):
                self.parallelAxis = parallelAxis
            case let .singleAxis(singleAxis):
                self.singleAxis = singleAxis
            case let .timeline(timeline):
                self.timeline = timeline
            case let .graphic(graphic):
                self.graphic = graphic
            case let .series(series):
                self.series = series
            case let .color(color):
                self.color = color
            case let .backgroundColor(backgroundColor):
                self.backgroundColor = backgroundColor
            case let .textStyle(textStyle):
                self.textStyle = textStyle
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

extension SECOption : SECMappable {
    public func mapping(map: SECMap) {
        map["title"] = title
        map["legend"] = legend
        map["grid"] = grid
        map["xAxis"] = xAxis
        map["yAxis"] = yAxis
        map["polar"] = polar
        map["radiusAxis"] = radiusAxis
        map["angleAxis"] = angleAxis
        map["radar"] = radar
        map["dataZoom"] = dataZoom
        map["visualMap"] = visualMap
        map["tooltip"] = tooltip
        map["toolbox"] = toolbox
        map["brush"] = brush
        map["geo"] = geo
        map["parallel"] = parallel
        map["parallelAxis"] = parallelAxis
        map["singleAxis"] = singleAxis
        map["timeline"] = timeline
        map["graphic"] = graphic
        map["series"] = series
        map["color"] = color
        map["backgroundColor"] = backgroundColor
        map["textStyle"] = textStyle
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
