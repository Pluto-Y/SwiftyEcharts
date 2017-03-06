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

extension SECMapSerie.ScaleLimit : SECEnumable {
    public enum Enums {
        case min(Float), max(Float)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
        for ele in elements {
            switch ele {
            case let .min(min):
                self.min = min
            case let .max(max):
                self.max = max
            }
        }
    }
}

extension SECMapSerie.ScaleLimit : SECMappable {
    public func mapping(map: SECMap) {
        map["min"] = min
        map["max"] = max
    }
}

extension SECMapSerie.Data : SECEnumable {
    public enum Enums {
        case name(String), value(Float), selected(Bool), itemStyle(SECItemStyle), label(SECLabel)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
        for ele in elements {
            switch ele {
            case let .name(name):
                self.name = name
            case let .value(value):
                self.value = value
            case let .selected(selected):
                self.selected = selected
            case let .itemStyle(itemStyle):
                self.itemStyle = itemStyle
            case let .label(label):
                self.label = label
            }
        }
    }
}

extension SECMapSerie.Data : SECMappable {
    public func mapping(map: SECMap) {
        map["name"] = name
        map["value"] = value
        map["selected"] = selected
        map["itemStyle"] = itemStyle
        map["label"] = label
    }
}

extension SECMapSerie : SECEnumable {
    public enum Enums {
        case name(String), map(String), roam(SECRoam), center(SECPosition), aspectScale(Float), zoom(Float), scaleLimit(ScaleLimit), nameMap([String: SECJsonable]), selectedMode(SECSelectedMode), label(SECLabel), itemStyle(SECItemStyle), zlevel(Float), z(Float), left(SECPosition), top(SECPosition), right(SECPosition), bottom(SECPosition), layoutCenter(SECPosition), layoutSize(SECLength), geoIndex(UInt8), mapValueCalculation(String), showLegendSymbol(Bool), data([SECJsonable]), markPoint(SECMarkPoint), markLine(SECMarkLine), markArea(SECMarkArea), silent(Bool)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
        for ele in elements {
            switch ele {
            case let .name(name):
                self.name = name
            case let .map(map):
                self.map = map
            case let .roam(roam):
                self.roam = roam
            case let .center(center):
                self.center = center
            case let .aspectScale(aspectScale):
                self.aspectScale = aspectScale
            case let .zoom(zoom):
                self.zoom = zoom
            case let .scaleLimit(scaleLimit):
                self.scaleLimit = scaleLimit
            case let .nameMap(nameMap):
                self.nameMap = nameMap
            case let .selectedMode(selectedMode):
                self.selectedMode = selectedMode
            case let .label(label):
                self.label = label
            case let .itemStyle(itemStyle):
                self.itemStyle = itemStyle
            case let .zlevel(zlevel):
                self.zlevel = zlevel
            case let .z(z):
                self.z = z
            case let .left(left):
                self.left = left
            case let .top(top):
                self.top = top
            case let .right(right):
                self.right = right
            case let .bottom(bottom):
                self.bottom = bottom
            case let .layoutCenter(layoutCenter):
                self.layoutCenter = layoutCenter
            case let .layoutSize(layoutSize):
                self.layoutSize = layoutSize
            case let .geoIndex(geoIndex):
                self.geoIndex = geoIndex
            case let .mapValueCalculation(mapValueCalculation):
                self.mapValueCalculation = mapValueCalculation
            case let .showLegendSymbol(showLegendSymbol):
                self.showLegendSymbol = showLegendSymbol
            case let .data(data):
                self.data = data
            case let .markPoint(markPoint):
                self.markPoint = markPoint
            case let .markLine(markLine):
                self.markLine = markLine
            case let .markArea(markArea):
                self.markArea = markArea
            case let .silent(silent):
                self.silent = silent
            }
        }
    }
}

extension SECMapSerie : SECMappable {
    public func mapping(map: SECMap) {
        map["type"] = type
        map["name"] = name
        map["map"] = map
        map["roam"] = roam
        map["center"] = center
        map["aspectScale"] = aspectScale
        map["zoom"] = zoom
        map["scaleLimit"] = scaleLimit
        map["nameMap"] = nameMap
        map["selectedMode"] = selectedMode
        map["label"] = label
        map["itemStyle"] = itemStyle
        map["zlevel"] = zlevel
        map["z"] = z
        map["left"] = left
        map["top"] = top
        map["right"] = right
        map["bottom"] = bottom
        map["layoutCenter"] = layoutCenter
        map["layoutSize"] = layoutSize
        map["geoIndex"] = geoIndex
        map["mapValueCalculation"] = mapValueCalculation
        map["showLegendSymbol"] = showLegendSymbol
        map["data"] = data
        map["markPoint"] = markPoint
        map["markLine"] = markLine
        map["markArea"] = markArea
        map["silent"] = silent
    }
}
