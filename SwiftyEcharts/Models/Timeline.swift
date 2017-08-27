//
//  Timeline.swift
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
public final class Timeline: Displayable, Symbolized, Zable {
    
    public final class LabelContent: Displayable, Shadowable, Borderable {
        /// 可选的配置方式：
        ///
        /// - auto： 完全自动决定。
        /// - left： 贴左边界放置。 当 timline.orient 为 'vertical' 时有效。
        /// - right：当 timline.orient 为 'vertical' 时有效。 贴右边界放置。
        /// - top： 贴上边界放置。 当 timline.orient 为 'horizontal' 时有效。
        /// - bottom： 贴下边界放置。 当 timline.orient 为 'horizontal' 时有效。
        /// - number： 指定某个数值时，表示 label 和轴的距离。为 0 时则和坐标轴重合，可以为正负值，决定 label 在坐标轴的哪一边。
        public var position: Position?
        /// 是否显示 label。
        public var show: Bool?
        /// label 的间隔。当指定为数值时，例如指定为 2，则每隔两个显示一个 label。
        public var interval: UInt8?
        /// label 的旋转角度。正值表示逆时针旋转。
        public var rotate: Float?
        /// 刻度标签的内容格式器，支持字符串模板和回调函数两种形式。
        ///
        /// 示例:
        ///
        ///     // 使用字符串模板，模板变量为刻度默认标签 {value}
        ///     formatter: '{value} kg'
        ///     
        ///     // 使用函数模板，函数参数分别为刻度数值（类目），刻度的索引
        ///     formatter: function (value, index) {
        ///         // 格式化成月/日，只在第一个刻度显示年份
        ///         var date = new Date(value);
        ///         var texts = [(date.getMonth() + 1), date.getDate()];
        ///         if (index === 0) {
        ///             texts.unshift(date.getYear());
        ///         }
        ///         return texts.join('/');
        ///     }
        public var formatter: Formatter?
        /// 文字的颜色。
        public var color: Color?
        /// 文字字体的风格
        public var fontStyle: FontStyle?
        /// 文字字体的粗细
        public var fontWeight: FontWeight?
        /// 文字的字体系列
        ///
        /// 还可以是 'serif' , 'monospace', 'Arial', 'Courier New', 'Microsoft YaHei', ...
        public var fontFamily: String?
        /// 文字的字体大小
        public var fontSize: UInt?
        /// 文字水平对齐方式，默认自动。
        ///
        /// 可选：
        ///
        /// 'left'
        /// 'center'
        /// 'right'
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
        /// 'top'
        /// 'middle'
        /// 'bottom'
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
        public var backgroundColor: Color? /// FIXME: 看下怎么处理
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
        /// 详情参见教程：富文本标签
        public var rich: [String: Jsonable]?
    }
    
    /// 轴的文本标签。有 normal 和 emphasis 两个状态，normal 是文本正常的样式，emphasis 是文本高亮的样式，比如鼠标悬浮或者图例联动高亮的时候会使用 emphasis 作为文本的样式。
    public final class Label: Emphasisable {
        public typealias Style = LabelContent
        
        public var normal: Style?
        public var emphasis: Style?
    }
    
