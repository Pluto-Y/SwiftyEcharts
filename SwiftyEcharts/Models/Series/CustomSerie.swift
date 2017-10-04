//
//  CustomSerie.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 16/09/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 自定义系列
///
/// 自定义系列可以自定义系列中的图形元素渲染。从而能扩展出不同的图表。
///
/// 同时，echarts 会统一管理图形的创建删除、动画、与其他组件（如 dataZoom、visualMap）的联动，使开发者不必纠结这些细节。
///
/// 例如，下面的例子使用 custom series 扩展出了 x-range 图：
///
/// 地址: http://www.echartsjs.com/gallery/editor.html?c=custom-profile
///
/// 更多的例子参见: http://echarts.baidu.com/examples.html#chart-type-custom
///
/// 教程: http://echarts.baidu.com/tutorial.html#%E8%87%AA%E5%AE%9A%E4%B9%89%E7%B3%BB%E5%88%97
///
/// 开发者自定义渲染逻辑（renderItem 函数）
///
/// custom 系列需要开发者自己提供图形渲染的逻辑。这个渲染逻辑一般命名为 renderItem。例如：
///
///     var option = {
///         ...,
///         series: [{
///             type: 'custom',
///             renderItem: function (params, api) {
///                 var categoryIndex = api.value(0);
///                 var start = api.coord([api.value(1), categoryIndex]);
///                 var end = api.coord([api.value(2), categoryIndex]);
///                 var height = api.size([0, 1])[1] * 0.6;
///             
///                 return {
///                     type: 'rect',
///                     shape: echarts.graphic.clipRectByRect({
///                         x: start[0],
///                         y: start[1] - height / 2,
///                         width: end[0] - start[0],
///                         height: height
///                     }, {
///                         x: params.coordSys.x,
///                         y: params.coordSys.y,
///                         width: params.coordSys.width,
///                         height: params.coordSys.height
///                     }),
///                     style: api.style()
///                 };
///             },
///             data: data
///         }]
///     }
///
/// 对于 data 中的每个数据项（为方便描述，这里称为 dataItem)，会调用此 renderItem 函数。
///
/// renderItem 函数提供了两个参数：
///
/// - params：包含了当前数据信息和坐标系的信息。
/// - api：是一些开发者可调用的方法集合。
///
/// renderItem 函数须返回根据此 dataItem 绘制出的图形元素的定义信息，参见 renderItem.return。
///
/// 一般来说，renderItem 函数的主要逻辑，是将 dataItem 里的值映射到坐标系上的图形元素。这一般需要用到 renderItem.arguments.api 中的两个函数：
///
/// - api.value(...)，意思是取出 dataItem 中的数值。例如 api.value(0) 表示取出当前 dataItem 中第一个维度的数值。
/// - api.coord(...)，意思是进行坐标转换计算。例如 var point = api.coord([api.value(0), api.value(1)]) 表示 dataItem 中的数值转换成坐标系上的点。
///
/// 有时候还需要用到 api.size(...) 函数，表示得到坐标系上一段数值范围对应的长度。
///
/// 返回值中样式的设置可以使用 api.style(...) 函数，他能得到 series.itemStyle.normal 中定义的样式信息，以及视觉映射的样式信息。也可以用这种方式覆盖这些样式信息：api.style({fill: 'green', stroke: 'yellow'})。
/// 
/// 维度的映射（encode 和 dimensions 属性）
///
/// custom 系列往往需要定义 series.encode，主要用于指明 data 的哪些维度映射到哪些数轴上。从而，echarts 能根据这些维度的值的范围，画出合适的数轴刻度。 同时，encode.tooltip 和 encode.label 也可以被指定，指明默认的 tooltip 和 label 显示什么内容。series.dimensions 也可以被指定，指明显示在 tooltip 中的维度名称，或者维度的类型。
///
/// 例如：
///
///     series: {
///         type: 'custom',
///         renderItem: function () {
///             ...
///         },
///         encode: {
///             x: [2, 4, 3],
///             y: 1,
///             label: 0,
///             tooltip: [2, 4, 3]
///         }
///     }
/// 
/// 与 dataZoom 组件的结合
///
/// 与 dataZoom 结合使用的时候，常常使用会设置 dataZoom.filterMode 为 'weakFilter'，从而让 dataItem 部分超出坐标系边界的时候，不会整体被过滤掉。
/// 
/// 关于 dataIndex 和 dataIndexInside 的区别
///
/// - dataIndex 指的 dataItem 在原始数据中的 index。
/// - dataIndexInside 指的是 dataItem 在当前数据窗口（参见 dataZoom）中的 index。
///
/// renderItem.arguments.api 中使用的参数都是 dataIndexInside 而非 dataIndex，因为从 dataIndex 转换成 dataIndexInside 需要时间开销。
public final class CustomSerie: Serie, Zable, Animatable {
    
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
    /// - 当某维度对应于类目轴（axis.type 为 'category'）的时候： 其值须为类目的『序数』（从 0 开始）或者类目的『字符串值』。例如：
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
    /// - 当某维度对应于时间轴（type 为 'time'）的时候，值可以为：
    ///     - 一个时间戳，如 1484141700832，表示 UTC 时间。
    ///     - 或者字符串形式的时间描述：
    ///         - ISO 8601 的子集，只包含这些形式（这几种格式，除非指明时区，否则均表示本地时间，与 moment 一致）：
    ///             - 部分年月日时间: '2012-03', '2012-03-01', '2012-03-01 05', '2012-03-01 05:06'.
    ///             - 使用 'T' 或空格分割: '2012-03-01T12:22:33.123', '2012-03-01 12:22:33.123'.
    ///             - 时区设定: '2012-03-01T12:22:33Z', '2012-03-01T12:22:33+8000', '2012-03-01T12:22:33-05:00'.
    ///     - 其他的时间字符串，包括（均表示本地时间）: '2012', '2012-3-1', '2012/3/1', '2012/03/01', '2009/6/12 2:00', '2009/6/12 2:05:08', '2009/6/12 2:05:08.123'
    /// - 或者用户 自行初始化的 Date 实例：
    ///     - 注意，用户自行初始化 Date 实例的时候，浏览器的行为有差异，不同字符串的表示也不同。
    ///     - 例如：在 chrome 中，new Date('2012-01-01') 表示 UTC 时间的 2012 年 1 月 1 日，而 new Date('2012-1-1') 和 new Date('2012/01/01') 表示本地时间的 2012 年 1 月 1 日。在 safari 中，不支持 new Date('2012-1-1') 这种表示方法。
    ///     - 所以，使用 new Date(dataString) 时，可使用第三方库解析（如 moment），或者使用 echarts.number.parseDate，或者参见 这里。
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
    public final class Data {
        /// 数据项名称。
        public var name: String?
        /// 单个数据项的数值。
        public var value: Float?
        /// 数据项的样式。
        public var itemStyle: ItemStyle?
        /// 本系列每个数据项中特定的 tooltip 设定。
        public var tooltip: Tooltip?
    }
    
