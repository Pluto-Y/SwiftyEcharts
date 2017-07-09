//
//  ContinuousVisualMap.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 20/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 连续型视觉映射组件（visualMapContinuous）
/// 展现形式如下图：
///
/// http://echarts.baidu.com/gallery/editor.html?c=doc-example/map-visualMap-continuous
///
/// visualMapContinuous中，可以通过 visualMap.calculable 来显示或隐藏手柄（手柄能拖拽改变值域）。
public final class ContinuousVisualMap: VisualMap, Displayable, Borderable, Colorful, Textful, Formatted, Zable {
    
    /// 类型为连续型。
    public var type: String {
        return "continuous"
    }
    /// 指定 visualMapContinuous 组件的允许的最小值。'min' 必须用户指定。[visualMap.min, visualMax.max] 形成了视觉映射的『定义域』。
    public var min: Float?
    /// 指定 visualMapContinuous 组件的允许的最大值。'max' 必须用户指定。[visualMap.min, visualMax.max] 形成了视觉映射的『定义域』。
    public var max: Float?
    /// 指定手柄对应数值的位置。range 应在 min max 范围内。例如：
    ///
    ///     chart.setOption({
    ///         visualMap: {
    ///             min: 0,
    ///             max: 100,
    ///             // 两个手柄对应的数值是 4 和 15
    ///             range: [4, 15],
    ///             ...
    ///         }
    ///     });
    ///
    /// setOption 改变 min、max 时 range 的自适应
    /// 如果 range 不设置（或设置为 null）
    ///
    ///     例如：
    ///     chart.setOption({visualMap: {min: 10, max: 300}}); // 不设置 range，则 range 默认为 [min, max]，即 [10, 300]。
    ///     
    ///     chart.setOption({visualMap: {min: 0, max: 400}}); // 再次使用 setOption 改变 min、max。
    ///     // 此时 range 也自然会更新成改变过后的 [min, max]，即 [0, 400]。
    ///
    /// 如果 range 被以具体值设置了（例如设置为 [10, 300]）
    ///
    ///     例如：
    ///     chart.setOption({visualMap: {min: 10, max: 300, range: [20, 80]}}); // 设置了 range
    ///     
    ///     chart.setOption({visualMap: {min: 0, max: 400}}); // 再次使用 setOption 改变 min、max。
    ///     // 此时 range 不会改变而仍维持本来的数值，仍为 [20, 80]。
    ///     
    ///     chart.setOption({visualMap: {range: null}}); // 再把 range 设为 null。
    ///     // 则 range 恢复为 [min, max]，即 [0, 400]，同时也恢复了自动随 min max 而改变的能力。
    ///
    /// getOption 得到的 range 总是 Array，不会为 null 或 undefined。
    public var range: Range?
    /// 是否显示拖拽用的手柄（手柄能拖拽调整选中范围）。
    ///
    /// （注：为兼容 ECharts2，当 visualMap.type 未指定时，假如设置了 'calculable'，则type自动被设置为'continuous'，无视 visualMap-piecewise.splitNumber 等设置。所以，建议使用者不要不指定 visualMap.type，否则表意不清晰。）
    public var calculable: Bool?
    /// 拖拽时，是否实时更新。
    ///
    /// - 如果为ture则拖拽手柄过程中实时更新图表视图。
    /// - 如果为false则拖拽结束时，才更新视图。
    public var realtime: Bool?
    /// 是否反转 visualMap 组件。
    ///
    /// 当inverse为false时，数据大小的位置规则，和直角坐标系相同，即：
    ///
    /// - 当 visualMap.orient 为'vertical'时，数据上大下小。
    /// - 当 visualMap.orient 为'horizontal'时，数据右大左小。
    ///
    /// 当inverse为true时，相反。
    public var inverse: Bool?
    /// 数据展示的小数精度，默认为0，无小数点。
    public var precision: Float?
    /// 图形的宽度，即长条的宽度。
    public var itemWidth: Float?
    /// 图形的高度，即长条的高度。
    public var itemHeight: Float?
    /// 指定组件中手柄和文字的摆放位置，可选值为：
    /// - 'auto' 自动决定。
    /// - 'left' 手柄和label在右，orient 为 horizontal 时有效。
    /// - 'right' 手柄和label在左，orient 为 horizontal 时有效。
    /// - 'top' 手柄和label在下，orient 为 vertical 时有效。
    /// - 'bottom' 手柄和label在上，orient 为 vertical 时有效。
    public var align: Align?
    /// 两端的文本，如 ['High', 'Low']。
    ///
    /// text 中的顺序，其实试试就知道。若要看详细的规则，参见 visualMap.inverse。
    public var text: PiecewiseText?
    /// 两端文字主体之间的距离，单位为px。参见 visualMap-continuous.text
    public var textGap: Float?
    /// 是否显示 visualMap-continuous 组件。如果设置为 false，不会显示，但是数据映射的功能还存在。
    public var show: Bool?
    /// 指定用数据的『哪个维度』，映射到视觉元素上。『数据』即 series.data。 可以把 series.data 理解成一个二维数组，例如：
    ///
    ///     [
    ///         [12, 23, 43],
    ///         [12, 23, 43],
    ///         [43, 545, 65],
    ///         [92, 23, 33]
    ///     ]
    ///
    /// 其中每个列是一个维度，即 dimension。 例如 dimension 为 1 时，取第二列（即 23，23，545，23），映射到视觉元素上。
    ///
    /// 默认取 data 中最后一个维度。
    public var dimension: Float?
    /// 指定取哪个系列的数据，即哪个系列的 series.data。
    ///
    /// 默认取所有系列。
    public var seriesIndex: [UInt8]?
    /// 打开 hoverLink 功能时，鼠标悬浮到 visualMap 组件上时，鼠标位置对应的数值 在 图表中对应的图形元素，会高亮。
    ///
    /// 反之，鼠标悬浮到图表中的图形元素上时，在 visualMap 组件的相应位置会有三角提示其所对应的数值。
    public var hoverLink: Bool?
    public var inRange: [String: Jsonable]?
    public var outRange: [String: Jsonable]?
    /// visualMap 组件中，控制器 的 inRange outOfRange 设置。如果没有这个 controller 设置，控制器 会使用外层的 inRange outOfRange 设置；如果有这个 controller 设置，则会采用这个设置。适用于一些控制器视觉效果需要特殊定制或调整的场景。
    public var controller: VisualMapController?
    
