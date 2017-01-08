//
//  SECMappable.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 04/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public protocol SECMappable: SECJsonable {
    func mapping(inout map: SECMap)
}

extension SECMappable {

    public var jsonString: String {
        var map = SECMap()
        mapping(&map)
        return map.jsonString
    }
    
}