    public var type: SerieType {
        return .custom
    }
    
    /// 系列名称，用于tooltip的显示，legend 的图例筛选，在 setOption 更新数据和配置项时用于指定对应的系列。
    public var name: String?
    /// 是否启用图例 hover 时的联动高亮。
    public var legendHoverLink: Bool?
    /// 该系列使用的坐标系
    public var coordinateSystem: CoordinateSystem?
    /// 使用的 x 轴的 index，在单个图表实例中存在多个 x 轴的时候有用。
    public var xAxisIndex: UInt?
    /// 使用的 y 轴的 index，在单个图表实例中存在多个 y轴的时候有用。
    public var yAxisIndex: UInt?
    /// 使用的极坐标系的 index，在单个图表实例中存在多个极坐标系的时候有用。
    public var polarIndex: UInt?
    /// 使用的地理坐标系的 index，在单个图表实例中存在多个地理坐标系的时候有用。
    public var geoIndex: UInt?
    /// 使用的日历坐标系的 index，在单个图表实例中存在多个日历坐标系的时候有用。
    public var calendarIndex: UInt?
    /// custom 系列需要开发者自己提供图形渲染的逻辑。这个渲染逻辑一般命名为 renderItem。例如：
    ///
    ///     var option = {
    ///         ...,
    ///         series: [{
    ///             type: 'custom',
    ///             renderItem: function (params, api) {
    ///                 var categoryIndex = api.value(0);
    ///                 var start = api.coord([api.value(1), categoryIndex]);
    ///                 var end = api.coord([api.value(2), categoryIndex]);
    ///                 var height = api.size([0, 1])[1] * 0.6;
    ///             
    ///                 return {
    ///                     type: 'rect',
    ///                     shape: echarts.graphic.clipRectByRect({
    ///                         x: start[0],
    ///                         y: start[1] - height / 2,
    ///                         width: end[0] - start[0],
    ///                         height: height
    ///                     }, {
    ///                         x: params.coordSys.x,
    ///                         y: params.coordSys.y,
    ///                         width: params.coordSys.width,
    ///                         height: params.coordSys.height
    ///                     }),
    ///                     style: api.style()
    ///                 };
    ///             },
    ///             data: data
    ///         }]
    ///     }
    ///
    /// 对于 data 中的每个数据项（为方便描述，这里称为 dataItem)，会调用此 renderItem 函数。
    ///
    /// renderItem 函数提供了两个参数：
    ///
    /// - params：包含了当前数据信息和坐标系的信息。
    /// - api：是一些开发者可调用的方法集合。
    ///
    /// renderItem 函数须返回根据此 dataItem 绘制出的图形元素的定义信息，参见 renderItem.return。
    ///
    /// 一般来说，renderItem 函数的主要逻辑，是将 dataItem 里的值映射到坐标系上的图形元素。这一般需要用到 renderItem.arguments.api 中的两个函数：
    ///
    /// - api.value(...)，意思是取出 dataItem 中的数值。例如 api.value(0) 表示取出当前 dataItem 中第一个维度的数值。
    /// - api.coord(...)，意思是进行坐标转换计算。例如 var point = api.coord([api.value(0), api.value(1)]) 表示 dataItem 中的数值转换成坐标系上的点。
    ///
    /// 有时候还需要用到 api.size(...) 函数，表示得到坐标系上一段数值范围对应的长度。
    ///
    /// 返回值中样式的设置可以使用 api.style(...) 函数，他能得到 series.itemStyle.normal 中定义的样式信息，以及视觉映射的样式信息。也可以用这种方式覆盖这些样式信息：api.style({fill: 'green', stroke: 'yellow'})。
    public var renderItem: Function?
    /// 图形样式，有 normal 和 emphasis 两个状态。normal 是图形在默认状态下的样式；emphasis 是图形在高亮状态下的样式，比如在鼠标悬浮或者图例联动高亮时。
    public var itemStyle: ItemStyle?
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
    ///                                  // 'ordinal' 表示离散型，一般文本使用这种类型。
    ///                                  // 如果类型没有被定义，会自动猜测类型。
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
    /// 系列中的数据内容数组。数组项通常为具体的数据项。
    public var data: [Jsonable]?
    
