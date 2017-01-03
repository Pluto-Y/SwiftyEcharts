//
//  SECLabel.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 03/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public protocol SECLabelStyle: CustomStringConvertible, SECDisplayable, SECTextful {
    
    var posistion: SECPosition? { get set }
}

public struct SECCommonLabelStyle: SECLabelStyle {
    
    public var show: Bool
    public var posistion: SECPosition?
    public var textStyle: SECTextStyle?
    
    public var description: String {
        return ""
    }
}

public struct SECLabel: SECEmphasisable {
    
    public typealias Style = SECCommonLabelStyle
    
    public var normal: Style?
    public var emphasis: Style?
    
    public var description: String {
        return ""
    }
}

public struct SECFormattedLabelStyle: SECLabelStyle, SECFormatted {
    public var show: Bool
    public var posistion: SECPosition?
    public var formatter: SECFormatter?
    public var textStyle: SECTextStyle?
    
    public var description: String {
        return ""
    }
}

public struct SECFormattedLabel: SECEmphasisable {
    public typealias Style = SECFormattedLabelStyle
    
    public var normal: Style?
    public var emphasis: Style?
    
    public var description: String {
        return ""
    }
}
