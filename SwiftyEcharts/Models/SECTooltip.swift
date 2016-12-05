//
//  SECTooltip.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 01/12/2016.
//  Copyright © 2016 com.pluto-y. All rights reserved.
//


/// 触发类型。
///
/// - item: 数据项图形触发，主要在散点图，饼图等无类目轴的图表中使用。
/// - axis: 坐标轴触发，主要在柱状图，折线图等会使用类目轴的图表中使用。
/// - Note: 在 ECharts 2.x 中只支持类目轴上使用 axis trigger，在 ECharts 3 中支持在直角坐标系和极坐标系上的所有类型的轴。并且可以通过 axisPointer.axis 指定坐标轴。
public enum SECTrigger: String {
    case item = "item"
    case axis = "axis"
    
    /// 提示框触发的条件
    ///
    /// - mousemove: 鼠标移动时触发
    /// - click: 鼠标点击时触发
    /// - none: 不触发，用户可以通过 action.tooltip.showTip 和 action.tooltip.hideTip 来手动触发和隐藏。
    /// - Note: 该属性为 ECharts 3.0 中新加。
    public enum TriggerOn: String {
        case mousemove = "mousemove"
        case click = "click"
        case none = "none"
    }
    
}

/// 提示框组件
public struct SECTooltip: SECDisplayable, SECFormatted, CustomStringConvertible {
    
    /// 提示框浮层的位置
    ///
    /// - intArr: 绝对位置
    /// - percentArray: 相对位置, eg:[0.5, 0.5] => 相对位置，放置在容器正中间
    /// - inside: 鼠标所在图形的内部中心位置，只在 trigger 为'item'的时候有效。
    /// - top: 鼠标所在图形上侧，只在 trigger 为'item'的时候有效。
    /// - left: 鼠标所在图形左侧，只在 trigger 为'item'的时候有效。
    /// - right: 鼠标所在图形右侧，只在 trigger 为'item'的时候有效。
    /// - bottom: 鼠标所在图形底侧，只在 trigger 为'item'的时候有效。
    public enum Position: CustomStringConvertible {
        case intArr(Int, Int)
        case percentArr(Float, Float)
//        case f() // TODO: 缺少一个Function的形式
        case inside, top, left, right, bottom
        public var description: String {
            switch self {
            case let .intArr(x, y):
                return "[\(x), \(y)]"
            case let .percentArr(xPer, yPer):
                return "[\(xPer * 100)%, \(yPer * 100)%]"
            case .inside:
                return "inside"
            case .left:
                return "left"
            case .right:
                return "right"
            case .top:
                return "top"
            case .bottom:
                return "ibottomnside"
            }

        }
    }
    
    /// 坐标轴指示器配置项
    public struct AxisPointer: SECLine, CustomStringConvertible {
        
        /// 十字准星指示器样式
        public struct CrossStyle: SECShadowable, SECColorful, CustomStringConvertible {
            /// 线的颜色
            public var color: SECColor? = SECColor.hexColor("#555")
            /// 线宽
            public var width = 1.0
            /// 线的类型
            public var type = SECLineType.dashed
            
            public var shadowBlur: Float?
            public var shadowColor: SECColor?
            public var shadowOffsetX: Float? = 0
            public var shadowOffsetY: Float? = 0
            
            public var textStyle: SECTextStyle? = {
                var textStyle = SECTextStyle()
                textStyle.color = SECColor.hexColor("#fff")
                textStyle.fontStyle = .normal
                textStyle.fontWeight = .normal
                textStyle.fontFamily = "sans-serif"
                textStyle.fontSize = 12
                return textStyle
            }()
            
            public var description: String {
                return ""
            }
        }
        
        /// 阴影提示器样式
        public struct ShadowStyle: SECShadowable, SECColorful {
            
            /// 填充的颜色
            public var color: SECColor? = SECColor.rgba(150, 150, 150, 0.3)
            
            public var shadowBlur: Float?
            public var shadowColor: SECColor?
            public var shadowOffsetX: Float? = 0
            public var shadowOffsetY: Float? = 0
            
            public var opacity: Float?
        }
        
