//
//  SECLegend.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 02/12/2016.
//  Copyright © 2016 com.pluto-y. All rights reserved.
//

/// 布局朝向
///
/// - horizontal: 水平
/// - vertical: 垂直
public enum SECOrient: String {
    case horizontal = "horizontal", vertical = "vertical"
}

/// 选择的模式
///
/// - selectable: 设置成是否可选择
/// - mode: 设置成单选或者多选
public enum SECSelectedMode: CustomStringConvertible {
    
    /// 单选或多选模式
    ///
    /// - single: 单选
    /// - multiple: 多选
    public enum Mode: String {
        case single = "single", multiple = "multiple"
    }
    
    case selectable(Bool)
    case mode(Mode)
    
    public var description: String {
        switch self {
        case .selectable(true):
            return "true"
        case .selectable(false):
            return "false"
        case let .mode(mode):
            return mode.rawValue
        }
    }
    
}

/// 图例组件。
/// 图例组件展现了不同系列的标记(symbol)，颜色和名字。可以通过点击图例控制哪些系列不显示。
/// ECharts 3 中单个 echarts 实例中可以存在多个图例组件，会方便多个图例的布局。
public struct SECLegend: SECDisplayable, SECFormatted, SECShadowable {
    
    /// 图例的数据数组。数组项通常为一个字符串，每一项代表一个系列的 `name`（如果是饼图，也可以是饼图单个数据的 `name`）。图例组件会自动获取对应系列的颜色，图形标记（symbol）作为自己绘制的颜色和标记，特殊字符串 `''`（空字符串）或者 `'\n'`（换行字符串）用于图例的换行。
    ///
    /// 如果要设置单独一项的样式，也可以把该项写成配置项对象。此时必须使用 name 属性对应表示系列的 name。
    ///
    /// 示例
    ///
    ///         data: [{
    ///             name: '系列1',
    ///             // 强制设置图形为圆。
    ///             icon: 'circle',
    ///             // 设置文本为红色
    ///             textStyle: {
    ///                 color: 'red'
    ///             }
    ///         }]
    public struct Data: CustomStringConvertible {
        /// 图例项的名称，应等于某系列的`name`值（如果是饼图，也可以是饼图单个数据的`name`）。
        public var name: String?
        /// 图例项的 icon。
        public var icon: SECSymbol?
        /// 图例项的文本样式。
        public var textStyle: SECTextStyle? = {
            var textStyle = SECTextStyle()
            textStyle.color = .red
            return textStyle
        }()
        public var description: String { // FIXME: 填写内容
            return ""
        }
    }
    
    public var show: Bool = true
    /// 所有图形的 zlevel 值。
    /// zlevel用于 Canvas 分层，不同zlevel值的图形会放置在不同的 Canvas 中，Canvas 分层是一种常见的优化手段。我们可以把一些图形变化频繁（例如有动画）的组件设置成一个单独的zlevel。需要注意的是过多的 Canvas 会引起内存开销的增大，在手机端上需要谨慎使用以防崩溃。
    /// zlevel 大的 Canvas 会放在 zlevel 小的 Canvas 的上面。
    public var zlevel: Float = 0.0
    /// 组件的所有图形的z值。控制图形的前后顺序。z值小的图形会被z值大的图形覆盖。
    /// z相比zlevel优先级更低，而且不会创建新的 Canvas。
    public var z: Int = 0
    /// 图例组件离容器左侧的距离。
    public var left = SECPosition.auto
    /// 图例组件离容器上侧的距离。
    public var top = SECPosition.auto
    /// 图例组件离容器右侧的距离。
    public var right = SECPosition.auto
    /// 图例组件离容器下侧的距离。
    public var bottom = SECPosition.auto
    /// 图例组件的宽度。为空时，为自适应。
    public var width: Float?
    /// 图例组件的高度。为空时，为自适应。
    public var height: Float?
    /// 图例列表的布局朝向。
    public var orient = SECOrient.horizontal
    /// 图例标记和文本的对齐。默认自动，根据组件的位置和 orient 决定，当组件的 left 值为 'right' 以及纵向布局（orient 为 'vertical'）的时候为右对齐，及为 'right'。
    public var align = SECAlign.auto
    /// 图例内边距，单位px，默认各方向内边距为5，接受数组分别设定上右下左边距。
    public var padding = SECPadding.all(5)
    /// 图例每项之间的间隔。横向布局时为水平间隔，纵向布局时为纵向间隔。
    public var itemGap = 10.0
    /// 图例标记的图形宽度。
    public var itemWidth = 25.0
    /// 图例标记的图形搞度。
    public var itemHeight = 14.0
    /// 用来格式化图例文本，支持字符串模板和回调函数两种形式。
    public var formatter: SECFormatter?
    /// 图例选择的模式，控制是否可以通过点击图例改变系列的显示状态。
    public var selectedMode = SECSelectedMode.selectable(true)
    /// 图例关闭时的颜色。
    public var inactiveColor = SECColor.hexColor("#ccc")
    /// 图例选中状态表。
    ///
    /// 示例：
    ///
    ///     selected: {
    ///         // 选中'系列1'
    ///         '系列1': true,
    ///         // 不选中'系列2'
    ///         '系列2': false
    ///     }
    public var selected: [String: Bool]?
    /// 图例的公用文本样式。
    public var textStyle: SECTextStyle = {
        var textStyle = SECTextStyle()
        textStyle.color = .hexColor("#333")
        textStyle.fontStyle = .normal
        textStyle.fontWeight = .normal
        textStyle.fontFamily = "sans-serif"
        textStyle.fontSize = 12
        return textStyle
    }()
    /// 图例的 tooltip 配置，配置项同 tooltip。默认不显示，可以在 legend 文字很多的时候对文字做裁剪并且开启 tooltip，
    ///
    /// 如下示例：
    /// 
    ///     legend: {
    ///         formatter: function (name) {
    ///             return echarts.format.truncateText(name, 40, '14px Microsoft Yahei', '…');
    ///         },
    ///         tooltip: {
    ///             show: true
    ///         }
    ///     }
    public var tooltip: SECTooltip?
    /// 图例的数据数组。
    public var datas: [Data]?
    public var backgroundColor = SECColor.transparent
    public var borderColor = SECColor.hexColor("#ccc")
    public var borderWidth = 1
    
    /// 注意：此配置项生效的前提是，设置了 show: `true` 以及值不为 `tranparent` 的背景色 `backgroundColor。
    public var shadowBlur: Float? = 1
    /// 阴影颜色。支持的格式同color。
    /// 注意：此配置项生效的前提是，设置了 show: `true`。
    public var shadowColor: SECColor?
    /// 注意：此配置项生效的前提是，设置了 show: `true`。
    public var shadowOffsetX: Float? = 0.0
    /// 注意：此配置项生效的前提是，设置了 show: `true`。
    public var shadowOffsetY: Float? = 0.0
}
