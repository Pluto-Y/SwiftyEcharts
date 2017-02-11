//
//  SECRectGraphic.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 11/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public struct SECRectGraphic : SECGraphic {
    
    public struct Shape {
        public var x: Float?
        public var y: Float?
        public var width: Float?
        public var height: Float?
    }
    
    public var type: SECGraphicType {
        return .rect
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
}

extension SECRectGraphic : SECMappable {
    public func mapping(map: SECMap) {
    }
}
