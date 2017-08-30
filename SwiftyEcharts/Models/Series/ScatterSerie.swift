//
//  ScatterSerie.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 25/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public final class ScatterSerie: Serie, Symbolized, Animatable, Zable {
    
    /// 数据项目
    public final class Data: Symbolized {
        /// 数据项名称。
        public var name: String?
        /// 数据项值。
        public var value: String?
        // MARK: Symbolized
        public var symbol: OneOrMore<Symbol>?
        public var symbolSize: FunctionOrFloatOrPair?
        public var symbolRotate: Float?
        public var symbolOffset: Point?
        /// 数据项文字样式
        public var label: EmphasisLabel?
        /// 单个数据点（气泡）的样式设置。
        public var itemStyle: ItemStyle?
    }
    
    /// 类型
    public var type: SerieType {
        return .scatter
    }
    /// 系列名称，用于tooltip的显示，legend 的图例筛选，在 setOption 更新数据和配置项时用于指定对应的系列。
    public var name: String?
    /// 该系列使用的坐标系，可选：
    /// - cartesian2d: 使用二维的直角坐标系（也称笛卡尔坐标系），通过 xAxisIndex, yAxisIndex指定相应的坐标轴组件。
    /// - polar: 使用极坐标系，通过 polarIndex 指定相应的极坐标组件
    /// - geo: 使用地理坐标系，通过 geoIndex 指定相应的地理坐标系组件
    public var coordinateSystem: CoordinateSystem?
    /// 使用的 x 轴的 index，在单个图表实例中存在多个 x 轴的时候有用。
    public var xAxisIndex: UInt8?
    /// 使用的 y 轴的 index，在单个图表实例中存在多个 y轴的时候有用。
    public var yAxisIndex: UInt8?
    /// 使用的极坐标系的 index，在单个图表实例中存在多个极坐标系的时候有用。
    public var polarIndex: UInt8?
    /// 使用的地理坐标系的 index，在单个图表实例中存在多个地理坐标系的时候有用。
    public var geoIndex: UInt8?
    /// 是否开启鼠标 hover 的提示动画效果。
    public var hoverAnimation: Bool?
    /// 是否启用图例 hover 时的联动高亮。
    public var legendHoverLink: Bool?
    /// 标记的图形。
    public var symbol: OneOrMore<Symbol>?
    /// 标记的大小，可以设置成诸如 10 这样单一的数字，也可以用数组分开表示宽和高，例如 [20, 10] 表示标记宽为20，高为10。
    /// 如果需要每个数据的图形大小不一样，可以设置为如下格式的回调函数：
    /// (value: Array|number, params: Object) => number|Array
    /// 其中第一个参数 value 为 data 中的数据值。第二个参数params 是其它的数据项参数。
    public var symbolSize: FunctionOrFloatOrPair?
    /// 标记的旋转角度。注意在 markLine 中当 symbol 为 'arrow' 时会忽略 symbolRotate 强制设置为切线的角度。
    public var symbolRotate: Float?
    /// 标记相对于原本位置的偏移。默认情况下，标记会居中置放在数据对应的位置，但是如果 symbol 是自定义的矢量路径或者图片，就有可能不希望 symbol 居中。这时候可以使用该配置项配置 symbol 相对于原本居中的偏移，可以是绝对的像素值，也可以是相对的百分比。
    /// 例如 [0, '50%'] 就是把自己向上移动了一半的位置，在 symbol 图形是气泡的时候可以让图形下端的箭头对准数据点。
    public var symbolOffset: Point?
    /// 是否开启大规模散点图的优化，在数据图形特别多的时候（>=5k）可以开启。
    /// 开启后配合 largeThreshold 在数据量大于指定阈值的时候对绘制进行优化。
    /// 缺点：优化后不能自定义设置单个数据项的样式。
    public var large: Bool?
    /// 开启绘制优化的阈值。
    public var largeThreshold: Float?
    /// 图形上的文本标签，可用于说明图形的一些数据信息，比如值，名称等，label选项在 ECharts 2.x 中放置于itemStyle.normal下，在 ECharts 3 中为了让整个配置项结构更扁平合理，label 被拿出来跟 itemStyle 平级，并且跟 itemStyle 一样拥有 normal, emphasis 两个状态。
    public var label: EmphasisLabel?
    /// 图形样式，有 normal 和 emphasis 两个状态。normal 是图形在默认状态下的样式；emphasis 是图形在高亮状态下的样式，比如在鼠标悬浮或者图例联动高亮时。
    public var itemStyle: ItemStyle?
    /// 系列中的数据内容数组。数组项通常为具体的数据项。
    ///
    /// 通常来说，数据用一个二维数组表示。如下，每一列被称为一个『维度』。
    ///
    ///     series: [{
    ///         data: [
    ///             // 维度X   维度Y   其他维度 ...
    ///             [  3.4,    4.5,   15,   43],
    ///             [  4.2,    2.3,   20,   91],
    ///             [  10.8,   9.5,   30,   18],
    ///             [  7.2,    8.8,   18,   57]
    ///         ]
    ///     }]
    ///
    /// - 在 直角坐标系 (grid) 中『维度X』和『维度Y』会默认对应于 xAxis 和 yAxis。
    /// - 在 极坐标系 (polar) 中『维度X』和『维度Y』会默认对应于 radiusAxis 和 angleAxis。
    /// - 后面的其他维度是可选的，可以在别处被使用，例如：
    ///     - 在 visualMap 中可以将一个或多个维度映射到颜色，大小等多个图形属性上。
    ///     - 在 series.symbolSize 中可以使用回调函数，基于某个维度得到 symbolSize 值。
    ///     - 使用 tooltip.formatter 或 series.label.normal.formatter 可以把其他维度的值展示出来。
    ///
    /// 特别地，当只有一个轴为类目轴（axis.type 为 'category'）的时候，数据可以简化用一个一维数组表示。例如：
    ///
    ///     xAxis: {
    ///         data: ['a', 'b', 'm', 'n']
    ///     },
    ///     series: [{
    ///         // 与 xAxis.data 一一对应。
    ///         data: [23,  44,  55,  19]
    ///         // 它其实是下面这种形式的简化：
    ///         // data: [[0, 23], [1, 44], [2, 55], [3, 19]]
    ///     }]
    /// 
    /// 『值』与 轴类型 的关系：
    ///
    /// - 当某维度对应于数值轴（axis.type 为 'value' 或者 'log'）的时候：其值可以为 number（例如 12）。（也可以容忍 string 形式的 number，例如 '12'）
    /// - 当某维度对应于类目轴（axis.type 为 'category'）的时候：其值须为类目的『序数』（从 0 开始）或者类目的『字符串值』。例如：
    ///     xAxis: {
    ///         type: 'category',
    ///         data: ['星期一', '星期二', '星期三', '星期四']
    ///     },
    ///     yAxis: {
    ///         type: 'category',
    ///         data: ['a', 'b', 'm', 'n', 'p', 'q']
    ///     },
    ///     series: [{
    ///         data: [
    ///             // xAxis    yAxis
    ///             [  0,        0,    2  ], // 意思是此点位于 xAxis: '星期一', yAxis: 'a'。
    ///             [  '星期四',  2,    1  ], // 意思是此点位于 xAxis: '星期四', yAxis: 'm'。
    ///             [  2,       'p',   2  ], // 意思是此点位于 xAxis: '星期三', yAxis: 'p'。
    ///             [  3,        3,    5  ]
    ///         ]
    ///     }]
    ///
    /// 双类目轴的示例可以参考 Github Punchcard 示例。
    ///
    /// - 当某维度对应于时间轴（type 为 'time'）的时候：值可以为一个时间戳（如 1484141700832），或者一个 Date 实例，或者字符串形式的值（如 '2012-12-12'，'2012/12/12'）。
    /// 
    /// 当需要对个别数据进行个性化定义时：
    ///
    /// 数组项可用对象，其中的 value 像表示具体的数值，如：
    ///     [
    ///         12,
    ///         34,
    ///         {
    ///             value : 56,
    ///             //自定义标签样式，仅对该数据项有效
    ///             label: {},
    ///             //自定义特殊 itemStyle，仅对该数据项有效
    ///             itemStyle:{}
    ///         },
    ///         10
    ///     ]
    ///     // 或
    ///     [
    ///         [12, 33],
    ///         [34, 313],
    ///         {
    ///             value: [56, 44],
    ///             label: {},
    ///             itemStyle:{}
    ///         },
    ///         [10, 33]
    ///     ]
    /// 
    /// 空值：
    ///
    /// 当某数据不存在时（ps：不存在不代表值为 0），可以用 '-'。
    ///
    /// 例如，无数据在折线图中可表现为该点是断开的，在其它图中可表示为图形不存在。
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
}

