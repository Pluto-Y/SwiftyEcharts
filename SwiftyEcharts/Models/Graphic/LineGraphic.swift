//
//  LineGraphic.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 12/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 直线类型的 `Graphic`
public final class LineGraphic: Graphic {
    
    /// 直线的位置
    public final class Shape {
        /// 开始点的 x 值。
        public var x1: Float?
        /// 开始点的 y 值。
        public var y1: Float?
        /// 结束点的 x 值。
        public var x2: Float?
        /// 结束点的 y 值。
        public var y2: Float?
        /// 线画到百分之多少就不画了。值的范围：[0, 1]。
        public var percent: Float?
        
        public init() {}
    }
    
    /// MARK: Graphic
    public var type: GraphicType {
        return .line
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
    
    /// 直线的位置
    public var shape: Shape?
    /// 直线的样式
    public var style: CommonGraphicStyle?
    
    public init() {}
}

extension LineGraphic.Shape: Enumable {
    public enum Enums {
        case x1(Float), y1(Float), x2(Float), y2(Float), percent(Float)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .x1(x1):
                self.x1 = x1
            case let .y1(y1):
                self.y1 = y1
            case let .x2(x2):
                self.x2 = x2
            case let .y2(y2):
                self.y2 = y2
            case let .percent(percent):
                self.percent = percent
            }
        }
    }
}

extension LineGraphic.Shape: Mappable {
    public func mapping(_ map: Mapper) {
        map["x1"] = x1
        map["y1"] = y1
        map["x2"] = x2
        map["y2"] = y2
        map["percent"] = percent
    }
}

extension LineGraphic: Enumable {
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

extension LineGraphic: Mappable {
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
