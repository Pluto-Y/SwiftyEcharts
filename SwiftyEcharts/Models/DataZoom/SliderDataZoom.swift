//
//  SliderDataZoom.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 17/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 滑动条型数据区域缩放组件（dataZoomSlider）
public final class SliderDataZoom: DataZoom, Displayable, Zable {
    
    /// 数据阴影的样式。
    public final class DataBackground {
        /// 阴影的线条样式
        public var lineStyle: EmphasisLineStyle?
        /// 阴影的填充样式
        public var areaStyle: AreaStyle?
    }
    
    /// 手柄的样式配置，见 示例: http://echarts.baidu.com/gallery/editor.html?c=area-simple
    public final class HandleStyle: Colorful, Borderable, Shadowable, Opacitable {
        /// 图形的颜色。
        /// > 颜色可以使用 RGB 表示，比如 'rgb(128, 128, 128)'，如果想要加上 alpha 通道表示不透明度，可以使用 RGBA，比如 'rgba(128, 128, 128, 0.5)'，也可以使用十六进制格式，比如 '#ccc'。除了纯色之外颜色也支持渐变色和纹理填充
        ///
        ///     // 线性渐变，前四个参数分别是 x0, y0, x2, y2, 范围从 0 - 1，相当于在图形包围盒中的百分比，如果最后一个参数传 `true`，则该四个值是绝对的像素位置
        ///     color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
        ///         offset: 0, color: 'red' // 0% 处的颜色
        ///     }, {
        ///         offset: 1, color: 'blue' // 100% 处的颜色
        ///     }], false)
        ///     // 径向渐变，前三个参数分别是圆心 x, y 和半径，取值同线性渐变
        ///     color: new echarts.graphic.RadialGradient(0.5, 0.5, 0.5, [...], false)
        ///     // 纹理填充
        ///     color: new echarts.graphic.Pattern(
        ///         imageDom, // 支持为 HTMLImageElement, HTMLCanvasElement，不支持路径字符串
        ///         'repeat' // 是否平铺, 可以是 repeat-x, repeat-y, no-repeat
        ///     )
        public var color: Color?
        /// 图形的描边颜色。支持的格式同 color。
        public var borderColor: Color?
        /// 描边线宽。为 0 时无描边。
        public var borderWidth: Float?
        /// 柱条的描边类型，默认为实线，支持 'solid', 'dashed', 'dotted'。
        public var borderType: LineType?
        /// 图形阴影的模糊大小。该属性配合 shadowColor,shadowOffsetX, shadowOffsetY 一起设置图形的阴影效果。
        ///
        /// 示例：
        ///
        ///     {
        ///         shadowColor: 'rgba(0, 0, 0, 0.5)',
        ///         shadowBlur: 10
        ///     }
        public var shadowBlur: Float?
        /// 阴影颜色。支持的格式同color。
        public var shadowColor: Color?
        /// 阴影水平方向上的偏移距离。
        public var shadowOffsetX: Float?
        /// 阴影垂直方向上的偏移距离。
        public var shadowOffsetY: Float?
        /// 图形透明度。支持从 0 到 1 的数字，为 0 时不绘制该图形。
        public var opacity: Float?
    }
    
    /// 类型
    public var type: String {
        return "slider"
    }
    
