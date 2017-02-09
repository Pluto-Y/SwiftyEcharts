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
    public var label: SECLabel?
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
    
}
