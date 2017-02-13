//
//  SECTextGraphic.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 11/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 文本类型的 `Graphic`
public struct SECTextGraphic : SECGraphic {
    
    /// 文本样式
    public struct Style : SECGraphicStyle {
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
        public var textAlign: SECAlign?
        /// 垂直对齐方式，取值：'top', 'middle', 'bottom'。
        public var textVertical: SECVerticalAlign?
        
        /// MARK: SECGraphicStyle
        public var fill: SECColor?
        public var stroke: SECColor?
        public var lineWidth: Float?
        public var shadowBlur: Float?
        public var shadowOffsetX: Float?
        public var shadowOffsetY: Float?
        public var shadowColor: SECColor?
        
        public init() {}
    }
    
    /// MARK: SECGraphic
    public var type: SECGraphicType {
        return .text
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
    
    /// 文本样式
    public var style: Style?
    
    public init() {}
}

extension SECTextGraphic.Style : SECEnumable {
    public enum Enums {
        case text(String), x(Float), y(Float), font(String), textAlign(SECAlign), textVertical(SECVerticalAlign), fill(SECColor), stroke(SECColor), lineWidth(Float), shadowBlur(Float), shadowOffsetX(Float), shadowOffsetY(Float), shadowColor(SECColor)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
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

extension SECTextGraphic.Style : SECMappable {
    public func mapping(map: SECMap) {
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

extension SECTextGraphic : SECEnumable {
    public enum Enums {
        case id(String), action(SECGraphicAction), left(SECPosition), right(SECPosition), top(SECPosition), bottom(SECPosition), bounding(SECGraphicBounding), z(Float), zlevel(Float), silent(Bool), invisible(Bool), cursor(String), draggable(Bool), progressiv(Bool), style(Style)
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
            case let .style(style):
                self.style = style
            }
        }
    }
}

extension SECTextGraphic : SECMappable {
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
        map["style"] = style
    }
}
