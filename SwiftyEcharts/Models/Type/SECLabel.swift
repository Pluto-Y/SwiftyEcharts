//
//  SECLabel.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 03/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public protocol SECLabelStyle : SECDisplayable, SECTextful{
    
    var posistion: SECPosition? { get set }
}

public struct SECCommonLabelStyle : SECLabelStyle {
    
    public var show: Bool?
    public var posistion: SECPosition?
    public var textStyle: SECTextStyle?
    
    public init() { }
    
}

extension SECCommonLabelStyle : SECMappable {
    public func mapping(map: SECMap) {
        map["show"] = show
        map["posistion"] = posistion
        map["textStyle"] = textStyle
    }
}

public struct SECLabel : SECEmphasisable {
    
    public typealias Style = SECCommonLabelStyle
    
    public var normal: Style?
    public var emphasis: Style?
    
    public init() { }
}

extension SECLabel : SECMappable {
    public func mapping(map: SECMap) {
        map["normal"] = normal
        map["emphasis"] = emphasis
    }
}

public struct SECFormattedLabelStyle : SECLabelStyle, SECFormatted {
    
    public var show: Bool?
    public var posistion: SECPosition?
    public var formatter: SECFormatter?
    public var textStyle: SECTextStyle?
    
    public init() { }
    
}

extension SECFormattedLabelStyle : SECMappable {
    public func mapping(map: SECMap) {
        map["show"] = show
        map["posistion"] = posistion
        map["formatter"] = formatter
        map["textStyle"] = textStyle
    }
}

public struct SECFormattedLabel : SECEmphasisable {
    public typealias Style = SECFormattedLabelStyle
    
    public var normal: Style?
    public var emphasis: Style?
    
    public init() {}
    
}

extension SECFormattedLabel : SECMappable {
    public func mapping(map: SECMap) {
        map["normal"] = normal
        map["emphasis"] = emphasis
    }
}
