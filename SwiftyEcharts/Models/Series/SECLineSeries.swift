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
    public enum CoordinateSystem: String {
        case cartesian2d = "cartesian2d"
        case polar = "polar"
    }
}

extension SECLineSeries {
    /// 折线图在数据量远大于像素点时候的降采样策略，开启后可以有效的优化图表的绘制效率，默认关闭，也就是全部绘制不过滤数据点。
    ///
    /// - average: 取过滤点的平均值
    /// - max: 取过滤点的最大值
    /// - min: 取过滤点的最小值
    /// - sum: 取过滤点的和
    public enum Sampling: String {
        case average = "average"
        case max = "max"
        case min = "min"
        case sum = "sum"
    }
}

extension SECLineSeries {
    public struct LineStyle {
        public var normal: SECCommonLineStyleContent?
        
        public init() { }
    }
}

extension SECLineSeries {
    public struct  AreaStyle {
        public var normal: SECCommonAreaStyleContent?
        
        public init() { }
    }
}

extension SECLineSeries {
    public struct Data: SECSymbolized {
        public struct Label {
            public var normalr: SECCommonLabelStyle?
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

/// 折线/面积图
/// 折线图是用折线将各个数据点标志连接起来的图表，用于展现数据的变化趋势。可用于直角坐标系和极坐标系上。
///
/// - Note: 设置 areaStyle 后可以绘制面积图。
/// - Note: 配合分段型 visualMap 组件可以将折线/面积图通过不同颜色分区间。如下示例
public struct SECLineSeries: SECSeries, SECSymbolized {
    
    public var name: String?
    public var coordinateSystem = CoordinateSystem.cartesian2d
    public var xAxisIndex = 0
    public var yAxisIndex = 0
    public var polarIndex = 0
    public var symbol: SECSymbol? = SECSymbol.emptyCircle
    public var symbolSize: Float? = 4
    public var symbolRotate: Float?
    public var symbolOffset: [Float]? = [0, 0]
    public var showSymbol = true
    public var showAllSymbol = false
    public var hoverAnimation = true
    public var legendHoverLink = true
    public var stack: String?
    public var connectNulls = false
    public var clipOverflow = true
    public var step: String? // FIXME: 类型？
    public var label: SECLabel?
    public var itemStyle: SECItemStyle?
    public var lineStyle: LineStyle?
    public var areaStyle: AreaStyle?
    public var smooth = false
    public var smoothMonotone: String? // FIXME: 具体类型？
    public var sampling: Sampling?
    public var data: [Data]?
    
    public init() { }
    
}

extension SECSeries {
    public var type: String {
        return "line"
    }
}

