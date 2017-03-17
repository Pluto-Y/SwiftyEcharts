//
//  SECPolygonGraphic.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 12/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 多边形类型的 `Graphic`
public struct SECPolygonGraphic: SECGraphic {
    
    /// 多边形的位置和大小定义
    public struct Shape {
        
        /// 是否平滑曲线
        ///
        /// - val: 如果为 val：表示贝塞尔 (bezier) 差值平滑，smooth 指定了平滑等级，范围 [0, 1]。
        /// - spline: 如果为 'spline'：表示 Catmull-Rom spline 差值平滑。
        public enum Smooth: Jsonable {
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
        
        /// 点列表，用于定义形状，如 [[22, 44], [44, 55], [11, 44], ...]
        public var point: [[Float]]?
        /// 是否平滑曲线
        public var smooth: Smooth?
        /// 是否将平滑曲线约束在包围盒中。smooth 为 number（bezier）时生效。
        public var smoothConstraint: Bool?
        
        public init() {}
    }
    
    /// MARK: SECGraphic
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
    
    /// 多边形的位置和大小定义
    public var shape: Shape?
    /// 多边形的样式
    public var style: SECCommonGraphicStyle?
    
    public init() {}
}

extension SECPolygonGraphic.Shape: Enumable {
    public enum Enums {
        case point([[Float]]), smooth(Smooth), smoothConstraint(Bool)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
        for ele in elements {
            switch ele {
            case let .point(point):
                self.point = point
            case let .smooth(smooth):
                self.smooth = smooth
            case let .smoothConstraint(smoothConstraint):
                self.smoothConstraint = smoothConstraint
            }
        }
    }
}

extension SECPolygonGraphic.Shape: Mappable {
    public func mapping(map: Mapper) {
        map["point"] = point
        map["smooth"] = smooth
        map["smoothConstraint"] = smoothConstraint
    }
}

extension SECPolygonGraphic: Enumable {
    public enum Enums {
        case id(String), action(SECGraphicAction), left(SECPosition), right(SECPosition), top(SECPosition), bottom(SECPosition), bounding(SECGraphicBounding), z(Float), zlevel(Float), silent(Bool), invisible(Bool), cursor(String), draggable(Bool), progressiv(Bool), shape(Shape), style(SECCommonGraphicStyle)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
        for ele in elements {
            switch ele {
            case let .id(id):
                self.id = id
            case let .action(action):
                self.action = action
            case let .left(left):
                self.left = left
            case let .right(right):
                self.right = right
            case let .top(top):
                self.top = top
            case let .bottom(bottom):
                self.bottom = bottom
            case let .bounding(bounding):
                self.bounding = bounding
            case let .z(z):
                self.z = z
            case let .zlevel(zlevel):
                self.zlevel = zlevel
            case let .silent(silent):
                self.silent = silent
            case let .invisible(invisible):
                self.invisible = invisible
            case let .cursor(cursor):
                self.cursor = cursor
            case let .draggable(draggable):
                self.draggable = draggable
            case let .progressiv(progressiv):
                self.progressiv = progressiv
            case let .shape(shape):
                self.shape = shape
            case let .style(style):
                self.style = style
            }
        }
    }
}

extension SECPolygonGraphic: Mappable {
    public func mapping(map: Mapper) {
        map["type"] = type
        map["id"] = id
        map["$action"] = action
        map["left"] = left
        map["right"] = right
        map["top"] = top
        map["bottom"] = bottom
        map["bounding"] = bounding
        map["z"] = z
        map["zlevel"] = zlevel
        map["silent"] = silent
        map["invisible"] = invisible
        map["cursor"] = cursor
        map["draggable"] = draggable
        map["progressiv"] = progressiv
        map["shape"] = shape
        map["style"] = style
    }
}
