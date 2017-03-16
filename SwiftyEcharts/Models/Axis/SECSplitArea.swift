//
//  SECSplitArea.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 06/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 分割区域
public struct SECSplitArea : SECDisplayable {
    
    public var show: Bool?
    public var interval: UInt?
    public var areaStyle: SECAreaStyle?
    
    public init() { }
}

extension SECSplitArea : SECEnumable {
    public enum Enums {
        case show(Bool), interval(UInt), areaStyle(SECAreaStyle)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
        for ele in elements {
            switch ele {
            case let .show(show):
                self.show = show
            case let .interval(interval):
                self.interval = interval
            case let .areaStyle(areaStyle):
                self.areaStyle = areaStyle
            }
        }
    }
}

extension SECSplitArea : Mappable {
    public func mapping(map: Mapper) {
        map["show"] = show
        map["interval"] = interval
        map["areaStyle"] = areaStyle
    }
}
