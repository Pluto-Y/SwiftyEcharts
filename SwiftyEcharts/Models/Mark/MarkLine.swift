//
//  MarkLine.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 16/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public struct MarkLine: Animatable {
    
    public struct Data {
        /// 名称
        public var name: String?
        /// 标注类型
        public var type: MarkDataType?
        /// 在使用 type 时有效，用于指定在哪个维度上指定最大值最小值，可以是 0（xAxis, radiusAxis），1（yAxis, angleAxis），默认使用第一个数值轴所在的维度。
        public var valueIndex: UInt?
        /// 在使用 type 时有效，用于指定在哪个维度上指定最大值最小值。这可以是维度的直接名称，例如折线图时可以是x、angle等、candlestick 图时可以是open、close等维度名称。
        public var valueDim: String?
        /// 起点或终点的坐标。坐标格式视系列的坐标系而定，可以是直角坐标系上的 x, y，也可以是极坐标系上的 radius, angle。
        /// 注：对于 axis.type 为 'category' 类型的轴
        /// - 如果 coord 值为 number，则表示 axis.data 的 index。
        /// - 如果 coord 值为 string，则表示 axis.data 中具体的值。注意使用这种方式时，xAxis.data 不能写成 [number, number, ...]，而只能写成 [string, string, ...]，否则不能被 markPoint / markLine 用『具体值』索引到。
        ///
        /// 例如：
        ///         {
        ///             xAxis: {
        ///                 type: 'category',
        ///                 data: ['5', '6', '9', '13', '19', '33']
        ///                 // 注意这里不建议写成 [5, 6, 9, 13, 19, 33]，否则不能被 markPoint / markLine 用『具体值』索引到。
        ///             },
        ///             series: {
        ///                 type: 'line',
        ///                 data: [11, 22, 33, 44, 55, 66],
        ///                 markPoint: { // markLine 也是同理
        ///                     data: [{
        ///                         coord: [5, 33.4], // 其中 5 表示 xAxis.data[5]，即 '33' 这个元素。
        ///                         // coord: ['5', 33.4] // 其中 '5' 表示 xAxis.data中的 '5' 这个元素。
        ///                         // 注意，使用这种方式时，xAxis.data 不能写成 [number, number, ...]
        ///                         // 而只能写成 [string, string, ...]
        ///                     }]
        ///                 }
        ///             }
        ///         }
        public var coord: Jsonable?
        /// 相对容器的屏幕 x 坐标，单位像素。
        public var x: LengthValue?
        /// 相对容器的屏幕 y 坐标，单位像素。
        public var y: LengthValue?
        
        public var xAxis: String?
        
        public var yAxis: String?
        /// 标注值，可以不设。
        public var value: Float?
        /// 标记的图形
        /// - Note: 该属性只在 MarkArea 无效
        public var symbol: Symbol?
        /// 标记的大小
        /// - Note: 该属性只在 MarkArea 无效
        public var symbolSize: Float?
        /// 标记的旋转角度。注意在 markLine 中当 symbol 为 'arrow' 时会忽略 symbolRotate 强制设置为切线的角度。
        /// - Note: 该属性只在 MarkArea 无效
        public var symbolRotate: Float?
        /// 标记相对于原本位置的偏移。默认情况下，标记会居中置放在数据对应的位置，但是如果 symbol 是自定义的矢量路径或者图片，就有可能不希望 symbol 居中。这时候可以使用该配置项配置 symbol 相对于原本居中的偏移，可以是绝对的像素值，也可以是相对的百分比。
        /// 例如 [0, '50%'] 就是把自己向上移动了一半的位置，在 symbol 图形是气泡的时候可以让图形下端的箭头对准数据点。
        /// - Note: 该属性只在 MarkArea 无效
        public var symbolOffset: [LengthValue]?
        /// 该数据项线的样式，起点和终点项的 lineStyle会合并到一起。
        public var lineStyle: EmphasisLineStyle?
        /// 该数据项标签的样式，起点和终点项的 label会合并到一起。
        public var label: FormattedLabel?
        
    }
    
    /// 图形是否不响应和触发鼠标事件，默认为 false，即响应和触发鼠标事件。
    public var silent: Bool?
    /// 标线两端的标记类型，可以是一个数组分别指定两端，也可以是单个统一指定，具体格式见 data.symbol。 
    // FIXME: 暂不支持两端
    public var symbol: Symbol?
    /// 标线两端的标记大小，可以是一个数组分别指定两端，也可以是单个统一指定。
    /// 注意： 这里无法像一般的 symbolSize 那样通过数组分别指定高宽。
    // FIXME: 暂不支持两端
    public var symbolSize: Float?
    /// 标线数值的精度，在显示平均值线的时候有用。
    public var precision: Float?
    /// 标线的文本。
    public var label: Label?
    /// 标线的样式
    public var lineStyle: EmphasisLineStyle?
    /// 标线的数据数组。每个数组项可以是一个两个值的数组，分别表示线的起点和终点，每一项是一个对象，有下面几种方式指定起点或终点的位置。
    /// - 1.通过 x, y 属性指定相对容器的屏幕坐标，单位像素，支持百分比。
    /// - 2.用 coord 属性指定数据在相应坐标系上的坐标位置，单个维度支持设置 'min', 'max', 'average'。
    /// - 3.直接用 type 属性标注系列中的最大值，最小值。这时候可以使用 valueIndex 或者 valueDim 指定是在哪个维度上的最大值、最小值、平均值。
    /// - 4.如果是笛卡尔坐标系的话，也可以通过只指定 xAxis 或者 yAxis 来实现 X 轴或者 Y 轴为某值的标线，见示例 scatter-weight
    ///
    /// 当多个属性同时存在时，优先级按上述的顺序。
    /// 也可以是直接通过 type 设置该标线的类型，是最大值的线还是平均线。同样的，这时候可以通过使用 valueIndex 指定维度。
    ///
    ///         data: [
    ///             {
    ///                 name: '平均线',
    ///                 // 支持 'average', 'min', 'max'
    ///                 type: 'average'
    ///             },
    ///             {
    ///                 name: 'Y 轴值为 100 的水平线',
    ///                 yAxis: 100
    ///             },
    ///             [
    ///                 {
    ///                     // 起点和终点的项会共用一个 name
    ///                     name: '最小值到最大值',
    ///                     type: 'min'
    ///                 },
    ///                 {
    ///                     type: 'max'
    ///                 }
    ///             ],
    ///             [
    ///                 {
    ///                     name: '两个坐标之间的标线',
    ///                     coord: [10, 20]
    ///                 },
    ///                 {
    ///                     coord: [20, 30]
    ///                 }
    ///             ], [{
    ///                 // 固定起点的 x 像素位置，用于模拟一条指向最大值的水平线
    ///                 yAxis: 'max',
    ///                 x: '90%'
    ///                 }, {
    ///                 type: 'max'
    ///             }],
    ///             [
    ///                 {
    ///                     name: '两个屏幕坐标之间的标线',
    ///                     x: 100,
    ///                     y: 100
    ///                 },
    ///                 {
    ///                     x: 500,
    ///                     y: 200
    ///                 }
    ///             ]
    ///         ]
    public var data: [Jsonable]?
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
    
    public init() { }
}

