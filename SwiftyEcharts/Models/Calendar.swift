//
//  Calendar.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 21/09/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 日历坐标系组件。
///
/// 在ECharts中，我们非常有创意地实现了日历图，是通过使用日历坐标系组件来达到日历图效果的，如下方的几个示例图所示，我们可以在热力图、散点图、关系图中使用日历坐标系。
///
/// 在日历坐标系中使用热力图的示例: http://www.echartsjs.com/gallery/editor.html?c=calendar-heatmap
///
/// 在日历坐标系中使用散点图的示例: http://www.echartsjs.com/gallery/editor.html?c=calendar-effectscatter
///
/// 在日历坐标系中使用关系图（以及混合图表）的示例: http://www.echartsjs.com/gallery/editor.html?c=calendar-graph
///
/// 灵活利用 echarts 图表和坐标系的组合，以及 API，可以实现更丰富的效果。 在日历中使用文字、 在日历中放置饼图
///
/// 水平和垂直放置日历
///
/// 在日历坐标系可以水平放置，也可以垂直放置。如上面的例子，使用热力图时，经常是水平放置的。但是如果需要格子的尺寸大些，水平放置就过于宽了，于是也可以选择垂直放置。参见 calendar.orient。
///
/// 尺寸的自适应
///
/// 可以设置日历坐标系使他支持不同尺寸的容器（页面）大小变化的自适应。首先，和 echarts 其他组件一样，日历坐标系可以选择使用 left right top bottom width height 来描述尺寸和位置，从而将日历摆放在上下左右各种位置，并随着页面尺寸变动而改变自身尺寸。另外，也可以使用 cellSize 来固定日历格子的长宽。
///
/// 中西方日历习惯的支持
///
/// 中西方日历有所差别，西方常使用星期日作为一周的第一天，中国使用星期一为一周的第一天。日历坐标系做了这种切换的支持。参见 calendar.dayLabel.firstDay。
///
/// 另外，日历上的『月份』和『星期几』的文字，也可以较方便的切换中英文，甚至自定义。参见 calendar.dayLabel.nameMap calendar.monthLabel.nameMap。
public final class Calendar: Zable {
    public final class BaseLabel: Displayable, Shadowable, Colorful, Borderable, Formatted {
        /// 是否在普通状态下显示标签。
        public var show: Bool?
        /// 一周从周几开始，默认从周日开始
        ///
        /// 例如：
        /// 
        ///     calendar: [{
        ///         dayLabel: {
        ///             firstDay: 1 // 从周一开始
        ///         }
        ///     }]
        public var firstDay: UInt8?
        /// 标签与轴线之间的距离
        public var margin: Float?
        /// 标签的位置 在标签的开头还是结尾。
        ///
        /// 可选：
        ///
        /// - 'start'
        /// - 'end'
        public var position: Position?
        /// 标签显示的效果，默认为'en' 可设置中英文以及自定义 下标0为对应标签的文字显示
        ///
        /// 使用示例：
        ///
        ///     // 快捷设置英文 ['S', 'M', 'T', 'W', 'T', 'F', 'S'],
        ///     nameMap: 'en'
        ///     // 快捷设置中文 ['日', '一', '二', '三', '四', '五', '六']
        ///     nameMap: 'cn'
        ///     // 自定义设置： 中英文混杂 或者不显示
        ///     nameMap: ['S', '一', 'T', '三', '', '五', 'S'],
        ///     
        ///     calendar: [{
        ///         dayLabel: {
        ///             nameMap: 'en'
        ///         }
        ///     }]
        ///
        ///     // 快捷设置英文 [
        ///                 'Jan', 'Feb', 'Mar',
        ///                 'Apr', 'May', 'Jun',
        ///                 'Jul', 'Aug', 'Sep',
        ///                 'Oct', 'Nov', 'Dec'
        ///             ],
        ///     nameMap: 'en'
        ///     // 快捷设置中文 [
        ///                 '一月', '二月', '三月',
        ///                 '四月', '五月', '六月',
        ///                 '七月', '八月', '九月',
        ///                 '十月', '十一月', '十二月'
        ///             ]
        ///     nameMap: 'cn'
        ///     // 自定义设置： 中英文混杂 或者不显示
        ///     nameMap: [
        ///             '一月', 'Feb', '三月',
        ///             '四月', 'May', '六月',
        ///             '七月', '八月', '',
        ///             '十月', 'Nov', '十二月'
        ///             ],
        ///     
        ///     calendar: [{
        ///         monthLabel: {
        ///             nameMap: 'en'
        ///         }
        ///     }]
        public var nameMap: OneOrMore<String>?
        /// 文字的颜色。
        public var color: Color?
        /// 设置日历坐标中 年的样式 
        ///
        /// PS: 暂时只支持 YearLabel
        public var formatter: Formatter?
        /// 文字字体的风格
        public var fontStyle: FontStyle?
        /// 文字字体的粗细
        public var fontWeight: FontWeight?
        /// 文字的字体系列
        public var fontFamily: String?
        /// 文字的字体大小
        public var fontSize: UInt?
        /// 文字水平对齐方式，默认自动。
        ///
        /// 可选：
        ///
        /// - 'left'
        /// - 'center'
        /// - 'right'
        ///
        /// rich 中如果没有设置 align，则会取父层级的 align。例如：
        ///
        ///     {
        ///         align: right,
        ///         rich: {
        ///             a: {
        ///                 // 没有设置 `align`，则 `align` 为 right
        ///             }
        ///         }
        ///     }
        public var align: Align?
        /// 文字垂直对齐方式，默认自动。
        ///
        /// 可选：
        ///
        /// - 'top'
        /// - 'middle'
        /// - 'bottom'
        ///
        /// rich 中如果没有设置 verticalAlign，则会取父层级的 verticalAlign。例如：
        ///
        ///     {
        ///         verticalAlign: bottom,
        ///         rich: {
        ///             a: {
        ///                 // 没有设置 `verticalAlign`，则 `verticalAlign` 为 bottom
        ///             }
        ///         }
        ///     }
        public var verticalAlign: VerticalAlign?
        /// 行高。
        ///
        /// rich 中如果没有设置 lineHeight，则会取父层级的 lineHeight。例如：
        ///
        ///     {
        ///         lineHeight: 56,
        ///         rich: {
        ///             a: {
        ///                 // 没有设置 `lineHeight`，则 `lineHeight` 为 56
        ///             }
        ///         }
        ///     }
        public var lineHeight: Float?
        /// 文字块背景色。
        ///
        /// 可以是直接的颜色值，例如：'#123234', 'red', rgba(0,23,11,0.3)'。
        ///
        /// 可以支持使用图片，例如：
        ///
        ///     backgroundColor: {
        ///         image: 'xxx/xxx.png'
        ///         // 这里可以是图片的 URL，
        ///         // 或者图片的 dataURI，
        ///         // 或者 HTMLImageElement 对象，
        ///         // 或者 HTMLCanvasElement 对象。
        ///     }
        ///
        /// 当使用图片的时候，可以使用 width 或 height 指定高宽，也可以不指定自适应。
        public var backgroundColor: Color?
        /// 文字块边框颜色。
        public var borderColor: Color?
        /// 文字块边框宽度。
        public var borderWidth: Float?
        /// 文字块的圆角。
        public var borderRadius: Float?
        /// 文字块的内边距。例如：
        ///
        /// - padding: [3, 4, 5, 6]：表示 [上, 右, 下, 左] 的边距。
        /// - padding: 4：表示 padding: [4, 4, 4, 4]。
        /// - padding: [3, 4]：表示 padding: [3, 4, 3, 4]。
        ///
        /// 注意，文字块的 width 和 height 指定的是内容高宽，不包含 padding。
        public var padding: Padding?
        /// 文字块的背景阴影颜色。
        public var shadowColor: Color?
        /// 文字块的背景阴影长度。
        public var shadowBlur: Float?
        /// 文字块的背景阴影 X 偏移。
        public var shadowOffsetX: Float?
        /// 文字块的背景阴影 Y 偏移。
        public var shadowOffsetY: Float?
        /// 文字块的宽度。一般不用指定，不指定则自动是文字的宽度。在想做表格项或者使用图片（参见 backgroundColor）时，可能会使用它。
        ///
        /// 注意，文字块的 width 和 height 指定的是内容高宽，不包含 padding。
        ///
        /// width 也可以是百分比字符串，如 '100%'。表示的是所在文本块的 contentWidth（即不包含文本块的 padding）的百分之多少。之所以以 contentWidth 做基数，因为每个文本片段只能基于 content box 布局。如果以 outerWidth 做基数，则百分比的计算在实用中不具有意义，可能会超出。
        ///
        /// 注意，如果不定义 rich 属性，则不能指定 width 和 height。
        public var width: LengthValue?
        /// 文字块的高度。一般不用指定，不指定则自动是文字的高度。在使用图片（参见 backgroundColor）时，可能会使用它。
        ///
        /// 注意，文字块的 width 和 height 指定的是内容高宽，不包含 padding。
        ///
        /// 注意，如果不定义 rich 属性，则不能指定 width 和 height。
        public var height: LengthValue?
        /// 文字本身的描边颜色。
        public var textBorderColor: Color?
        /// 文字本身的描边宽度。
        public var textBorderWidth: Float?
        /// 文字本身的阴影颜色。
        public var textShadowColor: Color?
        /// 文字本身的阴影长度。
        public var textShadowBlur: Float?
        /// 文字本身的阴影 X 偏移。
        public var textShadowOffsetX: Float?
        /// 文字本身的阴影 Y 偏移。
        public var textShadowOffsetY: Float?
        /// 在 rich 里面，可以自定义富文本样式。利用富文本样式，可以在标签中做出非常丰富的效果。
        ///
        /// 例如：
        ///
        ///     label: {
        ///         normal: {
        ///         
        ///             // 在文本中，可以对部分文本采用 rich 中定义样式。
        ///             // 这里需要在文本中使用标记符号：
        ///             // `{styleName|text content text content}` 标记样式名。
        ///             // 注意，换行仍是使用 '\n'。
        ///             formatter: [
        ///                 '{a|这段文本采用样式a}',
        ///                 '{b|这段文本采用样式b}这段用默认样式{x|这段用样式x}'
        ///             ].join('\n'),
        ///             
        ///             rich: {
        ///                 a: {
        ///                     color: 'red',
        ///                     lineHeight: 10
        ///                 },
        ///                 b: {
        ///                     backgroundColor: {
        ///                         image: 'xxx/xxx.jpg'
        ///                     },
        ///                     height: 40
        ///                 },
        ///                 x: {
        ///                     fontSize: 18,
        ///                     fontFamily: 'Microsoft YaHei',
        ///                     borderColor: '#449933',
        ///                     borderRadius: 4
        ///                 },
        ///                 ...
        ///             }
        ///         }
        ///     }
        ///
        /// 详情参见教程：富文本标签(http://echarts.baidu.com/tutorial.html#%E5%AF%8C%E6%96%87%E6%9C%AC%E6%A0%87%E7%AD%BE)
        public var rich: [String: Jsonable]?
    }
    