        /// 指示器类型
        ///
        /// - line: 直线指示器
        /// - cross: 十字准星指示器
        /// - shadow: 阴影指示器
        public enum Type: String {
            case line = "line", cross = "cross", shadow = "shadow"
        }
        
        
        /// 指示器类型
        public var type = Type.line
        /// 指示器的坐标轴。可以是 'x', 'y', 'radius', 'angle'。默认取类目轴或者时间轴。
        public var axis = "auto" // FIXME: ??? 是否需要添加枚举
        /// 是否开启动画，默认开启。
        public var animation = true
        /// 是否开启动画的阈值，当单个系列显示的图形数量大于这个阈值时会关闭动画。
        public var animationThreshold = 200.0
        /// 初始动画的时长。
        public var animationDuration = 1000
        /// 初始动画的缓动效果。
        public var animationEasing = "cubicOut" // FIXME: ??? 是否需要添加枚举
        /// 初始动画的延迟，支持回调函数，可以通过每个数据返回不同的 delay 时间实现更戏剧的初始动画效果。
        /// 如下示例：
        ///
        ///     animationDelayUpdate: function (idx) {
        ///         // 越往后的数据延迟越大
        ///         return idx * 100;
        ///     }
        public var animationDelay = 0.0
        /// 数据更新动画的时长。
        public var animationDurationUpdate = 300
        /// 数据更新动画的缓动效果。
        public var animationEasingUpdate = "cubicOut" // FIXME: ??? 是否需要添加枚举
        /// 数据更新动画的延迟，支持回调函数，可以通过每个数据返回不同的 delay 时间实现更戏剧的更新动画效果。
        /// 如下示例：
        ///
        ///         animationDelayUpdate: function (idx) {
        ///             // 越往后的数据延迟越大
        ///             return idx * 100;
        ///         }
        public var animationDelayUpdate = 0.0
        /// axisPointer.type 为 'line' 时有效。
        public var lineStyle: SECLineStyle? = {
            var lineStyle = SECLineStyle()
            lineStyle.color = SECColor.hexColor("#555")
            lineStyle.width = 1
            lineStyle.type = .solid
            lineStyle.shadowOffsetX = 0
            lineStyle.shadowOffsetY = 0
            return lineStyle
        }()
        /// axisPointer.type 为 'cross' 时有效。
        public var crossStyle =  CrossStyle()
        /// axisPointer.type 为 'shadow' 时有效。
        public var shadowStyle = ShadowStyle()
        
        
        public var description: String { // TODO: 添加description
            return ""
        }
    }
    
    /// 是否显示提示框组件，包括提示框浮层和 axisPointer。
    /// - SeeAlso: `SECAxisPointer`
    public var show = true
    /// 是否显示提示框浮层，默认显示。只需tooltip触发事件或显示axisPointer而不需要显示内容时可配置该项为false。
    public var showContent = true
    /// 触发类型。
    public var trigger = SECTrigger.item
    /// 提示框触发的条件
    public var triggerOn = SECTrigger.TriggerOn.mousemove
    /// 是否永远显示提示框内容，默认情况下在移出可触发提示框区域后 一定时间 后隐藏，设置为 true 可以保证一直显示提示框内容。
    /// - Note: 该属性为 ECharts 3.0 中新加。
    public var alwaysShowContent = false
    /// 浮层显示的延迟，单位为 ms，默认没有延迟，也不建议设置。在 triggerOn 为 'mousemove' 时有效。
    public var showDelay = 0.0
    /// 浮层隐藏的延迟，单位为 ms，在 alwaysShowContent 为 true 的时候无效。
    public var hideDelay = 100.0
    /// 提示框浮层的位置，默认不设置时位置会跟随鼠标的位置。
    public var position: SECTooltip.Position?
    /// 是否将 tooltip 框限制在图表的区域内。
    /// 当图表外层的 dom 被设置为 'overflow: hidden'，或者移动端窄屏，导致 tooltip 超出外界被截断时，此配置比较有用。
    public var confine = false
    /// 提示框浮层的移动动画过渡时间，单位是 s，设置为 0 的时候会紧跟着鼠标移动。
    public var transitionDuration = 0.4
    /// 提示框浮层内容格式器
    public var formatter: SECFormatter?
    /// 提示框浮层的背景颜色。
    public var backgroundColor = SECColor.rgba(50, 50, 50, 0.7)
    /// 提示框浮层的边框颜色
    public var borderColor = SECColor.hexColor("#333")
    /// 提示框浮层的边框宽。
    public var borderWidth = 0.0
    /// 提示框浮层内边距
    public var padding = SECPadding.all(5)
    /// 提示框浮层的文本样式。
    public var textStyle: SECTextStyle?
    /// 额外附加到浮层的 css 样式。如下为浮层添加阴影的示例：
    ///
    ///     extraCssText: 'box-shadow: 0 0 3px rgba(0, 0, 0, 0.3);'
    public var extraCssText: String?
    /// 坐标轴指示器配置项，在 trigger 为 'axis' 时有效。
    public var axisPointer: AxisPointer?
    
    
    
    public var description: String { // TODO: 添加description
        return ""
    }
}
