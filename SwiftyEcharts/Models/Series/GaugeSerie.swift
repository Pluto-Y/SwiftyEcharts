//
//  GaugeSerie.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 07/03/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 仪表盘
///
/// 示例：http://echarts.baidu.com/demo.html#gauge-car
public final class GaugeSerie: Serie, Animatable {
    
    /// 仪表盘指针。
    public final class Pointer: Displayable {
        /// 是否显示指针。
        public var show: Bool?
        /// 指针长度，可以是绝对数值，也可以是相对于半径的半分比。
        public var length: LengthValue?
        /// 指针宽度。
        public var width: Float?
        
        public init() { }
    }
    
    /// 仪表盘标题。
    public final class Title: Displayable {
        /// 是否显示标题。
        public var show: Bool?
        /// 相对于仪表盘中心的偏移位置，数组第一项是水平方向的偏移，第二项是垂直方向的偏移。可以是绝对的数值，也可以是相对于仪表盘半径的百分比。
        public var offsetCenter: Point?
        /// 标题文字样式
        public var textStyle: TextStyle?
        
        public init() { }
    }
    
    /// 仪表盘详情，用于显示数据。
    public final class Detail: Displayable, Formatted, Borderable, Textful {
        /// 是否显示详情。
        public var show: Bool?
        /// 详情宽度。
        public var width: Float?
        /// 详情高度。
        public var height: Float?
        /// 详情背景色。
        public var backgroundColor: Color?
        /// 详情边框宽度。
        public var borderWidth: Float?
        /// 详情边框颜色。
        public var borderColor: Color?
        /// 相对于仪表盘中心的偏移位置，数组第一项是水平方向的偏移，第二项是垂直方向的偏移。可以是绝对的数值，也可以是相对于仪表盘半径的百分比。
        public var offsetCenter: Point?
        /// 格式化函数或者字符串
        ///
        ///     formatter: function (value) {
        ///         return value.toFixed(0);
        ///     }
        public var formatter: Formatter?
        /// 详情文字样式
        public var textStyle: TextStyle?
        
        public init() { }
    }
    
    /// 类型
    public var type: SerieType {
        return .gauge
    }
    
    /// 系列名称，用于tooltip的显示，legend 的图例筛选，在 setOption 更新数据和配置项时用于指定对应的系列。
    public var name: String?
    /// 仪表盘半径，可以是相对于容器高宽中较小的一项的一半的百分比，也可以是绝对的数值。
    ///
    /// {{ use partial-legend-hover-link }}
    public var radius: LengthValue?
    /// 仪表盘的中心
    public var center: Point?
    /// 仪表盘起始角度。圆心 正右手侧为0度，正上方为90度，正左手侧为180度。
    public var startAngle: Float?
    /// 仪表盘结束角度。
    public var endAngle: Float?
    /// 仪表盘刻度是否是顺时针增长。
    public var clockwise: Bool?
    /// 最小的数据值，映射到 minAngle。
    public var min: Float?
    /// 最大的数据值，映射到 maxAngle。
    public var max: Float?
    /// 仪表盘刻度的分割段数。
    public var splitNumber: Float?
    /// 仪表盘轴线相关配置。
    public var axisLine: AxisLine?
    /// 分隔线样式。
    public var splitLine: SplitLine?
    /// 刻度样式。
    public var axisTick: AxisTick?
    /// 刻度标签。
    public var axisLabel: AxisLabel?
    /// 仪表盘指针。
    public var pointer: Pointer?
    /// 仪表盘指针样式。
    public var itemStyle: ItemStyle?
    /// 仪表盘标题。
    public var title: Title?
    /// 仪表盘详情，用于显示数据。
    public var detail: Detail?
    /// 图表标注。
    public var markPoint: MarkPoint?
    /// 图表标线。
    public var markLine: MarkLine?
    /// 图表标域，常用于标记图表中某个范围的数据，例如标出某段时间投放了广告。
    public var markArea: MarkArea?
    /// 数据
    public var data: [Jsonable]?
    /// 图形是否不响应和触发鼠标事件，默认为 false，即响应和触发鼠标事件。
    public var silent: Bool?
    
    // MARK: Animatable
    public var animation: Bool?
    public var animationThreshold: Float?
    public var animationDuration: Time?
    public var animationEasing: EasingFunction?
    public var animationDelay: Time?
    public var animationDurationUpdate: Time?
    public var animationEasingUpdate: EasingFunction?
    public var animationDelayUpdate: Time?
    /// 本系列特定的 tooltip 设定。
    public var tooltip: Tooltip?
    
    public init() { }
}

public typealias GaugeSeriePointer = GaugeSerie.Pointer
public typealias GaugeSerieTitle = GaugeSerie.Title
public typealias GaugeSerieDetail = GaugeSerie.Detail

extension GaugeSeriePointer: Enumable {
    public enum Enums {
        case show(Bool), length(LengthValue), width(Float)
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
            case let .width(width):
                self.width = width
            }
        }
    }
}

extension GaugeSeriePointer: Mappable {
    public func mapping(_ map: Mapper) {
        map["show"] = show
        map["length"] = length
        map["width"] = width
    }
}

