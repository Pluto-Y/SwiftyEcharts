//
//  SECArcGraphic.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 12/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public struct SECArcGraphic : SECGraphic {
    
    public struct Shape {
        public var cx: Float?
        public var cy: Float?
        public var r: Float?
        public var r0: Float?
        public var startAngle: Float?
        public var endAngle: Float?
        public var clockwise: Float?
        
        public init() {}
    }
    
    public var type: SECGraphicType {
         return .arc
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

extension SECArcGraphic : SECMappable {
    public func mapping(map: SECMap) {
    }
}
