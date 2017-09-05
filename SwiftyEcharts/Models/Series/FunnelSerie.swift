//
//  FunnelSerie.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 06/03/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 漏斗图
///
/// 示例:http://echarts.baidu.com/gallery/editor.html?c=funnel
public final class FunnelSerie: Serie, Animatable {
    
    /// 排序，ascending: 升序， descending: 降序
    public enum Sort: String, Jsonable {
        case ascending = "ascending"
        case descending = "descending"
        
        public var jsonString: String {
            return self.rawValue.jsonString
        }
    }
    
    /// 标签的视觉引导线样式，在 label 位置 设置为'left'或者'right'的时候会显示视觉引导线。
    public final class LabelLineContent {
        /// 是否显示视觉引导线。
        public var show: Bool?
        /// 视觉引导线第一段的长度。
        public var length: Float?
        /// 线条样式
        public var lineStyle: LineStyle?
        
        public init() { }
    }
    
    public final class LabelLine: Emphasisable {
        public typealias Style = LabelLineContent
        
        public var normal: Style?
        public var emphasis: Style?
        
        public init() { }
    }
    
    public final class Data {
        /// 数据项名称。
        public var name: String?
        /// 数据值。
        public var value: Float?
        /// 单个数据的标签配置。
        public var label: EmphasisLabel?
        /// 标签的视觉引导线样式
        public var labelLine: LabelLine?
        /// 图形样式，有 normal 和 emphasis 两个状态。normal 是图形在默认状态下的样式；emphasis 是图形在高亮状态下的样式，比如在鼠标悬浮或者图例联动高亮时。
        public var itemStyle: ItemStyle?
        
        public init() { }
    }
    
    /// 类型
    public var type: SerieType {
        return .funnel
    }
    
    /// 系列名称，用于tooltip的显示，legend 的图例筛选，在 setOption 更新数据和配置项时用于指定对应的系列。
    public var name: String?
    /// 指定的数据最小值。
    public var min: Float?
    /// 指定的数据最大值。
    public var max: Float?
    /// 数据最小值 min 映射的宽度。
    ///
    /// 可以是绝对的像素大小，也可以是相对布局宽度的百分比，如果需要最小值的图形并不是尖端三角，可通过设置该属性实现。
    public var minSize: LengthValue?
    /// 数据最大值 max 映射的宽度。
    ///
    /// 可以是绝对的像素大小，也可以是相对布局宽度的百分比。
    public var maxSize: LengthValue?
    /// 数据排序， 可以取 'ascending', 'descending'。
    public var sort: Sort?
    /// 数据图形间距。
    public var gap: Float?
    /// 是否启用图例 hover 时的联动高亮。
    public var legendHoverLink: Bool?
    /// 水平方向对齐布局类型，默认居中对齐，可用选项还有：'left' | 'right' | 'center'
    public var funnelAlign: Align?
    /// 漏斗图图形上的文本标签，可用于说明图形的一些数据信息，比如值，名称等，label选项在 ECharts 2.x 中放置于itemStyle.normal下，在 ECharts 3 中为了让整个配置项结构更扁平合理，label 被拿出来跟 itemStyle 平级，并且跟 itemStyle 一样拥有 normal, emphasis 两个状态。
    public var label: EmphasisLabel?
    /// 标签的视觉引导线样式，在 label 位置 设置为'left'或者'right'的时候会显示视觉引导线。
    public var labelLine: LabelLine?
    /// 图形样式，有 normal 和 emphasis 两个状态。normal 是图形在默认状态下的样式；emphasis 是图形在高亮状态下的样式，比如在鼠标悬浮或者图例联动高亮时。
    public var itemStyle: ItemStyle?
    /// 系列中的数据内容数组。数组项可以为单个数值，如：
    ///
    ///     [12, 34, 56, 10, 23]
    ///
    /// 如果需要在数据中加入其它维度给 visualMap 组件用来映射到颜色等其它图形属性。每个数据项也可以是数组，如：
    ///
    /// [[12, 14], [34, 50], [56, 30], [10, 15], [23, 10]]
    ///
    /// 这时候可以将每项数组中的第二个值指定给 visualMap 组件。
    ///
    /// 更多时候我们需要指定每个数据项的名称，这时候需要每个项为一个对象：
    ///
    ///     [{
    ///         // 数据项的名称
    ///         name: '数据1',
    ///         // 数据项值8
    ///         value: 10
    ///     }, {
    ///         name: '数据2',
    ///         value: 20
    ///     }]
    ///
    /// 需要对个别内容指定进行个性化定义时：
    ///
    ///     [{
    ///         name: '数据1',
    ///         value: 10
    ///     }, {
    ///     // 数据项名称
    ///         name: '数据2',
    ///         value : 56,
    ///         //自定义特殊 tooltip，仅对该数据项有效
    ///         tooltip:{},
    ///         //自定义特殊itemStyle，仅对该item有效
    ///         itemStyle:{}
    ///     }]
    public var data: [Jsonable]?
    /// 图表标注。
    public var markPoint: MarkPoint?
    /// 图表标线。
    public var markLine: MarkLine?
    /// 图表标域，常用于标记图表中某个范围的数据，例如标出某段时间投放了广告。
    public var markArea: MarkArea?
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

public typealias FunnelSerieData = FunnelSerie.Data

extension FunnelSerie.LabelLineContent: Enumable {
    public enum Enums {
        case show(Bool), length(Float), lineStyle(LineStyle)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .show(show):
                self.show = show
            case let .length(length):
                self.length = length
            case let .lineStyle(lineStyle):
                self.lineStyle = lineStyle
            }
        }
    }
}