extension GaugeSerieTitle: Enumable {
    public enum Enums {
        case show(Bool), offsetCenter(Point), textStyle(TextStyle)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .show(show):
                self.show = show
            case let .offsetCenter(offsetCenter):
                self.offsetCenter = offsetCenter
            case let .textStyle(textStyle):
                self.textStyle = textStyle
            }
        }
    }
}

extension GaugeSerieTitle: Mappable {
    public func mapping(_ map: Mapper) {
        map["show"] = show
        map["offsetCenter"] = offsetCenter
        map["textStyle"] = textStyle
    }
}

extension GaugeSerieDetail: Enumable {
    public enum Enums {
        case show(Bool), width(Float), height(Float), backgroundColor(Color), borderWidth(Float), borderColor(Color), offsetCenter(Point), formatter(Formatter), textStyle(TextStyle)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .show(show):
                self.show = show
            case let .width(width):
                self.width = width
            case let .height(height):
                self.height = height
            case let .backgroundColor(backgroundColor):
                self.backgroundColor = backgroundColor
            case let .borderWidth(borderWidth):
                self.borderWidth = borderWidth
            case let .borderColor(borderColor):
                self.borderColor = borderColor
            case let .offsetCenter(offsetCenter):
                self.offsetCenter = offsetCenter
            case let .formatter(formatter):
                self.formatter = formatter
            case let .textStyle(textStyle):
                self.textStyle = textStyle
            }
        }
    }
}

extension GaugeSerieDetail: Mappable {
    public func mapping(_ map: Mapper) {
        map["show"] = show
        map["width"] = width
        map["height"] = height
        map["backgroundColor"] = backgroundColor
        map["borderWidth"] = borderWidth
        map["borderColor"] = borderColor
        map["offsetCenter"] = offsetCenter
        map["formatter"] = formatter
        map["textStyle"] = textStyle
    }
}

extension GaugeSerie: Enumable {
    public enum Enums {
        case name(String), radius(LengthValue), center(Point), startAngle(Float), endAngle(Float), clockwise(Bool), min(Float), max(Float), splitNumber(Float), axisLine(AxisLine), splitLine(SplitLine), axisTick(AxisTick), axisLabel(AxisLabel), pointer(Pointer), itemStyle(ItemStyle), title(Title), detail(Detail), markPoint(MarkPoint), markLine(MarkLine), markArea(MarkArea), data([Jsonable]), silent(Bool), animation(Bool), animationThreshold(Float), animationDuration(Time), animationEasing(EasingFunction), animationDelay(Time), animationDurationUpdate(Time), animationEasingUpdate(EasingFunction), animationDelayUpdate(Time), tooltip(Tooltip)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .name(name):
                self.name = name
            case let .radius(radius):
                self.radius = radius
            case let .center(center):
                self.center = center
            case let .startAngle(startAngle):
                self.startAngle = startAngle
            case let .endAngle(endAngle):
                self.endAngle = endAngle
            case let .clockwise(clockwise):
                self.clockwise = clockwise
            case let .min(min):
                self.min = min
            case let .max(max):
                self.max = max
            case let .splitNumber(splitNumber):
                self.splitNumber = splitNumber
            case let .axisLine(axisLine):
                self.axisLine = axisLine
            case let .splitLine(splitLine):
                self.splitLine = splitLine
            case let .axisTick(axisTick):
                self.axisTick = axisTick
            case let .axisLabel(axisLabel):
                self.axisLabel = axisLabel
            case let .pointer(pointer):
                self.pointer = pointer
            case let .itemStyle(itemStyle):
                self.itemStyle = itemStyle
            case let .title(title):
                self.title = title
            case let .detail(detail):
                self.detail = detail
            case let .markPoint(markPoint):
                self.markPoint = markPoint
            case let .markLine(markLine):
                self.markLine = markLine
            case let .markArea(markArea):
                self.markArea = markArea
            case let .data(data):
                self.data = data
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
            case let .tooltip(tooltip):
                self.tooltip = tooltip
            }
        }
    }
}

extension GaugeSerie: Mappable {
    public func mapping(_ map: Mapper) {
        map["type"] = type
        map["name"] = name
        map["radius"] = radius
        map["center"] = center
        map["startAngle"] = startAngle
        map["endAngle"] = endAngle
        map["clockwise"] = clockwise
        map["min"] = min
        map["max"] = max
        map["splitNumber"] = splitNumber
        map["axisLine"] = axisLine
        map["splitLine"] = splitLine
        map["axisTick"] = axisTick
        map["axisLabel"] = axisLabel
        map["pointer"] = pointer
        map["itemStyle"] = itemStyle
        map["title"] = title
        map["detail"] = detail
        map["markPoint"] = markPoint
        map["markLine"] = markLine
        map["markArea"] = markArea
        map["data"] = data
        map["silent"] = silent
        map["animation"] = animation
        map["animationThreshold"] = animationThreshold
        map["animationDuration"] = animationDuration
        map["animationEasing"] = animationEasing
        map["animationDelay"] = animationDelay
        map["animationDurationUpdate"] = animationDurationUpdate
        map["animationEasingUpdate"] = animationEasingUpdate
        map["animationDelayUpdate"] = animationDelayUpdate
        map["tooltip"] = tooltip
    }
}
