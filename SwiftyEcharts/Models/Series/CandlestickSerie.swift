//
//  CandlestickSerie.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 14/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// Candlestick 即我们常说的 K线图。
///
/// 在 ECharts3 中，同时支持 'candlestick' 和 'k'这两种 'series.type'（'k' 会被自动转为 'candlestick'）。
///
/// 示例如下：
///
/// http://echarts.baidu.com/gallery/editor.html?c=candlestick-sh
///
/// 关于『涨』『跌』的颜色：
///
/// 不同国家或地区对于 K线图 的颜色定义不一样，可能是『红涨绿跌』或『红涨蓝跌』（如大陆、台湾、日本、韩国等），可能是『绿涨红跌』（如西方国家、香港、新加坡等）。K线图也不一定要用红蓝、红绿来表示涨跌，也可以是『有色/无色』等表示方法。
///
/// 默认配置项，采用的是『红涨蓝跌』。如果想更改这个颜色配置，在这些配置项中更改即可：
///
/// - series-candlestick.itemStyle.normal.color：阳线填充色（即『涨』）
/// - series-candlestick.itemStyle.normal.color0：阴线填充色（即『跌』）
/// - series-candlestick.itemStyle.normal.borderColor：阳线边框色（即『涨』）
/// - series-candlestick.itemStyle.normal.borderColor0：阴线边框色（即『跌』）
public final class CandlestickSerie: Serie, Zable {
    
    public final class Data {
        /// 数据项名称。
        public var name: String?
        /// 数据项值。
        ///
        ///     [open, close, lowest, highest] （即：[开盘值, 收盘值, 最低值, 最高值]）
        public var value: [Jsonable]?
        /// candlestick 图形样式，有 normal 和 emphasis 两个状态。normal 是图形在默认状态下的样式；emphasis 是图形在高亮状态下的样式，比如在鼠标悬浮或者图例联动高亮时。
        public var itemStyle: ItemStyle?
        
        public init() {}
    }
    
    /// 类型
    public var type: SerieType {
        return .candlestick
    }
    
    /// 该系列使用的坐标系。
    public var coordinateSystem: CoordinateSystem?
    /// 使用的 x 轴的 index，在单个图表实例中存在多个 x 轴的时候有用。
    public var xAxisIndex: UInt8?
    /// 使用的 y 轴的 index，在单个图表实例中存在多个 y轴的时候有用。
    public var yAxisIndex: UInt8?
    /// 系列名称，用于tooltip的显示，legend 的图例筛选，在 setOption 更新数据和配置项时用于指定对应的系列。
    public var name: String?
    /// 是否启用图例 hover 时的联动高亮。
    public var legendHoverLink: Bool?
    /// 是否开启 hover 在 box 上的动画效果。
    public var hoverAnimation: Bool?
    /// 布局方式，可选值：
    ///
    /// - 'horizontal'：水平排布各个 box。
    /// - 'vertical'：竖直排布各个 box。
    ///
    /// 默认值根据当前坐标系状况决定：如果 category 轴为横轴，则水平排布；否则竖直排布；如果没有 category 轴则水平排布。
    public var layout: Orient?
    /// 指定柱宽度。可以使用绝对数值（如 10）或百分比（如 '20%'，表示 band width 的百分之多少）。默认自适应。
    public var barWidth: Float?
    /// 指定柱最大宽度。可以使用绝对数值（如 10）或百分比（如 '20%'，表示 band width 的百分之多少）。默认自适应。
    public var barMinWidth: Float?
    /// 指定柱最小宽度。可以使用绝对数值（如 10）或百分比（如 '20%'，表示 band width 的百分之多少）。默认自适应。
    public var barMaxWidth: Float?
    /// candlestick 图形样式，有 normal 和 emphasis 两个状态。normal 是图形在默认状态下的样式；emphasis 是图形在高亮状态下的样式，比如在鼠标悬浮或者图例联动高亮时。
    public var itemStyle: ItemStyle?
    /// 数据格式是如下的二维数组。
    ///
    ///     [
    ///         [2320.26, 2320.26, 2287.3,  2362.94],
    ///         [2300,    2291.3,  2288.26, 2308.38],
    ///         { // 数据项也可以是 Object，从而里面能含有对此数据项的特殊设置。
    ///             value: [2300,    2291.3,  2288.26, 2308.38],
    ///             itemStyle: {...}
    ///         },
    ///         ...
    ///     ]
    ///
    /// 二维数组的每一数组项（上例中的每行）是渲染一个box，它含有四个量值，依次是：
    ///
    ///     [open, close, lowest, highest] （即：[开盘值, 收盘值, 最低值, 最高值]）
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
    /// 初始动画的时长，支持回调函数，可以通过每个数据返回不同的 delay 时间实现更戏剧的初始动画效果：
    ///
    ///     animationDuration: function (idx) {
    ///         // 越往后的数据延迟越大
    ///         return idx * 100;
    ///     }
    public var animationDuration: Time?
    /// 初始动画的缓动效果。不同的缓动效果可以参考 缓动示例。
    public var animationEasing: EasingFunction?
    /// 初始动画的延迟，支持回调函数，可以通过每个数据返回不同的 delay 时间实现更戏剧的初始动画效果。
    ///
    /// 如下示例：
    ///
    ///     animationDelay: function (idx) {
    ///         // 越往后的数据延迟越大
    ///         return idx * 100;
    ///     }
    ///
    /// 也可以看该示例
    public var animationDelay: Time?
}

