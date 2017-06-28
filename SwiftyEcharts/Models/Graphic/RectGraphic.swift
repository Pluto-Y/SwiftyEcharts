//
//  RectGraphic.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 11/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 矩形类型的 `Graphic`
public final class RectGraphic: Graphic {
    
    public final class Shape {
        public var x: Float?
        public var y: Float?
        public var width: Float?
        public var height: Float?
        
        public init() {}
    }
    
    /// MARK: Graphic
    public var type: GraphicType {
        return .rect
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
    
    /// 矩形的配置
    public var shape: Shape?
    /// 矩形样式配置
    public var style: CommonGraphicStyle?
    
    public init() {}
}

extension RectGraphic.Shape: Enumable {
    public enum Enums {
        case x(Float), y(Float), width(Float), height(Float)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .x(x):
                self.x = x
            case let .y(y):
                self.y = y
            case let .width(width):
                self.width = width
            case let .height(height):
                self.height = height
            }
        }
    }
}

extension RectGraphic.Shape: Mappable {
    public func mapping(_ map: Mapper) {
        map["x"] = x
        map["y"] = y
        map["width"] = width
        map["height"] = height
    }
}

extension RectGraphic: Enumable {
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

extension RectGraphic: Mappable {
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
