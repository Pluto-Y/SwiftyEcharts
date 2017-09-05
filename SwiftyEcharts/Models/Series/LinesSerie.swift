//
//  LinesSerie.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 06/03/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 线图
///
/// 用于带有起点和终点信息的线数据的绘制，主要用于地图上的航线，路线的可视化。
///
/// ECharts 2.x 里会用地图上的 markLine 去绘制迁徙效果，在 ECharts 3 里建议使用单独的 lines 类型图表。
///
/// 迁徙示例：
///
/// http://echarts.baidu.com/gallery/editor.html?c=geo-lines
public final class LinesSerie: Serie, Zable, Animatable {
    
    /// 线特效的配置，见示例 模拟迁徙 和 北京公交路线
    ///
    /// 注意： 所有带有尾迹特效的图表需要单独放在一个层，也就是需要单独设置 zlevel，同时建议关闭该层的动画（animation: false）。不然位于同个层的其它系列的图形，和动画的标签也会产生不必要的残影
    public final class Effect {
        /// 是否显示特效。
        public var show: Bool?
        /// 特效动画的时间，单位为 s。
        public var period: Float?
        /// 配置特效图形的移动动画是否是固定速度，单位像素/秒，设置为大于 0 的值后会忽略 period 配置项。
        public var constantSpeed: Float?
        /// 特效图形的标记。
        public var symbol: OneOrMore<Symbol>?
        /// 特效标记的大小，可以设置成诸如 10 这样单一的数字，也可以用数组分开表示高和宽，例如 [20, 10] 表示标记宽为20，高为10。
        public var symbolSize: FunctionOrFloatOrPair?
        /// 特效标记的颜色，默认取 lineStyle.normal.color。
        public var color: Color?
        /// 特效尾迹的长度。取从 0 到 1 的值，数值越大尾迹越长。
        public var trailLength: Float?
        /// 是否循环显示特效。
        public var loop: Bool?
        
        public init() { }
    }
    
    /// 线数据集。
    ///
    /// 注： 为了更好点支持多段线的配置，线数据的格式在 3.2.0 做了一定调整，如下：
    ///
    ///     // 3.2.0 之前
    ///     // [{
    ///     //    // 起点坐标
    ///     //    coord: [120, 66],
    ///     //    lineStyle: { normal: {} }
    ///     // }, {
    ///     //    // 终点坐标
    ///     //    coord: [122, 67]
    ///     // }]
    ///
    ///     // 从 3.2.0 起改为如下配置
    ///     {
    ///         coords: [
    ///             [120, 66],  // 起点
    ///             [122, 67]   // 终点
    ///             ...         // 如果 polyline 为 true 还可以设置更多的点
    ///         ],
    ///         // 统一的样式设置
    ///         lineStyle: {
    ///             normal: {}
    ///         }
    ///     }
    public final class Data {
        /// 数据名称
        public var name: String?
        /// 一个包含两个到多个二维坐标的数组。在 polyline 设置为 true 时支持多于两个的坐标。
        public var coords: [Point]?
        /// 单个数据（单条线）的样式设置。
        public var lineStyle: LineStyle?
        /// 单个数据（单条线）的标签设置。在 polyline 设置为 true 时无效。
        public var label: EmphasisLabel?
        
        public init() { }
    }
    
    /// 类型
    public var type: SerieType {
        return .lines
    }
    
