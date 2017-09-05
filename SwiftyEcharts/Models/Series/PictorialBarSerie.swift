//
//  PictorialBarSerie.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 03/04/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 象形柱图
///
/// 象形柱图是可以设置各种具象图形元素（如图片、SVG PathData 等）的柱状图。往往用在信息图中。用于有至少一个类目轴或时间轴的直角坐标系上。
///
/// 示例： http://echarts.baidu.com/gallery/editor.html?c=pictorialBar-hill
/// 
/// 布局
///
/// 象形柱图可以被想象为：它首先是个柱状图，但是柱状图的柱子并不显示。这些柱子我们称为『基准柱（reference bar）』，根据基准柱来定位和显示各种象形图形（包括图片）。
///
/// 每个象形图形根据基准柱的定位，是通过 symbolPosition、symbolOffset 来调整其于基准柱的相对位置。
///
/// 参见例子: http://echarts.baidu.com/gallery/editor.html?c=doc-example/pictorialBar-position
///
/// 可以使用 symbolSize 调整大小，从而形成各种视图效果。
///
/// 参见例子：http://echarts.baidu.com/gallery/editor.html?c=doc-example/pictorialBar-symbolSize
///
/// 象形图形类型
///
/// 每个图形可以配置成『单独』和『重复』两种类型，即通过 symbolRepeat 来设置。
///
/// - 设置为 false（默认），则一个图形来代表一个数据项。
/// - 设置为 true，则一组重复的图形来代表一个数据项。
///
/// 参见例子：http://echarts.baidu.com/gallery/editor.html?c=doc-example/pictorialBar-repeat
///
/// 每个象形图形可以是基本图形（如 'circle', 'rect', ...）、SVG PathData、图片，参见：symbolType。
///
/// 参见例子：http://echarts.baidu.com/gallery/editor.html?c=doc-example/pictorialBar-graphicType
///
/// 可以使用 symbolClip 对图形进行剪裁。
///
/// 参见例子：http://echarts.baidu.com/gallery/editor.html?c=doc-example/pictorialBar-clip
public final class PictorialBarSerie: Serie, Symbolized, Zable, Animatable {
    
