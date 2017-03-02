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

public typealias SECHeatmapSerieData = SECHeatmapSerie.Data

extension SECHeatmapSerieData : SECEnumable {
    public enum Enums {
        case name(String), value([SECJsonable]), label(SECLabel), itemStyle(SECItemStyle)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
        for ele in elements {
            switch ele {
            case let .name(name):
                self.name = name
            case let .value(value):
                self.value = value
            case let .label(label):
                self.label = label
            case let .itemStyle(itemStyle):
                self.itemStyle = itemStyle
            }
        }
    }
}

extension SECHeatmapSerieData : SECMappable {
    public func mapping(map: SECMap) {
        map["name"] = name
        map["value"] = value
        map["label"] = label
        map["itemStyle"] = itemStyle
    }
}

extension SECHeatmapSerie : SECEnumable {
    public enum Enums {
        case name(String), coordinateSystem(SECCoordinateSystem), xAxisIndex(UInt8), yAxisIndex(UInt8), geoIndex(UInt8), blurSize(Float), minOpacity(Float), maxOpacity(Float), data([SECJsonable]), markPoint(SECMarkPoint), markLine(SECMarkLine), markArea(SECMarkArea), zlevel(Float), z(Float), silent(Bool)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
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
            case let .geoIndex(geoIndex):
                self.geoIndex = geoIndex
            case let .blurSize(blurSize):
                self.blurSize = blurSize
            case let .minOpacity(minOpacity):
                self.minOpacity = minOpacity
            case let .maxOpacity(maxOpacity):
                self.maxOpacity = maxOpacity
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
            }
        }
    }
}

extension SECHeatmapSerie : SECMappable {
    public func mapping(map: SECMap) {
        map["type"] = type
        map["name"] = name
        map["coordinateSystem"] = coordinateSystem
        map["xAxisIndex"] = xAxisIndex
        map["yAxisIndex"] = yAxisIndex
        map["geoIndex"] = geoIndex
        map["blurSize"] = blurSize
        map["minOpacity"] = minOpacity
        map["maxOpacity"] = maxOpacity
        map["data"] = data
        map["markPoint"] = markPoint
        map["markLine"] = markLine
        map["markArea"] = markArea
        map["zlevel"] = zlevel
        map["z"] = z
        map["silent"] = silent
    }
}
