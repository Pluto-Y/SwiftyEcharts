//
//  SECJsMap.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 12/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

internal struct SECJsMap {
    private static var jsMap: [String: Any] = [String: Any]()
    
    static func add(clourse: Any, for method: String) {
        SECJsMap.jsMap[method] = clourse
    }
    
    static func removeClourse(by method: String) {
        SECJsMap.jsMap.removeValueForKey(method)
    }
    
    static func allMethods() -> [String] {
        return Array(SECJsMap.jsMap.keys)
    }
    
    static func clourse(from method: String) -> Any? {
        return SECJsMap.jsMap[method]
    }
    
    static func clearAllMap() {
        SECJsMap.jsMap.removeAll()
    }
    
    static func allMap() -> [String: Any] {
        return SECJsMap.jsMap
    }
    
}