    /// 所有图形的 zlevel 值。
    ///
    /// zlevel用于 Canvas 分层，不同zlevel值的图形会放置在不同的 Canvas 中，Canvas 分层是一种常见的优化手段。我们可以把一些图形变化频繁（例如有动画）的组件设置成一个单独的zlevel。需要注意的是过多的 Canvas 会引起内存开销的增大，在手机端上需要谨慎使用以防崩溃。
    ///
    /// zlevel 大的 Canvas 会放在 zlevel 小的 Canvas 的上面。
    public var zlevel: Float?
    /// 组件的所有图形的z值。控制图形的前后顺序。z值小的图形会被z值大的图形覆盖。
    ///
    /// z相比zlevel优先级更低，而且不会创建新的 Canvas。
    public var z: Float?
    /// calendar组件离容器左侧的距离。
    ///
    /// left 的值可以是像 20 这样的具体像素值，可以是像 '20%' 这样相对于容器高宽的百分比，也可以是 'left', 'center', 'right'。
    ///
    /// 如果 left 的值为'left', 'center', 'right'，组件会根据相应的位置自动对齐。
    public var left: Position?
    /// calendar组件离容器上侧的距离。
    ///
    /// top 的值可以是像 20 这样的具体像素值，可以是像 '20%' 这样相对于容器高宽的百分比，也可以是 'top', 'middle', 'bottom'。
    ///
    /// 如果 top 的值为'top', 'middle', 'bottom'，组件会根据相应的位置自动对齐。
    public var top: Position?
    /// calendar组件离容器右侧的距离。
    ///
    /// right 的值可以是像 20 这样的具体像素值，可以是像 '20%' 这样相对于容器高宽的百分比。
    ///
    /// 默认自适应。
    public var right: Position?
    /// calendar组件离容器下侧的距离。
    ///
    /// bottom 的值可以是像 20 这样的具体像素值，可以是像 '20%' 这样相对于容器高宽的百分比。
    ///
    /// 默认自适应。
    public var bottom: Position?
    /// 日历坐标的整体宽度
    ///
    /// 注意: 默认cellSize 为20，若设置了width的值, 则cellSize中的宽度强制转为auto;
    public var width: LengthValue?
    /// 日历坐标的整体高度，
    ///
    /// 注意: 默认cellSize 为20，若设置了height的值, 则cellSize中的高度强制转为auto;
    public var height: LengthValue?
    /// 必填，日历坐标的范围 支持多种格式
    /// 使用示例：
    /// 
    ///     // 某一年
    ///     range: 2017
    ///     
    ///     // 某个月
    ///     range: '2017-02'
    ///     
    ///     // 某个区间
    ///     range: ['2017-01-02', '2017-02-23']
    ///     
    ///     // 注意 此写法会识别为['2017-01-01', '2017-02-01']
    ///     range: ['2017-01', '2017-02']
    public var range: Jsonable?
    /// 日历每格框的大小，可设置单值 或数组 第一个元素是宽 第二个元素是高。 支持设置自适应：auto, 默认为高宽均为20
    /// 使用示例：
    /// 
    ///     // 设置宽高均为20
    ///     cellSize: 20
    ///     
    ///     // 设置宽为20，高为40
    ///     cellSize: [20, 40]
    ///     
    ///     // 设置宽高均为40
    ///     cellSize: [40]
    ///     
    ///     // 设置宽高均自适应
    ///     cellSize: 'auto'
    ///     
    ///     // 设置宽自适应，高为40
    ///     cellSize: ['auto', 40]
    public var cellSize: OneOrMore<Jsonable>?
    /// 日历坐标的布局朝向。
    public var orient: Orient?
    /// 设置日历坐标分隔线的样式。
    public var splitLine: SplitLine?
    /// 设置日历格的样式
    public var itemStyle: ItemStyle?
    /// 设置日历坐标中 星期轴的样式
    public var dayLabel: DayLabel?
    /// 设置日历坐标中 月份轴的样式
    public var monthLabel: MonthLabel?
    /// 设置日历坐标中 年的样式
    public var yearLabel: YearLabel?
    /// 图形是否不响应和触发鼠标事件，默认为 false，即响应和触发鼠标事件。
    public var silent: Bool?
}