    /// 是否显示 组件。如果设置为 false，不会显示，但是数据过滤的功能还存在。
    public var show: Bool?
    /// 组件的背景颜色。
    public var backgroundColor: Color?
    /// 数据阴影的样式。
    public var dataBackground: DataBackground?
    /// 选中范围的填充颜色。
    public var fillerColor: Color?
    /// 边框颜色。
    public var borderColor: Color?
    /// 手柄的 icon 形状，支持路径字符串，默认为：
    /// 'M8.2,13.6V3.9H6.3v9.7H3.1v14.9h3.3v9.7h1.8v-9.7h3.3V13.6H8.2z M9.7,24.4H4.8v-1.4h4.9V24.4z M9.7,19.1H4.8v-1.4h4.9V19.1z'
    /// 自定义 icon 见 示例: http://echarts.baidu.com/gallery/editor.html?c=area-simple
    public var handleIcon: String?
    /// 控制手柄的尺寸，可以是像素大小，也可以是相对于 dataZoom 组件宽度的百分比，默认跟 dataZoom 宽度相同。
    public var handleSize: LengthValue?
    /// 手柄的样式配置，见 示例: http://echarts.baidu.com/gallery/editor.html?c=area-simple
    public var handleStyle: HandleStyle?
    /// 显示label的小数精度。默认根据数据自动决定。
    public var labelPrecision: Float?
    /// 显示的label的格式化器。
    public var labelFormatter: Formatter?
    /// 是否显示detail，即拖拽时候显示详细数值信息。
    public var showDetail: Bool?
    /// 是否在 dataZoom-silder 组件中显示数据阴影。数据阴影可以简单地反应数据走势。
    public var showDataShadow: String? // FIXME: ??
    /// 拖动时，是否实时更新系列的视图。如果设置为 false，则只在拖拽结束的时候更新。
    public var realtime: Bool?
    /// 文本样式
    public var textStyle: TextStyle?
    /// 设置 dataZoom-inside 组件控制的 x轴（即xAxis，是直角坐标系中的概念，参见 grid）。
    /// 不指定时，当 dataZoom-inside.orient 为 'horizontal'时，默认控制和 dataZoom 平行的第一个 xAxis。但是不建议使用默认值，建议显式指定。
    /// 如果是 number 表示控制一个轴，如果是 Array 表示控制多个轴。
    /// 例如有如下 ECharts option：
    ///
    ///         option: {
    ///             xAxis: [
    ///                 {...}, // 第一个 xAxis
    ///                 {...}, // 第二个 xAxis
    ///                 {...}, // 第三个 xAxis
    ///                 {...}  // 第四个 xAxis
    ///             ],
    ///             dataZoom: [
    ///                 { // 第一个 dataZoom 组件
    ///                     xAxisIndex: [0, 2] // 表示这个 dataZoom 组件控制 第一个 和 第三个 xAxis
    ///                 },
    ///                 { // 第二个 dataZoom 组件
    ///                     xAxisIndex: 3      // 表示这个 dataZoom 组件控制 第四个 xAxis
    ///                 }
    ////            ]
    ///         }
    public var xAxisIndex: OneOrMore<UInt8>?
    /// 设置 dataZoom-inside 组件控制的 x轴（即yAxis，是直角坐标系中的概念，参见 grid）。
    /// 不指定时，当 dataZoom-inside.orient 为 'vertical'时，默认控制和 dataZoom 平行的第一个 yAxis。但是不建议使用默认值，建议显式指定。
    /// 如果是 number 表示控制一个轴，如果是 Array 表示控制多个轴。
    /// 例如有如下 ECharts option：
    ///
    ///         option: {
    ///             yAxis: [
    ///                 {...}, // 第一个 yAxis
    ///                 {...}, // 第二个 yAxis
    ///                 {...}, // 第三个 yAxis
    ///                 {...}  // 第四个 yAxis
    ///             ],
    ///             dataZoom: [
    ///                 { // 第一个 dataZoom 组件
    ///                     yAxisIndex: [0, 2] // 表示这个 dataZoom 组件控制 第一个 和 第三个 yAxis
    ///                 },
    ///                 { // 第二个 dataZoom 组件
    ///                     yAxisIndex: 3      // 表示这个 dataZoom 组件控制 第四个 yAxis
    ///                 }
    ////            ]
    ///         }
    public var yAxisIndex: OneOrMore<UInt8>?
    /// 设置 dataZoom-inside 组件控制的 radius 轴（即radiusAxis，是直角坐标系中的概念，参见 polar）。
    /// 如果是 number 表示控制一个轴，如果是 Array 表示控制多个轴。
    /// 例如有如下 ECharts option：
    ///
    ///         option: {
    ///             radiusAxis: [
    ///                 {...}, // 第一个 radiusAxis
    ///                 {...}, // 第二个 radiusAxis
    ///                 {...}, // 第三个 radiusAxis
    ///                 {...}  // 第四个 radiusAxis
    ///             ],
    ///             dataZoom: [
    ///                 { // 第一个 dataZoom 组件
    ///                     radiusAxisIndex: [0, 2] // 表示这个 dataZoom 组件控制 第一个 和 第三个 radiusAxis
    ///                 },
    ///                 { // 第二个 dataZoom 组件
    ///                     radiusAxisIndex: 3      // 表示这个 dataZoom 组件控制 第四个 radiusAxis
    ///                 }
    ///             ]
    ///         }
    public var radiusAxisIndex: OneOrMore<UInt8>?
    /// 设置 dataZoom-inside 组件控制的 angle 轴（即angleAxis，是直角坐标系中的概念，参见 polar）。
    /// 如果是 number 表示控制一个轴，如果是 Array 表示控制多个轴。
    /// 例如有如下 ECharts option：
    ///
    ///         option: {
    ///             angleAxis: [
    ///                 {...}, // 第一个 angleAxis
    ///                 {...}, // 第二个 angleAxis
    ///                 {...}, // 第三个 angleAxis
    ///                 {...}  // 第四个 angleAxis
    ///             ],
    ///             dataZoom: [
    ///                 { // 第一个 dataZoom 组件
    ///                     angleAxisIndex: [0, 2] // 表示这个 dataZoom 组件控制 第一个 和 第三个 angleAxis
    ///                 },
    ///                 { // 第二个 dataZoom 组件
    ///                     angleAxisIndex: 3      // 表示这个 dataZoom 组件控制 第四个 angleAxis
    ///                 }
    ///             ]
    ///         }
    public var angleAxisIndex: OneOrMore<UInt8>?
    /// dataZoom 的运行原理是通过 数据过滤 来达到 数据窗口缩放 的效果。数据过滤模式的设置不同，效果也不同。
    /// 可选值为：
    /// - 'filter'：当前数据窗口外的数据，被 过滤掉。即会影响其他轴的数据范围。
    /// - 'empty'：当前数据窗口外的数据，被 设置为空。即不会影响其他轴的数据范围。
    /// 如何设置，由用户根据场景和需求自己决定。经验来说：
    /// - 当『只有 X 轴 或 只有 Y 轴受 dataZoom 组件控制』时，常使用 filterMode: 'filter'，这样能使另一个轴自适应过滤后的数值范围。
    /// - 当『X 轴 Y 轴分别受 dataZoom 组件控制』时：
    ///     - 如果 X 轴和 Y 轴是『同等地位的、不应互相影响的』，比如在『双数值轴散点图』中，那么两个轴可都设为 fiterMode: 'empty'。
    ///     - 如果 X 轴为主，Y 轴为辅，比如在『柱状图』中，需要『拖动 dataZoomX 改变 X 轴过滤柱子时，Y 轴的范围也自适应剩余柱子的高度』，『拖动 dataZoomY 改变 Y 轴过滤柱子时，X 轴范围不受影响』，那么就 X轴设为 fiterMode: 'filter'，Y 轴设为 fiterMode: 'empty'，即主轴 'filter'，辅轴 'empty'。
    /// 下面是个具体例子：
    ///
    ///         option = {
    ///             dataZoom: [
    ///                 {
    ///                     id: 'dataZoomX',
    ///                     type: 'slider',
    ///                     xAxisIndex: [0],
    ///                     filterMode: 'filter'
    ///                 },
    ///                 {
    ///                     id: 'dataZoomY',
    ///                     type: 'slider',
    ///                     yAxisIndex: [0],
    ///                     filterMode: 'empty'
    ///                 }
    ///             ],
    ///             xAxis: {type: 'value'},
    ///             yAxis: {type: 'value'},
    ///             series{
    ///                 type: 'bar',
    ///                 data: [
    ///                 // 第一列对应 X 轴，第二列对应 Y 轴。
    ///                     [12, 24, 36],
    ///                     [90, 80, 70],
    ///                     [3, 9, 27],
    ///                     [1, 11, 111]
    ///                 ]
    ///             }
    ///         }
    ///
    /// 上例中，dataZoomX 的 filterMode 设置为 'filter'。于是，假设当用户拖拽 dataZoomX（不去动 dataZoomY）导致其 valueWindow 变为 [2, 50] 时，dataZoomX 对 series.data 的第一列进行遍历，窗口外的整项去掉，最终得到的 series.data 为：
    ///
    ///         [
    ///             // 第一列对应 X 轴，第二列对应 Y 轴。
    ///             [12, 24, 36],
    ///             // [90, 80, 70] 整项被过滤掉，因为 90 在 dataWindow 之外。
    ///             [3, 9, 27]
    ///             // [1, 11, 111] 整项被过滤掉，因为 1 在 dataWindow 之外。
    ///         ]
    ///
    /// 过滤前，series.data 中对应 Y 轴的值有 24、80、9、11，过滤后，只剩下 24 和 9，那么 Y 轴的显示范围就会自动改变以适应剩下的这两个值的显示（如果 Y 轴没有被设置 min、max 固定其显示范围的话）。
    /// 所以，filterMode: 'filter' 的效果是：过滤数据后使另外的轴也能自动适应当前数据的范围。
    /// 再从头来，上例中 dataZoomY 的 filterMode 设置为 'empty'。于是，假设当用户拖拽 dataZoomY（不去动 dataZoomX）导致其 dataWindow 变为 [10, 60] 时，dataZoomY 对 series.data 的第二列进行遍历，窗口外的值被设置为 empty （即替换为 NaN，这样设置为空的项，其所对应柱形，在 X 轴还有占位，只是不显示出来）。最终得到的 series.data 为：
    ///
    ///         [
    ///             // 第一列对应 X 轴，第二列对应 Y 轴。
    ///             [12, 24, 36],
    ///             [90, NaN, 70], // 设置为 empty (NaN)
    ///             [3, NaN, 27],  // 设置为 empty (NaN)
    ///             [1, 11, 111]
    ///         ]
    ///
    /// 这时，series.data 中对应于 X 轴的值仍然全部保留不受影响，为 12、90、3、1。那么用户对 dataZoomY 的拖拽操作不会影响到 X 轴的范围。这样的效果，对于离群点（outlier）过滤功能，比较清晰。
    /// 如地址的例子：
    public var filterMode: FilterMode?
    /// 数据窗口范围的起始百分比。范围是：0 ~ 100。表示 0% ~ 100%。
    public var start: Float?
    /// 数据窗口范围的结束百分比。范围是：0 ~ 100。
    public var end: Float?
    /// 数据窗口范围的起始数值。如果设置了 dataZoom-inside.start 则 startValue 失效。
    /// dataZoom-inside.startValue 和 dataZoom-inside.endValue 共同用 绝对数值 的形式定义了数据窗口范围。
    /// 注意，如果轴的类型为 category，则 startValue 既可以设置为 axis.data 数组的 index，也可以设置为数组值本身。 但是如果设置为数组值本身，会在内部自动转化为数组的 index。
    public var startValue: Jsonable?
    /// 数据窗口范围的结束数值。如果设置了 dataZoom-inside.end 则 endValue 失效。
    /// dataZoom-inside.startValue 和 dataZoom-inside.endValue 共同用 绝对数值 的形式定义了数据窗口范围。
    /// 注意，如果轴的类型为 category，则 endValue 即可以设置为 axis.data 数组的 index，也可以设置为数组值本身。 但是如果设置为数组值本身，会在内部自动转化为数组的 index。
    public var endValue: Jsonable?
    /// 布局方式是横还是竖。不仅是布局方式，对于直角坐标系而言，也决定了，缺省情况控制横向数轴还是纵向数轴。
    public var orient: Orient?
    /// 是否锁定选择区域（或叫做数据窗口）的大小。
    /// 如果设置为 true 则锁定选择区域的大小，也就是说，只能平移，不能缩放。
    public var zoomLock: Bool?
    /// 所有图形的 zlevel 值。
    /// zlevel用于 Canvas 分层，不同zlevel值的图形会放置在不同的 Canvas 中，Canvas 分层是一种常见的优化手段。我们可以把一些图形变化频繁（例如有动画）的组件设置成一个单独的zlevel。需要注意的是过多的 Canvas 会引起内存开销的增大，在手机端上需要谨慎使用以防崩溃。
    /// zlevel 大的 Canvas 会放在 zlevel 小的 Canvas 的上面。
    public var zlevel: Float?
    /// 组件的所有图形的z值。控制图形的前后顺序。z值小的图形会被z值大的图形覆盖。
    /// z相比zlevel优先级更低，而且不会创建新的 Canvas。
    public var z: Float?
    /// dataZoom-slider组件离容器左侧的距离。
    public var left: Position?
    /// dataZoom-slider组件离容器上侧的距离。
    public var top: Position?
    /// dataZoom-slider组件离容器右侧的距离。
    public var right: Position?
    /// dataZoom-slider组件离容器下侧的距离。
    public var bottom: Position?
    // dataZoom-slider组件的宽度
    public var width: LengthValue?
    // dataZoom-slider组件的高度
    public var height: LengthValue?
}