    /// 系列中的数据内容数组。数组项通常为具体的数据项。
    ///
    /// 通常来说，数据用一个二维数组表示。如下，每一列被称为一个『维度』。
    ///
    ///     series: [{
    ///         data: [
    ///             // 维度X   维度Y   其他维度 ...
    ///             [  3.4,    4.5,   15,   43],
    ///             [  4.2,    2.3,   20,   91],
    ///             [  10.8,   9.5,   30,   18],
    ///             [  7.2,    8.8,   18,   57]
    ///         ]
    ///     }]
    ///
    /// - 在 直角坐标系 (grid) 中『维度X』和『维度Y』会默认对应于 xAxis 和 yAxis。
    /// - 在 极坐标系 (polar) 中『维度X』和『维度Y』会默认对应于 radiusAxis 和 angleAxis。
    /// - 后面的其他维度是可选的，可以在别处被使用，例如：
    ///     - 在 visualMap 中可以将一个或多个维度映射到颜色，大小等多个图形属性上。
    ///     - 在 series.symbolSize 中可以使用回调函数，基于某个维度得到 symbolSize 值。
    ///     - 使用 tooltip.formatter 或 series.label.normal.formatter 可以把其他维度的值展示出来。
    ///
    /// 特别地，当只有一个轴为类目轴（axis.type 为 'category'）的时候，数据可以简化用一个一维数组表示。例如：
    ///
    ///     xAxis: {
    ///         data: ['a', 'b', 'm', 'n']
    ///     },
    ///     series: [{
    ///         // 与 xAxis.data 一一对应。
    ///         data: [23,  44,  55,  19]
    ///         // 它其实是下面这种形式的简化：
    ///         // data: [[0, 23], [1, 44], [2, 55], [3, 19]]
    ///     }]
    /// 
    /// 『值』与 轴类型 的关系：
    ///
    /// - 当某维度对应于数值轴（axis.type 为 'value' 或者 'log'）的时候：其值可以为 number（例如 12）。（也可以兼容 string 形式的 number，例如 '12'）
    /// - 当某维度对应于类目轴（axis.type 为 'category'）的时候：其值须为类目的『序数』（从 0 开始）或者类目的『字符串值』。例如：
    ///
    ///     xAxis: {
    ///         type: 'category',
    ///         data: ['星期一', '星期二', '星期三', '星期四']
    ///     },
    ///     yAxis: {
    ///         type: 'category',
    ///         data: ['a', 'b', 'm', 'n', 'p', 'q']
    ///     },
    ///     series: [{
    ///         data: [
    ///             // xAxis    yAxis
    ///             [  0,        0,    2  ], // 意思是此点位于 xAxis: '星期一', yAxis: 'a'。
    ///             [  '星期四',  2,    1  ], // 意思是此点位于 xAxis: '星期四', yAxis: 'm'。
    ///             [  2,       'p',   2  ], // 意思是此点位于 xAxis: '星期三', yAxis: 'p'。
    ///             [  3,        3,    5  ]
    ///         ]
    ///     }]
    ///
    /// 双类目轴的示例可以参考 Github Punchcard 示例。
    ///
    ///     - 当某维度对应于时间轴（type 为 'time'）的时候，值可以为：
    ///         - 一个时间戳，如 1484141700832，表示 UTC 时间。
    ///         - 或者字符串形式的时间描述：
    ///             - ISO 8601 的子集，只包含这些形式（这几种格式，除非指明时区，否则均表示本地时间，与 moment 一致）：
    ///                 - 部分年月日时间: '2012-03', '2012-03-01', '2012-03-01 05', '2012-03-01 05:06'.
    ///                 - 使用 'T' 或空格分割: '2012-03-01T12:22:33.123', '2012-03-01 12:22:33.123'.
    ///                 - 时区设定: '2012-03-01T12:22:33Z', '2012-03-01T12:22:33+8000', '2012-03-01T12:22:33-05:00'.
    ///             - 其他的时间字符串，包括（均表示本地时间）: '2012', '2012-3-1', '2012/3/1', '2012/03/01', '2009/6/12 2:00', '2009/6/12 2:05:08', '2009/6/12 2:05:08.123'
    ///     - 或者用户自行初始化的 Date 实例：
    ///         - 注意，用户自行初始化 Date 实例的时候，浏览器的行为有差异，不同字符串的表示也不同。
    ///         - 例如：在 chrome 中，new Date('2012-01-01') 表示 UTC 时间的 2012 年 1 月 1 日，而 new Date('2012-1-1') 和 new Date('2012/01/01') 表示本地时间的 2012 年 1 月 1 日。在 safari 中，不支持 new Date('2012-1-1') 这种表示方法。
    ///         - 所以，使用 new Date(dataString) 时，可使用第三方库解析（如 moment），或者使用 echarts.number.parseDate，或者参见 这里。
    /// 
    /// 当需要对个别数据进行个性化定义时：
    ///
    /// 数组项可用对象，其中的 value 像表示具体的数值，如：
    ///
    ///     [
    ///         12,
    ///         34,
    ///         {
    ///             value : 56,
    ///             //自定义标签样式，仅对该数据项有效
    ///             label: {},
    ///             //自定义特殊 itemStyle，仅对该数据项有效
    ///             itemStyle:{}
    ///         },
    ///         10
    ///     ]
    ///     // 或
    ///     [
    ///         [12, 33],
    ///         [34, 313],
    ///         {
    ///             value: [56, 44],
    ///             label: {},
    ///             itemStyle:{}
    ///         },
    ///         [10, 33]
    ///     ]
    /// 
    /// 空值：
    ///
    /// 当某数据不存在时（ps：不存在不代表值为 0），可以用 '-' 或者 null 或者 undefined 或者 NaN 表示。
    ///
    /// 例如，无数据在折线图中可表现为该点是断开的，在其它图中可表示为图形不存在。
    public final class Data: Symbolized, Animatable {
        /// 数据项名称。
        public var name: String?
        /// 单个数据项的数值。
        public var value: Jsonable?
        /// 图形类型。
        ///
        /// ECharts 提供的标记类型包括 'circle', 'rect', 'roundRect', 'triangle', 'diamond', 'pin', 'arrow'
        ///
        /// 也可以通过 'image://url' 设置为图片，其中 url 为图片的链接，或者 dataURI。
        ///
        /// 可以通过 'path://' 将图标设置为任意的矢量路径。这种方式相比于使用图片的方式，不用担心因为缩放而产生锯齿或模糊，而且可以设置为任意颜色。路径图形会自适应调整为合适的大小。路径的格式参见 SVG PathData。可以从 Adobe Illustrator 等工具编辑导出。
        ///
        /// 例子：http://echarts.baidu.com/gallery/editor.html?c=doc-example/pictorialBar-graphicType
        ///
        /// 此属性可以被设置在系列的 根部，表示对此系列中所有数据都生效；也可以被设置在 data 中的 每个数据项中，表示只对此数据项生效。
        ///
        /// 例如：
        ///
        ///     series: [{
        ///         symbol: ... // 对 data 中所有数据项生效。
        ///         data: [23, 56]
        ///     }]
        ///
        /// 或者
        ///
        ///     series: [{
        ///         data: [{
        ///             value: 23
        ///             symbol: ... // 只对此数据项生效
        ///         }, {
        ///             value: 56
        ///             symbol: ... // 只对此数据项生效
        ///         }]
        ///     }]
        public var symbol: OneOrMore<Symbol>?
        /// 图形的大小。
        ///
        /// 可以用数组分开表示宽和高，例如 [20, 10] 表示标记宽为20，高为10，也可以设置成诸如 10 这样单一的数字，表示 [10, 10]。
        ///
        /// 可以设置成绝对值（如 10），也可以设置成百分比（如 '120%'、['55%', 23]）。
        ///
        /// 当设置为百分比时，图形的大小是基于 基准柱 的尺寸计算出来的。
        ///
        /// 例如，当基准柱基于 x 轴（即柱子是纵向的），symbolSize 设置为 ['30%', '50%']，那么最终图形的尺寸是：
        ///
        /// - 宽度：基准柱的宽度 * 30%。
        /// - 高度：
        ///     - 如果 symbolRepeat 为 false：基准柱的高度 * 50%。
        ///     - 如果 symbolRepeat 为 true：基准柱的宽度 * 50%。
        ///
        /// 基准柱基于 y 轴（即柱子是横向的）的情况类似对调可得出。
        ///
        /// 例子： http://echarts.baidu.com/gallery/editor.html?c=doc-example/pictorialBar-symbolSize
        /// 此属性可以被设置在系列的 根部，表示对此系列中所有数据都生效；也可以被设置在 data 中的 每个数据项中，表示只对此数据项生效。
        ///
        /// 例如：
        ///
        ///     series: [{
        ///         symbolSize: ... // 对 data 中所有数据项生效。
        ///         data: [23, 56]
        ///     }]
        ///
        /// 或者
        ///
        ///     series: [{
        ///         data: [{
        ///             value: 23
        ///             symbolSize: ... // 只对此数据项生效
        ///         }, {
        ///             value: 56
        ///             symbolSize: ... // 只对此数据项生效
        ///         }]
        ///     }]
        public var symbolSize: FunctionOrFloatOrPair?
        /// 图形的定位位置。可取值：
        ///
        /// - 'start'：图形边缘与柱子开始的地方内切。
        /// - 'end'：图形边缘与柱子结束的地方内切。
        /// - 'center'：图形在柱子里居中。
        ///
        /// 例子：http://echarts.baidu.com/gallery/editor.html?c=doc-example/pictorialBar-position
        ///
        /// 此属性可以被设置在系列的 根部，表示对此系列中所有数据都生效；也可以被设置在 data 中的 每个数据项中，表示只对此数据项生效。
        ///
        /// 例如：
        ///
        ///     series: [{
        ///         symbolPosition: ... // 对 data 中所有数据项生效。
        ///         data: [23, 56]
        ///     }]
        ///
        /// 或者
        ///
        ///     series: [{
        ///         data: [{
        ///             value: 23
        ///             symbolPosition: ... // 只对此数据项生效
        ///         }, {
        ///             value: 56
        ///             symbolPosition: ... // 只对此数据项生效
        ///         }]
        ///     }]
        public var symbolPosition: Position?
        /// 图形相对于原本位置的偏移。symbolOffset 是图形定位中最后计算的一个步骤，可以对图形计算出来的位置进行微调。
        ///
        /// 可以设置成绝对值（如 10），也可以设置成百分比（如 '120%'、['55%', 23]）。
        ///
        /// 当设置为百分比时，表示相对于自身尺寸 symbolSize 的百分比。
        ///
        /// 例如 [0, '-50%'] 就是把图形向上移动了自身尺寸的一半的位置。
        ///
        /// 例子：http://echarts.baidu.com/gallery/editor.html?c=doc-example/pictorialBar-position
        ///
        /// 此属性可以被设置在系列的 根部，表示对此系列中所有数据都生效；也可以被设置在 data 中的 每个数据项中，表示只对此数据项生效。
        ///
        /// 例如：
        ///
        ///     series: [{
        ///         symbolOffset: ... // 对 data 中所有数据项生效。
        ///         data: [23, 56]
        ///     }]
        ///
        /// 或者
        ///
        ///     series: [{
        ///         data: [{
        ///             value: 23
        ///             symbolOffset: ... // 只对此数据项生效
        ///         }, {
        ///             value: 56
        ///             symbolOffset: ... // 只对此数据项生效
        ///         }]
        ///     }]
        public var symbolOffset: Point?
        /// 图形的旋转角度。
        ///
        /// 注意，symbolRotate 并不会影响图形的定位（哪怕超出基准柱的边界），而只是单纯得绕自身中心旋转。
        ///
        /// 此属性可以被设置在系列的 根部，表示对此系列中所有数据都生效；也可以被设置在 data 中的 每个数据项中，表示只对此数据项生效。
        ///
        /// 例如：
        ///
        ///     series: [{
        ///         symbolRotate: ... // 对 data 中所有数据项生效。
        ///         data: [23, 56]
        ///     }]
        ///
        /// 或者
        ///
        ///     series: [{
        ///         data: [{
        ///             value: 23
        ///             symbolRotate: ... // 只对此数据项生效
        ///         }, {
        ///             value: 56
        ///             symbolRotate: ... // 只对此数据项生效
        ///         }]
        ///     }]
        public var symbolRotate: Float?
        /// 指定图形元素是否重复。值可为：
        ///
        /// - false/null/undefined：不重复，即每个数据值用一个图形元素表示。
        /// - true：使图形元素重复，即每个数据值用一组重复的图形元素表示。重复的次数依据 data 计算得到。
        /// - a number：使图形元素重复，即每个数据值用一组重复的图形元素表示。重复的次数是给定的定值。
        /// - 'fixed'：使图形元素重复，即每个数据值用一组重复的图形元素表示。重复的次数依据 symbolBoundingData 计算得到，即与 data 无关。这在此图形被用于做背景时有用。
        ///
        /// 例子: http://echarts.baidu.com/gallery/editor.html?c=doc-example/pictorialBar-repeat
        ///
        /// 此属性可以被设置在系列的 根部，表示对此系列中所有数据都生效；也可以被设置在 data 中的 每个数据项中，表示只对此数据项生效。
        ///
        /// 例如：
        ///
        ///     series: [{
        ///         symbolRepeat: ... // 对 data 中所有数据项生效。
        ///         data: [23, 56]
        ///     }]
        ///
        /// 或者
        ///
        ///     series: [{
        ///         data: [{
        ///             value: 23
        ///             symbolRepeat: ... // 只对此数据项生效
        ///         }, {
        ///             value: 56
        ///             symbolRepeat: ... // 只对此数据项生效
        ///         }]
        ///     }]
        public var symbolRepeat: String?  // ?????
        /// 指定图形元素重复时，绘制的顺序。这个属性在两种情况下有用处：
        ///
        /// - 当 symbolMargin 设置为负值时，重复的图形会互相覆盖，这是可以使用 symbolRepeatDirection 来指定覆盖顺序。
        /// - 当 animationDelay 或 animationDelayUpdate 被使用时，symbolRepeatDirection 指定了 index 顺序。
        ///
        /// 这个属性的值可以是：'start' 或 'end'。
        ///
        /// 例子： http://echarts.baidu.com/gallery/editor.html?c=doc-example/pictorialBar-repeatDirection
        ///
        /// 此属性可以被设置在系列的 根部，表示对此系列中所有数据都生效；也可以被设置在 data 中的 每个数据项中，表示只对此数据项生效。
        ///
        /// 例如：
        ///
        ///     series: [{
        ///         symbolRepeatDirection: ... // 对 data 中所有数据项生效。
        ///         data: [23, 56]
        ///     }]
        ///
        /// 或者
        ///
        ///     series: [{
        ///         data: [{
        ///             value: 23
        ///             symbolRepeatDirection: ... // 只对此数据项生效
        ///         }, {
        ///             value: 56
        ///             symbolRepeatDirection: ... // 只对此数据项生效
        ///         }]
        ///     }]
        public var symbolRepeatDirection: String?   // ?????
        /// 图形的两边间隔（『两边』是指其数值轴方向的两边）。可以是绝对数值（如 20），或者百分比值（如 '-30%'），表示相对于自身尺寸 symbolSize 的百分比。只有当 symbolRepeat 被使用时有意义。
        ///
        /// 可以是正值，表示间隔大；也可以是负数。当 symbolRepeat 被使用时，负数时能使图形重叠。
        ///
        /// 可以在其值结尾处加一个 "!"，如 "30%!" 或 25!，表示第一个图形的开始和最后一个图形结尾留白，不紧贴边界。默认会紧贴边界。
        ///
        /// 注意：
        ///
        /// - 当 symbolRepeat 为 true/'fixed' 的时候： 这里设置的 symbolMargin 只是个参考值，真正最后的图形间隔，是根据 symbolRepeat、symbolMargin、symbolBoundingData 综合计算得到。
        /// - 当 symbolRepeat 为一个固定数值的时候： 这里设置的 symbolMargin 无效。
        ///
        /// 例子：http://echarts.baidu.com/gallery/editor.html?c=doc-example/pictorialBar-repeatLayout
        ///
        /// 此属性可以被设置在系列的 根部，表示对此系列中所有数据都生效；也可以被设置在 data 中的 每个数据项中，表示只对此数据项生效。
        ///
        /// 例如：
        ///
        ///     series: [{
        ///         symbolMargin: ... // 对 data 中所有数据项生效。
        ///         data: [23, 56]
        ///     }]
        ///
        /// 或者
        ///
        ///     series: [{
        ///         data: [{
        ///             value: 23
        ///             symbolMargin: ... // 只对此数据项生效
        ///         }, {
        ///             value: 56
        ///             symbolMargin: ... // 只对此数据项生效
        ///         }]
        ///     }]
        public var symbolMargin: String?   // ?????
        /// 是否剪裁图形。
        ///
        /// - false/null/undefined：图形本身表示数值大小。
        /// - true：图形被剪裁后剩余的部分表示数值大小。
        ///
        /// symbolClip 常在这种场景下使用：同时表达『总值』和『当前数值』。在这种场景下，可以使用两个系列，一个系列是完整的图形，当做『背景』来表达总数值，另一个系列是使用 symbolClip 进行剪裁过的图形，表达当前数值。
        ///
        /// 例子：http://echarts.baidu.com/gallery/editor.html?c=doc-example/pictorialBar-clip
        ///
        /// 在这个例子中：
        ///
        /// - 『背景系列』和『当前值系列』使用相同的 symbolBoundingData，使得绘制出的图形的大小是一样的。
        /// - 『当前值系列』设置了比『背景系列』更高的 z，使得其覆盖在『背景系列』上。
        ///
        /// 此属性可以被设置在系列的 根部，表示对此系列中所有数据都生效；也可以被设置在 data 中的 每个数据项中，表示只对此数据项生效。
        ///
        /// 例如：
        ///
        ///     series: [{
        ///         symbolClip: ... // 对 data 中所有数据项生效。
        ///         data: [23, 56]
        ///     }]
        ///
        /// 或者
        ///
        ///     series: [{
        ///         data: [{
        ///             value: 23
        ///             symbolClip: ... // 只对此数据项生效
        ///         }, {
        ///             value: 56
        ///             symbolClip: ... // 只对此数据项生效
        ///         }]
        ///     }]
        public var symbolClip: Bool?
        /// 这个属性是『指定图形界限的值』。它指定了一个 data，这个 data 映射在坐标系上的位置，是图形绘制的界限。也就是说，如果设置了 symbolBoundingData，图形的尺寸则由 symbolBoundingData 决定。
        /// 当柱子是水平的，symbolBoundingData 对应到 x 轴上，当柱子是竖直的，symbolBoundingData 对应到 y 轴上。
        ///
        /// 规则：
        ///
        /// - 没有使用 symbolRepeat 时： symbolBoundingData 缺省情况下和『参考柱』的尺寸一样。图形的尺寸由零点和 symbolBoundingData 决定。举例，当柱子是竖直的，柱子对应的 data 为 24，symbolSize 设置为 [30, '50%']，symbolBoundingData 设置为 124，那么最终图形的高度为 124 * 50% = 62。如果 symbolBoundingData 不设置，那么最终图形的高度为 24 * 50% = 12。
        /// - 使用了 symbolRepeat 时： symbolBoundingData 缺省情况取当前坐标系所显示出的最值。symbolBoundingData 定义了一个 bounding，重复的图形在这个 bounding 中，依据 symbolMargin 和 symbolRepeat 和 symbolSize 进行排布。这几个变量决定了图形的间隔大小。
        ///
        /// 在这些场景中，你可能会需要设置 symbolBoundingData：
        ///
        /// - 使用了 symbolCilp 时： 使用一个系列表达『总值』，另一个系列表达『当前值』的时候，需要两个系列画出的图形一样大。那么就把两个系列的 symbolBoundingData 设为一样大。
        ///
        /// 例子：http://echarts.baidu.com/gallery/editor.html?c=doc-example/pictorialBar-clip
        ///
        /// - 使用了 symbolRepeat 时：如果需要不同柱子中的图形的间隔保持一致，那么可以把 symbolBoundingData 设为一致的数值。当然，不设置 symbolBoundingData 也是可以的，因为其缺省值就是一个定值（坐标系所显示出的最值）。
        ///
        /// 例子：http://echarts.baidu.com/gallery/editor.html?c=doc-example/pictorialBar-repeatLayout
        ///
        /// symbolBoundingData 可以是一个数组，例如 [-40, 60]，表示同时指定了正值的 symbolBoundingData 和负值的 symbolBoundingData。
        ///
        /// 参见例子：http://echarts.baidu.com/gallery/editor.html?c=doc-example/pictorialBar-symbolBoundingDataArray
        ///
        /// 此属性可以被设置在系列的 根部，表示对此系列中所有数据都生效；也可以被设置在 data 中的 每个数据项中，表示只对此数据项生效。
        ///
        /// 例如：
        ///
        ///     series: [{
        ///         symbolBoundingData: ... // 对 data 中所有数据项生效。
        ///         data: [23, 56]
        ///     }]
        ///
        /// 或者
        ///
        ///     series: [{
        ///         data: [{
        ///             value: 23
        ///             symbolBoundingData: ... // 只对此数据项生效
        ///         }, {
        ///             value: 56
        ///             symbolBoundingData: ... // 只对此数据项生效
        ///         }]
        ///     }]
        public var symbolBoundingData: String?   // ?????
        /// 可以使用图片作为图形的 pattern。
        ///
        ///     var textureImg = new Image();
        ///     textureImg.src = 'data:image/jpeg;base64,...'; // dataURI
        ///     // 或者
        ///     // textureImg.src = 'http://xxx.xxx.xxx/xx.png'; // URL
        ///     ...
        ///     itemStyle: {
        ///         normal: {
        ///             color: {
        ///                 image: textureImg,
        ///                 repeat: 'repeat'
        ///             }
        ///         }
        ///     }
        ///
        /// 这时候，symbolPatternSize 指定了 pattern 的缩放尺寸。比如 symbolPatternSize 为 400 时表示图片显示为 400px * 400px 的尺寸。
        ///
        /// 例子：http://echarts.baidu.com/gallery/editor.html?c=doc-example/pictorialBar-patternSize
        ///
        /// 此属性可以被设置在系列的 根部，表示对此系列中所有数据都生效；也可以被设置在 data 中的 每个数据项中，表示只对此数据项生效。
        ///
        /// 例如：
        ///
        ///     series: [{
        ///         symbolPatternSize: ... // 对 data 中所有数据项生效。
        ///         data: [23, 56]
        ///     }]
        ///
        /// 或者
        ///
        ///     series: [{
        ///         data: [{
        ///             value: 23
        ///             symbolPatternSize: ... // 只对此数据项生效
        ///         }, {
        ///             value: 56
        ///             symbolPatternSize: ... // 只对此数据项生效
        ///         }]
        ///     }]
        public var symbolPatternSize: Float?
        /// 指定图形元素间的覆盖关系。数值越大，越在层叠的上方。
        public var z: Float?
        /// 是否开启 hover 在图形上的提示动画效果。
        ///
        /// 此属性可以被设置在系列的 根部，表示对此系列中所有数据都生效；也可以被设置在 data 中的 每个数据项中，表示只对此数据项生效。
        ///
        /// 例如：
        ///
        ///     series: [{
        ///         hoverAnimation: ... // 对 data 中所有数据项生效。
        ///         data: [23, 56]
        ///     }]
        ///
        /// 或者
        ///
        ///     series: [{
        ///         data: [{
        ///             value: 23
        ///             hoverAnimation: ... // 只对此数据项生效
        ///         }, {
        ///             value: 56
        ///             hoverAnimation: ... // 只对此数据项生效
        ///         }]
        ///     }]
        public var hoverAnimation: Bool?
        /// 是否开启动画。
        public var animation: Bool?
        /// 是否开启动画的阈值，当单个系列显示的图形数量大于这个阈值时会关闭动画。
        public var animationThreshold: Float?
        /// 初始动画的时长，支持回调函数，可以通过每个数据返回不同的 delay 时间实现更戏剧的初始动画效果：
        ///
        ///     animationDuration: function (idx) {
        ///         // 越往后的数据延迟越大
        ///         return idx * 100;
        ///     }
        public var animationDuration: Time?
        /// 初始动画的缓动效果。不同的缓动效果可以参考
        public var animationEasing: EasingFunction?
        /// 初始动画的延迟，支持回调函数，可以通过每个数据返回不同的 delay 时间实现更戏剧的初始动画效果。
        ///
        /// 如下示例：
        ///
        ///     animationDuration: function (idx) {
        ///         // 越往后的数据延迟越大
        ///         return idx * 100;
        ///     }
        public var animationDelay: Time?
        /// 数据更新动画的时长。
        /// 支持回调函数，可以通过每个数据返回不同的 delay 时间实现更戏剧的更新动画效果：
        ///     animationDurationUpdate: function (idx) {
        ///         // 越往后的数据延迟越大
        ///         return idx * 100;
        ///     }
        public var animationDurationUpdate: Time?
        /// 数据更新动画的缓动效果。
        public var animationEasingUpdate: EasingFunction?
        /// 数据更新动画的延迟，支持回调函数，可以通过每个数据返回不同的 delay 时间实现更戏剧的更新动画效果。
        /// 如下示例：
        ///
        ///     animationDelayUpdate: function (idx) {
        ///         // 越往后的数据延迟越大
        ///         return idx * 100;
        ///     }
        public var animationDelayUpdate: Time?
        /// 单个柱条文本的样式设置。
        public var label: EmphasisLabel?
        /// 单个柱条的样式设置。
        public var itemStyle: ItemStyle?
        /// 本系列每个数据项中特定的 tooltip 设定。
        public var tooltip: Tooltip?
        