public typealias DayLabel = Calendar.BaseLabel
public typealias MonthLabel = Calendar.BaseLabel
public typealias YearLabel = Calendar.BaseLabel

extension Calendar.BaseLabel: Enumable {
    public enum Enums {
        case show(Bool), firstDay(UInt8), margin(Float), position(Position), nameMap(String), nameMaps([String]), color(Color), formatter(Formatter), fontStyle(FontStyle), fontWeight(FontWeight), fontFamily(String), fontSize(UInt), align(Align), verticalAlign(VerticalAlign), lineHeight(Float), backgroundColor(Color), borderColor(Color), borderWidth(Float), borderRadius(Float), padding(Padding), shadowColor(Color), shadowBlur(Float), shadowOffsetX(Float), shadowOffsetY(Float), width(LengthValue), height(LengthValue), textBorderColor(Color), textBorderWidth(Float), textShadowColor(Color), textShadowBlur(Float), textShadowOffsetX(Float), textShadowOffsetY(Float), rich([String: Jsonable])
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .show(show):
                self.show = show
            case let .firstDay(firstDay):
                self.firstDay = firstDay
            case let .margin(margin):
                self.margin = margin
            case let .position(position):
                self.position = position
            case let .nameMap(nameMap):
                self.nameMap = OneOrMore(one: nameMap)
            case let .nameMaps(nameMaps):
                self.nameMap = OneOrMore(more: nameMaps)
            case let .color(color):
                self.color = color
            case let .formatter(formatter):
                self.formatter = formatter
            case let .fontStyle(fontStyle):
                self.fontStyle = fontStyle
            case let .fontWeight(fontWeight):
                self.fontWeight = fontWeight
            case let .fontFamily(fontFamily):
                self.fontFamily = fontFamily
            case let .fontSize(fontSize):
                self.fontSize = fontSize
            case let .align(align):
                self.align = align
            case let .verticalAlign(verticalAlign):
                self.verticalAlign = verticalAlign
            case let .lineHeight(lineHeight):
                self.lineHeight = lineHeight
            case let .backgroundColor(backgroundColor):
                self.backgroundColor = backgroundColor
            case let .borderColor(borderColor):
                self.borderColor = borderColor
            case let .borderWidth(borderWidth):
                self.borderWidth = borderWidth
            case let .borderRadius(borderRadius):
                self.borderRadius = borderRadius
            case let .padding(padding):
                self.padding = padding
            case let .shadowColor(shadowColor):
                self.shadowColor = shadowColor
            case let .shadowBlur(shadowBlur):
                self.shadowBlur = shadowBlur
            case let .shadowOffsetX(shadowOffsetX):
                self.shadowOffsetX = shadowOffsetX
            case let .shadowOffsetY(shadowOffsetY):
                self.shadowOffsetY = shadowOffsetY
            case let .width(width):
                self.width = width
            case let .height(height):
                self.height = height
            case let .textBorderColor(textBorderColor):
                self.textBorderColor = textBorderColor
            case let .textBorderWidth(textBorderWidth):
                self.textBorderWidth = textBorderWidth
            case let .textShadowColor(textShadowColor):
                self.textShadowColor = textShadowColor
            case let .textShadowBlur(textShadowBlur):
                self.textShadowBlur = textShadowBlur
            case let .textShadowOffsetX(textShadowOffsetX):
                self.textShadowOffsetX = textShadowOffsetX
            case let .textShadowOffsetY(textShadowOffsetY):
                self.textShadowOffsetY = textShadowOffsetY
            case let .rich(rich):
                self.rich = rich
            }
        }
    }
}

