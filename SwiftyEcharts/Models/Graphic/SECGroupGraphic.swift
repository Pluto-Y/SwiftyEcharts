//
//  SECGroupGraphic.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 10/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// group 是唯一的可以有子节点的容器。group 可以用来整体定位一组图形元素。
public struct SECGroupGraphic : SECGraphic {
    
    /// MARK: SECGraphic
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
    public var children: [SECGraphic]?
    
}

extension SECGroupGraphic : SECEnumable {
    public enum Enums {
        case id(String), action(SECGraphicAction), left(SECPosition), right(SECPosition), top(SECPosition), bottom(SECPosition), bounding(SECGraphicBounding), z(Float), zlevel(Float), silent(Bool), invisible(Bool), cursor(String), draggable(Bool), progressiv(Bool), width(Float), height(Float), children([SECGraphic])
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

extension SECGroupGraphic : SECMappable {
    public func mapping(map: SECMap) {
        map["type"] = type
        map["id"] = id
        map["action"] = action
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
        map["width"] = width
        map["height"] = height
        map["children"] = children
    }
}
