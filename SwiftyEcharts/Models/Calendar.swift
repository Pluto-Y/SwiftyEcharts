//
//  Calendar.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 21/09/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public final class Calendar: Zable {
    
    public final class BaseLabel: Displayable, Shadowable, Colorful, Borderable {
        public var show: Bool?
        public var firstDay: UInt8?
        public var margin: Float?
        public var position: Position?
        public var nameMap: OneOrMore<String>?
        public var color: Color?
        public var formatter: formatter?
        public var fontStyle: FontStyle?
        public var fontWeight: FontWeight?
        public var fontFamily: String?
        public var fontSize: UInt?
        public var align: Align?
        public var verticalAlign: VerticalAlign?
        public var lineHeight: Float?
        public var backgroundColor: Color?
        public var borderColor: Color?
        public var borderWidth: Float?
        public var borderRadius: Float?
        public var padding: Padding?
        public var shadowColor: Color?
        public var shadowBlur: Float?
        public var shadowOffsetX: Float?
        public var shadowOffsetY: Float?
        public var width: LengthValue?
        public var height: LengthValue?
        public var textBorderColor: Color?
        public var textBorderWidth: Float?
        public var textShadowColor: Color?
        public var textShdaowBlur: Float?
        public var textShadowOffsetX: Float?
        public var textShadowOffsetY: Float?
        public var rich: [String: Jsonable]?
    }
    
    public typealias DayLabel = BaseLabel
    public typealias MonthLabel = BaseLabel
    public typealias YearLabel = BaseLabel
    
    public var zlevel: Float?
    public var z: Float?
    public var left: Position?
    public var top: Position?
    public var right: Position?
    public var bottom: Position?
    public var width: LengthValue?
    public var heigth: LengthValue?
    public var range: Jsonable?
    public var cellSize: OneOrMore<Float>?
    public var orient: Orient?
    public var splitLine: SplitLine?
    public var itemStyle: ItemStyle?
    public var dayLabel: DayLabel?
    public var monthLabel: MonthLabel?
    public var yearLabel: YearLabel?
    public var silent: Bool?
}