public typealias ScatterSerieData = ScatterSerie.Data

extension ScatterSerieData: Enumable {
    public enum Enums {
        case name(String), value(String), symbol(Symbol), symbolSize(FunctionOrFloatOrPair), symbolRotate(Float), symbolOffset(Point), label(EmphasisLabel), itemStyle(ItemStyle)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .name(name):
                self.name = name
            case let .value(value):
                self.value = value
            case let .symbol(symbol):
                self.symbol = OneOrMore(one: symbol)
            case let .symbolSize(symbolSize):
                self.symbolSize = symbolSize
            case let .symbolRotate(symbolRotate):
                self.symbolRotate = symbolRotate
            case let .symbolOffset(symbolOffset):
                self.symbolOffset = symbolOffset
            case let .label(label):
                self.label = label
            case let .itemStyle(itemStyle):
                self.itemStyle = itemStyle
            }
        }
    }
}

extension ScatterSerieData: Mappable {
    public func mapping(_ map: Mapper) {
        map["name"] = name
        map["value"] = value
        map["symbol"] = symbol
        map["symbolSize"] = symbolSize
        map["symbolRotate"] = symbolRotate
        map["symbolOffset"] = symbolOffset
        map["label"] = label
        map["itemStyle"] = itemStyle
    }
}

