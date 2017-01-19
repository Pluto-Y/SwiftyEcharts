//
//  SECTimeline.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 19/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// timeline 组件，提供了在多个 ECharts option 间进行切换、播放等操作的功能。
/// 具体示例地址： 
/// timeline 和其他组件有些不同，它需要操作『多个option』。 假设，我们把 ECharts 的传统的 option 称为原子option，那么使用 timeline 时，传入 ECharts 的 option 就成为了一个集合多个原子option的复合option。如下示例：
/// 如下，baseOption 是一个 『原子option』，options 数组中的每一项也是一个 『原子option』。
/// 每个『原子option』中就是本文档中描述的各种配置项。
///
///     myChart.setOption(
///         {
///             baseOption: {
///                 timeline: {
///                     ...,
///                     data: ['2002-01-01', '2003-01-01', '2004-01-01']
///                 },
///                 title: {
///                     subtext: '数据来自国家统计局'
///                 },
///                 grid: {...},
///                 xAxis: [...],
///                 yAxis: [...],
///                 series: [
///                     { // 系列一的一些其他配置
///                         type: 'bar',
///                         ...
///                     },
///                     { // 系列二的一些其他配置
///                         type: 'line',
///                         ...
///                     },
///                     { // 系列三的一些其他配置
///                         type: 'pie',
///                         ...
///                     }
///                 ]
///             },
///             options: [
///                 { // 这是'2002-01-01' 对应的 option
///                     title: {
///                         text: '2002年统计值'
///                     },
///                     series: [
///                         {data: []}, // 系列一的数据
///                         {data: []}, // 系列二的数据
///                         {data: []}  // 系列三的数据
///                     ]
///                 },
///                 { // 这是'2003-01-01' 对应的 option
///                     title: {
///                         text: '2003年统计值'
///                     },
///                     series: [
///                         {data: []},
///                         {data: []},
///                         {data: []}
///                     ]
///                 },
///                 { // 这是'2004-01-01' 对应的 option
///                     title: {
///                         text: '2004年统计值'
///                     },
///                     series: [
///                         {data: []},
///                         {data: []},
///                         {data: []}
///                     ]
///                 }
///             ]
///         }
///     );
///
/// 在上例中，timeline.data 中的每一项，对应于 options 数组中的每个 option。
/// 
/// 使用注意与最佳实践：
/// 公有的配置项，推荐配置在 baseOption 中。timeline 播放切换时，会把 options 数组中的对应的 option，与 baseOption 进行 merge 形成最终的 option。
/// options 数组中，如果某一数组项中配置了某个属性，那么其他数组项中也必须配置某个属性，而不能缺省。否则这个属性的执行效果会遗留。
/// 复合 option 中的 options 不支持 merge。
/// 也就是说，当第二（或三、四、五 ...）次 chart.setOption(rawOption) 时，如果 rawOption 是复合 option（即包含 options 列表），那么新的 rawOption.options 列表不会和老的 options 列表进行 merge，而是简单替代。当然，rawOption.baseOption 仍然会正常和老的 option 进行merge。
/// 
/// 与 ECharts 2 的兼容性：
/// ECharts 3 中不再支持 timeline.notMerge 参数，也就是不支持 notMerge 模式。如果遇到这种场景需要使用，可在外部进行option管理，并用 setOption(option, true) 这样的notMerge方式设置。
/// ECharts 3 和 ECharts 2 相比，timeline 属性的定义位置有所不同，移到了 baseOption 中，统一作为一个普通的组件看待。但是，仍然兼容 ECharts2 的 timeline 定义位置，只是不再推荐这样写。
public struct SECTimeline : SECDisplayable, SECSymbolized {
    /// 轴的类型。可选值为
    ///
    /// - value: 数值轴，适用于连续数据。
    /// - category: 类目轴，适用于离散的类目数据。
    /// - time: 时间轴，适用于连续的时序数据，与数值轴相比时间轴带有时间的格式化，在刻度计算上也有所不同，例如会根据跨度的范围来决定使用月，星期，日还是小时范围的刻度。
    public enum AxisType : String, SECJsonable {
        case value = "value"
        case category = "category"
        case time = "time"
        
        public var jsonString: String {
            return "\"\(self.rawValue)\""
        }
    }
    
