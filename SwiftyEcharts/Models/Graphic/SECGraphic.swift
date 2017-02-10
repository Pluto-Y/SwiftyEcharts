//
//  SECGraphic.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 09/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public enum SECGraphicAction : String, SECJsonable {
    case merge = "merge"
    case replace = "replace"
    case remove = "remove"
    
    public var jsonString: String {
        return "\"\(self.rawValue)\""
    }
}

public enum SECGraphicBounding : String, SECJsonable {
    case all = "all"
    case raw = "raw"
    
    public var jsonString: String {
        return "\"\(self.rawValue)\""
    }
}

public protocol SECGraphic : SECZable, SECMappable {
    
    var type: SECGraphicType { get }
    var id: String? { get set }
    var action: SECGraphicAction? { get set }
    var left: SECPosition? { get set }
    var right: SECPosition? { get set }
    var top: SECPosition? { get set }
    var bottom: SECPosition? { get set }
    var bounding: SECGraphicBounding? { get set }
    var silent: Bool? { get set }
    var invisible: Bool? { get set }
    var draggable: Bool? { get set }
    var progressiv: Bool? { get set }
    
}
