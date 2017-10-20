//
//  Legend.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 02/12/2016.
//  Copyright © 2016 com.pluto-y. All rights reserved.
//

/// 图例组件。
/// 图例组件展现了不同系列的标记(symbol)，颜色和名字。可以通过点击图例控制哪些系列不显示。
/// ECharts 3 中单个 echarts 实例中可以存在多个图例组件，会方便多个图例的布局。
public final class Legend: Borderable, Displayable, Formatted, Shadowable, Zable {
    
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
    public final class Data {
        /// 图例项的名称，应等于某系列的`name`值（如果是饼图，也可以是饼图单个数据的`name`）。
        public var name: String?
        /// 图例项的 icon。
        public var icon: Symbol?
        /// 图例项的文本样式。
        public var textStyle: TextStyle?
        
        public init() { }
    }
    
    public var show: Bool?
    /// 所有图形的 zlevel 值。
    /// zlevel用于 Canvas 分层，不同zlevel值的图形会放置在不同的 Canvas 中，Canvas 分层是一种常见的优化手段。我们可以把一些图形变化频繁（例如有动画）的组件设置成一个单独的zlevel。需要注意的是过多的 Canvas 会引起内存开销的增大，在手机端上需要谨慎使用以防崩溃。
    /// zlevel 大的 Canvas 会放在 zlevel 小的 Canvas 的上面。
    public var zlevel: Float?
    /// 组件的所有图形的z值。控制图形的前后顺序。z值小的图形会被z值大的图形覆盖。
    /// z相比zlevel优先级更低，而且不会创建新的 Canvas。
    public var z: Float?
    /// 图例组件离容器左侧的距离。
    public var left: Position?
    /// 图例组件离容器上侧的距离。
    public var top: Position?
    /// 图例组件离容器右侧的距离。
    public var right: Position?
    /// 图例组件离容器下侧的距离。
    public var bottom: Position?
    /// 图例组件的宽度。为空时，为自适应。
    public var width: Float?
    /// 图例组件的高度。为空时，为自适应。
    public var height: Float?
    /// 图例列表的布局朝向。
    public var orient: Orient?
    /// 图例标记和文本的对齐。默认自动，根据组件的位置和 orient 决定，当组件的 left 值为 'right' 以及纵向布局（orient 为 'vertical'）的时候为右对齐，及为 'right'。
    public var align: Align?
    /// 图例内边距，单位px，默认各方向内边距为5，接受数组分别设定上右下左边距。
    public var padding: Padding?
    /// 图例每项之间的间隔。横向布局时为水平间隔，纵向布局时为纵向间隔。
    public var itemGap: Float?
    /// 图例标记的图形宽度。
    public var itemWidth: Float?
    /// 图例标记的图形搞度。
    public var itemHeight: Float?
    /// 用来格式化图例文本，支持字符串模板和回调函数两种形式。
    public var formatter: Formatter?
    /// 图例选择的模式，控制是否可以通过点击图例改变系列的显示状态。
    public var selectedMode: SelectedMode?
    /// 图例关闭时的颜色。
    public var inactiveColor: Color?
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
    public var textStyle: TextStyle?
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
    public var tooltip: Tooltip?
    /// 图例的数据数组。
    public var data: [Jsonable]?
    public var backgroundColor: Color?
    public var borderColor: Color?
    public var borderWidth: Float?
    
    /// 注意：此配置项生效的前提是，设置了 show: `true` 以及值不为 `tranparent` 的背景色 `backgroundColor。
    public var shadowBlur: Float?
    /// 阴影颜色。支持的格式同color。
    /// 注意：此配置项生效的前提是，设置了 show: `true`。
    public var shadowColor: Color?
    /// 注意：此配置项生效的前提是，设置了 show: `true`。
    public var shadowOffsetX: Float?
    /// 注意：此配置项生效的前提是，设置了 show: `true`。
    public var shadowOffsetY: Float?
    
    public init() { }
    
}

extension Legend.Data: Enumable {
    public enum Enums {
        case name(String), icon(Symbol), textStyle(TextStyle)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .name(name):
                self.name = name
            case let .icon(icon):
                self.icon = icon
            case let .textStyle(textStyle):
                self.textStyle = textStyle
            }
        }
    }
}

extension Legend.Data: Mappable {
    public func mapping(_ map: Mapper) {
        map["name"] = name
        map["icon"] = icon
        map["textStyle"] = textStyle
    }
}