    public struct LineStyle : SECDisplayable, SECShadowable, SECColorful, SECOpacitable {
        /// 是否显示轴线。可以设置为 false 不显示轴线，则可以做出不同的样式效果。
        public var show: Bool?
        /// timeline 线的颜色。
        /// 颜色可以使用 RGB 表示，比如 'rgb(128, 128, 128)'，如果想要加上 alpha 通道表示不透明度，可以使用 RGBA，比如 'rgba(128, 128, 128, 0.5)'，也可以使用十六进制格式，比如 '#ccc'。除了纯色之外颜色也支持渐变色和纹理填充
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
        public var color: SECColor?
        /// timeline 线宽。
        public var width: Float?
        /// timeline 线的类型。
        public var type: SECLineType?
        /// 图形阴影的模糊大小。该属性配合 shadowColor,shadowOffsetX, shadowOffsetY 一起设置图形的阴影效果。
        /// 示例：
        ///
        ///     {
        ///         shadowColor: 'rgba(0, 0, 0, 0.5)',
        ///         shadowBlur: 10
        ///     }
        public var shadowBlur: Float?
        /// 阴影颜色。支持的格式同color。
        public var shadowColor: SECColor?
        /// 阴影水平方向上的偏移距离。
        public var shadowOffsetX: Float?
        /// 阴影垂直方向上的偏移距离。
        public var shadowOffsetY: Float?
        /// 图形透明度。支持从 0 到 1 的数字，为 0 时不绘制该图形。
        public var opacity: Float?
    }
    
    public struct CheckpointStyle : SECSymbolized, SECColorful, SECBorderable {
       /// timeline.checkpointStyle 标记的图形。
        public var symbol: SECSymbol?
        /// timeline.checkpointStyle 标记的大小，可以设置成诸如 10 这样单一的数字，也可以用数组分开表示宽和高，例如 [20, 10] 表示标记宽为20，高为10。
        public var symbolSize: Float?
        /// timeline.checkpointStyle 标记的旋转角度。注意在 markLine 中当 symbol 为 'arrow' 时会忽略 symbolRotate 强制设置为切线的角度。
        public var symbolRotate: Float?
        /// timeline.checkpointStyle 标记相对于原本位置的偏移。默认情况下，标记会居中置放在数据对应的位置，但是如果 symbol 是自定义的矢量路径或者图片，就有可能不希望 symbol 居中。这时候可以使用该配置项配置 symbol 相对于原本居中的偏移，可以是绝对的像素值，也可以是相对的百分比。
        /// 例如 [0, '50%'] 就是把自己向上移动了一半的位置，在 symbol 图形是气泡的时候可以让图形下端的箭头对准数据点。
        public var symbolOffset: [Float]?
        /// timeline组件中『当前项』（checkpoint）的颜色。
        public var color: SECColor?
        /// timeline组件中『当前项』（checkpoint）的边框宽度。
        public var borderWidth: Float?
        /// timeline组件中『当前项』（checkpoint）的边框颜色。
        public var borderColor: SECColor?
        /// timeline组件中『当前项』（checkpoint）在 timeline 播放切换中的移动，是否有动画。
        public var animation: Bool?
        /// timeline组件中『当前项』（checkpoint）的动画时长。
        public var animationDuration: Float?
        /// timeline组件中『当前项』（checkpoint）的动画的缓动效果。
        public var animationEasing: SECAnimation?
    }
    
    public struct ControlStyle : SECDisplayable, SECEmphasisable {
        
        /// 控制按钮的的样式。
        public struct CStyle : SECColorful, SECBorderable {
            /// 按钮颜色。
            public var color: SECColor?
            /// 按钮边框颜色。
            public var borderWidth: Float?
            /// 按钮边框线宽。
            public var borderColor: SECColor?
        }
        
        public typealias Style = CStyle
        
