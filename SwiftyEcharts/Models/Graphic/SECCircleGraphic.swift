//
//  SECCircleGraphic.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 11/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public struct SECCircleGraphic : SECGraphic {
    
    public struct Shape {
        public var cx: Float?
        public var cy: Float?
        public var r: Float?
        
        public init() {}
    }
   
    public var type: SECGraphicType {
        return .circle
    }
    
    public var id: String?
    public var action: SECGraphicAction?
    public var left: SECPosition?
    public var right: SECPosition?
    public var top: SECPosition?
    public var bottom: SECPosition?
    public var bounding: SECGraphicBounding?
    public var z: Float?
    public var zlevel: Float?
    public var silent: Bool?
    public var invisible: Bool?
    public var cursor: String?
    public var draggable: Bool?
    public var progressiv: Bool?
    public var shape: Shape?
    public var style: SECCommonGraphicStyle?
    
    public init() {}
}

extension SECCircleGraphic : SECMappable {
    public func mapping(map: SECMap) {
    }
}
