//
//  CircleGraphic.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 11/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 圆类型的 `Graphic`
public final class CircleGraphic: Graphic {
    
    /// 圆形的位置和大小
    public final class Shape {
        /// 图形元素的中心在父节点坐标系（以父节点左上角为原点）中的横坐标值。
        public var cx: Float?
        /// 图形元素的中心在父节点坐标系（以父节点左上角为原点）中的纵坐标值。
        public var cy: Float?
        /// 外半径。
        public var r: Float?
        
        public init() {}
    }
    
    /// MARK: Graphic
    public var type: GraphicType {
        return .circle
    }
    public var id: String?
    public var action: GraphicAction?
    public var left: Position?
    public var right: Position?
    public var top: Position?
    public var bottom: Position?
    public var bounding: GraphicBounding?
    public var z: Float?
    public var zlevel: Float?
    public var silent: Bool?
    public var invisible: Bool?
    public var cursor: String?
    public var draggable: Bool?
    public var progressive: Bool?
    /// 圆形的位置和大小
    public var shape: Shape?
    /// 圆形的样式
    public var style: CommonGraphicStyle?
    
    public init() {}
}

extension CircleGraphic.Shape: Enumable {
    public enum Enums {
        case cx(Float), cy(Float), r(Float)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
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

extension CircleGraphic.Shape: Mappable {
    public func mapping(_ map: Mapper) {
        map["cx"] = cx
        map["cy"] = cy
        map["r"] = r
    }
}

extension CircleGraphic: Enumable {
    public enum Enums {
        case id(String), action(GraphicAction), left(Position), right(Position), top(Position), bottom(Position), bounding(GraphicBounding), z(Float), zlevel(Float), silent(Bool), invisible(Bool), cursor(String), draggable(Bool), progressive(Bool), shape(Shape), style(CommonGraphicStyle)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
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
            case let .progressive(progressive):
                self.progressive = progressive
            case let .shape(shape):
                self.shape = shape
            case let .style(style):
                self.style = style
            }
        }
    }
}

extension CircleGraphic: Mappable {
    public func mapping(_ map: Mapper) {
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
        map["progressive"] = progressive
        map["shape"] = shape
        map["style"] = style
    }
}
