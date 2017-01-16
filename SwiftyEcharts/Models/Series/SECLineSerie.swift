//
//  SECLineSerie.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 03/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

extension SECLineSerie {
    /// 坐标系枚举
    ///
    /// - cartesian2d: 二维的直角坐标系（也称笛卡尔坐标系），通过 xAxisIndex, yAxisIndex指定相应的坐标轴组件
    /// - polar: 极坐标系，通过 polarIndex 指定相应的极坐标组件
    public enum CoordinateSystem: String, SECJsonable{
        case cartesian2d = "cartesian2d"
        case polar = "polar"
        
        public var jsonString: String {
            return "\"\(self.rawValue)\""
        }
    }
}

extension SECLineSerie {
    /// 折线图在数据量远大于像素点时候的降采样策略，开启后可以有效的优化图表的绘制效率，默认关闭，也就是全部绘制不过滤数据点。
    ///
    /// - average: 取过滤点的平均值
    /// - max: 取过滤点的最大值
    /// - min: 取过滤点的最小值
    /// - sum: 取过滤点的和
    public enum Sampling: String, SECJsonable {
        case average = "average"
        case max = "max"
        case min = "min"
        case sum = "sum"
        
        public var jsonString: String {
            return "\"\(self.rawValue)\""
        }
    }
}

extension SECLineSerie {
    public struct LineStyle {
        public var normal: SECCommonLineStyleContent?
        
        public init() { }
    }
}

extension SECLineSerie.LineStyle : SECEnumable {
    public enum Enums {
        case normal(SECCommonLineStyleContent)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: [Enums]) {
        for ele in elements {
            switch ele {
            case let .normal(normal):
                self.normal = normal
            }
        }
    }
}

extension SECLineSerie.LineStyle : SECMappable {
    public func mapping(map: SECMap) {
        map["normal"] = normal
    }
}

extension SECLineSerie {
    public struct  AreaStyle {
        public var normal: SECCommonAreaStyleContent?
        
        public init() { }
    }
}

extension SECLineSerie.AreaStyle : SECEnumable {
    public enum Enums {
        case normal(SECCommonAreaStyleContent)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: [Enums]) {
        for ele in elements {
            switch ele {
            case let .normal(normal):
                self.normal = normal
            }
        }
    }
}

extension SECLineSerie.AreaStyle : SECMappable {
    public func mapping(map: SECMap) {
        map["normal"] = normal
    }
}

extension SECLineSerie {
    public struct Data: SECSymbolized {
        public struct Label {
            public var normal: SECCommonLabelStyle?
            
            public init() { }
        }

        public var name: String?
        public var value: Float?
        public var symbol: SECSymbol?
        public var symbolSize: Float?
        public var symbolRotate: Float?
        public var symbolOffset: [Float]?
        public var label: Label?
        public var itemStyle: SECItemStyle?
        
        public init() { }
    }
}

extension SECLineSerie.Data.Label : SECEnumable {
    public enum Enums {
        case normal(SECCommonLabelStyle)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: [Enums]) {
        for ele in elements {
            switch ele {
            case let .normal(normal):
                self.normal = normal
            }
        }
    }
}

extension SECLineSerie.Data.Label : SECMappable {
    public func mapping(map: SECMap) {
        map["normal"] = normal
    }
}

extension SECLineSerie.Data : SECEnumable {
    public enum Enums {
        case name(String), value(Float), symbol(SECSymbol), symbolSize(Float), symbolRotate(Float), symbolOffset([Float]), label(Label), itemStyle(SECItemStyle)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: [Enums]) {
        for ele in elements {
            switch ele {
            case let .name(name):
                self.name = name
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
            case let .label(label):
                self.label = label
            case let .itemStyle(itemStyle):
                self.itemStyle = itemStyle
            }
        }
    }
}

extension SECLineSerie.Data : SECMappable {
    public func mapping(map: SECMap) {
        map["name"] = name
        map["value"] = value
        map["symbol"] = symbol
        map["symbolSize"] = symbolSize
        map["symbolRotate"] = symbolRotate
        map["symbolOffset"] = symbolOffset
        map["label"] = label
        map["itemStyle"] = itemStyle
    }
}

/// 折线/面积图
/// 折线图是用折线将各个数据点标志连接起来的图表，用于展现数据的变化趋势。可用于直角坐标系和极坐标系上。
///
/// - Note: 设置 areaStyle 后可以绘制面积图。
/// - Note: 配合分段型 visualMap 组件可以将折线/面积图通过不同颜色分区间。如下示例
public struct SECLineSerie : SECSymbolized, SECAnimatable {
    
    /// 阶梯线图类型。
    ///
    /// 具体差别可以参考: http://echarts.baidu.com/gallery/editor.html?c=line-step
    public enum Step : String, SECJsonable {
        case start = "start"
        case middle = "middle"
        case end = "end"
        
        public var jsonString: String {
            return "\"\(self.rawValue)\""
        }
    }
    
    /// 折线平滑后是否在一个维度上保持单调性，可以设置成'x', 'y'来指明是在 x 轴或者 y 轴上保持单调性。
    public enum SmoothMonotone : String, SECJsonable{
        case x = "x"
        case y = "y"
        
        public var jsonString: String {
            return "\"\(self.rawValue)\""
        }
    }
    
