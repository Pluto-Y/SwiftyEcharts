//
//  SECRadarSerie.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 13/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 雷达图
///
/// 雷达图主要用于表现多变量的数据，例如球员的各个属性分析。依赖 radar 组件。
///
/// 下面是 AQI 数据用雷达图表现的示例。
///
/// 地址：http://echarts.baidu.com/gallery/editor.html?c=radar-aqi
public struct SECRadarSerie : SECSeries, SECSymbolized, SECZable, SECAnimatable {
    
    public struct Data : SECSymbolized {
        /// 数据项名称
        public var name: String?
        /// 单个数据项的数值。
        public var value: SECJsonable?
        
        /// MARK: SECSymbolized
        public var symbol: SECSymbol?
        public var symbolSize: Float?
        public var symbolRotate: Float?
        public var symbolOffset: SECPoint?
        
        /// 单个拐点文本的样式设置。
        public var label: SECFormattedLabel?
        /// 单个拐点标志的样式设置。
        public var itemStyle: SECItemStyle?
        /// 单项线条样式。
        public var lineStyle: SECEmphasisLineStyle?
        /// 单项区域填充样式。
        public var areaStyle: SECEmphasisAreaStyle?
        
        public init() {}
    }
    
    /// 类型
    public var type: SECSerieType {
        return .radar
    }
    
    /// 系列名称，用于tooltip的显示，legend 的图例筛选，在 setOption 更新数据和配置项时用于指定对应的系列。
    public var name: String?
    /// 雷达图所使用的 radar 组件的 index。
    public var radarIndex: UInt8?
    
    /// MARK: SECSymbolized
    public var symbol: SECSymbol?
    public var symbolSize: Float?
    public var symbolRotate: Float?
    public var symbolOffset: SECPoint?
    
    /// 图形上的文本标签，可用于说明图形的一些数据信息，比如值，名称等，label选项在 ECharts 2.x 中放置于itemStyle.normal下，在 ECharts 3 中为了让整个配置项结构更扁平合理，label 被拿出来跟 itemStyle 平级，并且跟 itemStyle 一样拥有 normal, emphasis 两个状态。
    public var label: SECFormattedLabel?
    /// 折线拐点标志的样式。
    public var itemStyle: SECItemStyle?
    /// 线条样式。
    public var lineStyle: SECEmphasisLineStyle?
    /// 区域填充样式。
    public var areaStyle: SECEmphasisAreaStyle?
    /// 雷达图的数据是多变量（维度）的，如下示例：
    ///     data : [
    ///         {
    ///             value : [4300, 10000, 28000, 35000, 50000, 19000],
    ///             name : '预算分配（Allocated Budget）'
    ///         },
    ///         {
    ///             value : [5000, 14000, 28000, 31000, 42000, 21000],
    ///             name : '实际开销（Actual Spending）'
    ///         }
    ///     ]
    /// 其中的value项数组是具体的数据，每个值跟 radar.indicator 一一对应。
    public var data: [SECJsonable]?
    public var zlevel: Float?
    public var z: Float?
    public var silent: Bool?
    public var animation: Bool?
    public var animationThreshold: Float?
    public var animationDuration: SECTime?
    public var animationEasing: SECAnimation?
    public var animationDelay: SECTime?
    public var animationDurationUpdate: SECTime?
    public var animationEasingUpdate: SECAnimation?
    public var animationDelayUpdate: SECTime?
    
    public init() {}
}

public typealias SECRadarSerieData = SECRadarSerie.Data

extension SECRadarSerieData : SECEnumable {
    public enum Enums {
        case name(String), value(SECJsonable), symbol(SECSymbol), symbolSize(Float), symbolRotate(Float), symbolOffset(SECPoint), label(SECFormattedLabel), itemStyle(SECItemStyle), lineStyle(SECEmphasisLineStyle), areaStyle(SECEmphasisAreaStyle)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
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
            case let .lineStyle(lineStyle):
                self.lineStyle = lineStyle
            case let .areaStyle(areaStyle):
                self.areaStyle = areaStyle
            }
        }
    }
}

extension SECRadarSerieData : SECMappable {
    public func mapping(map: SECMap) {
        map["name"] = name
        map["value"] = value
        map["symbol"] = symbol
        map["symbolSize"] = symbolSize
        map["symbolRotate"] = symbolRotate
        map["symbolOffset"] = symbolOffset
        map["label"] = label
        map["itemStyle"] = itemStyle
        map["lineStyle"] = lineStyle
        map["areaStyle"] = areaStyle
    }
}

extension SECRadarSerie : SECEnumable {
	public enum Enums {
		case name(String), radarIndex(UInt8), symbol(SECSymbol), symbolSize(Float), symbolRotate(Float), symbolOffset(SECPoint), label(SECFormattedLabel), itemStyle(SECItemStyle), lineStyle(SECEmphasisLineStyle), areaStyle(SECEmphasisAreaStyle), data([SECJsonable]), zlevel(Float), z(Float), silent(Bool), animation(Bool), animationThreshold(Float), animationDuration(SECTime), animationEasing(SECAnimation), animationDelay(SECTime), animationDurationUpdate(SECTime), animationEasingUpdate(SECAnimation), animationDelayUpdate(SECTime)
	}

	public typealias ContentEnum = Enums

	public init(_ elements: Enums...) {
		for ele in elements {
			switch ele {
				case let .name(name):
					self.name = name
				case let .radarIndex(radarIndex):
					self.radarIndex = radarIndex
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
				case let .lineStyle(lineStyle):
					self.lineStyle = lineStyle
				case let .areaStyle(areaStyle):
					self.areaStyle = areaStyle
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
			}
		}
	}
}

extension SECRadarSerie : SECMappable {
	public func mapping(map: SECMap) {
		map["type"] = type
		map["name"] = name
		map["radarIndex"] = radarIndex
		map["symbol"] = symbol
		map["symbolSize"] = symbolSize
		map["symbolRotate"] = symbolRotate
		map["symbolOffset"] = symbolOffset
		map["label"] = label
		map["itemStyle"] = itemStyle
		map["lineStyle"] = lineStyle
		map["areaStyle"] = areaStyle
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
	}
}
