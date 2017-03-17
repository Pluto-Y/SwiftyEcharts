//
//  Option.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 09/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public struct Option: Textful, Animatable {
    public var title: Title?
    public var legend: Legend?
    public var grid: OneOrMore<Grid>?
    public var xAxis: OneOrMore<SECAxis>?
    public var yAxis: OneOrMore<SECAxis>?
    public var polar: Polar?
    public var radiusAxis: [SECRadiusAxis]?
    public var angleAxis: [SECAngleAxis]?
    public var radar: OneOrMore<Radar>?
    public var dataZoom: [SECDataZoom]?
    public var visualMap: SECVisualMap?
    public var tooltip: Tooltip?
    public var toolbox: Toolbox?
    public var brush: Brush?
    public var geo: Geo?
    public var parallel: Parallel?
    public var parallelAxis: [SECParallelAxis]?
    public var singleAxis: OneOrMore<SECSingleAxis>?
    public var timeline: Timeline?
    public var graphic: [SECGraphic]?
    public var series: [Serie]?
    public var color: [Color]?
    public var backgroundColor: Color?
    public var textStyle: TextStyle?
    
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
    public var animationDuration: Time?
    /// 初始动画的缓动效果。不同的缓动效果可以参考
    public var animationEasing: EasingFunction?
    /// 初始动画的延迟，支持回调函数，可以通过每个数据返回不同的 delay 时间实现更戏剧的初始动画效果。
    ///
    /// 如下示例：
    ///
    ///     animationDuration: function (idx) {
    ///         // 越往后的数据延迟越大
    ///         return idx * 100;
    ///     }
    public var animationDelay: Time?
    /// 数据更新动画的时长。
    /// 支持回调函数，可以通过每个数据返回不同的 delay 时间实现更戏剧的更新动画效果：
    ///     animationDurationUpdate: function (idx) {
    ///         // 越往后的数据延迟越大
    ///         return idx * 100;
    ///     }
    public var animationDurationUpdate: Time?
    /// 数据更新动画的缓动效果。
    public var animationEasingUpdate: EasingFunction?
    /// 数据更新动画的延迟，支持回调函数，可以通过每个数据返回不同的 delay 时间实现更戏剧的更新动画效果。
    /// 如下示例：
    ///
    ///     animationDelayUpdate: function (idx) {
    ///         // 越往后的数据延迟越大
    ///         return idx * 100;
    ///     }
    public var animationDelayUpdate: Time?
    
    public init() { }
}

extension Option: Enumable {
    public enum Enums {
        case title(Title), legend(Legend), grid(Grid), grids([Grid]), xAxis(SECAxis), xAxises([SECAxis]), yAxis(SECAxis), yAxises([SECAxis]), polar(Polar), radiusAxis([SECRadiusAxis]), angleAxis([SECAngleAxis]), radar(Radar), radars([Radar]), dataZoom([SECDataZoom]), visualMap(SECVisualMap), tooltip(Tooltip), toolbox(Toolbox), brush(Brush), geo(Geo), parallel(Parallel), parallelAxis([SECParallelAxis]), singleAxis(SECSingleAxis), singleAxises([SECSingleAxis]), timeline(Timeline), graphic([SECGraphic]), series([Serie]), color([Color]), backgroundColor(Color), textStyle(TextStyle), animation(Bool), animationThreshold(Float), animationDuration(Time), animationEasing(EasingFunction), animationDelay(Time), animationDurationUpdate(Time), animationEasingUpdate(EasingFunction), animationDelayUpdate(Time)
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
                self.grid = OneOrMore(one: grid)
            case let .grids(grids):
                self.grid = OneOrMore(more: grids)
            case let .xAxis(xAxis):
                self.xAxis = OneOrMore(one: xAxis)
            case let .xAxises(xAxises):
                self.xAxis = OneOrMore(more: xAxises)
            case let .yAxis(yAxis):
                self.yAxis = OneOrMore(one: yAxis)
            case let .yAxises(yAxises):
                self.yAxis = OneOrMore(more: yAxises)
            case let .polar(polar):
                self.polar = polar
            case let .radiusAxis(radiusAxis):
                self.radiusAxis = radiusAxis
            case let .angleAxis(angleAxis):
                self.angleAxis = angleAxis
            case let .radar(radar):
                self.radar = OneOrMore(one: radar)
            case let .radars(radars):
                self.radar = OneOrMore(more: radars)
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
                self.singleAxis = OneOrMore(one: singleAxis)
            case let .singleAxises(singleAxises):
                self.singleAxis = OneOrMore(more: singleAxises)
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

extension Option: Mappable {
    public func mapping(map: Mapper) {
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
