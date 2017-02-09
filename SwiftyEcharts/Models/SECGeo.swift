//
//  SECGeo.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 09/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public struct SECGeo : SECDisplayable, SECZable {
    public struct ScaleLimit {
        public var min: Float?
        public var max: Float?
    }
    public struct Region {
        public var name: String?
        public var selected: Bool?
        public var itemStyle: SECItemStyle?
        public var label: SECLabel?
    }
    public var show: Bool?
    public var map: String?
    public var roam: Bool?
    public var center: [Float]?
    public var aspectScale: Float?
    public var zoom: Float?
    public var scaleLimit: ScaleLimit?
    public var nameMap: String?
    public var selectedMode: SECSelectedMode?
    public var label: SECLabel?
    public var itemStyle: SECItemStyle?
    public var zlevel: Float?
    public var z: Float?
    public var left: SECPosition?
    public var top: SECPosition?
    public var right: SECPosition?
    public var bottom: SECPosition?
    public var layoutCenter: String?
    public var layoutSize: String?
    public var regions: [Region]?
    public var silent: Bool?
}

extension SECGeo : SECEnumable {
	public enum Enums {
		case show(Bool), map(String), roam(Bool), center([Float]), aspectScale(Float), zoom(Float), scaleLimit(ScaleLimit), nameMap(String), selectedMode(SECSelectedMode), label(SECLabel), itemStyle(SECItemStyle), zlevel(Float), z(Float), left(SECPosition), top(SECPosition), right(SECPosition), bottom(SECPosition), layoutCenter(String), layoutSize(String), regions([Region]), silent(Bool)
	}

	public typealias ContentEnum = Enums

	public init(_ elements: [Enums]) {
		for ele in elements {
			switch ele {
				case let .show(show):
					self.show = show
				case let .map(map):
					self.map = map
				case let .roam(roam):
					self.roam = roam
				case let .center(center):
					self.center = center
				case let .aspectScale(aspectScale):
					self.aspectScale = aspectScale
				case let .zoom(zoom):
					self.zoom = zoom
				case let .scaleLimit(scaleLimit):
					self.scaleLimit = scaleLimit
				case let .nameMap(nameMap):
					self.nameMap = nameMap
				case let .selectedMode(selectedMode):
					self.selectedMode = selectedMode
				case let .label(label):
					self.label = label
				case let .itemStyle(itemStyle):
					self.itemStyle = itemStyle
				case let .zlevel(zlevel):
					self.zlevel = zlevel
				case let .z(z):
					self.z = z
				case let .left(left):
					self.left = left
				case let .top(top):
					self.top = top
				case let .right(right):
					self.right = right
				case let .bottom(bottom):
					self.bottom = bottom
				case let .layoutCenter(layoutCenter):
					self.layoutCenter = layoutCenter
				case let .layoutSize(layoutSize):
					self.layoutSize = layoutSize
				case let .regions(regions):
					self.regions = regions
				case let .silent(silent):
					self.silent = silent
			}
		}
	}
}

extension SECGeo : SECMappable {
	public func mapping(map: SECMap) {
		map["show"] = show
		map["map"] = map
		map["roam"] = roam
		map["center"] = center
		map["aspectScale"] = aspectScale
		map["zoom"] = zoom
		map["scaleLimit"] = scaleLimit
		map["nameMap"] = nameMap
		map["selectedMode"] = selectedMode
		map["label"] = label
		map["itemStyle"] = itemStyle
		map["zlevel"] = zlevel
		map["z"] = z
		map["left"] = left
		map["top"] = top
		map["right"] = right
		map["bottom"] = bottom
		map["layoutCenter"] = layoutCenter
		map["layoutSize"] = layoutSize
		map["regions"] = regions
		map["silent"] = silent
	}
}

extension SECGeo.ScaleLimit : SECEnumable {
	public enum Enums {
		case min(Float), max(Float)
	}

	public typealias ContentEnum = Enums

	public init(_ elements: [Enums]) {
		for ele in elements {
			switch ele {
				case let .min(min):
					self.min = min
				case let .max(max):
					self.max = max
			}
		}
	}
}

extension SECGeo.ScaleLimit : SECMappable {
	public func mapping(map: SECMap) {
		map["min"] = min
		map["max"] = max
	}
}

extension SECGeo.Region : SECEnumable {
	public enum Enums {
		case name(String), selected(Bool), itemStyle(SECItemStyle), label(SECLabel)
	}

	public typealias ContentEnum = Enums

	public init(_ elements: [Enums]) {
		for ele in elements {
			switch ele {
				case let .name(name):
					self.name = name
				case let .selected(selected):
					self.selected = selected
				case let .itemStyle(itemStyle):
					self.itemStyle = itemStyle
				case let .label(label):
					self.label = label
			}
		}
	}
}

extension SECGeo.Region : SECMappable {
	public func mapping(map: SECMap) {
		map["name"] = name
		map["selected"] = selected
		map["itemStyle"] = itemStyle
		map["label"] = label
	}
}
