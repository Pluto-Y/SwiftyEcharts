//
//  Tooltip.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 01/12/2016.
//  Copyright © 2016 com.pluto-y. All rights reserved.
//


/// 提示框组件
public final class Tooltip: Borderable, Displayable, Formatted, Jsonable {
    
    /// 触发类型。
    ///
    /// - item: 数据项图形触发，主要在散点图，饼图等无类目轴的图表中使用。
    /// - axis: 坐标轴触发，主要在柱状图，折线图等会使用类目轴的图表中使用。
    /// - Note: 在 ECharts 2.x 中只支持类目轴上使用 axis trigger，在 ECharts 3 中支持在直角坐标系和极坐标系上的所有类型的轴。并且可以通过 axisPointer.axis 指定坐标轴。
    public enum Trigger: String, Jsonable {
        case item = "item"
        case axis = "axis"
        case none = "none"
        
        public var jsonString: String {
            return self.rawValue.jsonString
        }
        
        /// 提示框触发的条件
        ///
        /// - mousemove: 鼠标移动时触发
        /// - click: 鼠标点击时触发
        /// - none: 不触发，用户可以通过 action.tooltip.showTip 和 action.tooltip.hideTip 来手动触发和隐藏。
        /// - Note: 该属性为 ECharts 3.0 中新加。
        public enum TriggerOn: String, Jsonable {
            case mousemove = "mousemove"
            case click = "click"
            case none = "none"
            
            public var jsonString: String {
                return self.rawValue.jsonString
            }
        }
        
    }
    
    /// 是否显示提示框组件，包括提示框浮层和 axisPointer。
    /// - SeeAlso: `AxisPointer`
    public var show: Bool?
    /// 是否显示提示框浮层，默认显示。只需tooltip触发事件或显示axisPointer而不需要显示内容时可配置该项为false。
    public var showContent: Bool?
    /// 触发类型。
    public var trigger: Trigger?
    /// 提示框触发的条件
    public var triggerOn: Trigger.TriggerOn?
    /// 是否永远显示提示框内容，默认情况下在移出可触发提示框区域后 一定时间 后隐藏，设置为 true 可以保证一直显示提示框内容。
    /// - Note: 该属性为 ECharts 3.0 中新加。
    public var alwaysShowContent: Bool?
    /// 浮层显示的延迟，单位为 ms，默认没有延迟，也不建议设置。在 triggerOn 为 'mousemove' 时有效。
    public var showDelay: Float?
    /// 浮层隐藏的延迟，单位为 ms，在 alwaysShowContent 为 true 的时候无效。
    public var hideDelay: Float?
    /// 提示框浮层的位置，默认不设置时位置会跟随鼠标的位置。
    ///
    /// - point: 绝对位置和相对位置, 支持浮点数和百分比, [10, 5%]
    /// - inside: 鼠标所在图形的内部中心位置，只在 trigger 为'item'的时候有效。
    /// - top: 鼠标所在图形上侧，只在 trigger 为'item'的时候有效。
    /// - left: 鼠标所在图形左侧，只在 trigger 为'item'的时候有效。
    /// - right: 鼠标所在图形右侧，只在 trigger 为'item'的时候有效。
    /// - bottom: 鼠标所在图形底侧，只在 trigger 为'item'的时候有效。
    public var position: Position?
    /// 是否将 tooltip 框限制在图表的区域内。
    /// 当图表外层的 dom 被设置为 'overflow: hidden'，或者移动端窄屏，导致 tooltip 超出外界被截断时，此配置比较有用。
    public var confine: Bool?
    /// 提示框浮层的移动动画过渡时间，单位是 s，设置为 0 的时候会紧跟着鼠标移动。
    public var transitionDuration: Float?
    /// 提示框浮层内容格式器
    public var formatter: Formatter?
    /// 提示框浮层的背景颜色。
    public var backgroundColor: Color?
    /// 提示框浮层的边框颜色
    public var borderColor: Color?
    /// 提示框浮层的边框宽。
    public var borderWidth: Float?
    /// 提示框浮层内边距
    public var padding: Padding?
    /// 提示框浮层的文本样式。
    public var textStyle: TextStyle?
    /// 额外附加到浮层的 css 样式。如下为浮层添加阴影的示例：
    ///
    ///     extraCssText: 'box-shadow: 0 0 3px rgba(0, 0, 0, 0.3);'
    public var extraCssText: String?
    /// 坐标轴指示器配置项，在 trigger 为 'axis' 时有效。
    public var axisPointer: AxisPointerForTooltip?
    
    public init() { }
}

