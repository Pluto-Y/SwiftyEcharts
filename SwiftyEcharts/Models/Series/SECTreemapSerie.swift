//
//  SECTreemapSerie.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 13/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public struct SECTreemapSerie : SECSeries, SECZable {
    
    public enum NodeClick : String, SECJsonable {
        case disable = "false"
        case zoomToNode = "zoomToNode"
        case link = "link"
        
        public var jsonString: String {
            return "\"\(self.rawValue)\""
        }
    }
    
    public enum ColorMappingBy : String, SECJsonable {
        case value = "value"
        case index = "index"
        case id = "id"
        
        public var jsonString: String {
            return "\"\(self.rawValue)\""
        }
    }
    
    public struct Level {
        public var visualDimension: Float?
        public var visualMin: Float?
        public var visualMax: Float?
        public var color: [SECColor]?
        public var colorAlpha: [Float]?
        public var colorSaturation: [Float]?
        public var colorMappingBy: ColorMappingBy?
        public var visibleMin: Float?
        public var childrenVisibleMin: Float?
        public var label: SECLabel?
        public var itemStyle: SECItemStyle?
        
        public init() {}
    }
    
    public struct Silent {
        public var link: String?
        public var target: SECTarget?
        public var children: [Any]?
        
        public init() {}
    }
    
    public struct Breadcrumb : SECDisplayable {
        public var show: Bool?
        public var left: SECPosition?
        public var top: SECPosition?
        public var right: SECPosition?
        public var bottom: SECPosition?
        public var height: Float?
        public var emptyItemWidth: Float?
        public var itemStyle: SECItemStyle?
        
        public init() {}
    }
    
    public struct Data {
        public var value: Float?
        public var id: String?
        public var name: String?
        public var visualDimension: Float?
        public var visualMin: Float?
        public var visualMax: Float?
        public var color: [SECColor]?
        public var colorAlpha: [Float]?
        public var colorSaturation: Float?
        public var colorMappingBy: ColorMappingBy?
        public var visibleMin: Float?
        public var childrenVisibleMin: Float?
        public var label: SECLabel?
        public var itemStyle: SECItemStyle?
        
        public init() {}
    }
    
    public var type: SECSerieType {
        return .treemap
    }
    
    public var zlevel: Float?
    public var z: Float?
    public var left: SECPosition?
    public var top: SECPosition?
    public var right: SECPosition?
    public var bottom: SECPosition?
    public var width: Float?
    public var height: Float?
    public var squareRotio: Float?
    public var leafDepth: Float?
    public var roam: Bool?
    public var nodeClick: NodeClick?
    public var zoomToNodeRatio: Float?
    public var level: [Level]?
    public var silent: Silent?
    public var visualDimentsion: Float?
    public var visualMin: Float?
    public var visualMax: Float?
    public var colorAlpha: [Float]?
    public var colorSaturation: [Float]?
    public var colorMappingBy: ColorMappingBy?
    public var visibleMin: Float?
    public var childrenVisibleMin: Float?
    public var label: SECLabel?
    public var itemStyle: SECItemStyle?
    public var breadcrumb: Breadcrumb?
    public var data: [Any]?
    public var animationDuration: Float?
    public var animationEasing: SECAnimation?
    public var animationDelay: SECTime?
    
    public init() {}
}

extension SECTreemapSerie.Level : SECEnumable {
    public enum Enums {
        case visualDimension(Float), visualMin(Float), visualMax(Float), color([SECColor]), colorAlpha([Float]), colorSaturation([Float]), colorMappingBy(SECTreemapSerie.ColorMappingBy), visibleMin(Float), childrenVisibleMin(Float), label(SECLabel), itemStyle(SECItemStyle)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
        for ele in elements {
            switch ele {
            case let .visualDimension(visualDimension):
                self.visualDimension = visualDimension
            case let .visualMin(visualMin):
                self.visualMin = visualMin
            case let .visualMax(visualMax):
                self.visualMax = visualMax
            case let .color(color):
                self.color = color
            case let .colorAlpha(colorAlpha):
                self.colorAlpha = colorAlpha
            case let .colorSaturation(colorSaturation):
                self.colorSaturation = colorSaturation
            case let .colorMappingBy(colorMappingBy):
                self.colorMappingBy = colorMappingBy
            case let .visibleMin(visibleMin):
                self.visibleMin = visibleMin
            case let .childrenVisibleMin(childrenVisibleMin):
                self.childrenVisibleMin = childrenVisibleMin
            case let .label(label):
                self.label = label
            case let .itemStyle(itemStyle):
                self.itemStyle = itemStyle
            }
        }
    }
}

