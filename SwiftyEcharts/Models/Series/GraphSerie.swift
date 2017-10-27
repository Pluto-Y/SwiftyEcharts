//
//  GraphSerie.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 26/10/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public final class GraphSerie: Serie, Animatable, Symbolized, Zable {
    
    public enum Layout: String, Jsonable {
        case none = "none"
        case circular = "circular"
        case force = "force"
        
        public var jsonString: String {
            return self.rawValue.jsonString
        }
    }
    
    public final class Circular {
        public var rotateLabel: Bool?
    }
    
    public final class Force {
        public var initLayout: String?
        public var repulsion: Float?
        public var gravity: Float?
        public var edgeLength: Range?
        public var layoutAnimation: Bool?
    }
    
    public final class Category: Symbolized {
        public var name: String?
        public var symbol: OneOrMore<Symbol>?
        public var symbolSize: FunctionOrFloatOrPair?
        public var symbolRotate: Float?
        public var symbolOffset: Point?
        public var itemStyle: ItemStyle?
        public var label: EmphasisLabel?
    }
    
    public final class Data: Symbolized {
        public var name: String?
        public var x: Float?
        public var y: Float?
        public var fixed: Bool?
        public var value: OneOrMore<Float>?
        public var category: Float?
        public var symbol: OneOrMore<Symbol>?
        public var symbolSize: FunctionOrFloatOrPair?
        public var symbolRotate: Float?
        public var symbolOffset: Point?
        public var itemStyle: ItemStyle?
        public var label: EmphasisLabel?
        public var tooltip: Tooltip?
    }
    
    public final class Link {
        public var source: Jsonable?
        public var target: Jsonable?
        public var value: Float?
        public var lineStyle: LineStyle?
        public var label: EmphasisLabel?
        public var symbol: OneOrMore<Symbol>?
        public var symbolSize: FunctionOrFloatOrPair?
    }
    
    public var type: SerieType {
        return .graph
    }
    public var name: String?
    public var legendHoverLinek: Bool?
    public var coordinateSystem: CoordinateSystem?
    public var xAxisIndex: UInt8?
    public var yAxisIndex: UInt8?
    public var polarIndex: UInt8?
    public var geoIndex: UInt8?
    public var calendarIndex: UInt8?
    public var hoverAnimation: Bool?
    public var layout: Layout?
    public var circular: Circular?
    public var force: Force?
    public var roam: Roam?
    public var nodeScaleRatio: Float?
    public var draggable: Bool?
    public var focusNodeAdjacency: Bool?
    public var symbol: OneOrMore<Symbol>?
    public var symbolSize: FunctionOrFloatOrPair?
    public var symbolRotate: Float?
    public var symbolOffset: Point?
    public var edgeSymbolSize: OneOrMore<Symbol>?
    public var cursor: String?
    public var itemStyle: ItemStyle?
    public var lineStyle: LineStyle?
    public var label: EmphasisLabel?
    public var edgeLabel: EmphasisLabel?
    public var categories: [Category]?
    public var data: [Jsonable]?
    public var nodes: [Jsonable]?
    public var links: [Link]?
    public var edges: [Link]?
    public var markPoint: MarkPoint?
    public var markLine: MarkLine?
    public var markArea: MarkArea?
    public var zlevel: Float?
    public var z: Float?
    public var left: Position?
    public var top: Position?
    public var right: Position?
    public var bottom: Position?
    public var width: LengthValue?
    public var height: LengthValue?
    public var silent: Bool?
    public var animation: Bool?
    public var animationThreshold: Float?
    public var animationDuration: Time?
    public var animationEasing: EasingFunction?
    public var animationDelay: Time?
    public var animationDurationUpdate: Time?
    public var animationEasingUpdate: EasingFunction?
    public var animationDelayUpdate: Time?
}

extension GraphSerie.Circular: Enumable {
    public enum Enums {
        case rotateLabel(Bool)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .rotateLabel(rotateLabel):
                self.rotateLabel = rotateLabel
            }
        }
    }
}

extension GraphSerie.Circular: Mappable {
    public func mapping(map: Mapper) {
        map["rotateLabel"] = rotateLabel
    }
}

extension GraphSerie.Force: Enumable {
    public enum Enums {
        case initLayout(String), repulsion(Float), gravity(Float), edgeLength(Range), layoutAnimation(Bool)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .initLayout(initLayout):
                self.initLayout = initLayout
            case let .repulsion(repulsion):
                self.repulsion = repulsion
            case let .gravity(gravity):
                self.gravity = gravity
            case let .edgeLength(edgeLength):
                self.edgeLength = edgeLength
            case let .layoutAnimation(layoutAnimation):
                self.layoutAnimation = layoutAnimation
            }
        }
    }
}

extension GraphSerie.Force: Mappable {
    public func mapping(map: Mapper) {
        map["initLayout"] = initLayout
        map["repulsion"] = repulsion
        map["gravity"] = gravity
        map["edgeLength"] = edgeLength
        map["layoutAnimation"] = layoutAnimation
    }
}