public typealias CandlestickSerieData = CandlestickSerie.Data

extension CandlestickSerieData: Enumable {
    public enum Enums {
        case name(String), value([Jsonable]), itemStyle(ItemStyle)
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
            case let .itemStyle(itemStyle):
                self.itemStyle = itemStyle
            }
        }
    }
}

extension CandlestickSerieData: Mappable {
    public func mapping(_ map: Mapper) {
        map["name"] = name
        map["value"] = value
        map["itemStyle"] = itemStyle
    }
}

extension CandlestickSerie: Enumable {
    public enum Enums {
        case coordinateSystem(CoordinateSystem), xAxisIndex(UInt8), yAxisIndex(UInt8), name(String), legendHoverLink(Bool), hoverAnimation(Bool), layout(Orient), barWidth(Float), barMinWidth(Float), barMaxWidth(Float), itemStyle(ItemStyle), data([Jsonable]), markPoint(MarkPoint), markLine(MarkLine), markArea(MarkArea), zlevel(Float), z(Float), silent(Bool), animationDuration(Time), animationEasing(EasingFunction), animationDelay(Time)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .coordinateSystem(coordinateSystem):
                self.coordinateSystem = coordinateSystem
            case let .xAxisIndex(xAxisIndex):
                self.xAxisIndex = xAxisIndex
            case let .yAxisIndex(yAxisIndex):
                self.yAxisIndex = yAxisIndex
            case let .name(name):
                self.name = name
            case let .legendHoverLink(legendHoverLink):
                self.legendHoverLink = legendHoverLink
            case let .hoverAnimation(hoverAnimation):
                self.hoverAnimation = hoverAnimation
            case let .layout(layout):
                self.layout = layout
            case let .barWidth(barWidth):
                self.barWidth = barWidth
            case let .barMinWidth(barMinWidth):
                self.barMinWidth = barMinWidth
            case let .barMaxWidth(barMaxWidth):
                self.barMaxWidth = barMaxWidth
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
            case let .animationDuration(animationDuration):
                self.animationDuration = animationDuration
            case let .animationEasing(animationEasing):
                self.animationEasing = animationEasing
            case let .animationDelay(animationDelay):
                self.animationDelay = animationDelay
            }
        }
    }
}

extension CandlestickSerie: Mappable {
    public func mapping(_ map: Mapper) {
        map["type"] = type
        map["coordinateSystem"] = coordinateSystem
        map["xAxisIndex"] = xAxisIndex
        map["yAxisIndex"] = yAxisIndex
        map["name"] = name
        map["legendHoverLink"] = legendHoverLink
        map["hoverAnimation"] = hoverAnimation
        map["layout"] = layout
        map["barWidth"] = barWidth
        map["barMinWidth"] = barMinWidth
        map["barMaxWidth"] = barMaxWidth
        map["itemStyle"] = itemStyle
        map["data"] = data
        map["markPoint"] = markPoint
        map["markLine"] = markLine
        map["markArea"] = markArea
        map["zlevel"] = zlevel
        map["z"] = z
        map["silent"] = silent
        map["animationDuration"] = animationDuration
        map["animationEasing"] = animationEasing
        map["animationDelay"] = animationDelay
    }
}
