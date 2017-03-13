//
//  SECJsCache.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 12/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 用来缓存Js需要执行的代码段，会在显示 Echarts 执行
/// 例如需要在 Serie 中动态执行的 data , 或者是 formatter 需要在执行是才知道数据的情况下都可以缓存在该处
public struct SECJsCache {
    private static var jsCache: [String] = [String]()
    
    public static func add(function: String) -> Bool {
        jsCache.append(function)
        return true
    }
    
    public static func remove(function: String) {
        if let index = jsCache.indexOf(function) {
            jsCache.removeAtIndex(index)
        }
    }
    
    public static func removeAll() {
        jsCache.removeAll()
    }
    
    public static func allFunctions() -> [String] {
        return jsCache
    }
    
    public static func contain(function: String) -> Bool {
        return jsCache.contains(function)
    }
}