extension SECTreemapSerie.Level : SECMappable {
    public func mapping(map: SECMap) {
        map["visualDimension"] = visualDimension
        map["visualMin"] = visualMin
        map["visualMax"] = visualMax
        map["color"] = color
        map["colorAlpha"] = colorAlpha
        map["colorSaturation"] = colorSaturation
        map["colorMappingBy"] = colorMappingBy
        map["visibleMin"] = visibleMin
        map["childrenVisibleMin"] = childrenVisibleMin
        map["label"] = label
        map["itemStyle"] = itemStyle
    }
}

extension SECTreemapSerie.Silent : SECEnumable {
    public enum Enums {
        case link(String), target(SECTarget), children([Any])
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
        for ele in elements {
            switch ele {
            case let .link(link):
                self.link = link
            case let .target(target):
                self.target = target
            case let .children(children):
                self.children = children
            }
        }
    }
}

extension SECTreemapSerie.Silent : SECMappable {
    public func mapping(map: SECMap) {
        map["link"] = link
        map["target"] = target
        map["children"] = children
    }
}

extension SECTreemapSerie.Breadcrumb : SECEnumable {
    public enum Enums {
        case show(Bool), left(SECPosition), top(SECPosition), right(SECPosition), bottom(SECPosition), height(Float), emptyItemWidth(Float), itemStyle(SECItemStyle)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
        for ele in elements {
            switch ele {
            case let .show(show):
                self.show = show
            case let .left(left):
                self.left = left
            case let .top(top):
                self.top = top
            case let .right(right):
                self.right = right
            case let .bottom(bottom):
                self.bottom = bottom
            case let .height(height):
                self.height = height
            case let .emptyItemWidth(emptyItemWidth):
                self.emptyItemWidth = emptyItemWidth
            case let .itemStyle(itemStyle):
                self.itemStyle = itemStyle
            }
        }
    }
}

extension SECTreemapSerie.Breadcrumb : SECMappable {
    public func mapping(map: SECMap) {
        map["show"] = show
        map["left"] = left
        map["top"] = top
        map["right"] = right
        map["bottom"] = bottom
        map["height"] = height
        map["emptyItemWidth"] = emptyItemWidth
        map["itemStyle"] = itemStyle
    }
}

extension SECTreemapSerie.Data : SECEnumable {
    public enum Enums {
        case value(Float), id(String), name(String), visualDimension(Float), visualMin(Float), visualMax(Float), color([SECColor]), colorAlpha([Float]), colorSaturation(Float), colorMappingBy(SECTreemapSerie.ColorMappingBy), visibleMin(Float), childrenVisibleMin(Float), label(SECLabel), itemStyle(SECItemStyle)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
        for ele in elements {
            switch ele {
            case let .value(value):
                self.value = value
            case let .id(id):
                self.id = id
            case let .name(name):
                self.name = name
            case let .visualDimension(visualDimension):
                self.visualDimension = visualDimension
            case let .visualMin(visualMin):
                self.visualMin = visualMin
            case let .visualMax(visualMax):
                self.visualMax = visualMax
            case let .color(color):
                self.color = color
            case let .colorAlpha(colorAlpha):
                self.colorAlpha = colorAlpha
            case let .colorSaturation(colorSaturation):
                self.colorSaturation = colorSaturation
            case let .colorMappingBy(colorMappingBy):
                self.colorMappingBy = colorMappingBy
            case let .visibleMin(visibleMin):
                self.visibleMin = visibleMin
            case let .childrenVisibleMin(childrenVisibleMin):
                self.childrenVisibleMin = childrenVisibleMin
            case let .label(label):
                self.label = label
            case let .itemStyle(itemStyle):
                self.itemStyle = itemStyle
            }
        }
    }
}