    public var name: String?
    public var coordinateSystem: CoordinateSystem?
    public var xAxisIndex: UInt?
    public var yAxisIndex: UInt?
    public var polarIndex: UInt?
    public var symbol: SECSymbol?
    public var symbolSize: Float?
    public var symbolRotate: Float?
    public var symbolOffset: [Float]?
    public var showSymbol: Bool?
    public var showAllSymbol: Bool?
    public var hoverAnimation: Bool?
    public var legendHoverLink: Bool?
    public var stack: String?
    public var connectNulls: Bool?
    public var clipOverflow: Bool?
    public var step: Step?
    public var label: SECLabel?
    public var itemStyle: SECItemStyle?
    public var lineStyle: LineStyle?
    public var areaStyle: AreaStyle?
    public var smooth: Bool?
    public var smoothMonotone: SmoothMonotone?
    public var sampling: Sampling?
    public var data: [Any]?
    public var markPoint: SECMarkPoint?
    public var markLine: SECMarkLine?
    
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

extension SECLineSerie : SECSeries {
    public var type: SECSerieType {
        return .line
    }
}

extension SECLineSerie : SECEnumable {
    public enum Enums {
        case name(String), coordinateSystem(CoordinateSystem), xAxisIndex(UInt), yAxisIndex(UInt), polarIndex(UInt), symbol(SECSymbol), symbolSize(Float), symbolRotate(Float), symbolOffset([Float]), showSymbol(Bool), showAllSymbol(Bool), hoverAnimation(Bool), legendHoverLink(Bool), stack(String), connectNulls(Bool), clipOverflow(Bool), step(Step), label(SECLabel), itemStyle(SECItemStyle), lineStyle(LineStyle), areaStyle(AreaStyle), smooth(Bool), smoothMonotone(SmoothMonotone), sampling(Sampling), data([Any]), markPoint(SECMarkPoint), animation(Bool), animationThreshold(Float), animationDuration(SECTime), animationEasing(SECAnimation), animationDelay(SECTime), animationDurationUpdate(SECTime), animationEasingUpdate(SECAnimation), animationDelayUpdate(SECTime)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: [Enums]) {
        for ele in elements {
            switch ele {
            case let .name(name):
                self.name = name
            case let .coordinateSystem(coordinateSystem):
                self.coordinateSystem = coordinateSystem
            case let .xAxisIndex(xAxisIndex):
                self.xAxisIndex = xAxisIndex
            case let .yAxisIndex(yAxisIndex):
                self.yAxisIndex = yAxisIndex
            case let .polarIndex(polarIndex):
                self.polarIndex = polarIndex
            case let .symbol(symbol):
                self.symbol = symbol
            case let .symbolSize(symbolSize):
                self.symbolSize = symbolSize
            case let .symbolRotate(symbolRotate):
                self.symbolRotate = symbolRotate
            case let .symbolOffset(symbolOffset):
                self.symbolOffset = symbolOffset
            case let .showSymbol(showSymbol):
                self.showSymbol = showSymbol
            case let .showAllSymbol(showAllSymbol):
                self.showAllSymbol = showAllSymbol
            case let .hoverAnimation(hoverAnimation):
                self.hoverAnimation = hoverAnimation
            case let .legendHoverLink(legendHoverLink):
                self.legendHoverLink = legendHoverLink
            case let .stack(stack):
                self.stack = stack
            case let .connectNulls(connectNulls):
                self.connectNulls = connectNulls
            case let .clipOverflow(clipOverflow):
                self.clipOverflow = clipOverflow
            case let .step(step):
                self.step = step
            case let .label(label):
                self.label = label
            case let .itemStyle(itemStyle):
                self.itemStyle = itemStyle
            case let .lineStyle(lineStyle):
                self.lineStyle = lineStyle
            case let .areaStyle(areaStyle):
                self.areaStyle = areaStyle
            case let .smooth(smooth):
                self.smooth = smooth
            case let .smoothMonotone(smoothMonotone):
                self.smoothMonotone = smoothMonotone
            case let .sampling(sampling):
                self.sampling = sampling
            case let .data(data):
                self.data = data
            case let .markPoint(markPoint):
                self.markPoint = markPoint
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

extension SECLineSerie : SECMappable {
    public func mapping(map: SECMap) {
        map["type"] = type
        map["name"] = name
        map["coordinateSystem"] = coordinateSystem
        map["xAxisIndex"] = xAxisIndex
        map["yAxisIndex"] = yAxisIndex
        map["polarIndex"] = polarIndex
        map["symbol"] = symbol
        map["symbolRotate"] = symbolRotate
        map["symbolOffset"] = symbolOffset
        map["showSymbol"] = showSymbol
        map["showAllSymbol"] = showAllSymbol
        map["hoverAnimation"] = hoverAnimation
        map["legendHoverLink"] = legendHoverLink
        map["stack"] = stack
        map["connectNulls"] = connectNulls
        map["clipOverflow"] = clipOverflow
        map["step"] = step
        map["label"] = label
        map["itemStyle"] = itemStyle
        map["lineStyle"] = lineStyle
        map["areaStyle"] = areaStyle
        map["smooth"] = smooth
        map["smoothMonotone"] = smoothMonotone
        map["sampling"] = sampling
        map["data"] = data
        map["markPoint"] = markPoint
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

