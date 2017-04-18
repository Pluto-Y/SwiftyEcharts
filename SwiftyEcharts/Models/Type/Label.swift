//
//  Label.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 03/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public protocol LabelStyle: Displayable, Textful{
    
    var position: Position? { get set }
}

public final class CommonLabelStyle: LabelStyle {
    
    public var show: Bool?
    public var position: Position?
    public var textStyle: TextStyle?
    
    public init() { }
    
}

extension CommonLabelStyle: Enumable {
    public enum Enums {
        case show(Bool), position(Position), textStyle(TextStyle)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
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

extension CommonLabelStyle: Mappable {
    public func mapping(map: Mapper) {
        map["show"] = show
        map["position"] = position
        map["textStyle"] = textStyle
    }
}

public final class Label: Emphasisable {
    
    public typealias Style = CommonLabelStyle
    
    public var normal: Style?
    public var emphasis: Style?
    
    public init() { }
}

public typealias EmphasisLabel = Label

extension Label: Enumable {
    public enum Enums {
        case normal(Style), emphasis(Style)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
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

extension Label: Mappable {
    public func mapping(map: Mapper) {
        map["normal"] = normal
        map["emphasis"] = emphasis
    }
}

public final class FormattedLabelStyle: LabelStyle, Formatted {
    
    public var show: Bool?
    public var position: Position?
    public var formatter: Formatter?
    public var offset: Point?
    public var textStyle: TextStyle?
    
    public init() { }
    
}

extension FormattedLabelStyle: Enumable {
    public enum Enums {
        case show(Bool), position(Position), formatter(Formatter), offset(Point), textStyle(TextStyle)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
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

extension FormattedLabelStyle: Mappable {
    public func mapping(map: Mapper) {
        map["show"] = show
        map["position"] = position
        map["formatter"] = formatter
        map["offset"] = offset
        map["textStyle"] = textStyle
    }
}

public final class FormattedLabel: Emphasisable {
    public typealias Style = FormattedLabelStyle
    
    public var normal: Style?
    public var emphasis: Style?
    
    public init() {}
    
}

public typealias EmphasisFormattedLabel = FormattedLabel

extension FormattedLabel: Enumable {
    public enum Enums {
        case normal(Style), emphasis(Style)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
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

extension FormattedLabel: Mappable {
    public func mapping(map: Mapper) {
        map["normal"] = normal
        map["emphasis"] = emphasis
    }
}
