//
//  JsCache.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 12/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 用来缓存Js需要执行的代码段，会在显示 Echarts 执行
/// 例如需要在 Serie 中动态执行的 data , 或者是 formatter 需要在执行是才知道数据的情况下都可以缓存在该处
public struct JsCache {
    private static var jsCache: [String] = [String]()
    private static let lock = NSLock()
    
    public static func add(jsStr: String) {
        lock.lock()
        jsCache.append(jsStr)
        lock.unlock()
    }
    
    public static func removeAll() {
        lock.lock()
        jsCache.removeAll()
        lock.unlock()
    }
    
    public static func allJsStrings() -> [String] {
        return jsCache
    }
    
    public static func contain(jsStr: String) -> Bool {
        return jsCache.contains(jsStr)
    }
}
