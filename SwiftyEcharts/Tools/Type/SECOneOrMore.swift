//
//  SECOneOrMore.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 19/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public struct SECOneOrMore<T> {
    private var one: T? = nil
    private var more: [T]? = nil
    public init(one: T) {
        self.one = one
    }
    
    public init(more: [T]) {
        self.more = more
    }
}

extension SECOneOrMore : SECJsonable {
    public var jsonString: String {
        if let datas = self.more {
            return datas.jsonString
        } else if let data = self.one {
            return obtainJsonString(from: data)
        }
        return "\"null\""
    }
}

extension SECOneOrMore {
    public subscript(index: Int) -> T? {
        if one != nil {
            return index == 0 ? one : nil
        }
        return more![index]
    }
}
prefix operator | {}

public prefix func |<T>(value: T) -> SECOneOrMore<T> {
    return SECOneOrMore(one: value)
}

prefix operator || {}

public prefix func ||<T>(values: [T]) -> SECOneOrMore<T> {
    return SECOneOrMore(more: values)
}
