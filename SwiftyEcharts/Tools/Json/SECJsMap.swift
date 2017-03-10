//
//  SECJsMap.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 12/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public struct SECJsMap {
    private static var jsMap: [String] = [String]()
    
    public static func add(function: String) -> Bool {
        jsMap.append(function)
        return true
    }
    
    public static func remove(function: String) {
        if let index = jsMap.indexOf(function) {
            jsMap.removeAtIndex(index)
        }
    }
    
    public static func allFunctions() -> [String] {
        return jsMap
    }
    
    public static func contain(function: String) -> Bool {
        return jsMap.contains(function)
    }
}
