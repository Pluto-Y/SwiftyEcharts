//
//  SECSankeySerie.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 15/03/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public struct SECSankeySerie: SECSeries, SECZable, SECAnimatable {
    
    public struct Data {
        public var name: String?
        public var value: Float?
        public var itemStyle: SECItemStyle?
        public var label: SECFormattedLabel?
        
        public init() { }
    }
    
    public struct Link {
        public var source: String?
        public var target: String?
        public var value: Float?
        public var lineStyle: SECLineStyle?
        
        public init() { }
    }
    
    public var type: SECSerieType {
        return .sankey
    }
    
    public var zlevel: Float?
    public var z: Float?
    public var left: SECPosition?
    public var top: SECPosition?
    public var right: SECPosition?
    public var bottom: SECPosition?
    public var width: SECLength?
    public var height: SECLength?
    public var nodeWidth: Float?
    public var nodeGap: Float?
    public var layoutIterations: Float?
    public var label: SECFormattedLabel?
    public var itemStyle: SECItemStyle?
    public var lineStyle: SECLineStyle?
    public var data: [SECJsonable]?
    public var nodes: [SECJsonable]?
    public var links: [Link]?
    public var edges: [Link]?
    public var silent: Bool?
    public var animation: Bool?
    public var animationThreshold: Float?
    public var animationDuration: SECTime?
    public var animationEasing: SECAnimation?
    public var animationDelay: SECTime?
    public var animationDurationUpdate: SECTime?
    public var animationEasingUpdate: SECAnimation?
    public var animationDelayUpdate: SECTime?
    
    public init() { }
}
