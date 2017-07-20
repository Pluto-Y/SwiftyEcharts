//
//  ImageGraphic.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 11/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 图片类型的 `Graphic`
public final class ImageGraphic: Graphic {
    
    /// 图片样式
    public final class Style: GraphicStyle {
        /// 图片的内容，可以是图片的 URL，也可以是 dataURI.
        public var image: String?
        /// 图形元素的左上角在父节点坐标系（以父节点左上角为原点）中的横坐标值。
        public var x: Float?
        /// 图形元素的左上角在父节点坐标系（以父节点左上角为原点）中的纵坐标值。
        public var y: Float?
        /// 图形元素的宽度。
        public var width: Float?
        /// 图形元素的高度。
        public var height: Float?
        /// MARK: GraphicStyle
        public var fill: Color?
        public var stroke: Color?
        public var lineWidth: Float?
        public var shadowBlur: Float?
        public var shadowOffsetX: Float?
        public var shadowOffsetY: Float?
        public var shadowColor: Color?
        
        public init() {}
    }
    
    /// MARK: Graphic
    public var type: GraphicType {
        return .image
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
    /// 样式
    public var style: Style?
    
    public init() {}
}

extension ImageGraphic.Style: Enumable {
    public enum Enums {
        case image(String), x(Float), y(Float), width(Float), height(Float), fill(Color), stroke(Color), lineWidth(Float), shadowBlur(Float), shadowOffsetX(Float), shadowOffsetY(Float), shadowColor(Color)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .image(image):
                self.image = image
            case let .x(x):
                self.x = x
            case let .y(y):
                self.y = y
            case let .width(width):
                self.width = width
            case let .height(height):
                self.height = height
            case let .fill(fill):
                self.fill = fill
            case let .stroke(stroke):
                self.stroke = stroke
            case let .lineWidth(lineWidth):
                self.lineWidth = lineWidth
            case let .shadowBlur(shadowBlur):
                self.shadowBlur = shadowBlur
            case let .shadowOffsetX(shadowOffsetX):
                self.shadowOffsetX = shadowOffsetX
            case let .shadowOffsetY(shadowOffsetY):
                self.shadowOffsetY = shadowOffsetY
            case let .shadowColor(shadowColor):
                self.shadowColor = shadowColor
            }
        }
    }
}

extension ImageGraphic.Style: Mappable {
    public func mapping(_ map: Mapper) {
        map["image"] = image
        map["x"] = x
        map["y"] = y
        map["width"] = width
        map["height"] = height
        map["fill"] = fill
        map["stroke"] = stroke
        map["lineWidth"] = lineWidth
        map["shadowBlur"] = shadowBlur
        map["shadowOffsetX"] = shadowOffsetX
        map["shadowOffsetY"] = shadowOffsetY
        map["shadowColor"] = shadowColor
    }
}

extension ImageGraphic: Enumable {
    public enum Enums {
        case id(String), action(GraphicAction), left(Position), right(Position), top(Position), bottom(Position), bounding(GraphicBounding), z(Float), zlevel(Float), silent(Bool), invisible(Bool), cursor(String), draggable(Bool), progressive(Bool), style(Style)
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
            case let .style(style):
                self.style = style
            }
        }
    }
}

extension ImageGraphic: Mappable {
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
        map["style"] = style
    }
}