extension FunnelSerie.LabelLineContent: Mappable {
    public func mapping(_ map: Mapper) {
        map["show"] = show
        map["length"] = length
        map["lineStyle"] = lineStyle
    }
}

extension FunnelSerie.LabelLine: Enumable {
    public enum Enums {
        case normal(Style), emphasis(Style)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .normal(normal):
                self.normal = normal
            case let .emphasis(emphasis):
                self.emphasis = emphasis
            }
        }
    }
}

extension FunnelSerie.LabelLine: Mappable {
    public func mapping(_ map: Mapper) {
        map["normal"] = normal
        map["emphasis"] = emphasis
    }
}

extension FunnelSerieData: Enumable {
    public enum Enums {
        case name(String), value(Float), label(EmphasisLabel), labelLine(FunnelSerie.LabelLine), itemStyle(ItemStyle)
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
            case let .labelLine(labelLine):
                self.labelLine = labelLine
            case let .itemStyle(itemStyle):
                self.itemStyle = itemStyle
            }
        }
    }
}

extension FunnelSerieData: Mappable {
    public func mapping(_ map: Mapper) {
        map["name"] = name
        map["value"] = value
        map["label"] = label
        map["labelLine"] = labelLine
        map["itemStyle"] = itemStyle
    }
}

extension FunnelSerie: Enumable {
    public enum Enums {
        case name(String), min(Float), max(Float), minSize(LengthValue), maxSize(LengthValue), sort(Sort), gap(Float), legendHoverLink(Bool), funnelAlign(Align), label(EmphasisLabel), labelLine(LabelLine), itemStyle(ItemStyle), data([Jsonable]), markPoint(MarkPoint), markLine(MarkLine), markArea(MarkArea), silent(Bool), animation(Bool), animationThreshold(Float), animationDuration(Time), animationEasing(EasingFunction), animationDelay(Time), animationDurationUpdate(Time), animationEasingUpdate(EasingFunction), animationDelayUpdate(Time)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .name(name):
                self.name = name
            case let .min(min):
                self.min = min
            case let .max(max):
                self.max = max
            case let .minSize(minSize):
                self.minSize = minSize
            case let .maxSize(maxSize):
                self.maxSize = maxSize
            case let .sort(sort):
                self.sort = sort
            case let .gap(gap):
                self.gap = gap
            case let .legendHoverLink(legendHoverLink):
                self.legendHoverLink = legendHoverLink
            case let .funnelAlign(funnelAlign):
                self.funnelAlign = funnelAlign
            case let .label(label):
                self.label = label
            case let .labelLine(labelLine):
                self.labelLine = labelLine
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

extension FunnelSerie: Mappable {
    public func mapping(_ map: Mapper) {
        map["type"] = type
        map["name"] = name
        map["min"] = min
        map["max"] = max
        map["minSize"] = minSize
        map["maxSize"] = maxSize
        map["sort"] = sort
        map["gap"] = gap
        map["legendHoverLink"] = legendHoverLink
        map["funnelAlign"] = funnelAlign
        map["label"] = label
        map["labelLine"] = labelLine
        map["itemStyle"] = itemStyle
        map["data"] = data
        map["markPoint"] = markPoint
        map["markLine"] = markLine
        map["markArea"] = markArea
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
