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

        
}