public typealias MarkLineData = MarkLine.Data

extension MarkLineData: Enumable {
    public enum Enums {
        case name(String), type(MarkDataType), valueIndex(UInt), valueDim(String), coord(Jsonable), x(LengthValue), y(LengthValue), xAxis(String), yAxis(String), value(Float), symbol(Symbol), symbolSize(Float), symbolRotate(Float), symbolOffset([LengthValue]), lineStyle(EmphasisLineStyle), label(FormattedLabel)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
        for ele in elements {
            switch ele {
            case let .name(name):
                self.name = name
            case let .type(type):
                self.type = type
            case let .valueIndex(valueIndex):
                self.valueIndex = valueIndex
            case let .valueDim(valueDim):
                self.valueDim = valueDim
            case let .coord(coord):
                self.coord = coord
            case let .x(x):
                self.x = x
            case let .y(y):
                self.y = y
            case let .xAxis(xAxis):
                self.xAxis = xAxis
            case let .yAxis(yAxis):
                self.yAxis = yAxis
            case let .value(value):
                self.value = value
            case let .symbol(symbol):
                self.symbol = symbol
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
            }
        }
    }
}

extension MarkLineData: Mappable {
    public func mapping(map: Mapper) {
        map["name"] = name
        map["type"] = type
        map["valueIndex"] = valueIndex
        map["valueDim"] = valueDim
        map["coord"] = coord
        map["x"] = x
        map["y"] = y
        map["xAxis"] = xAxis
        map["yAxis"] = yAxis
        map["value"] = value
        map["symbol"] = symbol
        map["symbolSize"] = symbolSize
        map["symbolRotate"] = symbolRotate
        map["symbolOffset"] = symbolOffset
        map["lineStyle"] = lineStyle
        map["label"] = label
    }
}

extension MarkLine: Enumable {
    public enum Enums {
        case silent(Bool), symbol(Symbol), symbolSize(Float), precision(Float), label(Label), lineStyle(EmphasisLineStyle), data([Jsonable]), animation(Bool), animationThreshold(Float), animationDuration(Time), animationEasing(EasingFunction), animationDelay(Time), animationDurationUpdate(Time), animationEasingUpdate(EasingFunction), animationDelayUpdate(Time)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
        for ele in elements {
            switch ele {
            case let .silent(silent):
                self.silent = silent
            case let .symbol(symbol):
                self.symbol = symbol
            case let .symbolSize(symbolSize):
                self.symbolSize = symbolSize
            case let .precision(precision):
                self.precision = precision
            case let .label(label):
                self.label = label
            case let .lineStyle(lineStyle):
                self.lineStyle = lineStyle
            case let .data(data):
                self.data = data
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
            }
        }
    }
}

extension MarkLine: Mappable {
    public func mapping(map: Mapper) {
        map["silent"] = silent
        map["symbol"] = symbol
        map["symbolSize"] = symbolSize
        map["precision"] = precision
        map["label"] = label
        map["lineStyle"] = lineStyle
        map["data"] = data
        map["animation"] = animation
        map["animationThreshold"] = animationThreshold
        map["animationDuration"] = animationDuration
        map["animationEasing"] = animationEasing
        map["animationDelay"] = animationDelay
        map["animationDurationUpdate"] = animationDurationUpdate
        map["animationEasingUpdate"] = animationEasingUpdate
        map["animationDelayUpdate"] = animationDelayUpdate
    }
}
