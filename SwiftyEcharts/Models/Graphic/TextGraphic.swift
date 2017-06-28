//
//  TextGraphic.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 11/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 文本类型的 `Graphic`
public final class TextGraphic: Graphic {
    
    /// 文本样式
    public final class Style: GraphicStyle {
        /// 文本块文字。可以使用 \n 来换行。
        public var text: String?
        /// 图形元素的左上角在父节点坐标系（以父节点左上角为原点）中的横坐标值。
        public var x: Float?
        /// 图形元素的左上角在父节点坐标系（以父节点左上角为原点）中的纵坐标值。
        public var y: Float?
        /// 字体大小、字体类型、粗细、字体样式。格式参见 css font。
        /// 例如：
        /// // size | family
        /// font: '2em "STHeiti", sans-serif'
        /// 
        /// // style | weight | size | family
        /// font: 'italic bolder 16px cursive'
        /// 
        /// // weight | size | family
        /// font: 'bolder 2em "Microsoft YaHei", sans-serif'
        public var font: String?
        /// 水平对齐方式，取值：'left', 'center', 'right'。
        /// 如果为 'left'，表示文本最左端在 x 值上。如果为 'right'，表示文本最右端在 x 值上。
        public var textAlign: Align?
        /// 垂直对齐方式，取值：'top', 'middle', 'bottom'。
        public var textVertical: VerticalAlign?
        
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
        return .text
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
    
    /// 文本样式
    public var style: Style?
    
    public init() {}
}

extension TextGraphic.Style: Enumable {
    public enum Enums {
        case text(String), x(Float), y(Float), font(String), textAlign(Align), textVertical(VerticalAlign), fill(Color), stroke(Color), lineWidth(Float), shadowBlur(Float), shadowOffsetX(Float), shadowOffsetY(Float), shadowColor(Color)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .text(text):
                self.text = text
            case let .x(x):
                self.x = x
            case let .y(y):
                self.y = y
            case let .font(font):
                self.font = font
            case let .textAlign(textAlign):
                self.textAlign = textAlign
            case let .textVertical(textVertical):
                self.textVertical = textVertical
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

extension TextGraphic.Style: Mappable {
    public func mapping(_ map: Mapper) {
        map["text"] = text
        map["x"] = x
        map["y"] = y
        map["font"] = font
        map["textAlign"] = textAlign
        map["textVertical"] = textVertical
        map["fill"] = fill
        map["stroke"] = stroke
        map["lineWidth"] = lineWidth
        map["shadowBlur"] = shadowBlur
        map["shadowOffsetX"] = shadowOffsetX
        map["shadowOffsetY"] = shadowOffsetY
        map["shadowColor"] = shadowColor
    }
}

extension TextGraphic: Enumable {
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

extension TextGraphic: Mappable {
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
