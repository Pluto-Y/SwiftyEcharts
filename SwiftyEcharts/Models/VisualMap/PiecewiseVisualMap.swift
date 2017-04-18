//
//  PiecewiseVisualMap.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 20/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public final class PiecewiseVisualMap: VisualMap, Displayable, Borderable, Colorful, Textful, Formatted, Zable {
    /// 类型为分段型。
    public var type: String {
        return "piecewise"
    }
    
    /// 对于连续型数据，自动平均切分成几段。默认为5段。 连续数据的范围需要 max 和 min 来指定。
    /// 如果设置了 visualMap-piecewise.pieces 或者 visualMap-piecewise.categories，则 splitNumber 无效。
    public var splitNumber: Int?
    /// 自定义『分段式视觉映射组件（visualMapPiecewise）』的每一段的范围，以及每一段的文字，以及每一段的特别的样式。例如：
    ///
    ///     pieces: [
    ///         {min: 1500}, // 不指定 max，表示 max 为无限大（Infinity）。
    ///         {min: 900, max: 1500},
    ///         {min: 310, max: 1000},
    ///         {min: 200, max: 300},
    ///         {min: 10, max: 200, label: '10 到 200（自定义label）'},
    ///         {value: 123, label: '123（自定义特殊颜色）', color: 'grey'}, // 表示 value 等于 123 的情况。
    ///         {max: 5}     // 不指定 min，表示 min 为无限大（-Infinity）。
    ///     ]
    /// 或者，更精确得，可以使用 lt（小于，little than），gt（大于，greater than），lte（小于等于 lettle than or equals），gte（大于等于，greater than or equals）来表达边界：
    ///
    ///     pieces: [
    ///         {gt: 1500},            // (1500, Infinity]
    ///         {gt: 900, lte: 1500},  // (900, 1500]
    ///         {gt: 310, lte: 1000},  // (310, 1000]
    ///         {gt: 200, lte: 300},   // (200, 300]
    ///         {gt: 10, lte: 200, label: '10 到 200（自定义label）'},       // (10, 200]
    ///         {value: 123, label: '123（自定义特殊颜色）', color: 'grey'},  // [123, 123]
    ///         {lt: 5}                 // (-Infinity, 5)
    ///     ]
    /// 注意，如果两个 piece 的区间重叠，则会自动进行去重。
    /// 在每个 piece 中支持的 visualMap 属性有：
    /// - symbol: 图元的图形类别。
    /// - symbolSize: 图元的大小。
    /// - color: 图元的颜色。
    /// - colorAlpha: 图元的颜色的透明度。
    /// - opacity: 图元以及其附属物（如文字标签）的透明度。
    /// - colorLightness: 颜色的明暗度，参见 HSL。
    /// - colorSaturation: 颜色的饱和度，参见 HSL。
    /// - colorHue: 颜色的色调，参见 HSL。
    ///
    /// 参见示例 ： http://echarts.baidu.com/gallery/editor.html?c=doc-example/map-visualMap-pieces&edit=1&reset=1
    ///
    /// （注：在 ECharts2 中，pieces 叫做 splitList。现在后者仍兼容，但推荐使用 pieces）
    /// pieces 中的顺序，其实试试就知道。若要看详细的规则，参见 visualMap.inverse。
    public var pieces: [Jsonable]?
    //    public var categories: []
    /// 指定 visualMapPiecewise 组件的最小值。
    /// 在 连续型数据自定义分段 模式（即 visualMap-piecewise.pieces 被使用）或 离散数据根据类别分段 模式（即 visualMap-piecewise.categories 被使用）时，max 和 min 不需指定。
    /// 在 连续型数据平均分段 模式（即 (that is, when visualMap-piecewise.splitNumber 被使用时）需指定 min、max，如果不指定，则默认为 [0, 200]（注意并不是默认为 series.data 的 dataMin 和 dataMax）。
    public var min: Float?
    /// 指定 visualMapPiecewise 组件的最大值。参见 visualMap-piecewise.splitNumber
    /// 连续型数据自定义分段 模式（即 visualMap-piecewise.pieces 被使用）或 离散数据根据类别分段 模式（即 visualMap-piecewise.categories 被使用），max 和 min 不需指定。
    /// 连续型数据平均分段 模式（即 (that is, when visualMap-piecewise.splitNumber 被使用时）需指定 min、max，如果不指定，则默认为 [0, 200]（注意并不是默认为 series.data 的 dataMin 和 dataMax）。
    public var max: Float?
    /// 当 type 为 piecewise 且使用 min/max/splitNumber 时，此参数有效。当值为 true 时，界面上会额外多出一个『< min』的选块。
    public var minOpen: Bool?
    /// 当 type 为 piecewise 且使用 min/max/splitNumber 时，此参数有效。当值为 true 时，界面上会额外多出一个『> max』的选块。
    public var maxOpen: Bool?
    /// 选择模式，可以是：
    /// - 'multiple'（多选）。
    /// - 'single'（单选）。
    public var selectedMode: SelectedMode?
    /// 是否反转。
    /// - 连续型数据平均分段 模式（即 (that is, when visualMap-piecewise.splitNumber 被使用时），数据排布规则，同 visualMap-continuous.inverse。
    /// - 连续型数据自定义分段 模式（即 visualMap-piecewise.pieces 被使用）或 离散数据根据类别分段 模式（即 visualMap-piecewise.categories 被使用），每个块的排布位置，取决于 pieces 或 categories 列表的定义顺序，即：
    ///     - 当inverse为false时：
    ///         - 当 visualMap.orient 为 'vertical' 时，pieces[0] 或 categories[0]对应『上方』
    ///         - 当 visualMap.orient 为 'horizontal' 时，pieces[0] 或 categories[0] 对应『左方』。
    ///     - 当 inverse 为 true 时，与上面相反。
    ///
    /// 其实没有那么复杂，使用时候，试试就知道了。
    public var inverse: Bool?
    /// 数据展示的小数精度。
    ///     - 连续型数据平均分段 模式（即 (that is, when visualMap-piecewise.splitNumber 被使用时），精度根据数据自动适应。
    ///     - 连续型数据自定义分段 模式（即 visualMap-piecewise.pieces 被使用）或 离散数据根据类别分段 模式（即 visualMap-piecewise.categories 被使用），精度默认为0（没有小数）。
    public var precision: UInt?
    /// 图形的宽度，即每个小块的宽度。
    public var itemWidth: Float?
    /// 图形的高度，即每个小块的高度。
    public var itemHeight: Float?
    /// 指定组件中图形（比如小方块）和文字的摆放关系，可选值为：
    /// - 'auto' 自动决定。
    /// - 'left' 图形在左文字在右。
    /// - 'right' 图形在右文字在左。
    public var align: Align?
    /// 两端的文本，如['High', 'Low']。
    ///
    /// 参见例子 : http://echarts.baidu.com/gallery/editor.html?c=doc-example/map-visualMap-piecewise-text&edit=1&reset=1
    ///
    /// text 中的顺序，其实试试就知道。若要看详细的规则，参见 visualMap.inverse。
    /// 兼容 ECharts2，当有 text 时，label不显示。
    public var text: PiecewiseText?
    /// 两端文字主体之间的距离，单位为px。参见 visualMap-piecewise.text
    public var textGap: Float?
    /// 是否显示每项的文本标签。默认情况是，如果 visualMap-piecewise.text 被使用则不显示文本标签，否则显示。
    public var showLabel: Bool?
    /// 每两个图元之间的间隔距离，单位为px。
    public var itemGap: Float?
    /// 默认的图形。
    public var itemSymbol: Symbol?
    /// 是否显示 visualMap-piecewise 组件。如果设置为 false，不会显示，但是数据映射的功能还存在。
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
    /// 默认取 data 中最后一个维度。
    public var dimension: Float?
    /// 指定取哪个系列的数据，即哪个系列的 series.data。
    /// 默认取所有系列。
    public var seriesIndex: [UInt8]?
    /// 打开 hoverLink 功能时，鼠标悬浮到 visualMap 组件上时，鼠标位置对应的数值 在 图表中对应的图形元素，会高亮。
    /// 反之，鼠标悬浮到图表中的图形元素上时，在 visualMap 组件的相应位置会有三角提示其所对应的数值。
    public var hoverLink: Bool?
    public var inRange: [String: Jsonable]?
    public var outRange: [String: Jsonable]?
    /// visualMap 组件中，控制器 的 inRange outOfRange 设置。如果没有这个 controller 设置，控制器 会使用外层的 inRange outOfRange 设置；如果有这个 controller 设置，则会采用这个设置。适用于一些控制器视觉效果需要特殊定制或调整的场景。
    public var controller: VisualMapController?
    /// 所有图形的 zlevel 值。
    /// zlevel用于 Canvas 分层，不同zlevel值的图形会放置在不同的 Canvas 中，Canvas 分层是一种常见的优化手段。我们可以把一些图形变化频繁（例如有动画）的组件设置成一个单独的zlevel。需要注意的是过多的 Canvas 会引起内存开销的增大，在手机端上需要谨慎使用以防崩溃。
    /// zlevel 大的 Canvas 会放在 zlevel 小的 Canvas 的上面。
    public var zlevel: Float?
    /// 组件的所有图形的z值。控制图形的前后顺序。z值小的图形会被z值大的图形覆盖。
    /// z相比zlevel优先级更低，而且不会创建新的 Canvas。
    public var z: Float?
    /// visualMap 组件离容器左侧的距离。
    public var left: Position?
    /// visualMap 组件离容器上侧的距离。
    public var top: Position?
    /// visualMap 组件离容器右侧的距离。
    public var right: Position?
    /// visualMap 组件离容器下侧的距离。
    public var bottom: Position?
    /// 如何放置 visualMap 组件，水平（'horizontal'）或者竖直（'vertical'）。
    public var orient: Orient?
    /// visualMap-piecewise内边距，单位px，默认各方向内边距为5，接受数组分别设定上右下左边距。
    /// 使用示例：
    ///
    ///     // 设置内边距为 5
    ///      padding: 5
    ///      // 设置上下的内边距为 5，左右的内边距为 10
    ///      padding: [5, 10]
    ///      // 分别设置四个方向的内边距
    ///      padding: [
    ///          5,  // 上
    ///          10, // 右
    ///          5,  // 下
    ///          10, // 左
    ///      ]
    public var padding: Padding?
    /// 背景色。
    public var backgroundColor: Color?
    /// 边框颜色。
    public var borderColor: Color?
    /// 边框线宽，单位px。
    public var borderWidth: Float?
    /// 这个配置项，是为了兼容 ECharts2 而存在，ECharts3 中已经不推荐使用。它的功能已经移到了 visualMap-piecewise.inRange 和 visualMap-piecewise.outOfRange 中。
    /// 如果要使用，则须注意，color属性中的顺序是由数值 大 到 小，但是 visualMap-piecewise.inRange 或 visualMap-piecewise.outOfRange 中 color 的顺序，总是由数值 小 到 大。二者不一致。
    public var color: Color?
    /// 文字样式
    public var textStyle: TextStyle?
    /// 标签的格式化工具。
    /// 如果为string，表示模板，例如：aaaa{value}bbbb{value2}。其中 {value} 和 {value2} 是当前的范围边界值。
    ///
    ///     如果为 Function，表示回调函数，形如：
    ///     formatter: function (value, value2) {
    ///         return 'aaaa' + value + 'bbbb' + value2; // 范围标签显示内容。
    ///     }
    public var formatter: Formatter?
}