        public init() { }
    }
    
    public var type: SerieType {
        return .pictorialBar
    }
    
    /// 系列名称，用于tooltip的显示，legend 的图例筛选，在 setOption 更新数据和配置项时用于指定对应的系列。
    public var name: String?
    /// 是否启用图例 hover 时的联动高亮。
    public var legendHoverLink: Bool?
    /// 该系列使用的坐标系，可选：
    /// -'cartesian2d' 使用二维的直角坐标系（也称笛卡尔坐标系），通过 xAxisIndex, yAxisIndex指定相应的坐标轴组件。
    public var coordinateSystem: CoordinateSystem?
    /// 使用的 x 轴的 index，在单个图表实例中存在多个 x 轴的时候有用。
    public var xAxisIndex: UInt8?
    /// 使用的 y 轴的 index，在单个图表实例中存在多个 y轴的时候有用。
    public var yAxisIndex: UInt8?
    /// 标悬浮时在图形元素上时鼠标的样式是什么。同 CSS 的 cursor。
    public var cursor: String?
    /// 图形上的文本标签，可用于说明图形的一些数据信息，比如值，名称等，label选项在 ECharts 2.x 中放置于itemStyle.normal下，在 ECharts 3 中为了让整个配置项结构更扁平合理，label 被拿出来跟 itemStyle 平级，并且跟 itemStyle 一样拥有 normal, emphasis 两个状态。
    public var label: EmphasisLabel?
    /// 图形样式，有 normal 和 emphasis 两个状态。normal 是图形在默认状态下的样式；emphasis 是图形在高亮状态下的样式，比如在鼠标悬浮或者图例联动高亮时。
    public var itemStyle: ItemStyle?
    /// 柱条的宽度，不设时自适应。支持设置成相对于类目宽度的百分比。
    ///
    /// 在同一坐标系上，此属性会被多个 'pictorialBar' 系列共享。此属性应设置于此坐标系中最后一个 'pictorialBar' 系列上才会生效，并且是对此坐标系中所有 'pictorialBar' 系列生效。
    public var barWidth: LengthValue?
    /// 柱条的最大宽度，不设时自适应。支持设置成相对于类目宽度的百分比。
    ///
    /// 在同一坐标系上，此属性会被多个 'pictorialBar' 系列共享。此属性应设置于此坐标系中最后一个 'pictorialBar' 系列上才会生效，并且是对此坐标系中所有 'pictorialBar' 系列生效。
    public var barMaxWidth: LengthValue?
    /// 柱条最小高度，可用于防止某数据项的值过小而影响交互。
    public var barMinHeight: LengthValue?
    /// 柱间距离，可设固定值（如 20）或者百分比（如 '30%'，表示柱子宽度的 30%）。
    ///
    /// 如果想要两个系列的柱子重叠，可以设置 barGap 为 '-100%'。这在用柱子做背景的时候有用。
    ///
    /// 在同一坐标系上，此属性会被多个 'pictorialBar' 系列共享。此属性应设置于此坐标系中最后一个 'pictorialBar' 系列上才会生效，并且是对此坐标系中所有 'pictorialBar' 系列生效。
    ///
    /// 例子：http://echarts.baidu.com/gallery/editor.html?c=doc-example/barGrid-barGap
    public var barGap: LengthValue?
    /// 类目间柱形距离，默认为类目间距的20%，可设固定值
    ///
    /// 在同一坐标系上，此属性会被多个 'pictorialBar' 系列共享。此属性应设置于此坐标系中最后一个 'pictorialBar' 系列上才会生效，并且是对此坐标系中所有 'pictorialBar' 系列生效。
    public var barCategoryGap: LengthValue?
    /// 图形类型。
    ///
    /// ECharts 提供的标记类型包括 'circle', 'rect', 'roundRect', 'triangle', 'diamond', 'pin', 'arrow'
    ///
    /// 也可以通过 'image://url' 设置为图片，其中 url 为图片的链接，或者 dataURI。
    ///
    /// 可以通过 'path://' 将图标设置为任意的矢量路径。这种方式相比于使用图片的方式，不用担心因为缩放而产生锯齿或模糊，而且可以设置为任意颜色。路径图形会自适应调整为合适的大小。路径的格式参见 SVG PathData。可以从 Adobe Illustrator 等工具编辑导出。
    ///
    /// 例子: http://echarts.baidu.com/gallery/editor.html?c=doc-example/pictorialBar-graphicType
    ///
    /// 此属性可以被设置在系列的 根部，表示对此系列中所有数据都生效；也可以被设置在 data 中的 每个数据项中，表示只对此数据项生效。
    ///
    /// 例如：
    ///
    ///     series: [{
    ///         symbol: ... // 对 data 中所有数据项生效。
    ///         data: [23, 56]
    ///     }]
    /// 或者
    ///     series: [{
    ///         data: [{
    ///             value: 23
    ///             symbol: ... // 只对此数据项生效
    ///         }, {
    ///             value: 56
    ///             symbol: ... // 只对此数据项生效
    ///         }]
    ///     }]
    public var symbol: OneOrMore<Symbol>?
    /// 图形的大小。
    ///
    /// 可以用数组分开表示宽和高，例如 [20, 10] 表示标记宽为20，高为10，也可以设置成诸如 10 这样单一的数字，表示 [10, 10]。
    ///
    /// 可以设置成绝对值（如 10），也可以设置成百分比（如 '120%'、['55%', 23]）。
    ///
    /// 当设置为百分比时，图形的大小是基于 基准柱 的尺寸计算出来的。
    ///
    /// 例如，当基准柱基于 x 轴（即柱子是纵向的），symbolSize 设置为 ['30%', '50%']，那么最终图形的尺寸是：
    ///
    /// - 宽度：基准柱的宽度 * 30%。
    /// - 高度：
    ///     - 如果 symbolRepeat 为 false：基准柱的高度 * 50%。
    ///     - 如果 symbolRepeat 为 true：基准柱的宽度 * 50%。
    ///
    /// 基准柱基于 y 轴（即柱子是横向的）的情况类似对调可得出。
    ///
    /// 例子： http://echarts.baidu.com/gallery/editor.html?c=doc-example/pictorialBar-symbolSize
    /// 此属性可以被设置在系列的 根部，表示对此系列中所有数据都生效；也可以被设置在 data 中的 每个数据项中，表示只对此数据项生效。
    ///
    /// 例如：
    ///
    ///     series: [{
    ///         symbolSize: ... // 对 data 中所有数据项生效。
    ///         data: [23, 56]
    ///     }]
    ///
    /// 或者
    ///
    ///     series: [{
    ///         data: [{
    ///             value: 23
    ///             symbolSize: ... // 只对此数据项生效
    ///         }, {
    ///             value: 56
    ///             symbolSize: ... // 只对此数据项生效
    ///         }]
    ///     }]
    public var symbolSize: FunctionOrFloatOrPair?
    /// 图形的定位位置。可取值：
    ///
    /// - 'start'：图形边缘与柱子开始的地方内切。
    /// - 'end'：图形边缘与柱子结束的地方内切。
    /// - 'center'：图形在柱子里居中。
    ///
    /// 例子：http://echarts.baidu.com/gallery/editor.html?c=doc-example/pictorialBar-position
    ///
    /// 此属性可以被设置在系列的 根部，表示对此系列中所有数据都生效；也可以被设置在 data 中的 每个数据项中，表示只对此数据项生效。
    ///
    /// 例如：
    ///
    ///     series: [{
    ///         symbolPosition: ... // 对 data 中所有数据项生效。
    ///         data: [23, 56]
    ///     }]
    ///
    /// 或者
    ///
    ///     series: [{
    ///         data: [{
    ///             value: 23
    ///             symbolPosition: ... // 只对此数据项生效
    ///         }, {
    ///             value: 56
    ///             symbolPosition: ... // 只对此数据项生效
    ///         }]
    ///     }]
    public var symbolPosition: Position?
    /// 图形相对于原本位置的偏移。symbolOffset 是图形定位中最后计算的一个步骤，可以对图形计算出来的位置进行微调。
    ///
    /// 可以设置成绝对值（如 10），也可以设置成百分比（如 '120%'、['55%', 23]）。
    ///
    /// 当设置为百分比时，表示相对于自身尺寸 symbolSize 的百分比。
    ///
    /// 例如 [0, '-50%'] 就是把图形向上移动了自身尺寸的一半的位置。
    ///
    /// 例子：http://echarts.baidu.com/gallery/editor.html?c=doc-example/pictorialBar-position
    ///
    /// 此属性可以被设置在系列的 根部，表示对此系列中所有数据都生效；也可以被设置在 data 中的 每个数据项中，表示只对此数据项生效。
    ///
    /// 例如：
    ///
    ///     series: [{
    ///         symbolOffset: ... // 对 data 中所有数据项生效。
    ///         data: [23, 56]
    ///     }]
    ///
    /// 或者
    ///
    ///     series: [{
    ///         data: [{
    ///             value: 23
    ///             symbolOffset: ... // 只对此数据项生效
    ///         }, {
    ///             value: 56
    ///             symbolOffset: ... // 只对此数据项生效
    ///         }]
    ///     }]
    public var symbolOffset: Point?
    /// 图形的旋转角度。
    ///
    /// 注意，symbolRotate 并不会影响图形的定位（哪怕超出基准柱的边界），而只是单纯得绕自身中心旋转。
    ///
    /// 此属性可以被设置在系列的 根部，表示对此系列中所有数据都生效；也可以被设置在 data 中的 每个数据项中，表示只对此数据项生效。
    ///
    /// 例如：
    ///
    ///     series: [{
    ///         symbolRotate: ... // 对 data 中所有数据项生效。
    ///         data: [23, 56]
    ///     }]
    ///
    /// 或者
    ///
    ///     series: [{
    ///         data: [{
    ///             value: 23
    ///             symbolRotate: ... // 只对此数据项生效
    ///         }, {
    ///             value: 56
    ///             symbolRotate: ... // 只对此数据项生效
    ///         }]
    ///     }]
    public var symbolRotate: Float?
    /// 指定图形元素是否重复。值可为：
    ///
    /// - false/null/undefined：不重复，即每个数据值用一个图形元素表示。
    /// - true：使图形元素重复，即每个数据值用一组重复的图形元素表示。重复的次数依据 data 计算得到。
    /// - a number：使图形元素重复，即每个数据值用一组重复的图形元素表示。重复的次数是给定的定值。
    /// - 'fixed'：使图形元素重复，即每个数据值用一组重复的图形元素表示。重复的次数依据 symbolBoundingData 计算得到，即与 data 无关。这在此图形被用于做背景时有用。
    ///
    /// 例子: http://echarts.baidu.com/gallery/editor.html?c=doc-example/pictorialBar-repeat
    ///
    /// 此属性可以被设置在系列的 根部，表示对此系列中所有数据都生效；也可以被设置在 data 中的 每个数据项中，表示只对此数据项生效。
    ///
    /// 例如：
    ///
    ///     series: [{
    ///         symbolRepeat: ... // 对 data 中所有数据项生效。
    ///         data: [23, 56]
    ///     }]
    ///
    /// 或者
    ///
    ///     series: [{
    ///         data: [{
    ///             value: 23
    ///             symbolRepeat: ... // 只对此数据项生效
    ///         }, {
    ///             value: 56
    ///             symbolRepeat: ... // 只对此数据项生效
    ///         }]
    ///     }]
    public var symbolRepeat: String?  // ?????
    /// 指定图形元素重复时，绘制的顺序。这个属性在两种情况下有用处：
    ///
    /// - 当 symbolMargin 设置为负值时，重复的图形会互相覆盖，这是可以使用 symbolRepeatDirection 来指定覆盖顺序。
    /// - 当 animationDelay 或 animationDelayUpdate 被使用时，symbolRepeatDirection 指定了 index 顺序。
    ///
    /// 这个属性的值可以是：'start' 或 'end'。
    ///
    /// 例子： http://echarts.baidu.com/gallery/editor.html?c=doc-example/pictorialBar-repeatDirection
    ///
    /// 此属性可以被设置在系列的 根部，表示对此系列中所有数据都生效；也可以被设置在 data 中的 每个数据项中，表示只对此数据项生效。
    ///
    /// 例如：
    ///
    ///     series: [{
    ///         symbolRepeatDirection: ... // 对 data 中所有数据项生效。
    ///         data: [23, 56]
    ///     }]
    ///
    /// 或者
    ///
    ///     series: [{
    ///         data: [{
    ///             value: 23
    ///             symbolRepeatDirection: ... // 只对此数据项生效
    ///         }, {
    ///             value: 56
    ///             symbolRepeatDirection: ... // 只对此数据项生效
    ///         }]
    ///     }]
    public var symbolRepeatDirection: String?   // ?????
    /// 图形的两边间隔（『两边』是指其数值轴方向的两边）。可以是绝对数值（如 20），或者百分比值（如 '-30%'），表示相对于自身尺寸 symbolSize 的百分比。只有当 symbolRepeat 被使用时有意义。
    ///
    /// 可以是正值，表示间隔大；也可以是负数。当 symbolRepeat 被使用时，负数时能使图形重叠。
    ///
    /// 可以在其值结尾处加一个 "!"，如 "30%!" 或 25!，表示第一个图形的开始和最后一个图形结尾留白，不紧贴边界。默认会紧贴边界。
    ///
    /// 注意：
    ///
    /// - 当 symbolRepeat 为 true/'fixed' 的时候： 这里设置的 symbolMargin 只是个参考值，真正最后的图形间隔，是根据 symbolRepeat、symbolMargin、symbolBoundingData 综合计算得到。
    /// - 当 symbolRepeat 为一个固定数值的时候： 这里设置的 symbolMargin 无效。
    ///
    /// 例子：http://echarts.baidu.com/gallery/editor.html?c=doc-example/pictorialBar-repeatLayout
    ///
    /// 此属性可以被设置在系列的 根部，表示对此系列中所有数据都生效；也可以被设置在 data 中的 每个数据项中，表示只对此数据项生效。
    ///
    /// 例如：
    ///
    ///     series: [{
    ///         symbolMargin: ... // 对 data 中所有数据项生效。
    ///         data: [23, 56]
    ///     }]
    ///
    /// 或者
    ///
    ///     series: [{
    ///         data: [{
    ///             value: 23
    ///             symbolMargin: ... // 只对此数据项生效
    ///         }, {
    ///             value: 56
    ///             symbolMargin: ... // 只对此数据项生效
    ///         }]
    ///     }]
    public var symbolMargin: String?   // ?????
    /// 是否剪裁图形。
    ///
    /// - false/null/undefined：图形本身表示数值大小。
    /// - true：图形被剪裁后剩余的部分表示数值大小。
    ///
    /// symbolClip 常在这种场景下使用：同时表达『总值』和『当前数值』。在这种场景下，可以使用两个系列，一个系列是完整的图形，当做『背景』来表达总数值，另一个系列是使用 symbolClip 进行剪裁过的图形，表达当前数值。
    ///
    /// 例子：http://echarts.baidu.com/gallery/editor.html?c=doc-example/pictorialBar-clip
    ///
    /// 在这个例子中：
    ///
    /// - 『背景系列』和『当前值系列』使用相同的 symbolBoundingData，使得绘制出的图形的大小是一样的。
    /// - 『当前值系列』设置了比『背景系列』更高的 z，使得其覆盖在『背景系列』上。
    ///
    /// 此属性可以被设置在系列的 根部，表示对此系列中所有数据都生效；也可以被设置在 data 中的 每个数据项中，表示只对此数据项生效。
    ///
    /// 例如：
    ///
    ///     series: [{
    ///         symbolClip: ... // 对 data 中所有数据项生效。
    ///         data: [23, 56]
    ///     }]
    ///
    /// 或者
    ///
    ///     series: [{
    ///         data: [{
    ///             value: 23
    ///             symbolClip: ... // 只对此数据项生效
    ///         }, {
    ///             value: 56
    ///             symbolClip: ... // 只对此数据项生效
    ///         }]
    ///     }]
    public var symbolClip: Bool?
    /// 这个属性是『指定图形界限的值』。它指定了一个 data，这个 data 映射在坐标系上的位置，是图形绘制的界限。也就是说，如果设置了 symbolBoundingData，图形的尺寸则由 symbolBoundingData 决定。
    /// 当柱子是水平的，symbolBoundingData 对应到 x 轴上，当柱子是竖直的，symbolBoundingData 对应到 y 轴上。
    ///
    /// 规则：
    ///
    /// - 没有使用 symbolRepeat 时： symbolBoundingData 缺省情况下和『参考柱』的尺寸一样。图形的尺寸由零点和 symbolBoundingData 决定。举例，当柱子是竖直的，柱子对应的 data 为 24，symbolSize 设置为 [30, '50%']，symbolBoundingData 设置为 124，那么最终图形的高度为 124 * 50% = 62。如果 symbolBoundingData 不设置，那么最终图形的高度为 24 * 50% = 12。
    /// - 使用了 symbolRepeat 时： symbolBoundingData 缺省情况取当前坐标系所显示出的最值。symbolBoundingData 定义了一个 bounding，重复的图形在这个 bounding 中，依据 symbolMargin 和 symbolRepeat 和 symbolSize 进行排布。这几个变量决定了图形的间隔大小。
    ///
    /// 在这些场景中，你可能会需要设置 symbolBoundingData：
    ///
    /// - 使用了 symbolCilp 时： 使用一个系列表达『总值』，另一个系列表达『当前值』的时候，需要两个系列画出的图形一样大。那么就把两个系列的 symbolBoundingData 设为一样大。
    ///
    /// 例子：http://echarts.baidu.com/gallery/editor.html?c=doc-example/pictorialBar-clip
    ///
    /// - 使用了 symbolRepeat 时：如果需要不同柱子中的图形的间隔保持一致，那么可以把 symbolBoundingData 设为一致的数值。当然，不设置 symbolBoundingData 也是可以的，因为其缺省值就是一个定值（坐标系所显示出的最值）。
    ///
    /// 例子：http://echarts.baidu.com/gallery/editor.html?c=doc-example/pictorialBar-repeatLayout
    ///
    /// symbolBoundingData 可以是一个数组，例如 [-40, 60]，表示同时指定了正值的 symbolBoundingData 和负值的 symbolBoundingData。
    ///
    /// 参见例子：http://echarts.baidu.com/gallery/editor.html?c=doc-example/pictorialBar-symbolBoundingDataArray
    ///
    /// 此属性可以被设置在系列的 根部，表示对此系列中所有数据都生效；也可以被设置在 data 中的 每个数据项中，表示只对此数据项生效。
    ///
    /// 例如：
    ///
    ///     series: [{
    ///         symbolBoundingData: ... // 对 data 中所有数据项生效。
    ///         data: [23, 56]
    ///     }]
    ///
    /// 或者
    ///
    ///     series: [{
    ///         data: [{
    ///             value: 23
    ///             symbolBoundingData: ... // 只对此数据项生效
    ///         }, {
    ///             value: 56
    ///             symbolBoundingData: ... // 只对此数据项生效
    ///         }]
    ///     }]
    public var symbolBoundingData: String?   // ?????
    /// 可以使用图片作为图形的 pattern。
    ///
    ///     var textureImg = new Image();
    ///     textureImg.src = 'data:image/jpeg;base64,...'; // dataURI
    ///     // 或者
    ///     // textureImg.src = 'http://xxx.xxx.xxx/xx.png'; // URL
    ///     ...
    ///     itemStyle: {
    ///         normal: {
    ///             color: {
    ///                 image: textureImg,
    ///                 repeat: 'repeat'
    ///             }
    ///         }
    ///     }
    ///
    /// 这时候，symbolPatternSize 指定了 pattern 的缩放尺寸。比如 symbolPatternSize 为 400 时表示图片显示为 400px * 400px 的尺寸。
    ///
    /// 例子：http://echarts.baidu.com/gallery/editor.html?c=doc-example/pictorialBar-patternSize
    ///
    /// 此属性可以被设置在系列的 根部，表示对此系列中所有数据都生效；也可以被设置在 data 中的 每个数据项中，表示只对此数据项生效。
    ///
    /// 例如：
    ///
    ///     series: [{
    ///         symbolPatternSize: ... // 对 data 中所有数据项生效。
    ///         data: [23, 56]
    ///     }]
    ///
    /// 或者
    ///
    ///     series: [{
    ///         data: [{
    ///             value: 23
    ///             symbolPatternSize: ... // 只对此数据项生效
    ///         }, {
    ///             value: 56
    ///             symbolPatternSize: ... // 只对此数据项生效
    ///         }]
    ///     }]
    public var symbolPatternSize: Float?
    /// 是否开启 hover 在图形上的提示动画效果。
    ///
    /// 此属性可以被设置在系列的 根部，表示对此系列中所有数据都生效；也可以被设置在 data 中的 每个数据项中，表示只对此数据项生效。
    ///
    /// 例如：
    ///
    ///     series: [{
    ///         hoverAnimation: ... // 对 data 中所有数据项生效。
    ///         data: [23, 56]
    ///     }]
    ///
    /// 或者
    ///
    ///     series: [{
    ///         data: [{
    ///             value: 23
    ///             hoverAnimation: ... // 只对此数据项生效
    ///         }, {
    ///             value: 56
    ///             hoverAnimation: ... // 只对此数据项生效
    ///         }]
    ///     }]
    public var hoverAnimation: Bool?
    /// 使用 dimensions 定义 data 每个维度的信息。例如：
    ///
    ///     series: {
    ///         type: 'xxx',
    ///         // 定义了每个维度的名称。这个名称会被显示到默认的 tooltip 中。
    ///         dimensions: ['date', 'open', 'close', 'highest', 'lowest']
    ///         data: [
    ///             // 有了上面 dimensions 定义后，下面这五个维度的名称分别为：
    ///             // 'date', 'open', 'close', 'highest', 'lowest'
    ///             [12, 44, 55, 66, 2],
    ///             [23, 6, 16, 23, 1],
    ///             ...
    ///         ]
    ///     }
    ///     series: {
    ///         type: 'xxx',
    ///         dimensions: [
    ///             null,                // 如果此维度不想给出定义，则使用 null 即可
    ///             {type: 'ordinal'},   // 只定义此维度的类型。
    ///             // 'ordinal' 表示离散型，一般文本使用这种类型。
    ///             // 如果类型没有被定义，会自动猜测类型。
    ///             {name: 'good', type: 'number'},
    ///             'bad'                // 等同于 {name: 'bad'}
    ///         ]
    ///     }
    ///
    /// dimensions 数组中的每一项可以是：
    ///
    /// - string，如 'someName'，等同于 {name: 'someName'}
    /// - Object，属性可以有：
    ///     - name: string。
    ///     - type: string，支持
    ///         - number
    ///         - float，即 Float64Array
    ///         - int，即 Int32Array
    ///         - ordinal，表示离散数据，一般指字符串。
    ///         - time，表示时间类型，时间类型的支持参见 data
    ///
    /// 值得一提的是，当定义了 dimensions 后，默认 tooltip 中对个维度的显示，会变为『竖排』，从而方便显示每个维度的名称。如果没有定义 dimensions，则默认 tooltip 会横排显示，且只显示数值没有维度名称可显示。
    public var dimensions: [Jsonable]?
    /// 可以定义 data 的哪个维度被编码成什么。比如：
    ///
    ///     series: {
    ///         type: 'xxx',
    ///         encode: {
    ///             x: [3, 1, 5],      // 表示维度 3、1、5 映射到 x 轴。
    ///             y: 2,              // 表示维度 2 映射到 y 轴。
    ///             tooltip: [3, 2, 4] // 表示维度 3、2、4 会在 tooltip 中显示。
    ///             label: 3           // 表示 label 使用维度 3。
    ///         },
    ///         data: [
    ///             // 每一列称为一个『维度』。
    ///             // 这里分别是维度 0、1、2、3、4。
    ///             [12, 44, 55, 66, 2],
    ///             [23, 6, 16, 23, 1],
    ///             ...
    ///         ]
    ///     }
    ///
    /// encode 支持的属性，根据坐标系不同而不同。 对于 直角坐标系（cartesian2d），支持 x、y。 对于 极坐标系（polar），支持 radius、angle。 对于 地理坐标系（geo），支持 lng，lat。 此外，均支持 tooltip 和 label 和 itemName（用于指定 tooltip 中数据项名称）。
    ///
    /// 当使用 dimensions 给维度定义名称后，encode 中可直接引用名称，例如：
    ///
    ///     series: {
    ///         type: 'xxx',
    ///         dimensions: ['date', 'open', 'close', 'highest', 'lowest'],
    ///         encode: {
    ///             x: 'date',
    ///             y: ['open', 'close', 'highest', 'lowest']
    ///         },
    ///         data: [ ... ]
    ///     }
    public var encode: [String: Jsonable]?
    /// 数据，详情可以见: PictorialBarSerie.Data
    public var data: [Jsonable]?
    /// 图表标注。
    public var markPoint: MarkPoint?
    /// 图表标线。
    public var markLine: MarkLine?
    /// 图表标域，常用于标记图表中某个范围的数据，例如标出某段时间投放了广告。
    public var markArea: MarkArea?
    /// 象形柱图所有图形的 zlevel 值。
    ///
    /// zlevel用于 Canvas 分层，不同zlevel值的图形会放置在不同的 Canvas 中，Canvas 分层是一种常见的优化手段。我们可以把一些图形变化频繁（例如有动画）的组件设置成一个单独的zlevel。需要注意的是过多的 Canvas 会引起内存开销的增大，在手机端上需要谨慎使用以防崩溃。
    ///
    /// zlevel 大的 Canvas 会放在 zlevel 小的 Canvas 的上面。
    public var zlevel: Float?
    /// 象形柱图组件的所有图形的z值。控制图形的前后顺序。z值小的图形会被z值大的图形覆盖。
    ///
    /// z相比zlevel优先级更低，而且不会创建新的 Canvas。
    public var z: Float?
    /// 图形是否不响应和触发鼠标事件，默认为 false，即响应和触发鼠标事件。
    public var silent: Bool?
    /// 是否开启动画。
    public var animation: Bool?
    /// 是否开启动画的阈值，当单个系列显示的图形数量大于这个阈值时会关闭动画。
    public var animationThreshold: Float?
    /// 初始动画的时长，支持回调函数，可以通过每个数据返回不同的 delay 时间实现更戏剧的初始动画效果：
    ///
    ///     animationDuration: function (idx) {
    ///         // 越往后的数据延迟越大
    ///         return idx * 100;
    ///     }
    public var animationDuration: Time?
    /// 初始动画的缓动效果。不同的缓动效果可以参考
    public var animationEasing: EasingFunction?
    /// 初始动画的延迟，支持回调函数，可以通过每个数据返回不同的 delay 时间实现更戏剧的初始动画效果。
    ///
    /// 如下示例：
    ///
    ///     animationDuration: function (idx) {
    ///         // 越往后的数据延迟越大
    ///         return idx * 100;
    ///     }
    public var animationDelay: Time?
    /// 数据更新动画的时长。
    /// 支持回调函数，可以通过每个数据返回不同的 delay 时间实现更戏剧的更新动画效果：
    ///     animationDurationUpdate: function (idx) {
    ///         // 越往后的数据延迟越大
    ///         return idx * 100;
    ///     }
    public var animationDurationUpdate: Time?
    /// 数据更新动画的缓动效果。
    public var animationEasingUpdate: EasingFunction?
    /// 数据更新动画的延迟，支持回调函数，可以通过每个数据返回不同的 delay 时间实现更戏剧的更新动画效果。
    /// 如下示例：
    ///
    ///     animationDelayUpdate: function (idx) {
    ///         // 越往后的数据延迟越大
    ///         return idx * 100;
    ///     }
    public var animationDelayUpdate: Time?
    /// 本系列特定的 tooltip 设定。
    public var tooltip: Tooltip?
    
