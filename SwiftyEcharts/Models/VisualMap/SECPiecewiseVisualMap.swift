//
//  SECPiecewiseVisualMap.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 20/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public struct SECPiecewiseVisualMap : SECVisualMap, SECDisplayable, SECBorderable, SECColorful, SECTextful, SECFormatted {
    public var type: String {
        return "piecewise"
    }
    
    public var splitNumber: Int?
    public var pieces: [SECJsonable]?
//    public var categories: []
    public var min: Float?
    public var max: Float?
    public var minOpen: Bool?
    public var maxOpen: Bool?
    public var selectedMode: SECSelectedMode?
    public var inverse: Bool?
    public var precision: UInt?
    public var itemWidth: Float?
    public var itemHeight: Float?
    public var align: SECAlign?
    public var text: [String]?
    public var textGap: Float?
    public var showLabel: Bool?
    public var itemGap: Float?
    public var itemSymbol: SECSymbol?
    public var show: Bool?
    public var dimension: Float?
    public var seriesIndex: [UInt8]?
    public var hoverLink: Bool?
    public var inRange: [String: SECJsonable]?
    public var outRange: [String: SECJsonable]?
    public var controller: SECVMController?
    public var zlevel: Float?
    public var z: Float?
    public var left: SECPosition?
    public var top: SECPosition?
    public var right: SECPosition?
    public var bottom: SECPosition?
    public var orient: SECOrient?
    public var padding: SECPadding?
    public var backgroundColor: SECColor?
    public var borderColor: SECColor?
    public var borderWidth: Float?
    public var color: SECColor?
    public var textStyle: SECTextStyle?
    public var formatter: SECFormatter?
}
