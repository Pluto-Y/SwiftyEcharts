//
//  Parallel.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 09/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 平行坐标系介绍
///
/// 平行坐标系（Parallel Coordinates） 是一种常用的可视化高维数据的图表。
///
/// 例如 series-parallel.data 中有如下数据：
///
///     [
///         [1,  55,  9,   56,  0.46,  18,  6,  '良'],
///         [2,  25,  11,  21,  0.65,  34,  9,  '优'],
///         [3,  56,  7,   63,  0.3,   14,  5,  '良'],
///         [4,  33,  7,   29,  0.33,  16,  6,  '优'],
///         { // 数据项也可以是 Object，从而里面能含有对线条的特殊设置。
///         value: [5,  42,  24,  44,  0.76,  40,  16, '优']
///         lineStyle: {...},
///         }
///         ...
///     ]
///
/// 数据中，每一行是一个『数据项』，每一列属于一个『维度』。（例如上面数据每一列的含义分别是：『日期』,『AQI指数』, 『PM2.5』, 『PM10』, 『一氧化碳值』, 『二氧化氮值』, 『二氧化硫值』）。
///
/// 平行坐标系适用于对这种多维数据进行可视化分析。每一个维度（每一列）对应一个坐标轴，每一个『数据项』是一条线，贯穿多个坐标轴。在坐标轴上，可以进行数据选取等操作。如下：
///
/// http://echarts.baidu.com/gallery/editor.html?c=doc-example/parallel-all
///
/// 配置方式概要
///
/// 『平行坐标系』的 option 基本配置如下例：
///
///     option = {
///         parallelAxis: [                     // 这是一个个『坐标轴』的定义
///             {dim: 0, name: schema[0].text}, // 每个『坐标轴』有个 'dim' 属性，表示坐标轴的维度号。
///             {dim: 1, name: schema[1].text},
///             {dim: 2, name: schema[2].text},
///             {dim: 3, name: schema[3].text},
///             {dim: 4, name: schema[4].text},
///             {dim: 5, name: schema[5].text},
///             {dim: 6, name: schema[6].text},
///             {dim: 7, name: schema[7].text,
///             type: 'category',           // 坐标轴也可以支持类别型数据
///             data: ['优', '良', '轻度污染', '中度污染', '重度污染', '严重污染']
///             }
///         ],
///         parallel: {                         // 这是『坐标系』的定义
///             left: '5%',                     // 平行坐标系的位置设置
///             right: '13%',
///             bottom: '10%',
///             top: '20%',
///             parallelAxisDefault: {          // 『坐标轴』的公有属性可以配置在这里避免重复书写
///                 type: 'value',
///                 nameLocation: 'end',
///                 nameGap: 20
///             }
///         },
///         series: [                           // 这里三个系列共用一个平行坐标系
///             {
///                 name: '北京',
///                 type: 'parallel',           // 这个系列类型是 'parallel'
///                 data: [
///                     [1,  55,  9,   56,  0.46,  18,  6,  '良'],
///                     [2,  25,  11,  21,  0.65,  34,  9,  '优'],
///                     ...
///                 ]
///             },
///             {
///                 name: '上海',
///                 type: 'parallel',
///                 data: [
///                     [3,  56,  7,   63,  0.3,   14,  5,  '良'],
///                     [4,  33,  7,   29,  0.33,  16,  6,  '优'],
///                     ...
///                 ]
///             },
///             {
///                 name: '广州',
///                 type: 'parallel',
///                 data: [
///                     [4,  33,  7,   29,  0.33,  16,  6,  '优'],
///                     [5,  42,  24,  44,  0.76,  40,  16, '优'],
///                     ...
///                 ]
///             }
///         ]
///     };
///
/// 需要涉及到三个组件：parallel、parallelAxis、series-parallel
///
/// - parallel: 这个配置项是平行坐标系的『坐标系』本身。一个系列（series）或多个系列（如上图中的『北京』、『上海』、『广州』分别各是一个系列）可以共用这个『坐标系』。和其他坐标系一样，坐标系也可以创建多个。 位置设置，也是放在这里进行。
/// - parallelAxis: 这个是『坐标系』中的坐标轴的配置。自然，需要有多个坐标轴。其中有 parallelAxis.parallelIndex 属性，指定这个『坐标轴』在哪个『坐标系』中。默认使用第一个『坐标系』。
/// - series-parallel: 这个是『系列』的定义。系列被画到『坐标系』上。其中有 series-parallel.parallelIndex 属性，指定使用哪个『坐标系』。默认使用第一个『坐标系』。
///
/// 配置注意和最佳实践
///
/// 配置多个 parallelAxis 时，有些值一样的属性，如果书写多遍则比较繁琐，那么可以放置在 parallel.parallelAxisDefault 里。在坐标轴初始化前，parallel.parallelAxisDefault 里的配置项，会分别融合进 parallelAxis，形成最终的坐标轴的配置。
///
/// 如果数据量很大并且发生卡顿
///
/// 建议把 series-parallel.lineStyle.normal.width 设为 0.5（或更小）， 可能显著改善性能。
///
/// 高维数据的显示
///
/// 维度比较多时，比如有 50+ 的维度，那么就会有 50+ 个轴。那么可能会页面显示不下。
///
/// 可以通过 parallel.axisExpandable 来改善显示效果，如下例子：
///
/// http://echarts.baidu.com/gallery/editor.html?c=map-parallel-prices
public struct Parallel: Zable {
    