    /// MARK: - Zable
    public var zlevel: Float?
    public var z: Float?
    
    /// visualMap 组件离容器左侧的距离。
    ///
    /// left 的值可以是像 20 这样的具体像素值，可以是像 '20%' 这样相对于容器高宽的百分比，也可以是 'left', 'center', 'right'。
    ///
    /// 如果 left 的值为'left', 'center', 'right'，组件会根据相应的位置自动对齐。
    public var left: Position?
    /// visualMap 组件离容器上侧的距离。
    ///
    /// top 的值可以是像 20 这样的具体像素值，可以是像 '20%' 这样相对于容器高宽的百分比，也可以是 'top', 'middle', 'bottom'。
    ///
    /// 如果 top 的值为'top', 'middle', 'bottom'，组件会根据相应的位置自动对齐。
    public var top: Position?
    /// visualMap 组件离容器右侧的距离。
    ///
    /// right 的值可以是像 20 这样的具体像素值，可以是像 '20%' 这样相对于容器高宽的百分比。
    public var right: Position?
    /// visualMap 组件离容器下侧的距离。
    ///
    /// bottom 的值可以是像 20 这样的具体像素值，可以是像 '20%' 这样相对于容器高宽的百分比。
    public var bottom: Position?
    /// 如何放置 visualMap 组件，水平（'horizontal'）或者竖直（'vertical'）。
    public var orient: Orient?
    /// visualMap-continuous内边距，单位px，默认各方向内边距为5，接受数组分别设定上右下左边距。
    ///
    /// 使用示例：
    ///
    ///     // 设置内边距为 5
    ///     padding: 5
    ///     // 设置上下的内边距为 5，左右的内边距为 10
    ///     padding: [5, 10]
    ///     // 分别设置四个方向的内边距
    ///     padding: [
    ///         5,  // 上
    ///         10, // 右
    ///         5,  // 下
    ///         10, // 左
    ///     ]
    public var padding: Padding?
    /// 背景色。
    public var backgroundColor: Color?
    /// 边框颜色。
    public var borderColor: Color?
    /// 边框线宽，单位px。
    public var borderWidth: Float?
    /// 这个配置项，是为了兼容 ECharts2 而存在，ECharts3 中已经不推荐使用。它的功能已经移到了 visualMap-continuous.inRange 和 visualMap-continuous.outOfRange 中。
    ///
    /// 如果要使用，则须注意，color属性中的顺序是由数值 大 到 小，但是 visualMap-continuous.inRange 或 visualMap-continuous.outOfRange 中 color 的顺序，总是由数值 小 到 大。二者不一致
    public var color: Color?
    public var textStyle: TextStyle?
    /// 标签的格式化工具。
    ///
    /// 如果为string，表示模板，例如：aaaa{value}。其中 {value} 是当前的范围边界值。
    ///
    /// 如果为 Function，表示回调函数，形如：
    ///
    ///     formatter: function (value) {
    ///         return 'aaaa' + value; // 范围标签显示内容。
    ///     }
    public var formatter: Formatter?
    