        /// 是否显示『控制按钮』。设置为 false 则全不显示。
        public var show: Bool?
        /// 是否显示『播放按钮』。
        public var showPlayBtn: Bool?
        /// 是否显示『后退按钮』。
        public var showPrevBtn: Bool?
        /// 是否显示『前进按钮』。
        public var showNextBtn: Bool?
        /// 『控制按钮』的尺寸，单位为像素（px）。
        public var itemSize: Float?
        /// 『控制按钮』的间隔，单位为像素（px）。
        public var itemGap: Float?
        /// 『控制按钮』的位置。
        /// 当 timeline.orient 为 'horizontal'时，'left'、'right'有效。
        /// 当 timeline.orient 为 'vertical'时，'top'、'bottom'有效。
        public var position: SECPosition?
        /// 『播放按钮』的『可播放状态』的图形。
        /// 在 ECharts 3 里可以通过 'path://' 将图标设置为任意的矢量路径。这种方式相比于使用图片的方式，不用担心因为缩放而产生锯齿或模糊，而且可以设置为任意颜色。路径图形会自适应调整为合适（如果是 symbol 的话就是 symbolSize）的大小。路径的格式参见 SVG PathData。可以从 Adobe Illustrator 等工具编辑导出。
        public var playIcon: String?
        /// 『播放按钮』的『可停止状态』的图形。
        /// 在 ECharts 3 里可以通过 'path://' 将图标设置为任意的矢量路径。这种方式相比于使用图片的方式，不用担心因为缩放而产生锯齿或模糊，而且可以设置为任意颜色。路径图形会自适应调整为合适（如果是 symbol 的话就是 symbolSize）的大小。路径的格式参见 SVG PathData。可以从 Adobe Illustrator 等工具编辑导出。
        public var stopIcon: String?
        ///『后退按钮』的图形
        /// 在 ECharts 3 里可以通过 'path://' 将图标设置为任意的矢量路径。这种方式相比于使用图片的方式，不用担心因为缩放而产生锯齿或模糊，而且可以设置为任意颜色。路径图形会自适应调整为合适（如果是 symbol 的话就是 symbolSize）的大小。路径的格式参见 SVG PathData。可以从 Adobe Illustrator 等工具编辑导出。
        public var prevIcon: String?
        /// 『前进按钮』的图形
        /// 在 ECharts 3 里可以通过 'path://' 将图标设置为任意的矢量路径。这种方式相比于使用图片的方式，不用担心因为缩放而产生锯齿或模糊，而且可以设置为任意颜色。路径图形会自适应调整为合适（如果是 symbol 的话就是 symbolSize）的大小。路径的格式参见 SVG PathData。可以从 Adobe Illustrator 等工具编辑导出。
        public var nextIcon: String?
        /// 控制按钮的『正常状态』的样式。
        public var normal: CStyle?
        /// 控制按钮的『高亮状态』的样式（hover时）。
        public var emphasis: CStyle?
    }
    
    /// 可能的数据对象
    public struct Data {
        /// 值
        public var value: String?
        /// tooltip, 主要用来修改里面的 `formatter`
        public var tooltip: SECTooltip?
        /// 标记图形
        public var symbol: SECSymbol?
        /// 标记图形大小
        public var symbolSize: Float?
    }
    