    /// 配置多个 parallelAxis 时，有些值一样的属性，如果书写多遍则比较繁琐，那么可以放置在 parallel.parallelAxisDefault 里。在坐标轴初始化前，parallel.parallelAxisDefault 里的配置项，会分别融合进 parallelAxis，形成最终的坐标轴的配置。
    ///
    /// 参见示例: http://echarts.baidu.com/gallery/editor.html?c=doc-example/parallel-all&edit=1&reset=1
    public struct ParallelAxisDefault {
        
        /// 类目数据，在类目轴（type: 'category'）中有效。
        ///
        /// 示例：
        ///
        ///     // 所有类目名称列表
        ///     data: ['周一', '周二', '周三', '周四', '周五', '周六', '周日']
        ///     // 每一项也可以是具体的配置项，此时取配置项中的 `value` 为类目名
        ///     data: [{
        ///         value: '周一',
        ///         // 突出周一
        ///         textStyle: {
        ///         fontSize: 20,
        ///         color: 'red'
        ///         }
        ///     }, '周二', '周三', '周四', '周五', '周六', '周日']
        public struct Data {
            /// 单个类目名称
            public var value: String?
            /// 类目标签的文字样式
            public var textStyle: TextStyle?
        }
        
        /// 坐标轴类型
        public var type: SECAxisType?
        /// 坐标轴名称
        public var name: String?
        /// 坐标轴名称显示位置
        public var nameLocation: Position?
        /// 坐标轴名称的文字样式
        public var nameTextStyle: TextStyle?
        /// 坐标轴名称与轴线之间的距离
        public var nameGap: Float?
        /// 坐标轴名字旋转，角度值
        public var nameRotate: Float?
        /// 是否是反向坐标轴。ECharts 3 中新加
        public var inverse: Bool?
        /// 坐标轴两边留白策略，类目轴和非类目轴的设置和表现不一样。
        ///
        /// 类目轴中 boundaryGap 可以配置为 true 和 false。默认为 true，这时候刻度只是作为分隔线，标签和数据点都会在两个刻度之间的带(band)中间。
        ///
        /// 非类目轴，包括时间，数值，对数轴，boundaryGap是一个两个值的数组，分别表示数据最小值和最大值的延伸范围，可以直接设置数值或者相对的百分比，在设置 min 和 max 后无效。 示例：
        ///
        /// boundaryGap: ['20%', '20%']
        public var boundaryGap: BoundaryGap?
        /// 坐标轴刻度最小值。
        ///
        /// 可以设置成特殊值 'dataMin'，此时取数据在该轴上的最小值作为最小刻度。
        ///
        /// 不设置时会自动计算最小值保证坐标轴刻度的均匀分布。
        ///
        /// 在类目轴中，也可以设置为类目的序数（如类目轴 data: ['类A', '类B', '类C'] 中，序数 2 表示 '类C'。也可以设置为负数，如 -3）。
        public var min: String?
        /// 坐标轴刻度最大值。
        ///
        /// 可以设置成特殊值 'dataMax'，此时取数据在该轴上的最大值作为最大刻度。
        ///
        /// 不设置时会自动计算最大值保证坐标轴刻度的均匀分布。
        ///
        /// 在类目轴中，也可以设置为类目的序数（如类目轴 data: ['类A', '类B', '类C'] 中，序数 2 表示 '类C'。也可以设置为负数，如 -3）。
        public var max: String?
        /// 只在数值轴中（type: 'value'）有效。
        /// 是否是脱离 0 值比例。设置成 true 后坐标刻度不会强制包含零刻度。在双数值轴的散点图中比较有用。
        /// 在设置 min 和 max 之后该配置项无效。
        public var scale: Bool?
        /// 坐标轴的分割段数，需要注意的是这个分割段数只是个预估值，最后实际显示的段数会在这个基础上根据分割后坐标轴刻度显示的易读程度作调整。
        /// 在类目轴中无效。
        public var splitNumber: UInt8?
        /// 自动计算的坐标轴最小间隔大小。
        ///
        /// 例如可以设置成1保证坐标轴分割刻度显示成整数。
        ///
        ///     {
        ///     minInterval: 1
        ///     }
        public var minInterval: UInt8?
        /// 强制设置坐标轴分割间隔。
        ///
        /// 因为 splitNumber 是预估的值，实际根据策略计算出来的刻度可能无法达到想要的效果，这时候可以使用 interval 配合 min、max 强制设定刻度划分，一般不建议使用。
        ///
        /// 无法在类目轴中使用。在时间轴（type: 'time'）中需要传时间戳，在对数轴（type: 'log'）中需要传指数值。
        public var interval: UInt?
        /// 对数轴的底数，只在对数轴中（type: 'log'）有效。
        public var logBase: Float?
        /// 坐标轴是否是静态无法交互。
        public var silent: Bool?
        /// 坐标轴的标签是否响应和触发鼠标事件，默认不响应。
        ///
        /// 事件参数如下：
        ///
        ///     {
        ///         // 组件类型，xAxis, yAxis, radiusAxis, angleAxis
        ///         // 对应组件类型都会有一个属性表示组件的 index，例如 xAxis 就是 xAxisIndex
        ///         componentType: string,
        ///         // 未格式化过的刻度值, 点击刻度标签有效
        ///         value: '',
        ///         // 坐标轴名称, 点击坐标轴名称有效
        ///         name: ''
        ///     }
        public var triggerEvent: Bool?
        /// 坐标轴轴线相关设置
        public var axisLine: SECAxisLine?
        /// 坐标轴刻度相关设置
        public var axisTick: SECAxisTick?
        /// 坐标轴刻度标签的相关设置
        public var axisLabel: SECAxisLabel?
        /// 类目数据
        public var data: [Any]?
        
    }
    
