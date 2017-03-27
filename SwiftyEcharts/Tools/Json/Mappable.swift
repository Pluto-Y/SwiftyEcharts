//
//  Mappable.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 04/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public protocol Mappable: Jsonable {
    func mapping(_ map: Mapper)
}

extension Mappable {

    public var jsonString: String {
        let map = Mapper()
        mapping(map)
        return map.jsonString
    }
    
}
