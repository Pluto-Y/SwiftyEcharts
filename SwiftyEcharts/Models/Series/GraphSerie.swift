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
