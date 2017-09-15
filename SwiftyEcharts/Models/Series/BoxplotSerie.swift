//
//  BoxplotSerie.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 14/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// Boxplot 中文可以称为『箱形图』、『盒须图』、『盒式图』、『盒状图』、『箱线图』。使用者知道概念，不需介绍。
///
/// 示例如下：
///
/// http://echarts.baidu.com/gallery/editor.html?c=boxplot-light-velocity
///
/// 也支持多个 series 在同一个坐标系中，参见 例子。
public final class BoxplotSerie: Serie, Zable {
    
    public final class Data {
        /// 数据项名称。
        public var name: String?
        /// 数据值。
        ///
        /// [min,  Q1,  median (or Q2),  Q3,  max]
        public var value: [Jsonable]?
        /// boxplot 图形样式，有 normal 和 emphasis 两个状态。normal 是图形在默认状态下的样式；emphasis 是图形在高亮状态下的样式，比如在鼠标悬浮或者图例联动高亮时。
        public var itemStyle: ItemStyle?
        
        public init() {}
    }
    
    /// 类型
    public var type: SerieType {
        return .boxplot
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
    ///
    /// - 'vertical'：竖直排布各个 box。
    ///
    /// 默认值根据当前坐标系状况决定：如果 category 轴为横轴，则水平排布；否则竖直排布；如果没有 category 轴则水平排布。
    public var layout: Orient?
    /// box 的宽度的上下限。数组的意思是：[min, max]。
    ///
    /// 可以是绝对数值，如 [7, 50]，也可以是百分比，如 ['40%', '90%']。百分比的意思是，最大可能宽度（bandWidth）的百分之多少。
    public var boxWidth: Range?
    /// boxplot 图形样式，有 normal 和 emphasis 两个状态。normal 是图形在默认状态下的样式；emphasis 是图形在高亮状态下的样式，比如在鼠标悬浮或者图例联动高亮时。
    public var itemStyle: ItemStyle?
    /// 数据格式是如下的二维数组。
    ///
    ///     [
    ///         [655, 850, 940, 980, 1175],
    ///         [672.5, 800, 845, 885, 1012.5],
    ///         [780, 840, 855, 880, 940],
    ///         [621.25, 767.5, 815, 865, 1011.25],
    ///         { // 数据项也可以是 Object，从而里面能含有对此数据项的特殊设置。
    ///             value: [713.75, 807.5, 810, 870, 963.75],
    ///             itemStyle: {...}
    ///         },
    ///         ...
    ///     ]
    ///
    /// 二维数组的每一数组项（上例中的每行）是渲染一个box，它含有五个量值，依次是：
    ///
    ///     [min,  Q1,  median (or Q2),  Q3,  max]
    ///
    /// 数据的处理
    ///
    /// ECharts 并不内置对原始数据的处理，输入给 boxplot 的数据须是如上五个统计结果量值。
    ///
    /// 但是 ECharts 也额外提供了简单的 原始数据处理函数，如这个 例子 使用了echarts.dataTool.prepareBoxplotData 来进行简单的数据统计。
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
    ///      animationDuration: function (idx) {
    ///      // 越往后的数据延迟越大
    ///      return idx * 100;
    ///      }
    public var animationDuration: Float?
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
    public var animationDelay: Float?
    /// 本系列特定的 tooltip 设定。
    public var tooltip: Tooltip?
    
    public init() {}
}

public typealias BoxplotSerieData = BoxplotSerie.Data

extension BoxplotSerieData: Enumable {
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

extension BoxplotSerieData: Mappable {
    public func mapping(_ map: Mapper) {
        map["name"] = name
        map["value"] = value
        map["itemStyle"] = itemStyle
    }
}

extension BoxplotSerie: Enumable {
    public enum Enums {
        case coordinateSystem(CoordinateSystem), xAxisIndex(UInt8), yAxisIndex(UInt8), name(String), legendHoverLink(Bool), hoverAnimation(Bool), layout(Orient), boxWidth(Range), itemStyle(ItemStyle), data([Jsonable]), markPoint(MarkPoint), markLine(MarkLine), markArea(MarkArea), zlevel(Float), z(Float), silent(Bool), animationDuration(Float), animationEasing(EasingFunction), animationDelay(Float), tooltip(Tooltip)
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
            case let .boxWidth(boxWidth):
                self.boxWidth = boxWidth
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
            case let .tooltip(tooltip):
                self.tooltip = tooltip
            }
        }
    }
}

extension BoxplotSerie: Mappable {
    public func mapping(_ map: Mapper) {
        map["type"] = type
        map["coordinateSystem"] = coordinateSystem
        map["xAxisIndex"] = xAxisIndex
        map["yAxisIndex"] = yAxisIndex
        map["name"] = name
        map["legendHoverLink"] = legendHoverLink
        map["hoverAnimation"] = hoverAnimation
        map["layout"] = layout
        map["boxWidth"] = boxWidth
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
        map["tooltip"] = tooltip
    }
}