extension ScatterSerie: Enumable {
    public enum Enums {
        case name(String), coordinateSystem(CoordinateSystem), xAxisIndex(UInt8), yAxisIndex(UInt8), polarIndex(UInt8), geoIndex(UInt8), hoverAnimation(Bool), legendHoverLink(Bool), symbol(Symbol), symbolSize(FunctionOrFloatOrPair), symbolRotate(Float), symbolOffset(Point), large(Bool), largeThreshold(Float), label(EmphasisLabel), itemStyle(ItemStyle), data([Jsonable]), markPoint(MarkPoint), markLine(MarkLine), markArea(MarkArea), zlevel(Float), z(Float), silent(Bool), animation(Bool), animationThreshold(Float), animationDuration(Time), animationEasing(EasingFunction), animationDelay(Time), animationDurationUpdate(Time), animationEasingUpdate(EasingFunction), animationDelayUpdate(Time)
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
            case let .polarIndex(polarIndex):
                self.polarIndex = polarIndex
            case let .geoIndex(geoIndex):
                self.geoIndex = geoIndex
            case let .hoverAnimation(hoverAnimation):
                self.hoverAnimation = hoverAnimation
            case let .legendHoverLink(legendHoverLink):
                self.legendHoverLink = legendHoverLink
            case let .symbol(symbol):
                self.symbol = OneOrMore(one: symbol)
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

extension ScatterSerie: Mappable {
    public func mapping(_ map: Mapper) {
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