    public init() { }
}

extension PictorialBarSerie.Data: Enumable {
    public enum Enums {
        case name(String), value(Jsonable), symbol(Symbol), symbolSize(FunctionOrFloatOrPair), symbolPosition(Position), symbolOffset(Point), symbolRotate(Float), symbolRepeat(String), symbolRepeatDirection(String), symbolMargin(String), symbolClip(Bool), symbolBoundingData(String), symbolPatternSize(Float), z(Float), hoverAnimation(Bool), animation(Bool), animationThreshold(Float), animationDuration(Time), animationEasing(EasingFunction), animationDurationUpdate(Time), animationEasingUpdate(EasingFunction), animationDelay(Time), animationDelayUpdate(Time), label(EmphasisLabel), itemStyle(ItemStyle), tooltip(Tooltip)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .name(name):
                self.name = name
            case let .value(value):
                self.value = value
            case let .symbol(symbol):
                self.symbol = OneOrMore(one: symbol)
            case let .symbolSize(symbolSize):
                self.symbolSize = symbolSize
            case let .symbolPosition(symbolPosition):
                self.symbolPosition = symbolPosition
            case let .symbolOffset(symbolOffset):
                self.symbolOffset = symbolOffset
            case let .symbolRotate(symbolRotate):
                self.symbolRotate = symbolRotate
            case let .symbolRepeat(symbolRepeat):
                self.symbolRepeat = symbolRepeat
            case let .symbolRepeatDirection(symbolRepeatDirection):
                self.symbolRepeatDirection = symbolRepeatDirection
            case let .symbolMargin(symbolMargin):
                self.symbolMargin = symbolMargin
            case let .symbolClip(symbolClip):
                self.symbolClip = symbolClip
            case let .symbolBoundingData(symbolBoundingData):
                self.symbolBoundingData = symbolBoundingData
            case let .symbolPatternSize(symbolPatternSize):
                self.symbolPatternSize = symbolPatternSize
            case let .z(z):
                self.z = z
            case let .hoverAnimation(hoverAnimation):
                self.hoverAnimation = hoverAnimation
            case let .animation(animation):
                self.animation = animation
            case let .animationThreshold(animationThreshold):
                self.animationThreshold = animationThreshold
            case let .animationDuration(animationDuration):
                self.animationDuration = animationDuration
            case let .animationEasing(animationEasing):
                self.animationEasing = animationEasing
            case let .animationDurationUpdate(animationDurationUpdate):
                self.animationDurationUpdate = animationDurationUpdate
            case let .animationEasingUpdate(animationEasingUpdate):
                self.animationEasingUpdate = animationEasingUpdate
            case let .animationDelay(animationDelay):
                self.animationDelay = animationDelay
            case let .animationDelayUpdate(animationDelayUpdate):
                self.animationDelayUpdate = animationDelayUpdate
            case let .label(label):
                self.label = label
            case let .itemStyle(itemStyle):
                self.itemStyle = itemStyle
            case let .tooltip(tooltip):
                self.tooltip = tooltip
            }
        }
    }
}