    public init() {}
}

extension ContinuousVisualMap: Enumable {
    public enum Enums {
        case min(Float), max(Float), range(Range), calculable(Bool), realtime(Bool), inverse(Bool), precision(Float), itemWidth(Float), itemHeight(Float), align(Align), text(PiecewiseText), textGap(Float), show(Bool), dimension(Float), seriesIndex([UInt8]), hoverLink(Bool), inRange([String: Jsonable]), outRange([String: Jsonable]), controller(VisualMapController), zlevel(Float), z(Float), left(Position), top(Position), right(Position), bottom(Position), orient(Orient), padding(Padding), backgroundColor(Color), borderColor(Color), borderWidth(Float), color(Color), textStyle(TextStyle), formatter(Formatter)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .min(min):
                self.min = min
            case let .max(max):
                self.max = max
            case let .range(range):
                self.range = range
            case let .calculable(calculable):
                self.calculable = calculable
            case let .realtime(realtime):
                self.realtime = realtime
            case let .inverse(inverse):
                self.inverse = inverse
            case let .precision(precision):
                self.precision = precision
            case let .itemWidth(itemWidth):
                self.itemWidth = itemWidth
            case let .itemHeight(itemHeight):
                self.itemHeight = itemHeight
            case let .align(align):
                self.align = align
            case let .text(text):
                self.text = text
            case let .textGap(textGap):
                self.textGap = textGap
            case let .show(show):
                self.show = show
            case let .dimension(dimension):
                self.dimension = dimension
            case let .seriesIndex(seriesIndex):
                self.seriesIndex = seriesIndex
            case let .hoverLink(hoverLink):
                self.hoverLink = hoverLink
            case let .inRange(inRange):
                self.inRange = inRange
            case let .outRange(outRange):
                self.outRange = outRange
            case let .controller(controller):
                self.controller = controller
            case let .zlevel(zlevel):
                self.zlevel = zlevel
            case let .z(z):
                self.z = z
            case let .left(left):
                self.left = left
            case let .top(top):
                self.top = top
            case let .right(right):
                self.right = right
            case let .bottom(bottom):
                self.bottom = bottom
            case let .orient(orient):
                self.orient = orient
            case let .padding(padding):
                self.padding = padding
            case let .backgroundColor(backgroundColor):
                self.backgroundColor = backgroundColor
            case let .borderColor(borderColor):
                self.borderColor = borderColor
            case let .borderWidth(borderWidth):
                self.borderWidth = borderWidth
            case let .color(color):
                self.color = color
            case let .textStyle(textStyle):
                self.textStyle = textStyle
            case let .formatter(formatter):
                self.formatter = formatter
            }
        }
    }
}

extension ContinuousVisualMap: Mappable {
    public func mapping(_ map: Mapper) {
        map["type"] = type
        map["min"] = min
        map["max"] = max
        map["range"] = range
        map["calculable"] = calculable
        map["realtime"] = realtime
        map["inverse"] = inverse
        map["precision"] = precision
        map["itemWidth"] = itemWidth
        map["itemHeight"] = itemHeight
        map["align"] = align
        map["text"] = text
        map["textGap"] = textGap
        map["show"] = show
        map["dimension"] = dimension
        map["seriesIndex"] = seriesIndex
        map["hoverLink"] = hoverLink
        map["inRange"] = inRange
        map["outRange"] = outRange
        map["controller"] = controller
        map["zlevel"] = zlevel
        map["z"] = z
        map["left"] = left
        map["top"] = top
        map["right"] = right
        map["bottom"] = bottom
        map["orient"] = orient
        map["padding"] = padding
        map["backgroundColor"] = backgroundColor
        map["borderColor"] = borderColor
        map["borderWidth"] = borderWidth
        map["color"] = color
        map["textStyle"] = textStyle
        map["formatter"] = formatter
    }
}