extension GraphSerie.Category: Enumable {
    public enum Enums {
        case name(String), symbol(Symbol), symbols([Symbol]), symbolSize(FunctionOrFloatOrPair), symbolRotate(Float), symbolOffset(Point), itemStyle(ItemStyle), label(EmphasisLabel)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .name(name):
                self.name = name
            case let .symbol(symbol):
                self.symbol = OneOrMore(one: symbol)
            case let .symbols(symbols):
                self.symbol = OneOrMore(more: symbols)
            case let .symbolSize(symbolSize):
                self.symbolSize = symbolSize
            case let .symbolRotate(symbolRotate):
                self.symbolRotate = symbolRotate
            case let .symbolOffset(symbolOffset):
                self.symbolOffset = symbolOffset
            case let .itemStyle(itemStyle):
                self.itemStyle = itemStyle
            case let .label(label):
                self.label = label
            }
        }
    }
}

extension GraphSerie.Category: Mappable {
    public func mapping(map: Mapper) {
        map["name"] = name
        map["symbol"] = symbol
        map["symbolSize"] = symbolSize
        map["symbolRotate"] = symbolRotate
        map["symbolOffset"] = symbolOffset
        map["itemStyle"] = itemStyle
        map["label"] = label
    }
}

extension GraphSerie.Data: Enumable {
    public enum Enums {
        case name(String), x(Float), y(Float), fixed(Bool), value(Float), values([Float]), category(Float), symbol(Symbol), symbols([Symbol]), symbolSize(FunctionOrFloatOrPair), symbolRotate(Float), symbolOffset(Point), itemStyle(ItemStyle), label(EmphasisLabel), tooltip(Tooltip)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .name(name):
                self.name = name
            case let .x(x):
                self.x = x
            case let .y(y):
                self.y = y
            case let .fixed(fixed):
                self.fixed = fixed
            case let .value(value):
                self.value = OneOrMore(one: value)
            case let .values(values):
                self.value = OneOrMore(more: values)
            case let .category(category):
                self.category = category
            case let .symbol(symbol):
                self.symbol = OneOrMore(one: symbol)
            case let .symbols(symbols):
                self.symbol = OneOrMore(more: symbols)
            case let .symbolSize(symbolSize):
                self.symbolSize = symbolSize
            case let .symbolRotate(symbolRotate):
                self.symbolRotate = symbolRotate
            case let .symbolOffset(symbolOffset):
                self.symbolOffset = symbolOffset
            case let .itemStyle(itemStyle):
                self.itemStyle = itemStyle
            case let .label(label):
                self.label = label
            case let .tooltip(tooltip):
                self.tooltip = tooltip
            }
        }
    }
}

extension GraphSerie.Data: Mappable {
    public func mapping(map: Mapper) {
        map["name"] = name
        map["x"] = x
        map["y"] = y
        map["fixed"] = fixed
        map["value"] = value
        map["category"] = category
        map["symbol"] = symbol
        map["symbolSize"] = symbolSize
        map["symbolRotate"] = symbolRotate
        map["symbolOffset"] = symbolOffset
        map["itemStyle"] = itemStyle
        map["label"] = label
        map["tooltip"] = tooltip
    }
}

extension GraphSerie.Link: Enumable {
    public enum Enums {
        case source(Jsonable), target(Jsonable), value(Float), lineStyle(LineStyle), label(EmphasisLabel), symbol(Symbol), symbols([Symbol]), symbolSize(FunctionOrFloatOrPair)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
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
            case let .label(label):
                self.label = label
            case let .symbol(symbol):
                self.symbol = OneOrMore(one: symbol)
            case let .symbols(symbols):
                self.symbol = OneOrMore(more: symbols)
            case let .symbolSize(symbolSize):
                self.symbolSize = symbolSize
            }
        }
    }
}

extension GraphSerie.Link: Mappable {
    public func mapping(map: Mapper) {
        map["source"] = source
        map["target"] = target
        map["value"] = value
        map["lineStyle"] = lineStyle
        map["label"] = label
        map["symbol"] = symbol
        map["symbolSize"] = symbolSize
    }
}

