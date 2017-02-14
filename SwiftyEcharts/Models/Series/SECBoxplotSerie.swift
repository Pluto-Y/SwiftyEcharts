//
//  SECBoxplotSerie.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 14/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public struct SECBoxplotSerie : SECSeries, SECZable {
    
    public struct Data {
        public var name: String?
        public var value: [SECJsonable]?
        public var itemStyle: SECItemStyle?
        
        public init() {}
    }
    
    public var type: SECSerieType {
        return .boxplot
    }
    
    public var coordinateSystem: SECCoordinateSystem?
    public var xAxisIndex: UInt8?
    public var yAxisIndex: UInt8?
    public var name: String?
    public var legendHoverLink: Bool?
    public var hoverAnimation: Bool?
    public var layout: SECOrient?
    public var boxWidth: [Float]?
    public var itemStyle: SECItemStyle?
    public var data: [SECJsonable]?
    public var markPoint: SECMarkPoint?
    public var markLine: SECMarkLine?
    public var markArea: SECMarkArea?
    public var zlevel: Float?
    public var z: Float?
    public var silent: Bool?
    public var animationDuration: Float?
    public var animationEasing: SECAnimation?
    public var animationDelay: Float?
    
    public init() {}
}
