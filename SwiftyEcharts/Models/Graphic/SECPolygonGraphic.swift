//
//  SECPolygonGraphic.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 12/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public struct SECPolygonGraphic : SECGraphic {
    
    public struct Shape {
        
        public enum Smooth : SECJsonable {
            case val(Float)
            case spline
            
            public var jsonString: String {
                switch self {
                case let .val(val):
                    return "\(val)"
                case .spline:
                    return "\"spline\""
                }
            }
        }
        public var point: [[Float]]?
        public var smooth: Smooth?
        public var smoothConstraint: Bool?
        
        public init() {}
    }
    
    public var type: SECGraphicType {
        return .polygon
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

extension SECPolygonGraphic : SECMappable {
    public func mapping(map: SECMap) {
    }
}