extension PiecewiseVisualMap: Enumable {
    public enum Enums {
        case splitNumber(Int), pieces([Jsonable]), min(Float), max(Float), minOpen(Bool), maxOpen(Bool), selectedMode(SelectedMode), inverse(Bool), precision(UInt), itemWidth(Float), itemHeight(Float), align(Align), text(PiecewiseText), textGap(Float), showLabel(Bool), itemGap(Float), itemSymbol(Symbol), show(Bool), dimension(Float), seriesIndex([UInt8]), hoverLink(Bool), inRange([String: Jsonable]), outRange([String: Jsonable]), controller(VisualMapController), zlevel(Float), z(Float), left(Position), top(Position), right(Position), bottom(Position), orient(Orient), padding(Padding), backgroundColor(Color), borderColor(Color), borderWidth(Float), color(Color), textStyle(TextStyle), formatter(Formatter)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .splitNumber(splitNumber):
                self.splitNumber = splitNumber
            case let .pieces(pieces):
                self.pieces = pieces
            case let .min(min):
                self.min = min
            case let .max(max):
                self.max = max
            case let .minOpen(minOpen):
                self.minOpen = minOpen
            case let .maxOpen(maxOpen):
                self.maxOpen = maxOpen
            case let .selectedMode(selectedMode):
                self.selectedMode = selectedMode
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
            case let .showLabel(showLabel):
                self.showLabel = showLabel
            case let .itemGap(itemGap):
                self.itemGap = itemGap
            case let .itemSymbol(itemSymbol):
                self.itemSymbol = itemSymbol
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

extension PiecewiseVisualMap: Mappable {
    public func mapping(_ map: Mapper) {
        map["type"] = type
        map["splitNumber"] = splitNumber
        map["pieces"] = pieces
        map["min"] = min
        map["max"] = max
        map["minOpen"] = minOpen
        map["maxOpen"] = maxOpen
        map["selectedMode"] = selectedMode
        map["inverse"] = inverse
        map["precision"] = precision
        map["itemWidth"] = itemWidth
        map["itemHeight"] = itemHeight
        map["align"] = align
        map["text"] = text
        map["textGap"] = textGap
        map["showLabel"] = showLabel
        map["itemGap"] = itemGap
        map["itemSymbol"] = itemSymbol
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
