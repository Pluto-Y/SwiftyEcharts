//
//  SECHeatmapSerie.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 14/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public struct SECHeatmapSerie : SECSeries, SECZable {
    
    public struct Data {
        public var name: String?
        public var value: [SECJsonable]?
        public var label: SECLabel?
        public var itemStyle: SECItemStyle?
        
        public init() {}
    }
    
    public var type: SECSerieType {
        return .heatmap
    }
    
    public var name: String?
    public var coordinateSystem: SECCoordinateSystem?
    public var xAxisIndex: UInt8?
    public var yAxisIndex: UInt8?
    public var geoIndex: UInt8?
    public var blurSize: Float?
    public var minOpacity: Float?
    public var maxOpacity: Float?
    public var data: [SECJsonable]?
    public var markPoint: SECMarkPoint?
    public var markLine: SECMarkLine?
    public var markArea: SECMarkArea?
    public var zlevel: Float?
    public var z: Float?
    public var silent: Bool?
    
    public init() {}
}
