//
//  SECTextGraphic.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 11/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public struct SECTextGraphic : SECGraphic {
    
    public struct Style : SECGraphicStyle {
        public var text: String?
        public var x: Float?
        public var y: Float?
        public var font: String?
        public var textAlign: SECAlign?
        public var textVertical: SECVerticalAlign?
        public var fill: SECColor?
        public var stroke: SECColor?
        public var lineWidth: Float?
        public var shadowBlur: Float?
        public var shadowOffsetX: Float?
        public var shadowOffsetY: Float?
        public var shadowColor: SECColor?
        
        public init() {}
    }
    
    public var type: SECGraphicType {
        return .text
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
    public var style: Style?
    
    public init() {}
}

extension SECTextGraphic : SECMappable {
    public func mapping(map: SECMap) {
    }
}
