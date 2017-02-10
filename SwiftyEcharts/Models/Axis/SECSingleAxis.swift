//
//  SECSingleAxis.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 09/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public struct SECSingleAxis : SECZable {
    
    public struct Data {
        public var value: String?
        public var textStyle: SECTextStyle?
        
        public init() {}
    }
    
    /// <#Description#>
    ///
    /// - start: <#start description#>
    /// - middle: <#middle description#>
    /// - end: <#end description#>
    public enum NameLocation : String, SECJsonable {
        case start = "start"
        case middle = "middle"
        case end = "end"
        
        public var jsonString: String {
            return "\"\(self.rawValue)\""
        }
    }
    
    public var zlevel: Float?
    public var z: Float? 
    public var left: SECPosition? 
    public var top: SECPosition? 
    public var right: SECPosition? 
    public var bottom: SECPosition? 
    public var width: Float? 
    public var height: Float? 
    public var orient: SECOrient? 
    public var type: SECAxisType? 
    public var name: String? 
    public var nameLocation: NameLocation? 
    public var nameTextStyle: SECTextStyle? 
    public var nameGap: Float? 
    public var nameRotate: Float? 
    public var inverse: Bool? 
    public var boundaryGap: SECBoundaryGap? 
    public var min: Float? 
    public var max: Float? 
    public var scale: Bool? 
    public var splitNumber: UInt8? 
    public var minInterval: UInt8? 
    public var interval: Int? 
    public var logBase: Float? 
    public var silent: Bool? 
    public var triggerEvent: Bool? 
    public var axisLine: SECAxisLine? 
    public var axisTick: SECAxisTick? 
    public var axisLabel: SECAxisLabel? 
    public var splitLine: SECSplitLine? 
    public var splitArea: SECSplitArea? 
    public var data: [Any]?
    
    public init() {}
}
