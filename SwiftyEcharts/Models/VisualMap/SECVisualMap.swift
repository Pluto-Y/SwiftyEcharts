//
//  SECVisualMap.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 23/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public protocol SECVisualMap {
    var type: String { get }
}

public struct SECVMController {
    public var inRange: [String: SECJsonable]?
    public var outRange: [String: SECJsonable]?
}

extension SECVMController : SECEnumable {
    public enum Enums {
        case inRange([String: SECJsonable]), outRange([String: SECJsonable])
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: [Enums]) {
        for ele in elements {
            switch ele {
            case let .inRange(inRange):
                self.inRange = inRange
            case let .outRange(outRange):
                self.outRange = outRange
            }
        }
    }
}

extension SECVMController : SECMappable {
    public func mapping(map: SECMap) {
        map["inRange"] = inRange
        map["outRange"] = outRange
    }
}