extension Legend: Enumable {
    public enum Enums {
        case show(Bool), zlevel(Float), z(Float), left(Position), x(Position), top(Position), y(Position), right(Position), bottom(Position), width(Float), height(Float), orient(Orient), align(Align), padding(Padding), itemGap(Float), itemWidth(Float), itemHeight(Float), formatter(Formatter), selectedMode(SelectedMode), inactiveColor(Color), selected([String: Bool]), textStyle(TextStyle), tooltip(Tooltip), data([Jsonable]), backgroundColor(Color), borderColor(Color), borderWidth(Float), shadowBlur(Float), shadowColor(Color), shadowOffsetX(Float), shadowOffsetY(Float)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .show(show):
                self.show = show
            case let .zlevel(zlevel):
                self.zlevel = zlevel
            case let .z(z):
                self.z = z
            case let .left(left):
                self.left = left
            case let .x(left):
                self.left = left
            case let .top(top):
                self.top = top
            case let .y(top):
                self.top = top
            case let .right(right):
                self.right = right
            case let .bottom(bottom):
                self.bottom = bottom
            case let .width(width):
                self.width = width
            case let .height(height):
                self.height = height
            case let .orient(orient):
                self.orient = orient
            case let .align(align):
                self.align = align
            case let .padding(padding):
                self.padding = padding
            case let .itemGap(itemGap):
                self.itemGap = itemGap
            case let .itemWidth(itemWidth):
                self.itemWidth = itemWidth
            case let .itemHeight(itemHeight):
                self.itemHeight = itemHeight
            case let .formatter(formatter):
                self.formatter = formatter
            case let .selectedMode(selectedMode):
                self.selectedMode = selectedMode
            case let .inactiveColor(inactiveColor):
                self.inactiveColor = inactiveColor
            case let .selected(selected):
                self.selected = selected
            case let .textStyle(textStyle):
                self.textStyle = textStyle
            case let .tooltip(tooltip):
                self.tooltip = tooltip
            case let .data(data):
                self.data = data
            case let .backgroundColor(backgroundColor):
                self.backgroundColor = backgroundColor
            case let .borderColor(color):
                self.borderColor = color
            case let .borderWidth(width):
                self.borderWidth = width
            case let .shadowBlur(blur):
                self.shadowBlur = blur
            case let .shadowColor(color):
                self.shadowColor = color
            case let .shadowOffsetX(x):
                self.shadowOffsetX = x
            case let .shadowOffsetY(y):
                self.shadowOffsetY = y
            }
        }
    }
}

extension Legend: Mappable {
    public func mapping(_ map: Mapper) {
        map["show"] = show
        map["zlevel"] = zlevel
        map["z"] = z
        map["left"] = left
        map["top"] = top
        map["right"] = right
        map["bottom"] = bottom
        map["width"] = width
        map["height"] = height
        map["orient"] = orient
        map["align"] = align
        map["padding"] = padding
        map["itemGap"] = itemGap
        map["itemWidth"] = itemWidth
        map["itemHeight"] = itemHeight
        map["formatter"] = formatter
        map["selectedMode"] = selectedMode
        map["inactiveColor"] = inactiveColor
        map["selected"] = selected
        map["textStyle"] = textStyle
        map["tooltip"] = tooltip
        map["data"] = data
        map["backgroundColor"] = backgroundColor
        map["borderColor"] = borderColor
        map["borderWidth"] = borderWidth
        map["shadowBlur"] = shadowBlur
        map["shadowColor"] = shadowColor
        map["shadowOffsetX"] = shadowOffsetX
        map["shadowOffsetY"] = shadowOffsetY
    }
}

// MARK: - Actions
/// 选中图例的Action
public final class LegendSelect: EchartsAction {
    public var type: EchartsActionType {
        return .legendSelect
    }
    
    /// 图例名称
    public var name: String?
    
    public enum Enums {
        case name(String)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .name(name):
                self.name = name
            }
        }
    }
    
    public func mapping(_ map: Mapper) {
        map["type"] = type
        map["name"] = name
    }
}

/// 取消选中图例的Action
public final class LegendUnSelect: EchartsAction {
    public var type: EchartsActionType {
        return .legendUnSelect
    }
    
    /// 图例名称
    public var name: String?
    
    public enum Enums {
        case name(String)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .name(name):
                self.name = name
            }
        }
    }
    
    public func mapping(_ map: Mapper) {
        map["type"] = type
        map["name"] = name
    }
}

/// 切换图例的选中状态的Action
public final class LegendToggleSelect: EchartsAction {
    public var type: EchartsActionType {
        return .legendToggleSelect
    }
    
    /// 图例名称
    public var name: String?
    
    public enum Enums {
        case name(String)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .name(name):
                self.name = name
            }
        }
    }
    
    public func mapping(_ map: Mapper) {
        map["type"] = type
        map["name"] = name
    }
}

/// 控制图例的滚动。当 legend.type 为 'scroll' 时有效。
public final class LegendScroll: EchartsAction {
    public var type: EchartsActionType {
        return .legendScroll
    }
    
    public var scrollDataIndex: Int?
    public var legendId: String?
    
    public enum Enums {
        case scrollDataIndex(Int), legendId(String)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .scrollDataIndex(scrollDataIndex):
                self.scrollDataIndex = scrollDataIndex
            case let .legendId(legendId):
                self.legendId = legendId
            }
        }
    }
    
    public func mapping(_ map: Mapper) {
        map["type"] = type
        map["scrollDataIndex"] = scrollDataIndex
        map["legendId"] = legendId
    }
}
