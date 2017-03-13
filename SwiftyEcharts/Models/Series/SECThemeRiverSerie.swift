//
//  SECThemeRiverSerie.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 13/03/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public struct SECThemeRiverSerie: SECSeries, SECZable {
    
    public var type: SECSerieType {
        return .themeRiver
    }
    
    public var zlevel: Float?
    public var z: Float?
    public var left: SECPosition?
    public var top: SECPosition?
    public var right: SECPosition?
    public var bottom: SECPosition?
    public var width: SECLength?
    public var height: SECLength?
    public var coordinateSystem: SECCoordinateSystem?
    public var boundaryGap: SECBoundaryGap?
    public var singleAxisIndex: UInt8?
    public var label: SECFormattedLabel?
    public var itemStyle: SECItemStyle?
    public var legend: SECLegend?
    public var tooltip: SECTooltip?
    
    public init() { }
}

extension SECThemeRiverSerie : SECEnumable {
    public enum Enums {
        case zlevel(Float), z(Float), left(SECPosition), top(SECPosition), right(SECPosition), bottom(SECPosition), width(SECLength), height(SECLength), coordinateSystem(SECCoordinateSystem), boundaryGap(SECBoundaryGap), singleAxisIndex(UInt8), label(SECFormattedLabel), itemStyle(SECItemStyle), legend(SECLegend), tooltip(SECTooltip)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
        for ele in elements {
            switch ele {
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
            case let .width(width):
                self.width = width
            case let .height(height):
                self.height = height
            case let .coordinateSystem(coordinateSystem):
                self.coordinateSystem = coordinateSystem
            case let .boundaryGap(boundaryGap):
                self.boundaryGap = boundaryGap
            case let .singleAxisIndex(singleAxisIndex):
                self.singleAxisIndex = singleAxisIndex
            case let .label(label):
                self.label = label
            case let .itemStyle(itemStyle):
                self.itemStyle = itemStyle
            case let .legend(legend):
                self.legend = legend
            case let .tooltip(tooltip):
                self.tooltip = tooltip
            }
        }
    }
}

extension SECThemeRiverSerie : SECMappable {
    public func mapping(map: SECMap) {
        map["type"] = type
        map["zlevel"] = zlevel
        map["z"] = z
        map["left"] = left
        map["top"] = top
        map["right"] = right
        map["bottom"] = bottom
        map["width"] = width
        map["height"] = height
        map["coordinateSystem"] = coordinateSystem
        map["boundaryGap"] = boundaryGap
        map["singleAxisIndex"] = singleAxisIndex
        map["label"] = label
        map["itemStyle"] = itemStyle
        map["legend"] = legend
        map["tooltip"] = tooltip
    }
}