    /// 是否显示 timeline 组件。如果设置为false，不会显示，但是功能还存在。
    public var show: Bool?
    /// 这个属性目前只支持为 slider，不需要更改。
    public var type: String {
        return "slider"
    }
    /// 轴的类型
    public var axisType: AxisType?
    /// 表示当前选中项是哪项。比如，currentIndex 为 0 时，表示当前选中项为 timeline.data[0]（即使用 options[0]）。
    public var current: UInt?
    /// 表示是否自动播放。
    public var autoPlay: Bool??
    /// 表示是否反向播放。
    public var rewind: Bool?
    /// 表示是否循环播放。
    public var loop: Bool?
    /// 表示播放的速度（跳动的间隔），单位毫秒（ms）。
    public var playInterval: Float?
    /// 拖动圆点的时候，是否实时更新视图。
    public var realtime: Bool?
    /// 表示『播放』按钮的位置。可选值：'left'、'right'。
    public var controlPosition: String?
    /// 所有图形的 zlevel 值。
    /// zlevel用于 Canvas 分层，不同zlevel值的图形会放置在不同的 Canvas 中，Canvas 分层是一种常见的优化手段。我们可以把一些图形变化频繁（例如有动画）的组件设置成一个单独的zlevel。需要注意的是过多的 Canvas 会引起内存开销的增大，在手机端上需要谨慎使用以防崩溃。
    /// zlevel 大的 Canvas 会放在 zlevel 小的 Canvas 的上面。
    public var zlevel: Float?
    /// 组件的所有图形的z值。控制图形的前后顺序。z值小的图形会被z值大的图形覆盖。
    /// z相比zlevel优先级更低，而且不会创建新的 Canvas。
    public var z: Float?
    /// timeline组件离容器左侧的距离。
    /// left 的值可以是像 20 这样的具体像素值，可以是像 '20%' 这样相对于容器高宽的百分比，也可以是 'left', 'center', 'right'。
    /// 如果 left 的值为'left', 'center', 'right'，组件会根据相应的位置自动对齐。
    public var left: SECPosition?
    /// timeline组件离容器上侧的距离。
    /// top 的值可以是像 20 这样的具体像素值，可以是像 '20%' 这样相对于容器高宽的百分比，也可以是 'top', 'middle', 'bottom'。
    /// 如果 top 的值为'top', 'middle', 'bottom'，组件会根据相应的位置自动对齐。
    public var top: SECPosition?
    /// timeline组件离容器右侧的距离。
    /// right 的值可以是像 20 这样的具体像素值，可以是像 '20%' 这样相对于容器高宽的百分比。
    /// 默认自适应。
    public var right: SECPosition?
    /// timeline组件离容器下侧的距离。
    /// bottom 的值可以是像 20 这样的具体像素值，可以是像 '20%' 这样相对于容器高宽的百分比。
    /// 默认自适应。
    public var bottom: SECPosition?
    /// timeline内边距，单位px，默认各方向内边距为5，接受数组分别设定上右下左边距。
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
    public var padding: SECPadding?
    /// 摆放方式
    public var orient: SECOrient?
    /// 是否反向放置 timeline，反向则首位颠倒过来。
    public var inverse: Bool?
    /// timeline标记的图形。
    public var symbol: SECSymbol?
    /// timeline标记的大小，可以设置成诸如 10 这样单一的数字，也可以用数组分开表示宽和高，例如 [20, 10] 表示标记宽为20，高为10。
    public var symbolSize: Float?
    /// timeline标记的旋转角度。注意在 markLine 中当 symbol 为 'arrow' 时会忽略 symbolRotate 强制设置为切线的角度。
    public var symbolRotate: Float?
    /// timeline标记相对于原本位置的偏移。默认情况下，标记会居中置放在数据对应的位置，但是如果 symbol 是自定义的矢量路径或者图片，就有可能不希望 symbol 居中。这时候可以使用该配置项配置 symbol 相对于原本居中的偏移，可以是绝对的像素值，也可以是相对的百分比。
    /// 例如 [0, '50%'] 就是把自己向上移动了一半的位置，在 symbol 图形是气泡的时候可以让图形下端的箭头对准数据点。
    public var symbolOffset: [Float]?
    /// 线条样式
    public var lineStyle: LineStyle?
    /// 轴的文本标签。有 normal 和 emphasis 两个状态，normal 是文本正常的样式，emphasis 是文本高亮的样式，比如鼠标悬浮或者图例联动高亮的时候会使用 emphasis 作为文本的样式。
//    public var label: // FIXME?
    /// timeline 图形样式，有 normal 和 emphasis 两个状态。normal 是图形在默认状态下的样式；emphasis 是图形在高亮状态下的样式，比如在鼠标悬浮或者图例联动高亮时。
    public var itemStyle: SECItemStyle?
    /// 『当前项』（checkpoint）的图形样式。
    public var checkpointStyle: CheckpointStyle?
    /// 『控制按钮』的样式。『控制按钮』包括：『播放按钮』、『前进按钮』、『后退按钮』。
    public var controlStyle: ControlStyle?
    /// 数据
    public var data: [Any]?
    
}

extension SECTimeline.LineStyle : SECEnumable {
    public enum Enums {
        case show(Bool), color(SECColor), width(Float), type(SECLineType), shadowBlur(Float), shadowColor(SECColor), shadowOffsetX(Float), shadowOffsetY(Float), opacity(Float)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: [Enums]) {
        for ele in elements {
            switch ele {
            case let .show(show):
                self.show = show
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
            case let .opacity(opacity):
                self.opacity = opacity
            }
        }
    }
}

extension SECTimeline.LineStyle : SECMappable {
    public func mapping(map: SECMap) {
        map["show"] = show
        map["color"] = color
        map["width"] = width
        map["type"] = type
        map["shadowBlur"] = shadowBlur
        map["shadowColor"] = shadowColor
        map["shadowOffsetX"] = shadowOffsetX
        map["shadowOffsetY"] = shadowOffsetY
        map["opacity"] = opacity
    }
}