extension Calendar.BaseLabel: Mappable {
    public func mapping(_ map: Mapper) {
        map["show"] = show
        map["firstDay"] = firstDay
        map["margin"] = margin
        map["position"] = position
        map["nameMap"] = nameMap
        map["color"] = color
        map["formatter"] = formatter
        map["fontStyle"] = fontStyle
        map["fontWeight"] = fontWeight
        map["fontFamily"] = fontFamily
        map["fontSize"] = fontSize
        map["align"] = align
        map["verticalAlign"] = verticalAlign
        map["lineHeight"] = lineHeight
        map["backgroundColor"] = backgroundColor
        map["borderColor"] = borderColor
        map["borderWidth"] = borderWidth
        map["borderRadius"] = borderRadius
        map["padding"] = padding
        map["shadowColor"] = shadowColor
        map["shadowBlur"] = shadowBlur
        map["shadowOffsetX"] = shadowOffsetX
        map["shadowOffsetY"] = shadowOffsetY
        map["width"] = width
        map["height"] = height
        map["textBorderColor"] = textBorderColor
        map["textBorderWidth"] = textBorderWidth
        map["textShadowColor"] = textShadowColor
        map["textShadowBlur"] = textShadowBlur
        map["textShadowOffsetX"] = textShadowOffsetX
        map["textShadowOffsetY"] = textShadowOffsetY
        map["rich"] = rich
    }
}

