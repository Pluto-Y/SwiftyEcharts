//
//  SECDataZoom.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 17/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public protocol SECDataZoom {
    var xAxisIndex: UInt8? { get set }
    var yAxisIndex: UInt8? { get set }
}

public enum SECFilterMode : String, SECJsonable{
    case filter = "filter"
    case empty = "empty"
    
    public var jsonString: String {
        return "\"\(self.rawValue)\""
    }
}