extension SECTimeline.CheckpointStyle : SECEnumable {
    public enum Enums {
        case symbol(SECSymbol), symbolSize(Float), symbolRotate(Float), symbolOffset([Float]), color(SECColor), borderColor(SECColor), borderWidth(Float), animation(Bool), animationDuration(Float), animationEasing(SECAnimation)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: [Enums]) {
        for ele in elements {
            switch ele {
            case let .symbol(symbol):
                self.symbol = symbol
            case let .symbolSize(symbolSize):
                self.symbolSize = symbolSize
            case let .symbolRotate(symbolRotate):
                self.symbolRotate = symbolRotate
            case let .symbolOffset(symbolOffset):
                self.symbolOffset = symbolOffset
            case let .color(color):
                self.color = color
            case let .borderColor(color):
                self.borderColor = color
            case let .borderWidth(width):
                self.borderWidth = width
            case let .animation(animation):
                self.animation = animation
            case let .animationDuration(animationDuration):
                self.animationDuration = animationDuration
            case let .animationEasing(animationEasing):
                self.animationEasing = animationEasing
            }
        }
    }
}

extension SECTimeline.CheckpointStyle : SECMappable {
    public func mapping(map: SECMap) {
        map["symbol"] = symbol
        map["symbolSize"] = symbolSize
        map["symbolRotate"] = symbolRotate
        map["symbolOffset"] = symbolOffset
        map["color"] = color
        map["borderColor"] = borderColor
        map["borderWidth"] = borderWidth
        map["animation"] = animation
        map["animationDuration"] = animationDuration
        map["animationEasing"] = animationEasing
    }
}

extension SECTimeline.ControlStyle.CStyle : SECEnumable {
    public enum Enums {
        case color(SECColor), borderWidth(Float), borderColor(SECColor)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: [Enums]) {
        for ele in elements {
            switch ele {
            case let .color(color):
                self.color = color
             case let .borderWidth(borderWidth):
                self.borderWidth = borderWidth
            case let .borderColor(borderColor):
                self.borderColor = borderColor
                   
            }
        }
    }
}

extension SECTimeline.ControlStyle.CStyle : SECMappable {
    public func mapping(map: SECMap) {
        map["color"] = color
        map["borderWidth"] = borderWidth
        map["borderColor"] = borderColor
        
    }
}

extension SECTimeline.ControlStyle : SECEnumable {
    public enum Enums {
        case show(Bool), showPlayBtn(Bool), showPrevBtn(Bool), showNextBtn(Bool), itemSize(Float), itemGap(Float), position(SECPosition), playIcon(String), stopIcon(String), prevIcon(String), nextIcon(String), normal(CStyle), emphasis(CStyle)
    }
    
    public typealias ContentsEnums = Enums
    
    public init(_ elements: [Enums]) {
        for ele in elements {
            switch ele {
            case let .show(show):
                self.show = show
            case let .showPlayBtn(showPlayBtn):
                self.showPlayBtn = showPlayBtn
            case let .showPrevBtn(showPrevBtn):
                self.showPrevBtn = showPrevBtn
            case let .showNextBtn(showNextBtn):
                self.showNextBtn = showNextBtn
            case let .itemSize(itemSize):
                self.itemSize = itemSize
            case let .itemGap(itemGap):
                self.itemGap = itemGap
            case let .position(position):
                self.position = position
            case let .playIcon(playIcon):
                self.playIcon = playIcon
            case let .stopIcon(stopIcon):
                self.stopIcon = stopIcon
            case let .prevIcon(prevIcon):
                self.prevIcon = prevIcon
            case let .nextIcon(nextIcon):
                self.nextIcon = nextIcon
            case let .normal(normal):
                self.normal = normal
            case let .emphasis(emphasis):
                self.emphasis = emphasis
            }
        }
    }
}

extension SECTimeline.ControlStyle : SECMappable {
    public func mapping(map: SECMap) {
        map["show"] = show
        map["showPlayBtn"] = showPlayBtn
        map["showPrevBtn"] = showPrevBtn
        map["showNextBtn"] = showNextBtn
        map["itemSize"] = itemSize
        map["itemGap"] = itemGap
        map["position"] = position
        map["playIcon"] = playIcon
        map["stopIcon"] = stopIcon
        map["prevIcon"] = prevIcon
        map["nextIcon"] = nextIcon
        map["normal"] = normal
        map["emphasis"] = emphasis
        
    }
}
