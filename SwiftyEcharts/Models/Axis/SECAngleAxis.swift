//
//  SECAngleAxis.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 06/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public struct SECAngleAxis {
    public struct Data {
        public var value: String?
        public var textStyle: SECTextStyle?
        
        public init() {}
    }
    public var polarIndex: UInt8?
    public var startAngle: Float?
    public var clockwise: Bool?
    public var type: SECAxisType?
    public var boundaryGap: [Float]?
    public var min: Float?
    public var max: Float?
    public var scale: Bool?
    public var splitNumber: UInt8?
    public var minInterval: UInt8?
    public var interval: UInt?
    public var logBase: Float?
    public var silent: Bool?
    public var triggerEvent: Bool?
    public var axisLine: SECAxisLine?
    public var axisTick: SECAxisTick?
    public var axisLabel: SECAxisLabel?
    public var splitLine: SECSplitLine?
    public var splitArea: SECSplitArea?
    public var data: [Any]?
    public var zlevel: Float?
    public var z: Float?
    
    public init() {}
}

		map["splitArea"] = splitArea
		map["data"] = data
		map["zlevel"] = zlevel
		map["z"] = z
	}
}