    /// 系列名称，用于tooltip的显示，legend 的图例筛选，在 setOption 更新数据和配置项时用于指定对应的系列。
    public var name: String?
    /// 该系列使用的坐标系，可选：cartesian2d, geo
    public var coordinateSystem: CoordinateSystem?
    /// 使用的 x 轴的 index，在单个图表实例中存在多个 x 轴的时候有用。
    public var xAxisIndex: UInt8?
    /// 使用的 y 轴的 index，在单个图表实例中存在多个 y轴的时候有用。
    public var yAxisIndex: UInt8?
    /// 使用的地理坐标系的 index，在单个图表实例中存在多个地理坐标系的时候有用。
    public var geoIndex: UInt8?
    /// 是否是多段线。
    ///
    /// 默认为 false，只能用于绘制只有两个端点的线段，线段可以通过 lineStyle.normal.curveness 配置为曲线。
    ///
    /// 如果该配置项为 true，则可以在 data.coords 中设置多于 2 个的顶点用来绘制多段线，在绘制路线轨迹的时候比较有用，见示例 北京公交路线，设置为多段线后 lineStyle.normal.curveness 无效。
    public var polyline: Bool?
    /// 线特效的配置，见示例 模拟迁徙 和 北京公交路线
    ///
    /// 注意： 所有带有尾迹特效的图表需要单独放在一个层，也就是需要单独设置 zlevel，同时建议关闭该层的动画（animation: false）。不然位于同个层的其它系列的图形，和动画的标签也会产生不必要的残影。
    public var effect: Effect?
    /// 是否启用大规模线图的优化，在数据图形特别多的时候（>=5k）可以开启。
    ///
    /// 开启后配合 largeThreshold 在数据量大于指定阈值的时候对绘制进行优化。
    ///
    /// 缺点：优化后不能自定义设置单个数据项的样式，不能启用 effect。
    public var large: Bool?
    /// 开启绘制优化的阈值。
    public var largeThreshold: Float?
    /// 线两端的标记类型，可以是一个数组分别指定两端，也可以是单个统一指定。 具体支持的格式可以参考 标线的 symbol
    public var symbol: OneOrMore<Symbol>?
    /// 线两端的标记大小，可以是一个数组分别指定两端，也可以是单个统一指定。 注意： 这里无法像一般的 symbolSize 那样通过数组分别指定高宽。
    public var symbolSize: FunctionOrFloatOrPair?
    /// 线条样式。
    public var lineStyle: EmphasisLineStyle?
    /// 标签相关配置。在 polyline 设置为 true 时无效。
    public var label: EmphasisLabel?
    /// 线数据集。
    ///
    /// 注： 为了更好点支持多段线的配置，线数据的格式在 3.2.0 做了一定调整，如下：
    ///
    ///     // 3.2.0 之前
    ///     // [{
    ///     //    // 起点坐标
    ///     //    coord: [120, 66],
    ///     //    lineStyle: { normal: {} }
    ///     // }, {
    ///     //    // 终点坐标
    ///     //    coord: [122, 67]
    ///     // }]
    ///     
    ///     // 从 3.2.0 起改为如下配置
    ///     {
    ///         coords: [
    ///             [120, 66],  // 起点
    ///             [122, 67]   // 终点
    ///             ...         // 如果 polyline 为 true 还可以设置更多的点
    ///         ],
    ///         // 统一的样式设置
    ///         lineStyle: {
    ///             normal: {}
    ///         }
    ///     }
    public var data: [Jsonable]?
    /// 图表标注。
    public var markPoint: MarkPoint?
    /// 图表标线。
    public var markLine: MarkLine?
    /// 图表标域，常用于标记图表中某个范围的数据，例如标出某段时间投放了广告。
    public var markArea: MarkArea?
    /// MARK: Zable
    public var zlevel: Float?
    public var z: Float?
    
    /// 图形是否不响应和触发鼠标事件，默认为 false，即响应和触发鼠标事件。
    public var silent: Bool?
    
    /// MARK: Animatable
    public var animation: Bool?
    public var animationThreshold: Float?
    public var animationDuration: Time?
    public var animationEasing: EasingFunction?
    public var animationDelay: Time?
    public var animationDurationUpdate: Time?
    public var animationEasingUpdate: EasingFunction?
    public var animationDelayUpdate: Time?
    
    public init() { }
}

public typealias LinesSerieData = LinesSerie.Data

