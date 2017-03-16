//
//  SECMarkPoint.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 16/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public struct SECMarkPoint : SECSymbolized, SECAnimatable {
    
    public struct Data : SECSymbolized {
        public var name: String?
        public var type: SECMarkDataType?
        public var valueIndex: UInt8?
        public var valueDim: String?
        public var coord: [Jsonable]?
        public var x: LengthValue?
        public var y: LengthValue?
        public var xAxis: Float?
        public var yAxis: Float?
        public var value: Float?
        public var symbol: SECSymbol?
        public var symbolSize: Float?
        public var symbolRotate: Float?
        public var symbolOffset: SECPoint?
        public var itemStyle: SECItemStyle?
        public var label: SECLabel?
    }
    
    /// 标记的图形。
    public var symbol: SECSymbol?
    /// 标记的大小
    public var symbolSize: Float?
    /// 标记的旋转角度。注意在 markLine 中当 symbol 为 'arrow' 时会忽略 symbolRotate 强制设置为切线的角度。
    public var symbolRotate: Float?
    /// 标记相对于原本位置的偏移。默认情况下，标记会居中置放在数据对应的位置，但是如果 symbol 是自定义的矢量路径或者图片，就有可能不希望 symbol 居中。这时候可以使用该配置项配置 symbol 相对于原本居中的偏移，可以是绝对的像素值，也可以是相对的百分比。
    /// 例如 [0, '50%'] 就是把自己向上移动了一半的位置，在 symbol 图形是气泡的时候可以让图形下端的箭头对准数据点。
    public var symbolOffset: SECPoint?
    /// 图形是否不响应和触发鼠标事件，默认为 false，即响应和触发鼠标事件。
    public var silent: Bool?
    /// 标注的文本。
    public var label: SECFormattedLabel?
    /// 标注的样式。
    public var itemStyle: SECItemStyle?
    /// 标注的数据数组
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
    public var animationDuration: SECTime?
    /// 初始动画的缓动效果。不同的缓动效果可以参考
    public var animationEasing: SECAnimation?
    /// 初始动画的延迟，支持回调函数，可以通过每个数据返回不同的 delay 时间实现更戏剧的初始动画效果。
    ///
    /// 如下示例：
    ///
    ///     animationDuration: function (idx) {
    ///         // 越往后的数据延迟越大
    ///         return idx * 100;
    ///     }
    public var animationDelay: SECTime?
    /// 数据更新动画的时长。
    /// 支持回调函数，可以通过每个数据返回不同的 delay 时间实现更戏剧的更新动画效果：
    ///     animationDurationUpdate: function (idx) {
    ///         // 越往后的数据延迟越大
    ///         return idx * 100;
    ///     }
    public var animationDurationUpdate: SECTime?
    /// 数据更新动画的缓动效果。
    public var animationEasingUpdate: SECAnimation?
    /// 数据更新动画的延迟，支持回调函数，可以通过每个数据返回不同的 delay 时间实现更戏剧的更新动画效果。
    /// 如下示例：
    ///
    ///     animationDelayUpdate: function (idx) {
    ///         // 越往后的数据延迟越大
    ///         return idx * 100;
    ///     }
    public var animationDelayUpdate: SECTime?
    
    public init() { }
    
}

public typealias SECMarkPointData = SECMarkPoint.Data

extension SECMarkPoint : SECEnumable {
    public enum Enums {
        case symbol(SECSymbol), symbolSize(Float), symbolRotate(Float), symbolOffset(SECPoint), silent(Bool), label(SECFormattedLabel), itemStyle(SECItemStyle),  data([Jsonable]), animation(Bool), animationThreshold(Float), animationDuration(SECTime), animationEasing(SECAnimation), animationDelay(SECTime), animationDurationUpdate(SECTime), animationEasingUpdate(SECAnimation), animationDelayUpdate(SECTime)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
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
            case let .silent(silent):
                self.silent = silent
            case let .label(label):
                self.label = label
            case let .itemStyle(itemStyle):
                self.itemStyle = itemStyle
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

extension SECMarkPoint : Mappable {
    public func mapping(map: Mapper) {
        map["symbol"] = symbol
        map["symbolSize"] = symbolSize
        map["symbolRotate"] = symbolRotate
        map["symbolOffset"] = symbolOffset
        map["silent"] = silent
        map["label"] = label
        map["itemStyle"] = itemStyle
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


extension SECMarkPointData : SECEnumable {
    public enum Enums {
        case name(String), type(SECMarkDataType), valueIndex(UInt8), valueDim(String), coord([Jsonable]), x(LengthValue), y(LengthValue), xAxis(Float), yAxis(Float), value(Float), symbol(SECSymbol), symbolSize(Float), symbolRotate(Float), symbolOffset(SECPoint), itemStyle(SECItemStyle), label(SECLabel)
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
            case let .itemStyle(itemStyle):
                self.itemStyle = itemStyle
            case let .label(label):
                self.label = label
            }
        }
    }
}

extension SECMarkPointData : Mappable {
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
        map["itemStyle"] = itemStyle
        map["label"] = label
    }
}