    /// MARK: Zable
    public var zlevel: Float?
    public var z: Float?
    /// 组件离容器左侧的距离。
    ///
    /// left 的值可以是像 20 这样的具体像素值，可以是像 '20%' 这样相对于容器高宽的百分比，也可以是 'left', 'center', 'right'。
    ///
    /// 如果 left 的值为'left', 'center', 'right'，组件会根据相应的位置自动对齐。
    public var left: Position?
    /// 组件离容器上侧的距离。
    ///
    /// top 的值可以是像 20 这样的具体像素值，可以是像 '20%' 这样相对于容器高宽的百分比，也可以是 'top', 'middle', 'bottom'。
    ///
    /// 如果 top 的值为'top', 'middle', 'bottom'，组件会根据相应的位置自动对齐。
    public var top: Position?
    /// 组件离容器右侧的距离。
    ///
    /// right 的值可以是像 20 这样的具体像素值，可以是像 '20%' 这样相对于容器高宽的百分比。
    ///
    /// 默认自适应。
    public var right: Position?
    /// 组件离容器下侧的距离。
    ///
    /// bottom 的值可以是像 20 这样的具体像素值，可以是像 '20%' 这样相对于容器高宽的百分比。
    ///
    /// 默认自适应。
    public var bottom: Position?
    /// parallel 组件的宽度。默认自适应。
    public var width: Float?
    /// parallel 组件的高度。默认自适应。
    public var height: Float?
    /// 布局方式
    public var layout: SECOrient?
    /// 维度比较多时，比如有 50+ 的维度，那么就会有 50+ 个轴。那么可能会页面显示不下。
    ///
    /// 可以通过 parallel.axisExpandable 来改善显示效果，如下例子：
    ///
    /// http://echarts.baidu.com/gallery/editor.html?c=map-parallel-prices
    ///
    /// 是否允许点击展开折叠 axis。
    public var axisExpandable: Bool?
    /// 初始时，以哪个轴为中心展开，这里给出轴的 index。没有默认值，需要手动指定。
    /// 参见 parallel.axisExpandable
    public var axisExpandCenter: Float?
    /// 初始时，有多少个轴会处于展开状态。建议根据你的维度个数而手动指定。
    ///
    /// 参见 parallel.axisExpandCenter 参见 parallel.axisExpandable
    public var axisExpandCount: Float?
    /// 在展开状态，轴的间距是多少，单位为像素。
    public var axisExpandWidth: Float?
    /// 配置多个 parallelAxis 时，有些值一样的属性，如果书写多遍则比较繁琐，那么可以放置在 parallel.parallelAxisDefault 里。在坐标轴初始化前，parallel.parallelAxisDefault 里的配置项，会分别融合进 parallelAxis，形成最终的坐标轴的配置。
    public var parallelAxisDefault: ParallelAxisDefault?
}