extension SliderDataZoom.DataBackground: Enumable {
    public enum Enums {
        case lineStyle(EmphasisLineStyle), areaStyle(AreaStyle)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .lineStyle(lineStyle):
                self.lineStyle = lineStyle
            case let .areaStyle(areaStyle):
                self.areaStyle = areaStyle
            }
        }
    }
}

extension SliderDataZoom.DataBackground: Mappable {
    public func mapping(_ map: Mapper) {
        map["lineStyle"] = lineStyle
        map["areaStyle"] = areaStyle
    }
}

extension SliderDataZoom.HandleStyle: Enumable {
    public enum Enums {
        case color(Color), borderColor(Color), borderWidth(Float), borderType(LineType), shadowBlur(Float), shadowColor(Color), shadowOffsetX(Float), shadowOffsetY(Float), opacity(Float)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .color(color):
                self.color = color
            case let .borderColor(color):
                self.borderColor = color
            case let .borderWidth(width):
                self.borderWidth = width
            case let .borderType(borderType):
                self.borderType = borderType
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

extension SliderDataZoom.HandleStyle: Mappable {
    public func mapping(_ map: Mapper) {
        map["color"] = color
        map["borderColor"] = borderColor
        map["borderWidth"] = borderWidth
        map["borderType"] = borderType
        map["shadowBlur"] = shadowBlur
        map["shadowColor"] = shadowColor
        map["shadowOffsetX"] = shadowOffsetX
        map["shadowOffsetY"] = shadowOffsetY
        map["opacity"] = opacity
    }
}

extension SliderDataZoom: Enumable {
    public enum Enums {
        case show(Bool), backgroundColor(Color), dataBackground(DataBackground), fillerColor(Color), borderColor(Color), handleIcon(String), handleSize(LengthValue), handleStyle(HandleStyle), labelPrecision(Float), labelFormatter(Formatter), showDetail(Bool), showDataShadow(String), realtime(Bool), textStyle(TextStyle), xAxisIndex(UInt8), xAxisIndexes([UInt8]), yAxisIndex(UInt8), yAxisIndexes([UInt8]), radiusAxisIndex(UInt8), radiusAxisIndexes([UInt8]), angleAxisIndex(UInt8), angleAxisIndexes([UInt8]), filterMode(FilterMode), start(Float), end(Float), startValue(Jsonable), endValue(Jsonable), orient(Orient), zoomLock(Bool), zlevel(Float), z(Float), left(Position), x(Position), top(Position), y(Position), right(Position), bottom(Position), width(LengthValue), height(LengthValue)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .show(show):
                self.show = show
            case let .backgroundColor(backgroundColor):
                self.backgroundColor = backgroundColor
            case let .dataBackground(dataBackground):
                self.dataBackground = dataBackground
            case let .fillerColor(fillerColor):
                self.fillerColor = fillerColor
            case let .borderColor(borderColor):
                self.borderColor = borderColor
            case let .handleIcon(handleIcon):
                self.handleIcon = handleIcon
            case let .handleSize(handleSize):
                self.handleSize = handleSize
            case let .handleStyle(handleStyle):
                self.handleStyle = handleStyle
            case let .labelPrecision(labelPrecision):
                self.labelPrecision = labelPrecision
            case let .labelFormatter(labelFormatter):
                self.labelFormatter = labelFormatter
            case let .showDetail(showDetail):
                self.showDetail = showDetail
            case let .showDataShadow(showDataShadow):
                self.showDataShadow = showDataShadow
            case let .realtime(realtime):
                self.realtime = realtime
            case let .textStyle(textStyle):
                self.textStyle = textStyle
            case let .xAxisIndex(xAxisIndex):
                self.xAxisIndex = OneOrMore(one: xAxisIndex)
            case let .xAxisIndexes(xAxisIndexes):
                self.xAxisIndex = OneOrMore(more: xAxisIndexes)
            case let .yAxisIndex(yAxisIndex):
                self.yAxisIndex = OneOrMore(one: yAxisIndex)
            case let .yAxisIndexes(yAxisIndexes):
                self.yAxisIndex = OneOrMore(more: yAxisIndexes)
            case let .radiusAxisIndex(radiusAxisIndex):
                self.radiusAxisIndex = OneOrMore(one: radiusAxisIndex)
            case let .radiusAxisIndexes(radiusAxisIndexes):
                self.radiusAxisIndex = OneOrMore(more: radiusAxisIndexes)
            case let .angleAxisIndex(angleAxisIndex):
                self.angleAxisIndex = OneOrMore(one: angleAxisIndex)
            case let .angleAxisIndexes(angleAxisIndexes):
                self.angleAxisIndex = OneOrMore(more: angleAxisIndexes)
            case let .filterMode(filterMode):
                self.filterMode = filterMode
            case let .start(start):
                self.start = start
            case let .end(end):
                self.end = end
            case let .startValue(startValue):
                self.startValue = startValue
            case let .endValue(endValue):
                self.endValue = endValue
            case let .orient(orient):
                self.orient = orient
            case let .zoomLock(zoomLock):
                self.zoomLock = zoomLock
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
            }
        }
    }
}

