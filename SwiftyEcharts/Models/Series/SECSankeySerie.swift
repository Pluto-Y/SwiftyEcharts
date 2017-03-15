//
//  SECSankeySerie.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 15/03/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public struct SECSankeySerie: SECSeries, SECZable, SECAnimatable {
    
    public struct Data {
        public var name: String?
        public var value: Float?
        public var itemStyle: SECItemStyle?
        public var label: SECFormattedLabel?
        
        public init() { }
    }
    
    public struct Link {
        public var source: String?
        public var target: String?
        public var value: Float?
        public var lineStyle: SECLineStyle?
        
        public init() { }
    }
    
    public var type: SECSerieType {
        return .sankey
    }
    
    public var zlevel: Float?
    public var z: Float?
    public var left: SECPosition?
    public var top: SECPosition?
    public var right: SECPosition?
    public var bottom: SECPosition?
    public var width: SECLength?
    public var height: SECLength?
    public var nodeWidth: Float?
    public var nodeGap: Float?
    public var layoutIterations: Float?
    public var label: SECFormattedLabel?
    public var itemStyle: SECItemStyle?
    public var lineStyle: SECLineStyle?
    public var data: [SECJsonable]?
    public var nodes: [SECJsonable]?
    public var links: [Link]?
    public var edges: [Link]?
    public var silent: Bool?
    public var animation: Bool?
    public var animationThreshold: Float?
    public var animationDuration: SECTime?
    public var animationEasing: SECAnimation?
    public var animationDelay: SECTime?
    public var animationDurationUpdate: SECTime?
    public var animationEasingUpdate: SECAnimation?
    public var animationDelayUpdate: SECTime?
    
    public init() { }
}

extension SECSankeySerie.Data : SECEnumable {
    public enum Enums {
        case name(String), value(Float), itemStyle(SECItemStyle), label(SECFormattedLabel)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
        for ele in elements {
            switch ele {
            case let .name(name):
                self.name = name
            case let .value(value):
                self.value = value
            case let .itemStyle(itemStyle):
                self.itemStyle = itemStyle
            case let .label(label):
                self.label = label
            }
        }
    }
}

extension SECSankeySerie.Data : SECMappable {
    public func mapping(map: SECMap) {
        map["name"] = name
        map["value"] = value
        map["itemStyle"] = itemStyle
        map["label"] = label
    }
}

extension SECSankeySerie.Link : SECEnumable {
    public enum Enums {
        case source(String), target(String), value(Float), lineStyle(SECLineStyle)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
        for ele in elements {
            switch ele {
            case let .source(source):
                self.source = source
            case let .target(target):
                self.target = target
            case let .value(value):
                self.value = value
            case let .lineStyle(lineStyle):
                self.lineStyle = lineStyle
            }
        }
    }
}

extension SECSankeySerie.Link : SECMappable {
    public func mapping(map: SECMap) {
        map["source"] = source
        map["target"] = target
        map["value"] = value
        map["lineStyle"] = lineStyle
    }
}

extension SECSankeySerie : SECEnumable {
    public enum Enums {
        case zlevel(Float), z(Float), left(SECPosition), top(SECPosition), right(SECPosition), bottom(SECPosition), width(SECLength), height(SECLength), nodeWidth(Float), nodeGap(Float), layoutIterations(Float), label(SECFormattedLabel), itemStyle(SECItemStyle), lineStyle(SECLineStyle), data([SECJsonable]), nodes([SECJsonable]), links([Link]), edges([Link]), silent(Bool), animation(Bool), animationThreshold(Float), animationDuration(SECTime), animationEasing(SECAnimation), animationDelay(SECTime), animationDurationUpdate(SECTime), animationEasingUpdate(SECAnimation), animationDelayUpdate(SECTime)
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
            case let .nodeWidth(nodeWidth):
                self.nodeWidth = nodeWidth
            case let .nodeGap(nodeGap):
                self.nodeGap = nodeGap
            case let .layoutIterations(layoutIterations):
                self.layoutIterations = layoutIterations
            case let .label(label):
                self.label = label
            case let .itemStyle(itemStyle):
                self.itemStyle = itemStyle
            case let .lineStyle(lineStyle):
                self.lineStyle = lineStyle
            case let .data(data):
                self.data = data
            case let .nodes(nodes):
                self.nodes = nodes
            case let .links(links):
                self.links = links
            case let .edges(edges):
                self.edges = edges
            case let .silent(silent):
                self.silent = silent
            case let .animation(animation):
                self.animation = animation
            case let .animationThreshold(animationThreshold):
                self.animationThreshold = animationThreshold
            case let .animationDuration(animationDuration):
                self.animationDuration = animationDuration
            case let .animationEasing(animationEasing):
                self.animationEasing = animationEasing
            case let .animationDelay(animationDelay):
                self.animationDelay = animationDelay
            case let .animationDurationUpdate(animationDurationUpdate):
                self.animationDurationUpdate = animationDurationUpdate
            case let .animationEasingUpdate(animationEasingUpdate):
                self.animationEasingUpdate = animationEasingUpdate
            case let .animationDelayUpdate(animationDelayUpdate):
                self.animationDelayUpdate = animationDelayUpdate
            }
        }
    }
}

extension SECSankeySerie : SECMappable {
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
        map["nodeWidth"] = nodeWidth
        map["nodeGap"] = nodeGap
        map["layoutIterations"] = layoutIterations
        map["label"] = label
        map["itemStyle"] = itemStyle
        map["lineStyle"] = lineStyle
        map["data"] = data
        map["nodes"] = nodes
        map["links"] = links
        map["edges"] = edges
        map["silent"] = silent
        map["animation"] = animation
        map["animationThreshold"] = animationThreshold
        map["animationDuration"] = animationDuration
        map["animationEasing"] = animationEasing
        map["animationDelay"] = animationDelay
        map["animationDurationUpdate"] = animationDurationUpdate
        map["animationEasingUpdate"] = animationEasingUpdate
        map["animationDelayUpdate"] = animationDelayUpdate
    }
}
