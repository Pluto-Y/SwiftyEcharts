//
//  SECMapSerie.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 03/03/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public struct SECMapSerie: SECSeries, SECZable {
    
    public struct ScaleLimit {
        public var min: Float?
        public var max: Float?
    }
    
    public struct Data {
        public var name: String?
        public var value: Float?
        public var selected: Bool?
        public var itemStyle: SECItemStyle?
        public var label: SECLabel?
    }
    
    public var type: SECSerieType {
        return .map
    }
    
    public var name: String?
    public var map: String?
    public var roam: SECRoam?
    public var center: SECPosition?
    public var aspectScale: Float?
    public var zoom: Float?
    public var scaleLimit: ScaleLimit?
    public var nameMap: [String: SECJsonable]?
    public var selectedMode: SECSelectedMode?
    public var label: SECLabel?
    public var itemStyle: SECItemStyle?
    public var zlevel: Float?
    public var z: Float?
    public var left: SECPosition?
    public var top: SECPosition?
    public var right: SECPosition?
    public var bottom: SECPosition?
    public var layoutCenter: SECPosition?
    public var layoutSize: SECLength?
    public var geoIndex: UInt8?
    public var mapValueCalculation: String?
    public var showLegendSymbol: Bool?
    public var data: [SECJsonable]?
    public var markPoint: SECMarkPoint?
    public var markLine: SECMarkLine?
    public var markArea: SECMarkArea?
    public var silent: Bool?
}