    /// MARK: Zable
    public var zlevel: Float?
    public var z: Float?
    
    /// 图形是否不响应和触发鼠标事件，默认为 false，即响应和触发鼠标事件。
    public var silent: Bool?
    
    /// MARK: Animatable
    public var animation: Bool?
    public var animationThreshold: Float?
    public var animationDuration: Time?
    public var animationEasing: EasingFunction?
    public var animationDelay: Time?
    public var animationDurationUpdate: Time?
    public var animationEasingUpdate: EasingFunction?
    public var animationDelayUpdate: Time?
    
    /// 本系列特定的 tooltip 设定。
    public var tooltip: Tooltip?
}

extension CustomSerie.Data: Enumable {
    public enum Enums {
        case name(String), value(Float), itemStyle(ItemStyle), tooltip(Tooltip)
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
            case let .itemStyle(itemStyle):
                self.itemStyle = itemStyle
            case let .tooltip(tooltip):
                self.tooltip = tooltip
            }
        }
    }
}

extension CustomSerie.Data: Mappable {
    public func mapping(_ map: Mapper) {
        map["name"] = name
        map["value"] = value
        map["itemStyle"] = itemStyle
        map["tooltip"] = tooltip
    }
}

extension CustomSerie: Enumable {
    public enum Enums {
        case name(String), legendHoverLink(Bool), coordinateSystem(CoordinateSystem), xAxisIndex(UInt), yAxisIndex(UInt), polarIndex(UInt), geoIndex(UInt), calendarIndex(UInt), renderItem(Function), itemStyle(ItemStyle), dimensions([Jsonable]), encode([String: Jsonable]), data([Jsonable]), zlevel(Float), z(Float), silent(Bool), animation(Bool), animationThreshold(Float), animationDuration(Time), animationEasing(EasingFunction), animationDelay(Time), animationDurationUpdate(Time), animationEasingUpdate(EasingFunction), animationDelayUpdate(Time), tooltip(Tooltip)
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
            case let .polarIndex(polarIndex):
                self.polarIndex = polarIndex
            case let .geoIndex(geoIndex):
                self.geoIndex = geoIndex
            case let .calendarIndex(calendarIndex):
                self.calendarIndex = calendarIndex
            case let .renderItem(renderItem):
                self.renderItem = renderItem
            case let .itemStyle(itemStyle):
                self.itemStyle = itemStyle
            case let .dimensions(dimensions):
                self.dimensions = dimensions
            case let .encode(encode):
                self.encode = encode
            case let .data(data):
                self.data = data
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
            case let .animationDelay(animationDelay):
                self.animationDelay = animationDelay
            case let .animationDurationUpdate(animationDurationUpdate):
                self.animationDurationUpdate = animationDurationUpdate
            case let .animationEasingUpdate(animationEasingUpdate):
                self.animationEasingUpdate = animationEasingUpdate
            case let .animationDelayUpdate(animationDelayUpdate):
                self.animationDelayUpdate = animationDelayUpdate
            case let .tooltip(tooltip):
                self.tooltip = tooltip
            }
        }
    }
}

extension CustomSerie: Mappable {
    public func mapping(_ map: Mapper) {
        map["type"] = type
        map["name"] = name
        map["legendHoverLink"] = legendHoverLink
        map["coordinateSystem"] = coordinateSystem
        map["xAxisIndex"] = xAxisIndex
        map["yAxisIndex"] = yAxisIndex
        map["polarIndex"] = polarIndex
        map["geoIndex"] = geoIndex
        map["calendarIndex"] = calendarIndex
        map["renderItem"] = renderItem
        map["itemStyle"] = itemStyle
        map["dimensions"] = dimensions
        map["encode"] = encode
        map["data"] = data
        map["zlevel"] = zlevel
        map["z"] = z
        map["silent"] = silent
        map["animation"] = animation
        map["animationThreshold"] = animationThreshold
        map["animationDuration"] = animationDuration
        map["animationEasing"] = animationEasing
        map["animationDelay"] = animationDelay
        map["animationDurationUpdate"] = animationDurationUpdate
        map["animationEasingUpdate"] = animationEasingUpdate
        map["animationDelayUpdate"] = animationDelayUpdate
        map["tooltip"] = tooltip
    }
}