extension PictorialBarSerie.Data: Mappable {
    public func mapping(_ map: Mapper) {
        map["name"] = name
        map["value"] = value
        map["symbol"] = symbol
        map["symbolSize"] = symbolSize
        map["symbolPosition"] = symbolPosition
        map["symbolOffset"] = symbolOffset
        map["symbolRotate"] = symbolRotate
        map["symbolRepeat"] = symbolRepeat
        map["symbolRepeatDirection"] = symbolRepeatDirection
        map["symbolMargin"] = symbolMargin
        map["symbolClip"] = symbolClip
        map["symbolBoundingData"] = symbolBoundingData
        map["symbolPatternSize"] = symbolPatternSize
        map["z"] = z
        map["hoverAnimation"] = hoverAnimation
        map["animation"] = animation
        map["animationThreshold"] = animationThreshold
        map["animationDuration"] = animationDuration
        map["animationEasing"] = animationEasing
        map["animationDurationUpdate"] = animationDurationUpdate
        map["animationEasingUpdate"] = animationEasingUpdate
        map["animationDelay"] = animationDelay
        map["animationDelayUpdate"] = animationDelayUpdate
        map["label"] = label
        map["itemStyle"] = itemStyle
        map["tooltip"] = tooltip
    }
}

extension PictorialBarSerie: Enumable {
    public enum Enums {
        case name(String), legendHoverLink(Bool), coordinateSystem(CoordinateSystem), xAxisIndex(UInt8), yAxisIndex(UInt8), cursor(String), label(EmphasisLabel), itemStyle(ItemStyle), barWidth(LengthValue), barMaxWidth(LengthValue), barMinHeight(LengthValue), barGap(LengthValue), barCategoryGap(LengthValue), symbol(Symbol), symbolSize(FunctionOrFloatOrPair), symbolPosition(Position), symbolOffset(Point), symbolRotate(Float), symbolRepeat(String), symbolRepeatDirection(String), symbolMargin(String), symbolClip(Bool), symbolBoundingData(String), symbolPatternSize(Float), hoverAnimation(Bool), dimensions([Jsonable]), encode([String: Jsonable]), data([Jsonable]), markPoint(MarkPoint), markLine(MarkLine), markArea(MarkArea), zlevel(Float), z(Float), silent(Bool), animation(Bool), animationThreshold(Float), animationDuration(Time), animationEasing(EasingFunction), animationDurationUpdate(Time), animationDelayUpdate(Time), animationDelay(Time), animationEasingUpdate(EasingFunction), tooltip(Tooltip)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .name(name):
                self.name = name
            case let .legendHoverLink(legendHoverLink):
                self.legendHoverLink = legendHoverLink
            case let .coordinateSystem(coordinateSystem):
                self.coordinateSystem = coordinateSystem
            case let .xAxisIndex(xAxisIndex):
                self.xAxisIndex = xAxisIndex
            case let .yAxisIndex(yAxisIndex):
                self.yAxisIndex = yAxisIndex
            case let .cursor(cursor):
                self.cursor = cursor
            case let .label(label):
                self.label = label
            case let .itemStyle(itemStyle):
                self.itemStyle = itemStyle
            case let .barWidth(barWidth):
                self.barWidth = barWidth
            case let .barMaxWidth(barMaxWidth):
                self.barMaxWidth = barMaxWidth
            case let .barMinHeight(barMinHeight):
                self.barMinHeight = barMinHeight
            case let .barGap(barGap):
                self.barGap = barGap
            case let .barCategoryGap(barCategoryGap):
                self.barCategoryGap = barCategoryGap
            case let .symbol(symbol):
                self.symbol = OneOrMore(one: symbol)
            case let .symbolSize(symbolSize):
                self.symbolSize = symbolSize
            case let .symbolPosition(symbolPosition):
                self.symbolPosition = symbolPosition
            case let .symbolOffset(symbolOffset):
                self.symbolOffset = symbolOffset
            case let .symbolRotate(symbolRotate):
                self.symbolRotate = symbolRotate
            case let .symbolRepeat(symbolRepeat):
                self.symbolRepeat = symbolRepeat
            case let .symbolRepeatDirection(symbolRepeatDirection):
                self.symbolRepeatDirection = symbolRepeatDirection
            case let .symbolMargin(symbolMargin):
                self.symbolMargin = symbolMargin
            case let .symbolClip(symbolClip):
                self.symbolClip = symbolClip
            case let .symbolBoundingData(symbolBoundingData):
                self.symbolBoundingData = symbolBoundingData
            case let .symbolPatternSize(symbolPatternSize):
                self.symbolPatternSize = symbolPatternSize
            case let .hoverAnimation(hoverAnimation):
                self.hoverAnimation = hoverAnimation
            case let .dimensions(dimensions):
                self.dimensions = dimensions
            case let .encode(encode):
                self.encode = encode
            case let .data(data):
                self.data = data
            case let .markPoint(markPoint):
                self.markPoint = markPoint
            case let .markLine(markLine):
                self.markLine = markLine
            case let .markArea(markArea):
                self.markArea = markArea
            case let .zlevel(zlevel):
                self.zlevel = zlevel
            case let .z(z):
                self.z = z
            case let .silent(silent):
                self.silent = silent
            case let .animation(animation):
                self.animation = animation
            case let .animationThreshold(animationThreshold):
                self.animationThreshold = animationThreshold
            case let .animationDuration(animationDuration):
                self.animationDuration = animationDuration
            case let .animationEasing(animationEasing):
                self.animationEasing = animationEasing
            case let .animationDurationUpdate(animationDurationUpdate):
                self.animationDurationUpdate = animationDurationUpdate
            case let .animationDelayUpdate(animationDelayUpdate):
                self.animationDelayUpdate = animationDelayUpdate
            case let .animationDelay(animationDelay):
                self.animationDelay = animationDelay
            case let .animationEasingUpdate(animationEasingUpdate):
                self.animationEasingUpdate = animationEasingUpdate
            case let .tooltip(tooltip):
                self.tooltip = tooltip
            }
        }
    }
}

