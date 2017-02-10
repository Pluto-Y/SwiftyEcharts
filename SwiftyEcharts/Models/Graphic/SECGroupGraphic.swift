//
//  SECGroupGraphic.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 10/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public struct SECGroupGraphic : SECGraphic {
    public var type: SECGraphicType {
        return .group
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
    public var width: Float?
    public var height: Float?
    public var children: [SECGraphic]?
    
}
