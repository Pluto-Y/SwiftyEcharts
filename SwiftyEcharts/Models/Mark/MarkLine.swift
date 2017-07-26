//
//  MarkLine.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 16/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public final class MarkLine: Animatable {
        
    /// 图形是否不响应和触发鼠标事件，默认为 false，即响应和触发鼠标事件。
    public var silent: Bool?
    /// 标线两端的标记类型，可以是一个数组分别指定两端，也可以是单个统一指定，具体格式见 data.symbol。 
    public var symbol: OneOrMore<Symbol>?
    /// 标线两端的标记大小，可以是一个数组分别指定两端，也可以是单个统一指定。
    /// 注意： 这里无法像一般的 symbolSize 那样通过数组分别指定高宽。
    public var symbolSize: FunctionOrFloatOrPair?
    /// 标线数值的精度，在显示平均值线的时候有用。
    public var precision: Float?
    /// 标线的文本。
    public var label: FormattedLabel?
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

extension MarkLine: Enumable {
    public enum Enums {
        case silent(Bool), symbol(Symbol), symbols([Symbol]), symbolSize(FunctionOrFloatOrPair), precision(Float), label(FormattedLabel), lineStyle(EmphasisLineStyle), data([Jsonable]), animation(Bool), animationThreshold(Float), animationDuration(Time), animationEasing(EasingFunction), animationDelay(Time), animationDurationUpdate(Time), animationEasingUpdate(EasingFunction), animationDelayUpdate(Time)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .silent(silent):
                self.silent = silent
            case let .symbol(symbol):
                self.symbol = OneOrMore(one: symbol)
            case let .symbols(symbols):
                self.symbol = OneOrMore(more: symbols)
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
    public func mapping(_ map: Mapper) {
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
