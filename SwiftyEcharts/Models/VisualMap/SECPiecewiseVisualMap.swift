//
//  SECPiecewiseVisualMap.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 20/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public struct SECPiecewiseVisualMap {
    public var type: String {
        return "piecewise"
    }
    
    public var splitNumber: Int?
    public var pieces: [SECJsonable]?
//    public var categories: []
}