extension Tooltip: Enumable {
    public enum Enums {
        case show(Bool), showContent(Bool), trigger(Trigger), triggerOn(Trigger.TriggerOn), alwaysShowContent(Bool), showDelay(Float), hideDelay(Float), position(Position), confine(Bool), transitionDuration(Float), formatter(Formatter), backgroundColor(Color), borderColor(Color), borderWidth(Float), padding(Padding), textStyle(TextStyle), extraCssText(String), axisPointer(AxisPointerForTooltip)
    }
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .show(show):
                self.show = show
            case let .showContent(showContent):
                self.showContent = showContent
            case let .trigger(trigger):
                self.trigger = trigger
            case let .triggerOn(triggerOn):
                self.triggerOn = triggerOn
            case let .alwaysShowContent(alwaysShowContent):
                self.alwaysShowContent = alwaysShowContent
            case let .showDelay(showDelay):
                self.showDelay = showDelay
            case let .hideDelay(hideDelay):
                self.hideDelay = hideDelay
            case let .position(position):
                self.position = position
            case let .confine(confine):
                self.confine = confine
            case let .transitionDuration(transitionDuration):
                self.transitionDuration = transitionDuration
            case let .formatter(formatter):
                self.formatter = formatter
            case let .backgroundColor(backgroundColor):
                self.backgroundColor = backgroundColor
            case let .borderColor(borderColor):
                self.borderColor = borderColor
            case let .borderWidth(borderWidth):
                self.borderWidth = borderWidth
            case let .padding(padding):
                self.padding = padding
            case let .textStyle(textStyle):
                self.textStyle = textStyle
            case let .extraCssText(extraCssText):
                self.extraCssText = extraCssText
            case let .axisPointer(axisPointer):
                self.axisPointer = axisPointer
            }
        }
    }
}

extension Tooltip: Mappable {
    public func mapping(_ map: Mapper) {
        map["show"] = show
        map["showContent"] = showContent
        map["trigger"] = trigger
        map["triggerOn"] = triggerOn
        map["alwaysShowContent"] = alwaysShowContent
        map["showDelay"] = showDelay
        map["hideDelay"] = hideDelay
        map["position"] = position
        map["confine"] = confine
        map["transitionDuration"] = transitionDuration
        map["formatter"] = formatter
        map["backgroundColor"] = backgroundColor
        map["borderColor"] = borderColor
        map["borderWidth"] = borderWidth
        map["padding"] = padding
        map["textStyle"] = textStyle
        map["extraCssText"] = extraCssText
        map["axisPointer"] = axisPointer
    }
}

// MARK: - Tooltip Action
extension Tooltip {
    /// 显示提示框。
    /// 有下面两种使用方式。
    ///
    /// 1 指定在相对容器的位置处显示提示框，如果指定的位置无法显示则无效。
    ///
    ///     dispatchAction({
    ///         type: 'showTip',
    ///         x: number,
    ///         y: number,
    ///         position: Array.<number>|string|Function
    ///     })
    ///
    /// 2 指定数据图形，根据 tooltip 的配置项显示提示框。
    ///
    ///     dispatchAction({
    ///         type: 'showTip',
    ///         seriesIndex?: number,
    ///         dataIndex?: number,
    ///         name?: string,
    ///         position: Array.<number>|string|Function,
    ///     })
    ///
    /// 参数position同Tooltip.position相同。
    public final class ShowTipAction: EchartsAction {
        public var type: EchartsActionType {
            return .showTip
        }
        
        /// 屏幕上的 x 坐标
        public var x: Float?
        /// 屏幕上的 y 坐标
        public var y: Float?
        /// 本次显示 tooltip 的位置。只在本次 action 中生效。
        /// 缺省则使用 option 中定义的 tooltip 位置。
        public var position: Position?
        /// 系列的 index，在 tooltip 的 trigger 为 axis 的时候可选。
        public var seriesIndex: Int?
        /// 数据的 index，如果不指定也可以通过 name 属性根据名称指定数据
        public var dataIndex: Int?
        /// 可选，数据名称，在有 dataIndex 的时候忽略
        public var name: String?
        
        public init() { }
    }
    
    /// 隐藏提示框。
    public final class HideTipAction: EchartsAction {
        public var type: EchartsActionType {
            return .hideTip
        }
    }
}

extension Tooltip.ShowTipAction: Enumable {
    public enum Enums {
        case x(Float), y(Float), position(Position), seriesIndex(Int), dataIndex(Int), name(String)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .x(x):
                self.x = x
            case let .y(y):
                self.y = y
            case let .position(position):
                self.position = position
            case let .seriesIndex(seriesIndex):
                self.seriesIndex = seriesIndex
            case let .dataIndex(dataIndex):
                self.dataIndex = dataIndex
            case let .name(name):
                self.name = name
            }
        }
    }
}

extension Tooltip.ShowTipAction: Mappable {
    public func mapping(_ map: Mapper) {
        map["type"] = type
        map["x"] = x
        map["y"] = y
        map["position"] = position
        map["seriesIndex"] = seriesIndex
        map["dataIndex"] = dataIndex
        map["name"] = name
    }
}

extension Tooltip.HideTipAction: Enumable, Mappable {
    public typealias ContentEnum = EmptyEnum
    
    public convenience init(_ elements: EmptyEnum...) {
        self.init()
    }
    
    public func mapping(_ map: Mapper) {
        map["type"] = type
    }
}

typealias TooltipShowTipAction = Tooltip.ShowTipAction
typealias TooltipHideTipAction = Tooltip.HideTipAction
