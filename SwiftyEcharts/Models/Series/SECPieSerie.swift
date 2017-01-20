//
//  SECPieSerie.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 20/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public struct SECPieSerie : SECSeries {
    public var type: SECSerieType {
        return .pie
    }
    
    public var name: String?
    public var legendHoverLink: Bool?
}
