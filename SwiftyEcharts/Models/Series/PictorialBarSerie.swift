//
//  PictorialBarSerie.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 03/04/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public struct PictorialBarSerie: Serie, Symbolized, Zable, Animatable {
    public var type: SerieType {
        return .pictorialBar
    }
    
    public var name: String?
    public var legendHoverLine: Bool?
    public var coordinateSystem: CoordinateSystem?
    public var xAxisIndex: UInt8?
    public var yAxisIndex: UInt8?
    public var label: Label?
    public var itemStyle: ItemStyle?
    public var barWidth: LengthValue?
    public var barMaxWidth: LengthValue?
    public var barMinHeight: LengthValue?
    public var barGap: LengthValue?
    public var barCategoryGap: LengthValue?
    public var symbol: Symbol?
    public var symbolSize: Float?
    public var symbolPosition: Position?
    public var symbolOffset: Point?
    public var symbolRotate: Float?
    public var symbolRepeat: String?  // ?????
    public var symbolRepeatDirection: String?   // ?????
    public var symbolMargin: String?   // ?????
    public var symbolClip: Bool?
    public var symbolBoundingData: String?   // ?????
    public var symbolPatternSize: Float?
    public var hoverAnimation: Bool?
    public var data: [Jsonable]?
    public var markPoint: MarkPoint?
    public var markLine: MarkLine?
    public var markArea: MarkArea?
    public var zlevel: Float?
    public var z: Float?
    public var silent: Bool?
    public var animation: Bool?
    public var animationThreshold: Float?
    public var animationDuration: Time?
    public var animationEasing: EasingFunction?
    public var animationDurationUpdate: Time?
    public var animationDelayUpdate: Time?
    public var animationDelay: Time?
    public var animationEasingUpdate: EasingFunction?
    public var tooltip: Tooltip?
    
    public init() { }
}
