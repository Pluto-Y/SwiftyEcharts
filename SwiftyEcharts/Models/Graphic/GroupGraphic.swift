//
//  GroupGraphic.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 10/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// group 是唯一的可以有子节点的容器。group 可以用来整体定位一组图形元素。
public final class GroupGraphic: Graphic {
    
    /// MARK: Graphic
    public var type: GraphicType {
        return .group
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
    
    /// 用于描述此 group 的宽。
    ///
    /// 这个宽只用于给子节点定位。
    ///
    /// 即便当宽度为零的时候，子节点也可以使用 left: 'center' 相对于父节点水平居中。
    public var width: Float?
    /// 用于描述此 group 的高。
    ///
    /// 这个高只用于给子节点定位。
    ///
    /// 即便当高度为零的时候，子节点也可以使用 top: 'middle' 相对于父节点垂直居中。
    public var height: Float?
    /// 子节点列表，其中项都是一个图形元素定义。
    public var children: [Graphic]?
    
}

extension GroupGraphic: Enumable {
    public enum Enums {
        case id(String), action(GraphicAction), left(Position), right(Position), top(Position), bottom(Position), bounding(GraphicBounding), z(Float), zlevel(Float), silent(Bool), invisible(Bool), cursor(String), draggable(Bool), progressive(Bool), width(Float), height(Float), children([Graphic])
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
            case let .width(width):
                self.width = width
            case let .height(height):
                self.height = height
            case let .children(children):
                self.children = children
            }
        }
    }
}

extension GroupGraphic: Mappable {
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
        map["width"] = width
        map["height"] = height
        map["children"] = children
    }
}