extension LinesSerie.Effect: Enumable {
    public enum Enums {
        case show(Bool), period(Float), constantSpeed(Float), symbol(Symbol), symbolSize(FunctionOrFloatOrPair), color(Color), trailLength(Float), loop(Bool)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .show(show):
                self.show = show
            case let .period(period):
                self.period = period
            case let .constantSpeed(constantSpeed):
                self.constantSpeed = constantSpeed
            case let .symbol(symbol):
                self.symbol = OneOrMore(one: symbol)
            case let .symbolSize(symbolSize):
                self.symbolSize = symbolSize
            case let .color(color):
                self.color = color
            case let .trailLength(trailLength):
                self.trailLength = trailLength
            case let .loop(loop):
                self.loop = loop
            }
        }
    }
}

extension LinesSerie.Effect: Mappable {
    public func mapping(_ map: Mapper) {
        map["show"] = show
        map["period"] = period
        map["constantSpeed"] = constantSpeed
        map["symbol"] = symbol
        map["symbolSize"] = symbolSize
        map["color"] = color
        map["trailLength"] = trailLength
        map["loop"] = loop
    }
}

extension LinesSerieData: Enumable {
    public enum Enums {
        case name(String), coords([Point]), lineStyle(LineStyle), label(EmphasisLabel)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .name(name):
                self.name = name
            case let .coords(coords):
                self.coords = coords
            case let .lineStyle(lineStyle):
                self.lineStyle = lineStyle
            case let .label(label):
                self.label = label
            }
        }
    }
}

extension LinesSerieData: Mappable {
    public func mapping(_ map: Mapper) {
        map["name"] = name
        map["coords"] = coords
        map["lineStyle"] = lineStyle
        map["label"] = label
    }
}

extension LinesSerie: Enumable {
    public enum Enums {
        case name(String), coordinateSystem(CoordinateSystem), xAxisIndex(UInt8), yAxisIndex(UInt8), geoIndex(UInt8), polyline(Bool), effect(Effect), large(Bool), largeThreshold(Float), symbol(Symbol), symbols([Symbol]), symbolSize(FunctionOrFloatOrPair), lineStyle(EmphasisLineStyle), label(EmphasisLabel), data([Jsonable]), markPoint(MarkPoint), markLine(MarkLine), markArea(MarkArea), zlevel(Float), z(Float), silent(Bool), animation(Bool), animationThreshold(Float), animationDuration(Time), animationEasing(EasingFunction), animationDelay(Time), animationDurationUpdate(Time), animationEasingUpdate(EasingFunction), animationDelayUpdate(Time)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
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
            case let .geoIndex(geoIndex):
                self.geoIndex = geoIndex
            case let .polyline(polyline):
                self.polyline = polyline
            case let .effect(effect):
                self.effect = effect
            case let .large(large):
                self.large = large
            case let .largeThreshold(largeThreshold):
                self.largeThreshold = largeThreshold
            case let .symbol(symbol):
                self.symbol = OneOrMore(one: symbol)
            case let .symbols(symbols):
                self.symbol = OneOrMore(more: symbols)
            case let .symbolSize(symbolSize):
                self.symbolSize = symbolSize
            case let .lineStyle(lineStyle):
                self.lineStyle = lineStyle
            case let .label(label):
                self.label = label
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

extension LinesSerie: Mappable {
    public func mapping(_ map: Mapper) {
        map["type"] = type
        map["name"] = name
        map["coordinateSystem"] = coordinateSystem
        map["xAxisIndex"] = xAxisIndex
        map["yAxisIndex"] = yAxisIndex
        map["geoIndex"] = geoIndex
        map["polyline"] = polyline
        map["effect"] = effect
        map["large"] = large
        map["largeThreshold"] = largeThreshold
        map["symbol"] = symbol
        map["symbolSize"] = symbolSize
        map["lineStyle"] = lineStyle
        map["label"] = label
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
