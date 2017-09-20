//
//  Function.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 18/09/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 用来封装在model或者一些枚举中会用到的js的function的情况
/// 保证其的统一性以及将来的拓展性
public final class Function {
    internal var jsFuncStr: String
    
    public init(_ jsFuncStr: String) {
        self.jsFuncStr = jsFuncStr
    }
}

internal let EchartsFunctionPrefix = "_echartsFunc"

// MARK: - 用来封装对Jsonable的拓展
extension Function: Jsonable {
    public var jsonString: String {
        guard jsFuncStr != "null" else {
            return "null"
        }
        // 避免重复添加相同的js
        for jsFunc in JsCache.allJsStrings() {
            if let endRange = jsFunc.rangeOfString(" = \(jsFuncStr);") {
                let j = jsFunc.substringToIndex(endRange.startIndex).substringFromIndex(jsFunc.startIndex.advancedBy(4))
                return j.jsonString
            }
        }
        let jsonStr = "\(EchartsFunctionPrefix)\(JsCache.allJsStrings().count)"
        JsCache.add("var \(jsonStr) = \(jsFuncStr);")
        return jsonStr.jsonString
    }
}

// MARK: - 用来封装其可以通过字符串常量来进行赋值
extension Function: StringLiteralConvertible {
    public convenience init(stringLiteral value: String) {
        self.init(value)
    }
    
    public convenience init(extendedGraphemeClusterLiteral value: String) {
        self.init(value)
    }
    
    public convenience init(unicodeScalarLiteral value: String) {
        self.init(value)
    }
}