extension PictorialBarSerie: Mappable {
    public func mapping(_ map: Mapper) {
        map["type"] = type
        map["name"] = name
        map["legendHoverLink"] = legendHoverLink
        map["coordinateSystem"] = coordinateSystem
        map["xAxisIndex"] = xAxisIndex
        map["yAxisIndex"] = yAxisIndex
        map["cursor"] = cursor
        map["label"] = label
        map["itemStyle"] = itemStyle
        map["barWidth"] = barWidth
        map["barMaxWidth"] = barMaxWidth
        map["barMinHeight"] = barMinHeight
        map["barGap"] = barGap
        map["barCategoryGap"] = barCategoryGap
        map["symbol"] = symbol
        map["symbolSize"] = symbolSize
        map["symbolPosition"] = symbolPosition
        map["symbolOffset"] = symbolOffset
        map["symbolRotate"] = symbolRotate
        map["symbolRepeat"] = symbolRepeat
        map["symbolRepeatDirection"] = symbolRepeatDirection
        map["symbolMargin"] = symbolMargin
        map["symbolClip"] = symbolClip
        map["symbolBoundingData"] = symbolBoundingData
        map["symbolPatternSize"] = symbolPatternSize
        map["hoverAnimation"] = hoverAnimation
        map["dimensions"] = dimensions
        map["encode"] = encode
        map["data"] = data
        map["markPoint"] = markPoint
        map["markLine"] = markLine
        map["markArea"] = markArea
        map["zlevel"] = zlevel
        map["z"] = z
        map["silent"] = silent
        map["animation"] = animation
        map["animationThreshold"] = animationThreshold
        map["animationDuration"] = animationDuration
        map["animationEasing"] = animationEasing
        map["animationDurationUpdate"] = animationDurationUpdate
        map["animationDelayUpdate"] = animationDelayUpdate
        map["animationDelay"] = animationDelay
        map["animationEasingUpdate"] = animationEasingUpdate
        map["tooltip"] = tooltip
    }
}