    public final class CheckpointStyle: Symbolized, Colorful, Borderable {
        /// timeline.checkpointStyle 标记的图形。
        public var symbol: OneOrMore<Symbol>?
        /// timeline.checkpointStyle 标记的大小，可以设置成诸如 10 这样单一的数字，也可以用数组分开表示宽和高，例如 [20, 10] 表示标记宽为20，高为10。
        public var symbolSize: FunctionOrFloatOrPair?
        /// timeline.checkpointStyle 标记的旋转角度。注意在 markLine 中当 symbol 为 'arrow' 时会忽略 symbolRotate 强制设置为切线的角度。
        public var symbolRotate: Float?
        /// timeline.checkpointStyle 标记相对于原本位置的偏移。默认情况下，标记会居中置放在数据对应的位置，但是如果 symbol 是自定义的矢量路径或者图片，就有可能不希望 symbol 居中。这时候可以使用该配置项配置 symbol 相对于原本居中的偏移，可以是绝对的像素值，也可以是相对的百分比。
        /// 例如 [0, '50%'] 就是把自己向上移动了一半的位置，在 symbol 图形是气泡的时候可以让图形下端的箭头对准数据点。
        public var symbolOffset: Point?
        /// timeline组件中『当前项』（checkpoint）的颜色。
        public var color: Color?
        /// timeline组件中『当前项』（checkpoint）的边框宽度。
        public var borderWidth: Float?
        /// timeline组件中『当前项』（checkpoint）的边框颜色。
        public var borderColor: Color?
        /// timeline组件中『当前项』（checkpoint）在 timeline 播放切换中的移动，是否有动画。
        public var animation: Bool?
        /// timeline组件中『当前项』（checkpoint）的动画时长。
        public var animationDuration: Float?
        /// timeline组件中『当前项』（checkpoint）的动画的缓动效果。
        public var animationEasing: EasingFunction?
    }
    
    public final class ControlStyle: Displayable, Emphasisable {
        
