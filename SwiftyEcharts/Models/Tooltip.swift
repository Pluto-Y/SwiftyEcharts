//
//  Tooltip.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 01/12/2016.
//  Copyright © 2016 com.pluto-y. All rights reserved.
//


/// 提示框组件
public struct Tooltip: Borderable, Displayable, Formatted, Jsonable {
    
    /// 触发类型。
    ///
    /// - item: 数据项图形触发，主要在散点图，饼图等无类目轴的图表中使用。
    /// - axis: 坐标轴触发，主要在柱状图，折线图等会使用类目轴的图表中使用。
    /// - Note: 在 ECharts 2.x 中只支持类目轴上使用 axis trigger，在 ECharts 3 中支持在直角坐标系和极坐标系上的所有类型的轴。并且可以通过 axisPointer.axis 指定坐标轴。
    public enum Trigger: String, Jsonable {
        case item = "item"
        case axis = "axis"
        
        public var jsonString: String {
            return "\"\(self.rawValue)\""
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
                return "\"\(self.rawValue)\""
            }
        }
        
    }
    
    /// 提示框浮层的位置
    ///
    /// - intArr: 绝对位置
    /// - percentArray: 相对位置, eg:[0.5, 0.5] => 相对位置，放置在容器正中间
    /// - inside: 鼠标所在图形的内部中心位置，只在 trigger 为'item'的时候有效。
    /// - top: 鼠标所在图形上侧，只在 trigger 为'item'的时候有效。
    /// - left: 鼠标所在图形左侧，只在 trigger 为'item'的时候有效。
    /// - right: 鼠标所在图形右侧，只在 trigger 为'item'的时候有效。
    /// - bottom: 鼠标所在图形底侧，只在 trigger 为'item'的时候有效。
    public enum Position: CustomStringConvertible, Jsonable {
        case intArr(Int, Int)
        case percentArr(Float, Float)
        case function(String)
        case inside, top, left, right, bottom
        public var description: String {
            switch self {
            case let .intArr(x, y):
                return "[\(x), \(y)]"
            case let .percentArr(xPer, yPer):
                return "[\(xPer * 100)%, \(yPer * 100)%]"
            case .inside:
                return "\"inside\""
            case .left:
                return "\"left\""
            case .right:
                return "\"right\""
            case .top:
                return "\"top\""
            case .bottom:
                return "\"ibottomnside\""
            case let .function(f):
                let count = JsCache.allJsStrings().count
                let funcName = "positionFunc\(count)"
                JsCache.add("var \(funcName) = \(f);")
                return "\"\(funcName)\""
            }

        }
    }
    
    /// 坐标轴指示器配置项
    public struct AxisPointer: Line {
        
        /// 十字准星指示器样式
        public struct CrossStyle: Shadowable, Colorful{
            /// 线的颜色
            public var color: Color?
            /// 线宽
            public var width: Float?
            /// 线的类型
            public var type: LineType?
            
            public var shadowBlur: Float?
            public var shadowColor: Color?
            public var shadowOffsetX: Float?
            public var shadowOffsetY: Float?
            
            public var textStyle: TextStyle?
            
            public init() { }
        }
        
        /// 阴影提示器样式
        public struct ShadowStyle: Shadowable, Colorful, Opacitable {
            
            /// 填充的颜色
            public var color: Color?
            
            public var shadowBlur: Float?
            public var shadowColor: Color?
            public var shadowOffsetX: Float?
            public var shadowOffsetY: Float?
            
            public var opacity: Float? {
                didSet {
                    validateOpacity()
                }
            }
            
            public init() { }
        }
        
        /// 指示器类型
        ///
        /// - line: 直线指示器
        /// - cross: 十字准星指示器
        /// - shadow: 阴影指示器
        public enum Type: String, Jsonable {
            case line = "line", cross = "cross", shadow = "shadow"
            
            public var jsonString: String {
                return "\"\(self.rawValue)\""
            }
        }
        
        
        /// 指示器类型
        public var type: Type?
        /// 指示器的坐标轴。可以是 'x', 'y', 'radius', 'angle'。默认取类目轴或者时间轴。
        public var axis: String? // FIXME: ??? 是否需要添加枚举
        /// 是否开启动画，默认开启。
        public var animation: Bool?
        /// 是否开启动画的阈值，当单个系列显示的图形数量大于这个阈值时会关闭动画。
        public var animationThreshold: Float?
        /// 初始动画的时长。
        public var animationDuration: UInt32?
        /// 初始动画的缓动效果。
        public var animationEasing: String?// FIXME: ??? 是否需要添加枚举
        /// 初始动画的延迟，支持回调函数，可以通过每个数据返回不同的 delay 时间实现更戏剧的初始动画效果。
        /// 如下示例：
        ///
        ///     animationDelayUpdate: function (idx) {
        ///         // 越往后的数据延迟越大
        ///         return idx * 100;
        ///     }
        public var animationDelay: Float?
        /// 数据更新动画的时长。
        public var animationDurationUpdate: UInt32?
        /// 数据更新动画的缓动效果。
        public var animationEasingUpdate: String? // FIXME: ??? 是否需要添加枚举
        /// 数据更新动画的延迟，支持回调函数，可以通过每个数据返回不同的 delay 时间实现更戏剧的更新动画效果。
        /// 如下示例：
        ///
        ///         animationDelayUpdate: function (idx) {
        ///             // 越往后的数据延迟越大
        ///             return idx * 100;
        ///         }
        public var animationDelayUpdate: Float?
        /// axisPointer.type 为 'line' 时有效。
        public var lineStyle: LineStyle?
        /// axisPointer.type 为 'cross' 时有效。
        public var crossStyle: CrossStyle?
        /// axisPointer.type 为 'shadow' 时有效。
        public var shadowStyle: ShadowStyle?
        
        public init() { }
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
    public var position: Tooltip.Position?
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
    public var axisPointer: AxisPointer?
    
    public init() { }
}