extension Parallel: Enumable {
    public enum Enums {
        case zlevel(Float), z(Float), left(Position), top(Position), right(Position), bottom(Position), width(Float), height(Float), layout(SECOrient), axisExpandable(Bool), axisExpandCenter(Float), axisExpandCount(Float), axisExpandWidth(Float), parallelAxisDefault(ParallelAxisDefault)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
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
            case let .layout(layout):
                self.layout = layout
            case let .axisExpandable(axisExpandable):
                self.axisExpandable = axisExpandable
            case let .axisExpandCenter(axisExpandCenter):
                self.axisExpandCenter = axisExpandCenter
            case let .axisExpandCount(axisExpandCount):
                self.axisExpandCount = axisExpandCount
            case let .axisExpandWidth(axisExpandWidth):
                self.axisExpandWidth = axisExpandWidth
            case let .parallelAxisDefault(parallelAxisDefault):
                self.parallelAxisDefault = parallelAxisDefault
            }
        }
    }
}

extension Parallel: Mappable {
    public func mapping(map: Mapper) {
        map["zlevel"] = zlevel
        map["z"] = z
        map["left"] = left
        map["top"] = top
        map["right"] = right
        map["bottom"] = bottom
        map["width"] = width
        map["height"] = height
        map["layout"] = layout
        map["axisExpandable"] = axisExpandable
        map["axisExpandCenter"] = axisExpandCenter
        map["axisExpandCount"] = axisExpandCount
        map["axisExpandWidth"] = axisExpandWidth
        map["parallelAxisDefault"] = parallelAxisDefault
    }
}

extension Parallel.ParallelAxisDefault: Enumable {
    public enum Enums {
        case type(SECAxisType), name(String), nameLocation(Position), nameTextStyle(TextStyle), nameGap(Float), nameRotate(Float), inverse(Bool), boundaryGap(BoundaryGap), min(String), max(String), scale(Bool), splitNumber(UInt8), minInterval(UInt8), interval(UInt), logBase(Float), silent(Bool), triggerEvent(Bool), axisLine(SECAxisLine), axisTick(SECAxisTick), axisLabel(SECAxisLabel), data([Any])
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
        for ele in elements {
            switch ele {
            case let .type(type):
                self.type = type
            case let .name(name):
                self.name = name
            case let .nameLocation(nameLocation):
                self.nameLocation = nameLocation
            case let .nameTextStyle(nameTextStyle):
                self.nameTextStyle = nameTextStyle
            case let .nameGap(nameGap):
                self.nameGap = nameGap
            case let .nameRotate(nameRotate):
                self.nameRotate = nameRotate
            case let .inverse(inverse):
                self.inverse = inverse
            case let .boundaryGap(boundaryGap):
                self.boundaryGap = boundaryGap
            case let .min(min):
                self.min = min
            case let .max(max):
                self.max = max
            case let .scale(scale):
                self.scale = scale
            case let .splitNumber(splitNumber):
                self.splitNumber = splitNumber
            case let .minInterval(minInterval):
                self.minInterval = minInterval
            case let .interval(interval):
                self.interval = interval
            case let .logBase(logBase):
                self.logBase = logBase
            case let .silent(silent):
                self.silent = silent
            case let .triggerEvent(triggerEvent):
                self.triggerEvent = triggerEvent
            case let .axisLine(axisLine):
                self.axisLine = axisLine
            case let .axisTick(axisTick):
                self.axisTick = axisTick
            case let .axisLabel(axisLabel):
                self.axisLabel = axisLabel
            case let .data(data):
                self.data = data
            }
        }
    }
}

extension Parallel.ParallelAxisDefault: Mappable {
    public func mapping(map: Mapper) {
        map["type"] = type
        map["name"] = name
        map["nameLocation"] = nameLocation
        map["nameTextStyle"] = nameTextStyle
        map["nameGap"] = nameGap
        map["nameRotate"] = nameRotate
        map["inverse"] = inverse
        map["boundaryGap"] = boundaryGap
        map["min"] = min
        map["max"] = max
        map["scale"] = scale
        map["splitNumber"] = splitNumber
        map["minInterval"] = minInterval
        map["interval"] = interval
        map["logBase"] = logBase
        map["silent"] = silent
        map["triggerEvent"] = triggerEvent
        map["axisLine"] = axisLine
        map["axisTick"] = axisTick
        map["axisLabel"] = axisLabel
        map["data"] = data
    }
}

extension Parallel.ParallelAxisDefault.Data: Enumable {
    public enum Enums {
        case value(String), textStyle(TextStyle)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
        for ele in elements {
            switch ele {
            case let .value(value):
                self.value = value
            case let .textStyle(textStyle):
                self.textStyle = textStyle
            }
        }
    }
}

extension Parallel.ParallelAxisDefault.Data: Mappable {
    public func mapping(map: Mapper) {
        map["value"] = value
        map["textStyle"] = textStyle
    }
}
