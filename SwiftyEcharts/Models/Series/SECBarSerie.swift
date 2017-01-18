//
//  SECBarSerie.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 18/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public struct SECBarSerie : SECSeries {
    public var type: SECSerieType {
        return .bar
    }
    
    public var name: String?
    public var legendHoverLine: Bool?
    public var coordinateSystem: SECCoordinateSystem?
}
