//
//  SECImageGraphic.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 11/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public struct SECImageGraphic : SECGraphic {
    
    public struct Style : SECShadowable {
        public var image: String?
        public var x: Float?
        public var y: Float?
        public var width: Float?
        public var height: Float?
        public var fill: SECColor?
        public var stroke: SECColor?
        public var lineWidth: Float?
        public var shadowBlur: Float?
        public var shadowOffsetX: Float?
        public var shadowOffsetY: Float?
        public var shadowColor: SECColor?
        
        public init() {}
    }
    
    public var type: SECGraphicType {
        return .image
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
    public var style: Style?
    
    public init() {}
}

extension SECImageGraphic : SECEnumable {
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

extension SECImageGraphic : SECMappable {
	public func mapping(map: SECMap) {
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

extension SECImageGraphic.Style : SECEnumable {
	public enum Enums {
		case image(String), x(Float), y(Float), width(Float), height(Float), fill(SECColor), stroke(SECColor), lineWidth(Float), shadowBlur(Float), shadowOffsetX(Float), shadowOffsetY(Float), shadowColor(SECColor)
	}

	public typealias ContentEnum = Enums

	public init(_ elements: Enums...) {
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

extension SECImageGraphic.Style : SECMappable {
	public func mapping(map: SECMap) {
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