extension Calendar: Enumable {
    public enum Enums {
        case zlevel(Float), z(Float), left(Position), top(Position), right(Position), bottom(Position), width(LengthValue), height(LengthValue), range(Jsonable), cellSize(Jsonable), cellSizes([Jsonable]), orient(Orient), splitLine(SplitLine), itemStyle(ItemStyle), dayLabel(DayLabel), monthLabel(MonthLabel), yearLabel(YearLabel), silent(Bool)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
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
            case let .width(width):
                self.width = width
            case let .height(height):
                self.height = height
            case let .range(range):
                self.range = range
            case let .cellSize(cellSize):
                self.cellSize = OneOrMore(one: cellSize)
            case let .cellSizes(cellSizes):
                self.cellSize = OneOrMore(more: cellSizes)
            case let .orient(orient):
                self.orient = orient
            case let .splitLine(splitLine):
                self.splitLine = splitLine
            case let .itemStyle(itemStyle):
                self.itemStyle = itemStyle
            case let .dayLabel(dayLabel):
                self.dayLabel = dayLabel
            case let .monthLabel(monthLabel):
                self.monthLabel = monthLabel
            case let .yearLabel(yearLabel):
                self.yearLabel = yearLabel
            case let .silent(silent):
                self.silent = silent
            }
        }
    }
}

extension Calendar: Mappable {
    public func mapping(_ map: Mapper) {
        map["zlevel"] = zlevel
        map["z"] = z
        map["left"] = left
        map["top"] = top
        map["right"] = right
        map["bottom"] = bottom
        map["width"] = width
        map["height"] = height
        map["range"] = range
        map["cellSize"] = cellSize
        map["orient"] = orient
        map["splitLine"] = splitLine
        map["itemStyle"] = itemStyle
        map["dayLabel"] = dayLabel
        map["monthLabel"] = monthLabel
        map["yearLabel"] = yearLabel
        map["silent"] = silent
    }
}