extension SECTreemapSerie.Data : SECMappable {
    public func mapping(map: SECMap) {
        map["value"] = value
        map["id"] = id
        map["name"] = name
        map["visualDimension"] = visualDimension
        map["visualMin"] = visualMin
        map["visualMax"] = visualMax
        map["color"] = color
        map["colorAlpha"] = colorAlpha
        map["colorSaturation"] = colorSaturation
        map["colorMappingBy"] = colorMappingBy
        map["visibleMin"] = visibleMin
        map["childrenVisibleMin"] = childrenVisibleMin
        map["label"] = label
        map["itemStyle"] = itemStyle
    }
}

extension SECTreemapSerie : SECEnumable {
    public enum Enums {
        case zlevel(Float), z(Float), left(SECPosition), top(SECPosition), right(SECPosition), bottom(SECPosition), width(Float), height(Float), squareRotio(Float), leafDepth(Float), roam(Bool), nodeClick(NodeClick), zoomToNodeRatio(Float), level([Level]), silent(Silent), visualDimentsion(Float), visualMin(Float), visualMax(Float), colorAlpha([Float]), colorSaturation([Float]), colorMappingBy(ColorMappingBy), visibleMin(Float), childrenVisibleMin(Float), label(SECLabel), itemStyle(SECItemStyle), breadcrumb(Breadcrumb), data([Any]), animationDuration(Float), animationEasing(SECAnimation), animationDelay(SECTime)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
        for ele in elements {
            switch ele {
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
            case let .width(width):
                self.width = width
            case let .height(height):
                self.height = height
            case let .squareRotio(squareRotio):
                self.squareRotio = squareRotio
            case let .leafDepth(leafDepth):
                self.leafDepth = leafDepth
            case let .roam(roam):
                self.roam = roam
            case let .nodeClick(nodeClick):
                self.nodeClick = nodeClick
            case let .zoomToNodeRatio(zoomToNodeRatio):
                self.zoomToNodeRatio = zoomToNodeRatio
            case let .level(level):
                self.level = level
            case let .silent(silent):
                self.silent = silent
            case let .visualDimentsion(visualDimentsion):
                self.visualDimentsion = visualDimentsion
            case let .visualMin(visualMin):
                self.visualMin = visualMin
            case let .visualMax(visualMax):
                self.visualMax = visualMax
            case let .colorAlpha(colorAlpha):
                self.colorAlpha = colorAlpha
            case let .colorSaturation(colorSaturation):
                self.colorSaturation = colorSaturation
            case let .colorMappingBy(colorMappingBy):
                self.colorMappingBy = colorMappingBy
            case let .visibleMin(visibleMin):
                self.visibleMin = visibleMin
            case let .childrenVisibleMin(childrenVisibleMin):
                self.childrenVisibleMin = childrenVisibleMin
            case let .label(label):
                self.label = label
            case let .itemStyle(itemStyle):
                self.itemStyle = itemStyle
            case let .breadcrumb(breadcrumb):
                self.breadcrumb = breadcrumb
            case let .data(data):
                self.data = data
            case let .animationDuration(animationDuration):
                self.animationDuration = animationDuration
            case let .animationEasing(animationEasing):
                self.animationEasing = animationEasing
            case let .animationDelay(animationDelay):
                self.animationDelay = animationDelay
            }
        }
    }
}

extension SECTreemapSerie : SECMappable {
    public func mapping(map: SECMap) {
        map["type"] = type
        map["zlevel"] = zlevel
        map["z"] = z
        map["left"] = left
        map["top"] = top
        map["right"] = right
        map["bottom"] = bottom
        map["width"] = width
        map["height"] = height
        map["squareRotio"] = squareRotio
        map["leafDepth"] = leafDepth
        map["roam"] = roam
        map["nodeClick"] = nodeClick
        map["zoomToNodeRatio"] = zoomToNodeRatio
        map["level"] = level
        map["silent"] = silent
        map["visualDimentsion"] = visualDimentsion
        map["visualMin"] = visualMin
        map["visualMax"] = visualMax
        map["colorAlpha"] = colorAlpha
        map["colorSaturation"] = colorSaturation
        map["colorMappingBy"] = colorMappingBy
        map["visibleMin"] = visibleMin
        map["childrenVisibleMin"] = childrenVisibleMin
        map["label"] = label
        map["itemStyle"] = itemStyle
        map["breadcrumb"] = breadcrumb
        map["data"] = data
        map["animationDuration"] = animationDuration
        map["animationEasing"] = animationEasing
        map["animationDelay"] = animationDelay
    }
}