        /// 控制按钮的的样式。
        public final class CStyle: Colorful, Borderable {
            /// 按钮颜色。
            public var color: Color?
            /// 按钮边框颜色。
            public var borderWidth: Float?
            /// 按钮边框线宽。
            public var borderColor: Color?
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
        public var position: Position?
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
    public final class Data {
        /// 值
        public var value: Jsonable?
        /// tooltip, 主要用来修改里面的 `formatter`
        public var tooltip: Tooltip?
        /// 标记图形
        public var symbol: Symbol?
        /// 标记图形大小
        public var symbolSize: FunctionOrFloatOrPair?
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
    public var autoPlay: Bool?
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
    public var left: Position?
    /// timeline组件离容器上侧的距离。
    /// top 的值可以是像 20 这样的具体像素值，可以是像 '20%' 这样相对于容器高宽的百分比，也可以是 'top', 'middle', 'bottom'。
    /// 如果 top 的值为'top', 'middle', 'bottom'，组件会根据相应的位置自动对齐。
    public var top: Position?
    /// timeline组件离容器右侧的距离。
    /// right 的值可以是像 20 这样的具体像素值，可以是像 '20%' 这样相对于容器高宽的百分比。
    /// 默认自适应。
    public var right: Position?
    /// timeline组件离容器下侧的距离。
    /// bottom 的值可以是像 20 这样的具体像素值，可以是像 '20%' 这样相对于容器高宽的百分比。
    /// 默认自适应。
    public var bottom: Position?
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
    public var padding: Padding?
    /// 摆放方式
    public var orient: Orient?
    /// 是否反向放置 timeline，反向则首位颠倒过来。
    public var inverse: Bool?
    /// timeline标记的图形。
    public var symbol: OneOrMore<Symbol>?
    /// timeline标记的大小，可以设置成诸如 10 这样单一的数字，也可以用数组分开表示宽和高，例如 [20, 10] 表示标记宽为20，高为10。
    public var symbolSize: FunctionOrFloatOrPair?
    /// timeline标记的旋转角度。注意在 markLine 中当 symbol 为 'arrow' 时会忽略 symbolRotate 强制设置为切线的角度。
    public var symbolRotate: Float?
    /// timeline标记相对于原本位置的偏移。默认情况下，标记会居中置放在数据对应的位置，但是如果 symbol 是自定义的矢量路径或者图片，就有可能不希望 symbol 居中。这时候可以使用该配置项配置 symbol 相对于原本居中的偏移，可以是绝对的像素值，也可以是相对的百分比。
    /// 例如 [0, '50%'] 就是把自己向上移动了一半的位置，在 symbol 图形是气泡的时候可以让图形下端的箭头对准数据点。
    public var symbolOffset: Point?
    /// 线条样式
    public var lineStyle: LineStyle?
    /// 轴的文本标签。有 normal 和 emphasis 两个状态，normal 是文本正常的样式，emphasis 是文本高亮的样式，比如鼠标悬浮或者图例联动高亮的时候会使用 emphasis 作为文本的样式。
    public var label: FormattedLabel?
    /// timeline 图形样式，有 normal 和 emphasis 两个状态。normal 是图形在默认状态下的样式；emphasis 是图形在高亮状态下的样式，比如在鼠标悬浮或者图例联动高亮时。
    public var itemStyle: ItemStyle?
    /// 『当前项』（checkpoint）的图形样式。
    public var checkpointStyle: CheckpointStyle?
    /// 『控制按钮』的样式。『控制按钮』包括：『播放按钮』、『前进按钮』、『后退按钮』。
    public var controlStyle: ControlStyle?
    /// 数据
    public var data: [Jsonable]?
    
}

extension Timeline.LabelContent: Enumable {
    public enum Enums {
        case position(Position), show(Bool), interval(UInt8), rotate(Float), formatter(Formatter), color(Color), fontStyle(FontStyle), fontWeight(FontWeight), fontFamily(String), fontSize(UInt), align(Align), verticalAlign(VerticalAlign), lineHeight(Float), backgroundColor(Color), borderColor(Color), borderWidth(Float), borderRadius(Float), padding(Padding), shadowColor(Color), shadowBlur(Float), shadowOffsetX(Float), shadowOffsetY(Float), width(LengthValue), height(LengthValue), textBorderColor(Color), textBorderWidth(Float), textShadowColor(Color), textShadowBlur(Float), textShadowOffsetX(Float), textShadowOffsetY(Float), rich([String: Jsonable])
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .position(position):
                self.position = position
            case let .show(show):
                self.show = show
            case let .interval(interval):
                self.interval = interval
            case let .rotate(rotate):
                self.rotate = rotate
            case let .formatter(formatter):
                self.formatter = formatter
            case let .color(color):
                self.color = color
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

extension Timeline.LabelContent: Mappable {
    public func mapping(map: Mapper) {
        map["position"] = position
        map["show"] = show
        map["interval"] = interval
        map["rotate"] = rotate
        map["formatter"] = formatter
        map["color"] = color
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

extension Timeline.Label: Enumable {
    public enum Enums {
        case normal(Style), emphasis(Style)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .normal(normal):
                self.normal = normal
            case let .emphasis(emphasis):
                self.emphasis = emphasis
            }
        }
    }
}

extension Timeline.Label: Mappable {
    public func mapping(map: Mapper) {
        map["normal"] = normal
        map["emphasis"] = emphasis
    }
}

extension Timeline.CheckpointStyle: Enumable {
    public enum Enums {
        case symbol(Symbol), symbolSize(FunctionOrFloatOrPair), symbolRotate(Float), symbolOffset(Point), color(Color), borderColor(Color), borderWidth(Float), animation(Bool), animationDuration(Float), animationEasing(EasingFunction)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .symbol(symbol):
                self.symbol = OneOrMore(one: symbol)
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

extension Timeline.CheckpointStyle: Mappable {
    public func mapping(map: Mapper) {
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

extension Timeline.ControlStyle.CStyle: Enumable {
    public enum Enums {
        case color(Color), borderWidth(Float), borderColor(Color)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
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

extension Timeline.ControlStyle.CStyle: Mappable {
    public func mapping(map: Mapper) {
        map["color"] = color
        map["borderWidth"] = borderWidth
        map["borderColor"] = borderColor
        
    }
}

extension Timeline.ControlStyle: Enumable {
    public enum Enums {
        case show(Bool), showPlayBtn(Bool), showPrevBtn(Bool), showNextBtn(Bool), itemSize(Float), itemGap(Float), position(Position), playIcon(String), stopIcon(String), prevIcon(String), nextIcon(String), normal(CStyle), emphasis(CStyle)
    }
    
    public typealias ContentsEnums = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
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

extension Timeline.ControlStyle: Mappable {
    public func mapping(map: Mapper) {
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

extension Timeline.Data: Enumable {
    public enum Enums {
        case value(Jsonable), tooltip(Tooltip), symbol(Symbol), symbolSize(FunctionOrFloatOrPair)
    }
    
    public typealias ContentEnums = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .value(value):
                self.value = value
            case let .tooltip(tooltip):
                self.tooltip = tooltip
            case let .symbol(symbol):
                self.symbol = symbol
            case let .symbolSize(symbolSize):
                self.symbolSize = symbolSize
            }
        }
    }
}

extension Timeline.Data: Mappable {
    public func mapping(map: Mapper) {
        map["value"] = value
        map["tooltip"] = tooltip
        map["symbol"] = symbol
        map["symbolSize"] = symbolSize
    }
}

extension Timeline: Enumable {
    public enum Enums {
        case show(Bool), axisType(AxisType), current(UInt), autoPlay(Bool), rewind(Bool), loop(Bool), playInterval(Float), realtime(Bool), controlPosition(String), zlevel(Float), z(Float), left(Position), top(Position), right(Position), bottom(Position), padding(Padding), orient(Orient), inverse(Bool), symbol(Symbol), symbolSize(FunctionOrFloatOrPair), symbolRotate(Float), symbolOffset(Point), lineStyle(LineStyle), label(FormattedLabel), itemStyle(ItemStyle), checkpointStyle(CheckpointStyle), controlStyle(ControlStyle), data([Jsonable])
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .show(show):
                self.show = show
            case let .axisType(axisType):
                self.axisType = axisType
            case let .current(current):
                self.current = current
            case let .autoPlay(autoPlay):
                self.autoPlay = autoPlay
            case let .rewind(rewind):
                self.rewind = rewind
            case let .loop(loop):
                self.loop = loop
            case let .playInterval(playInterval):
                self.playInterval = playInterval
            case let .realtime(realtime):
                self.realtime = realtime
            case let .controlPosition(controlPosition):
                self.controlPosition = controlPosition
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
            case let .padding(padding):
                self.padding = padding
            case let .orient(orient):
                self.orient = orient
            case let .inverse(inverse):
                self.inverse = inverse
            case let .symbol(symbol):
                self.symbol = OneOrMore(one: symbol)
            case let .symbolSize(symbolSize):
                self.symbolSize = symbolSize
            case let .symbolRotate(symbolRotate):
                self.symbolRotate = symbolRotate
            case let .symbolOffset(symbolOffset):
                self.symbolOffset = symbolOffset
            case let .lineStyle(lineStyle):
                self.lineStyle = lineStyle
            case let .label(label):
                self.label = label
            case let .itemStyle(itemStyle):
                self.itemStyle = itemStyle
            case let .checkpointStyle(checkpointStyle):
                self.checkpointStyle = checkpointStyle
            case let .controlStyle(controlStyle):
                self.controlStyle = controlStyle
            case let .data(data):
                self.data = data
            }
        }
    }
}

extension Timeline: Mappable {
    public func mapping(map: Mapper) {
        map["show"] = show
        map["type"] = type
        map["axisType"] = axisType
        map["current"] = current
        map["autoPlay"] = autoPlay
        map["rewind"] = rewind
        map["loop"] = loop
        map["playInterval"] = playInterval
        map["realtime"] = realtime
        map["controlPosition"] = controlPosition
        map["zlevel"] = zlevel
        map["z"] = z
        map["left"] = left
        map["top"] = top
        map["right"] = right
        map["bottom"] = bottom
        map["padding"] = padding
        map["orient"] = orient
        map["inverse"] = inverse
        map["symbol"] = symbol
        map["symbolSize"] = symbolSize
        map["symbolRotate"] = symbolRotate
        map["symbolOffset"] = symbolOffset
        map["lineStyle"] = lineStyle
        map["label"] = label
        map["itemStyle"] = itemStyle
        map["checkpointStyle"] = checkpointStyle
        map["controlStyle"] = controlStyle
        map["data"] = data
        
    }
}
