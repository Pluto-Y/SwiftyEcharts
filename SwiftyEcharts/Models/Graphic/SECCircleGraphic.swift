//
//  SECCircleGraphic.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 11/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 圆类型的 `Graphic`
public struct SECCircleGraphic : SECGraphic {
    
    /// 圆形的位置和大小
    public struct Shape {
        /// 图形元素的中心在父节点坐标系（以父节点左上角为原点）中的横坐标值。
        public var cx: Float?
        /// 图形元素的中心在父节点坐标系（以父节点左上角为原点）中的纵坐标值。
        public var cy: Float?
        /// 外半径。
        public var r: Float?
        
        public init() {}
    }
    
    /// MARK: SECGraphic
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
    /// 圆形的位置和大小
    public var shape: Shape?
    /// 圆形的样式
    public var style: SECCommonGraphicStyle?
    
    public init() {}
}

extension SECCircleGraphic.Shape : SECEnumable {
    public enum Enums {
        case cx(Float), cy(Float), r(Float)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
        for ele in elements {
            switch ele {
            case let .cx(cx):
                self.cx = cx
            case let .cy(cy):
                self.cy = cy
            case let .r(r):
                self.r = r
            }
        }
    }
}

extension SECCircleGraphic.Shape : Mappable {
    public func mapping(map: Mapper) {
        map["cx"] = cx
        map["cy"] = cy
        map["r"] = r
    }
}

extension SECCircleGraphic : SECEnumable {
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

extension SECCircleGraphic : Mappable {
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
