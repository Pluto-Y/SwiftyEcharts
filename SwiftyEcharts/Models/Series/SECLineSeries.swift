//
//  SECLineSeries.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 03/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

extension SECLineSeries {
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

extension SECLineSeries {
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

extension SECLineSeries {
    public struct LineStyle {
        public var normal: SECCommonLineStyleContent?
        
        public init() { }
    }
}

extension SECLineSeries.LineStyle : SECEnumable {
    public enum Enums {
        case normal(SECCommonLineStyleContent)
    }
    
    public typealias SECContentEnum = Enums
    
    public init(_ elements: [Enums]) {
        for ele in elements {
            switch ele {
            case let .normal(normal):
                self.normal = normal
            }
        }
    }
}

extension SECLineSeries.LineStyle : SECMappable {
    public func mapping(map: SECMap) {
        map["normal"] = normal
    }
}

extension SECLineSeries {
    public struct  AreaStyle {
        public var normal: SECCommonAreaStyleContent?
        
        public init() { }
    }
}

extension SECLineSeries.AreaStyle : SECEnumable {
    public enum Enums {
        case normal(SECCommonAreaStyleContent)
    }
    
    public typealias SECContentEnum = Enums
    
    public init(_ elements: [Enums]) {
        for ele in elements {
            switch ele {
            case let .normal(normal):
                self.normal = normal
            }
        }
    }
}

extension SECLineSeries.AreaStyle : SECMappable {
    public func mapping(map: SECMap) {
        map["normal"] = normal
    }
}

extension SECLineSeries {
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

extension SECLineSeries.Data.Label : SECEnumable {
    public enum Enums {
        case normal(SECCommonLabelStyle)
    }
    
    public typealias SECContentEnum = Enums
    
    public init(_ elements: [Enums]) {
        for ele in elements {
            switch ele {
            case let .normal(normal):
                self.normal = normal
            }
        }
    }
}

extension SECLineSeries.Data.Label : SECMappable {
    public func mapping(map: SECMap) {
        map["normal"] = normal
    }
}

extension SECLineSeries.Data : SECEnumable {
    public enum Enums {
        case name(String), value(Float), symbol(SECSymbol), symbolSize(Float), symbolRotate(Float), symbolOffset([Float]), label(Label), itemStyle(SECItemStyle)
    }
    
    public typealias SECContentEnum = Enums
    
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

extension SECLineSeries.Data : SECMappable {
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
public struct SECLineSeries : SECSymbolized {
    
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
    public var step: String? // FIXME: 类型？
    public var label: SECLabel?
    public var itemStyle: SECItemStyle?
    public var lineStyle: LineStyle?
    public var areaStyle: AreaStyle?
    public var smooth: Bool?
    public var smoothMonotone: String? // FIXME: 具体类型？
    public var sampling: Sampling?
    public var data: [Any]?
    
    public init() { }
    
}

extension SECLineSeries : SECSeries {
    public var type: SECSerieType {
        return .line
    }
}

extension SECLineSeries : SECEnumable {
    public enum Enums {
        case name(String), coordinateSystem(CoordinateSystem), xAxisIndex(UInt), yAxisIndex(UInt), polarIndex(UInt), symbol(SECSymbol), symbolSize(Float), symbolRotate(Float), symbolOffset([Float]), showSymbol(Bool), showAllSymbol(Bool), hoverAnimation(Bool), legendHoverLink(Bool), stack(String), connectNulls(Bool), clipOverflow(Bool), step(String), label(SECLabel), itemStyle(SECItemStyle), lineStyle(LineStyle), areaStyle(AreaStyle), smooth(Bool), smoothMonotone(String), sampling(Sampling), data([Any])
    }
    
    public typealias SECContentEnum = Enums
    
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
            }
        }
    }
}

extension SECLineSeries : SECMappable {
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
    }
}

