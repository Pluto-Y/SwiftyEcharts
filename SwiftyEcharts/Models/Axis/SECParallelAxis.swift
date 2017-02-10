//
//  SECParallelAxis.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 09/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public struct SECParallelAxis {
    
    public struct AreaSelectStyle : SECColorful, SECOpacitable {
        public var width: Float?
        public var borderWidth: Float?
        public var borderColor: SECColor?
        public var color: SECColor?
        public var opacity: Float?
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
    
    public var dim: Float?
    public var parallelIndex: UInt8?
    public var realtiem: Bool?
    public var areaSelectedStyle: AreaSelectStyle?
    public var type: SECAxisType?
    public var name: String?
    public var nameTextStyle: SECTextStyle?
    public var nameLocation: NameLocation?
    public var nameGap: Float?
    public var nameRotate: Float?
    public var inverse: Bool?
    public var boudaryGap: SECBoundaryGap?
    public var min: Float?
    public var max: Float?
    public var scale: Bool?
    public var splitName: UInt8?
    public var minInterval: UInt8?
    public var interval: Int?
    public var logBase: Float?
    public var silent: Bool?
    public var triggerEvent: Bool?
    public var axisLine: SECAxisLine?
    public var axisTick: SECAxisTick?
    public var axisLabel: SECAxisLabel?
    public var data: [Any]?
}
