//
//  HeatmapSerie.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 14/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 热力图
///
/// 热力图主要通过颜色去表现数值的大小，必须要配合 visualMap 组件使用。
///
/// 可以应用在直角坐标系以及地理坐标系上，这两个坐标系上的表现形式相差很大，直角坐标系上必须要使用两个类目轴。
///
/// 下面分别是直角坐标系和地理坐标系上应用的例子：
///
/// 直角坐标系：http://echarts.baidu.com/gallery/editor.html?c=heatmap-cartesian
///
/// 地理坐标系：http://echarts.baidu.com/gallery/editor.html?c=heatmap-map
public final class HeatmapSerie: Serie, Zable {
    
    public final class Data {
        /// 数据项名称。
        public var name: String?
        /// 数据项值。
        public var value: [Jsonable]?
        /// 在直角坐标系(coordinateSystem: 'cartesian2d')上有效。
        public var label: EmphasisLabel?
        /// 单个数据点的样式设置，在直角坐标系(coordinateSystem: 'cartesian2d')上有效。
        public var itemStyle: ItemStyle?
        
        public init() {}
    }
    
    /// 类型
    public var type: SerieType {
        return .heatmap
    }
    
    /// 系列名称，用于tooltip的显示，legend 的图例筛选，在 setOption 更新数据和配置项时用于指定对应的系列。
    public var name: String?
    /// 该系列使用的坐标系。
    public var coordinateSystem: CoordinateSystem?
    /// 使用的 x 轴的 index，在单个图表实例中存在多个 x 轴的时候有用。
    public var xAxisIndex: UInt8?
    /// 使用的 y 轴的 index，在单个图表实例中存在多个 y轴的时候有用。
    public var yAxisIndex: UInt8?
    /// 使用的地理坐标系的 index，在单个图表实例中存在多个地理坐标系的时候有用。
    public var geoIndex: UInt8?
    /// 使用的日历坐标系的 index，在单个图表实例中存在多个日历坐标系的时候有用。
    public var calendarIndex: UInt8?
    /// 每个点模糊的大小，在地理坐标系(coordinateSystem: 'geo')上有效。
    public var blurSize: Float?
    /// 最小的透明度，在地理坐标系(coordinateSystem: 'geo')上有效。
    public var minOpacity: Float?
    /// 最大的透明度，在地理坐标系(coordinateSystem: 'geo')上有效。
    public var maxOpacity: Float?
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
    ///
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
    /// - 当某维度对应于时间轴（type 为 'time'）的时候： 值可以为一个时间戳（如 1484141700832），或者一个 Date 实例，或者字符串形式的值（如 '2012-12-12'，'2012/12/12'）。
    /// 
    /// 当需要对个别数据进行个性化定义时：
    ///
    /// 数组项可用对象，其中的 value 像表示具体的数值，如：
    ///
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
    /// 当某数据不存在时（ps：不存在不代表值为 0），可以用 '-' 或者 null 或者 undefined 或者 NaN 表示。
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
    /// 图表文本标签
    public var label: EmphasisLabel?
    /// 图形样式，有 normal 和 emphasis 两个状态。normal 是图形在默认状态下的样式；emphasis 是图形在高亮状态下的样式，比如在鼠标悬浮或者图例联动高亮时。
    public var itemStyle: ItemStyle?
    
    public init() {}
}

public typealias HeatmapSerieData = HeatmapSerie.Data

extension HeatmapSerieData: Enumable {
    public enum Enums {
        case name(String), value([Jsonable]), label(EmphasisLabel), itemStyle(ItemStyle)
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
            case let .label(label):
                self.label = label
            case let .itemStyle(itemStyle):
                self.itemStyle = itemStyle
            }
        }
    }
}

extension HeatmapSerieData: Mappable {
    public func mapping(_ map: Mapper) {
        map["name"] = name
        map["value"] = value
        map["label"] = label
        map["itemStyle"] = itemStyle
    }
}

extension HeatmapSerie: Enumable {
    public enum Enums {
        case name(String), coordinateSystem(CoordinateSystem), xAxisIndex(UInt8), yAxisIndex(UInt8), geoIndex(UInt8), calendarIndex(UInt8), blurSize(Float), minOpacity(Float), maxOpacity(Float), data([Jsonable]), markPoint(MarkPoint), markLine(MarkLine), markArea(MarkArea), zlevel(Float), z(Float), silent(Bool), label(EmphasisLabel), itemStyle(ItemStyle)
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
            case let .calendarIndex(calendarIndex):
                self.calendarIndex = calendarIndex
            case let .blurSize(blurSize):
                self.blurSize = blurSize
            case let .minOpacity(minOpacity):
                self.minOpacity = minOpacity
            case let .maxOpacity(maxOpacity):
                self.maxOpacity = maxOpacity
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
            case let .label(label):
                self.label = label
            case let .itemStyle(itemStyle):
                self.itemStyle = itemStyle
            }
        }
    }
}

extension HeatmapSerie: Mappable {
    public func mapping(_ map: Mapper) {
        map["type"] = type
        map["name"] = name
        map["coordinateSystem"] = coordinateSystem
        map["xAxisIndex"] = xAxisIndex
        map["yAxisIndex"] = yAxisIndex
        map["geoIndex"] = geoIndex
        map["calendarIndex"] = calendarIndex
        map["blurSize"] = blurSize
        map["minOpacity"] = minOpacity
        map["maxOpacity"] = maxOpacity
        map["data"] = data
        map["markPoint"] = markPoint
        map["markLine"] = markLine
        map["markArea"] = markArea
        map["zlevel"] = zlevel
        map["z"] = z
        map["silent"] = silent
        map["label"] = label
        map["itemStyle"] = itemStyle
    }
}