extension GraphSerie: Enumable {
    public enum Enums {
        case name(String), legendHoverLinek(Bool), coordinateSystem(CoordinateSystem), xAxisIndex(UInt8), yAxisIndex(UInt8), polarIndex(UInt8), geoIndex(UInt8), calendarIndex(UInt8), hoverAnimation(Bool), layout(Layout), circular(Circular), force(Force), roam(Roam), nodeScaleRatio(Float), draggable(Bool), focusNodeAdjacency(Bool), symbol(Symbol), symbols([Symbol]), symbolSize(FunctionOrFloatOrPair), symbolRotate(Float), symbolOffset(Point), edgeSymbolSize(Symbol), edgeSymbolSizes([Symbol]), cursor(String), itemStyle(ItemStyle), lineStyle(LineStyle), label(EmphasisLabel), edgeLabel(EmphasisLabel), categories([Category]), data([Jsonable]), nodes([Jsonable]), links([Link]), edges([Link]), markPoint(MarkPoint), markLine(MarkLine), markArea(MarkArea), zlevel(Float), z(Float), left(Position), top(Position), right(Position), bottom(Position), width(LengthValue), height(LengthValue), silent(Bool), animation(Bool), animationThreshold(Float), animationDuration(Time), animationEasing(EasingFunction), animationDelay(Time), animationDurationUpdate(Time), animationEasingUpdate(EasingFunction), animationDelayUpdate(Time)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .name(name):
                self.name = name
            case let .legendHoverLinek(legendHoverLinek):
                self.legendHoverLinek = legendHoverLinek
            case let .coordinateSystem(coordinateSystem):
                self.coordinateSystem = coordinateSystem
            case let .xAxisIndex(xAxisIndex):
                self.xAxisIndex = xAxisIndex
            case let .yAxisIndex(yAxisIndex):
                self.yAxisIndex = yAxisIndex
            case let .polarIndex(polarIndex):
                self.polarIndex = polarIndex
            case let .geoIndex(geoIndex):
                self.geoIndex = geoIndex
            case let .calendarIndex(calendarIndex):
                self.calendarIndex = calendarIndex
            case let .hoverAnimation(hoverAnimation):
                self.hoverAnimation = hoverAnimation
            case let .layout(layout):
                self.layout = layout
            case let .circular(circular):
                self.circular = circular
            case let .force(force):
                self.force = force
            case let .roam(roam):
                self.roam = roam
            case let .nodeScaleRatio(nodeScaleRatio):
                self.nodeScaleRatio = nodeScaleRatio
            case let .draggable(draggable):
                self.draggable = draggable
            case let .focusNodeAdjacency(focusNodeAdjacency):
                self.focusNodeAdjacency = focusNodeAdjacency
            case let .symbol(symbol):
                self.symbol = OneOrMore(one: symbol)
            case let .symbols(symbols):
                self.symbol = OneOrMore(more: symbols)
            case let .symbolSize(symbolSize):
                self.symbolSize = symbolSize
            case let .symbolRotate(symbolRotate):
                self.symbolRotate = symbolRotate
            case let .symbolOffset(symbolOffset):
                self.symbolOffset = symbolOffset
            case let .edgeSymbolSize(edgeSymbolSize):
                self.edgeSymbolSize = OneOrMore(one: edgeSymbolSize)
            case let .edgeSymbolSizes(edgeSymbolSizes):
                self.edgeSymbolSize = OneOrMore(more: edgeSymbolSizes)
            case let .cursor(cursor):
                self.cursor = cursor
            case let .itemStyle(itemStyle):
                self.itemStyle = itemStyle
            case let .lineStyle(lineStyle):
                self.lineStyle = lineStyle
            case let .label(label):
                self.label = label
            case let .edgeLabel(edgeLabel):
                self.edgeLabel = edgeLabel
            case let .categories(categories):
                self.categories = categories
            case let .data(data):
                self.data = data
            case let .nodes(nodes):
                self.nodes = nodes
            case let .links(links):
                self.links = links
            case let .edges(edges):
                self.edges = edges
            case let .markPoint(markPoint):
                self.markPoint = markPoint
            case let .markLine(markLine):
                self.markLine = markLine
            case let .markArea(markArea):
                self.markArea = markArea
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

extension GraphSerie: Mappable {
    public func mapping(map: Mapper) {
        map["type"] = type
        map["name"] = name
        map["legendHoverLinek"] = legendHoverLinek
        map["coordinateSystem"] = coordinateSystem
        map["xAxisIndex"] = xAxisIndex
        map["yAxisIndex"] = yAxisIndex
        map["polarIndex"] = polarIndex
        map["geoIndex"] = geoIndex
        map["calendarIndex"] = calendarIndex
        map["hoverAnimation"] = hoverAnimation
        map["layout"] = layout
        map["circular"] = circular
        map["force"] = force
        map["roam"] = roam
        map["nodeScaleRatio"] = nodeScaleRatio
        map["draggable"] = draggable
        map["focusNodeAdjacency"] = focusNodeAdjacency
        map["symbol"] = symbol
        map["symbolSize"] = symbolSize
        map["symbolRotate"] = symbolRotate
        map["symbolOffset"] = symbolOffset
        map["edgeSymbolSize"] = edgeSymbolSize
        map["cursor"] = cursor
        map["itemStyle"] = itemStyle
        map["lineStyle"] = lineStyle
        map["label"] = label
        map["edgeLabel"] = edgeLabel
        map["categories"] = categories
        map["data"] = data
        map["nodes"] = nodes
        map["links"] = links
        map["edges"] = edges
        map["markPoint"] = markPoint
        map["markLine"] = markLine
        map["markArea"] = markArea
        map["zlevel"] = zlevel
        map["z"] = z
        map["left"] = left
        map["top"] = top
        map["right"] = right
        map["bottom"] = bottom
        map["width"] = width
        map["height"] = height
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
