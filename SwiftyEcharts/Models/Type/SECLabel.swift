//
//  SECLabel.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 03/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public protocol SECLabelStyle : SECDisplayable, SECTextful{
    
    var position: SECPosition? { get set }
}

public struct SECCommonLabelStyle : SECLabelStyle {
    
    public var show: Bool?
    public var position: SECPosition?
    public var textStyle: SECTextStyle?
    
    public init() { }
    
}

extension SECCommonLabelStyle : SECEnumable {
    public enum Enums {
        case show(Bool), position(SECPosition), textStyle(SECTextStyle)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
        for ele in elements {
            switch ele {
            case let .show(show):
                self.show = show
            case let .position(position):
                self.position = position
            case let .textStyle(textStyle):
                self.textStyle = textStyle
            }
        }
    }
}

extension SECCommonLabelStyle : SECMappable {
    public func mapping(map: SECMap) {
        map["show"] = show
        map["position"] = position
        map["textStyle"] = textStyle
    }
}

public struct SECLabel : SECEmphasisable {
    
    public typealias Style = SECCommonLabelStyle
    
    public var normal: Style?
    public var emphasis: Style?
    
    public init() { }
}

public typealias SECEmphasisLabel = SECLabel

extension SECLabel : SECEnumable {
    public enum Enums {
        case normal(Style), emphasis(Style)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
        for ele in elements {
            switch ele {
            case let .normal(normal):
                self.normal = normal
            case let .emphasis(emphasis):
                self.emphasis = emphasis
            }
        }
    }
}

extension SECLabel : SECMappable {
    public func mapping(map: SECMap) {
        map["normal"] = normal
        map["emphasis"] = emphasis
    }
}

public struct SECFormattedLabelStyle : SECLabelStyle, SECFormatted {
    
    public var show: Bool?
    public var position: SECPosition?
    public var formatter: SECFormatter?
    public var offset: SECPoint?
    public var textStyle: SECTextStyle?
    
    public init() { }
    
}

extension SECFormattedLabelStyle : SECEnumable {
    public enum Enums {
        case show(Bool), position(SECPosition), formatter(SECFormatter), offset(SECPoint), textStyle(SECTextStyle)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
        for ele in elements {
            switch ele {
            case let .show(show):
                self.show = show
            case let .position(position):
                self.position = position
            case let .formatter(formatter):
                self.formatter = formatter
            case let .offset(offset):
                self.offset = offset
            case let .textStyle(textStyle):
                self.textStyle = textStyle
            }
        }
    }
}

extension SECFormattedLabelStyle : SECMappable {
    public func mapping(map: SECMap) {
        map["show"] = show
        map["position"] = position
        map["formatter"] = formatter
        map["offset"] = offset
        map["textStyle"] = textStyle
    }
}

public struct SECFormattedLabel : SECEmphasisable {
    public typealias Style = SECFormattedLabelStyle
    
    public var normal: Style?
    public var emphasis: Style?
    
    public init() {}
    
}

public typealias SECEmphasisFormattedLabel = SECFormattedLabel

extension SECFormattedLabel : SECEnumable {
    public enum Enums {
        case normal(Style), emphasis(Style)
    }
    
    public typealias ContentEnum = Enums
    
    public init(_ elements: Enums...) {
        for ele in elements {
            switch ele {
            case let .normal(normal):
                self.normal = normal
            case let .emphasis(emphasis):
                self.emphasis = emphasis
            }
        }
    }
}

extension SECFormattedLabel : SECMappable {
    public func mapping(map: SECMap) {
        map["normal"] = normal
        map["emphasis"] = emphasis
    }
}
