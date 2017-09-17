//
//  CustomSerie.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 16/09/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public final class CustomSerie: Serie, Zable, Animatable {
    
    public var type: SerieType {
        return .custom
    }
    
    public var name: String?
    public var legendHoverLink: Bool?
    public var coordinateSystem: CoordinateSystem?
    public var xAxisIndex: UInt?
    public var yAxisIndex: UInt?
    public var polarIndex: UInt?
    public var geoIndex: UInt?
    public var calendarIndex: UInt?
    public var renderItem: String?
    public var itemStyle: ItemStyle?
    public var dimensions: [Jsonable]?
    public var encode: [String: Jsonable]?
    public var data: [Jsonable]?
    public var zlevel: Float?
    public var z: Float?
    public var silent: Bool?
    public var animation: Bool?
    public var animationThreshold: Float?
    public var animationDuration: Time?
    public var animationEasing: EasingFunction?
    public var animationDelay: Time?
    public var animationDurationUpdate: Time?
    public var animationEasingUpdate: EasingFunction?
    public var animationDelayUpdate: Time?
    public var tooltip: Tooltip?
}

extension CustomSerie: Enumable {
    public enum Enums {
        case name(String), legendHoverLink(Bool), coordinateSystem(CoordinateSystem), xAxisIndex(UInt), yAxisIndex(UInt), polarIndex(UInt), geoIndex(UInt), calendarIndex(UInt), renderItem(String), itemStyle(ItemStyle), dimensions([Jsonable]), encode([String: Jsonable]), data([Jsonable]), zlevel(Float), z(Float), silent(Bool), animation(Bool), animationThreshold(Float), animationDuration(Time), animationEasing(EasingFunction), animationDelay(Time), animationDurationUpdate(Time), animationEasingUpdate(EasingFunction), animationDelayUpdate(Time), tooltip(Tooltip)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .name(name):
                self.name = name
            case let .legendHoverLink(legendHoverLink):
                self.legendHoverLink = legendHoverLink
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
            case let .renderItem(renderItem):
                self.renderItem = renderItem
            case let .itemStyle(itemStyle):
                self.itemStyle = itemStyle
            case let .dimensions(dimensions):
                self.dimensions = dimensions
            case let .encode(encode):
                self.encode = encode
            case let .data(data):
                self.data = data
            case let .zlevel(zlevel):
                self.zlevel = zlevel
            case let .z(z):
                self.z = z
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
            case let .tooltip(tooltip):
                self.tooltip = tooltip
            }
        }
    }
}

extension CustomSerie: Mappable {
    public func mapping(map: Mapper) {
        map["type"] = type
        map["name"] = name
        map["legendHoverLink"] = legendHoverLink
        map["coordinateSystem"] = coordinateSystem
        map["xAxisIndex"] = xAxisIndex
        map["yAxisIndex"] = yAxisIndex
        map["polarIndex"] = polarIndex
        map["geoIndex"] = geoIndex
        map["calendarIndex"] = calendarIndex
        map["renderItem"] = renderItem
        map["itemStyle"] = itemStyle
        map["dimensions"] = dimensions
        map["encode"] = encode
        map["data"] = data
        map["zlevel"] = zlevel
        map["z"] = z
        map["silent"] = silent
        map["animation"] = animation
        map["animationThreshold"] = animationThreshold
        map["animationDuration"] = animationDuration
        map["animationEasing"] = animationEasing
        map["animationDelay"] = animationDelay
        map["animationDurationUpdate"] = animationDurationUpdate
        map["animationEasingUpdate"] = animationEasingUpdate
        map["animationDelayUpdate"] = animationDelayUpdate
        map["tooltip"] = tooltip
    }
}
