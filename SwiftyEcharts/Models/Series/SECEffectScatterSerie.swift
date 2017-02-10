//
//  SECEffectScatterSerie.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 09/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public struct SECEffectScatterSerie : SECSeries, SECSymbolized, SECZable {
    
    /// <#Description#>
    ///
    /// - render: <#render description#>
    /// - emphasis: <#emphasis description#>
    public enum ShowEffectOn : String, SECJsonable {
        case render = "render"
        case emphasis = "emphasis"
        
        public var jsonString: String {
            return "\"\(self.rawValue)\""
        }
    }
    
    public struct RippleEffect {
        /// <#Description#>
        ///
        /// - stroke: <#stroke description#>
        /// - fill: <#fill description#>
        public enum BrushType : String, SECJsonable {
            case stroke = "stroke"
            case fill = "fill"
            
            public var jsonString: String {
                return "\"\(self.rawValue)\""
            }
        }
        
        public var period: Float?
        public var scale: Float?
        public var brushType: BrushType?
        
        public init() {}
    }
    
    public var type: SECSerieType {
        return .effectScatter
    }
    
    public var name: String?
    public var legendHoverLink: Bool?
    public var effectType: String?
    public var showEffectOn: ShowEffectOn?
    public var rippleEffect: RippleEffect?
    public var coordinateSystem: SECCoordinateSystem?
    public var xAxisIndex: UInt8?
    public var yAxisIndex: UInt8?
    public var polarIndex: UInt8?
    public var geoIndex: UInt8?
    public var symbol: SECSymbol?
    public var symbolSize: Float?
    public var symbolRotate: Float?
    public var symbolOffset: [Float]?
    public var label: SECFormattedLabel?
    public var itemStyle: SECItemStyle?
    public var data: [Any]?
    public var markPoint: SECMarkPoint?
    public var markLine: SECMarkLine?
    public var markArea: SECMarkArea?
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

extension SECEffectScatterSerie.RippleEffect : SECEnumable {
    public enum Enums {
        case period(Float), scale(Float), brushType(BrushType)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
        for ele in elements {
            switch ele {
            case let .period(period):
                self.period = period
            case let .scale(scale):
                self.scale = scale
            case let .brushType(brushType):
                self.brushType = brushType
            }
        }
    }
}

extension SECEffectScatterSerie.RippleEffect : SECMappable {
    public func mapping(map: SECMap) {
        map["period"] = period
        map["scale"] = scale
        map["brushType"] = brushType
    }
}

extension SECEffectScatterSerie : SECEnumable {
    public enum Enums {
        case name(String), legendHoverLink(Bool), showEffectOn(ShowEffectOn), rippleEffect(RippleEffect), coordinateSystem(SECCoordinateSystem), xAxisIndex(UInt8), yAxisIndex(UInt8), polarIndex(UInt8), geoIndex(UInt8), symbol(SECSymbol), symbolSize(Float), symbolRotate(Float), symbolOffset([Float]), label(SECFormattedLabel), itemStyle(SECItemStyle), data([Any]), markPoint(SECMarkPoint), markLine(SECMarkLine), markArea(SECMarkArea), zlevel(Float), z(Float), silent(Bool), animation(Bool), animationThreshold(Float), animationDuration(SECTime), animationEasing(SECAnimation), animationDelay(SECTime), animationDurationUpdate(SECTime), animationEasingUpdate(SECAnimation), animationDelayUpdate(SECTime)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
        for ele in elements {
            switch ele {
            case let .name(name):
                self.name = name
            case let .legendHoverLink(legendHoverLink):
                self.legendHoverLink = legendHoverLink
            case let .showEffectOn(showEffectOn):
                self.showEffectOn = showEffectOn
            case let .rippleEffect(rippleEffect):
                self.rippleEffect = rippleEffect
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

extension SECEffectScatterSerie : SECMappable {
    public func mapping(map: SECMap) {
        map["type"] = type
        map["name"] = name
        map["legendHoverLink"] = legendHoverLink
        map["effectType"] = effectType
        map["showEffectOn"] = showEffectOn
        map["rippleEffect"] = rippleEffect
        map["coordinateSystem"] = coordinateSystem
        map["xAxisIndex"] = xAxisIndex
        map["yAxisIndex"] = yAxisIndex
        map["polarIndex"] = polarIndex
        map["geoIndex"] = geoIndex
        map["symbol"] = symbol
        map["symbolSize"] = symbolSize
        map["symbolRotate"] = symbolRotate
        map["symbolOffset"] = symbolOffset
        map["label"] = label
        map["itemStyle"] = itemStyle
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
        map["animationDelay"] = animationDelay
        map["animationDurationUpdate"] = animationDurationUpdate
        map["animationEasingUpdate"] = animationEasingUpdate
        map["animationDelayUpdate"] = animationDelayUpdate
    }
}