extension Tooltip.AxisPointer.ShadowStyle: Enumable {
    public enum Enums {
        case color(Color), shadowBlur(Float), shadowColor(Color), shadowOffsetX(Float), shadowOffsetY(Float), opacity(Float)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
        for ele in elements {
            switch ele {
            case let .color(color):
                self.color = color
            case let .shadowBlur(blur):
                self.shadowBlur = blur
            case let .shadowColor(color):
                self.shadowColor = color
            case let .shadowOffsetX(x):
                self.shadowOffsetX = x
            case let .shadowOffsetY(y):
                self.shadowOffsetY = y
            case let .opacity(opacity):
                self.opacity = opacity
            }
        }
    }
}

extension Tooltip.AxisPointer.ShadowStyle: Mappable {
    public func mapping(map: Mapper) {
        map["color"] = color
        map["shadowBlur"] = shadowBlur
        map["shadowColor"] = shadowColor
        map["shadowOffsetX"] = shadowOffsetX
        map["shadowOffsetY"] = shadowOffsetY
        map["opacity"] = opacity
    }
}

extension Tooltip.AxisPointer.CrossStyle: Enumable {
    public enum Enums {
        case color(Color), width(Float), type(LineType), shadowBlur(Float), shadowColor(Color), shadowOffsetX(Float), shadowOffsetY(Float), textStyle(TextStyle)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
        for ele in elements {
            switch ele {
            case let .color(color):
                self.color = color
            case let .width(width):
                self.width = width
            case let .type(type):
                self.type = type
            case let .shadowBlur(blur):
                self.shadowBlur = blur
            case let .shadowColor(color):
                self.shadowColor = color
            case let .shadowOffsetX(x):
                self.shadowOffsetX = x
            case let .shadowOffsetY(y):
                self.shadowOffsetY = y
            case let .textStyle(textStyle):
                self.textStyle = textStyle
            }
        }
    }
}

extension Tooltip.AxisPointer.CrossStyle: Mappable {
    public func mapping(map: Mapper) {
        map["color"] = color
        map["width"] = width
        map["type"] = type
        map["shadowBlur"] = shadowBlur
        map["shadowColor"] = shadowColor
        map["shadowOffsetX"] = shadowOffsetX
        map["shadowOffsetY"] = shadowOffsetY
        map["textStyle"] = textStyle
    }
}

extension Tooltip.AxisPointer: Enumable {
    public enum Enums {
        case type(Type), axis(String), animation(Bool), animationThreshold(Float), animationDuration(UInt32), animationEasing(String), animationDelay(Float), animationDurationUpdate(UInt32), animationEasingUpdate(String), animationDelayUpdate(Float), lineStyle(LineStyle), crossStyle(CrossStyle), shadowStyle(ShadowStyle)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
        for ele in elements {
            switch ele {
            case let .type(type):
                self.type = type
            case let .axis(axis):
                self.axis = axis
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
            case let .lineStyle(lineStyle):
                self.lineStyle = lineStyle
            case let .crossStyle(crossStyle):
                self.crossStyle = crossStyle
            case let .shadowStyle(shadowStyle):
                self.shadowStyle = shadowStyle
            }
        }
    }
}

extension Tooltip.AxisPointer: Mappable {
    public func mapping(map: Mapper) {
        map["type"] = type
        map["axis"] = axis
        map["animation"] = animation
        map["animationThreshold"] = animationThreshold
        map["animationDuration"] = animationDuration
        map["animationEasing"] = animationEasing
        map["animationDelay"] = animationDelay
        map["animationDurationUpdate"] = animationDurationUpdate
        map["animationEasingUpdate"] = animationEasingUpdate
        map["animationDelayUpdate"] = animationDelayUpdate
        map["lineStyle"] = lineStyle
        map["crossStyle"] = crossStyle
        map["shadowStyle"] = shadowStyle
    }
}

extension Tooltip: Enumable {
    public enum Enums {
        case show(Bool), showContent(Bool), trigger(Trigger), triggerOn(Trigger.TriggerOn), alwaysShowContent(Bool), showDelay(Float), hideDelay(Float), position(Tooltip.Position), confine(Bool), transitionDuration(Float), formatter(Formatter), backgroundColor(Color), borderColor(Color), borderWidth(Float), padding(Padding), textStyle(TextStyle), extraCssText(String), axisPointer(AxisPointer)
    }
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
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
    public func mapping(map: Mapper) {
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
