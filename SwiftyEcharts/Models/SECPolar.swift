//
//  SECPolar.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 25/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public struct SECPolar {
    public var zlevel: Float?
    public var z: Float?
    public var center: [Float]?
    public var radius: [Float]?
}

extension SECPolar : SECEnumable {
    public enum Enums {
        case zlevel(Float), z(Float), center([Float]), radius([Float])
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: [Enums]) {
        for ele in elements {
            switch ele {
            case let .zlevel(zlevel):
                self.zlevel = zlevel
            case let .z(z):
                self.z = z
            case let .center(center):
                self.center = center
            case let .radius(radius):
                self.radius = radius
            }
        }
    }
}

extension SECPolar : SECMappable {
    public func mapping(map: SECMap) {
        map["zlevel"] = zlevel
        map["z"] = z
        map["center"] = center
        map["radius"] = radius
    }
}