extension SliderDataZoom: Mappable {
    public func mapping(_ map: Mapper) {
        map["type"] = type
        map["show"] = show
        map["backgroundColor"] = backgroundColor
        map["dataBackground"] = dataBackground
        map["fillerColor"] = fillerColor
        map["borderColor"] = borderColor
        map["handleIcon"] = handleIcon
        map["handleSize"] = handleSize
        map["handleStyle"] = handleStyle
        map["labelPrecision"] = labelPrecision
        map["labelFormatter"] = labelFormatter
        map["showDetail"] = showDetail
        map["showDataShadow"] = showDataShadow
        map["realtime"] = realtime
        map["textStyle"] = textStyle
        map["xAxisIndex"] = xAxisIndex
        map["yAxisIndex"] = yAxisIndex
        map["radiusAxisIndex"] = radiusAxisIndex
        map["angleAxisIndex"] = angleAxisIndex
        map["filterMode"] = filterMode
        map["start"] = start
        map["end"] = end
        map["startValue"] = startValue
        map["endValue"] = endValue
        map["orient"] = orient
        map["zoomLock"] = zoomLock
        map["zlevel"] = zlevel
        map["z"] = z
        map["left"] = left
        map["top"] = top
        map["right"] = right
        map["bottom"] = bottom
        map["width"] = width
        map["height"] = height
    }
}
