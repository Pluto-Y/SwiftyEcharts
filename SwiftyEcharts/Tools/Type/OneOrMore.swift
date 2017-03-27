//
//  OneOrMore.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 19/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public struct OneOrMore<T>: ExpressibleByArrayLiteral {
    fileprivate var one: T? = nil
    fileprivate var more: [T]? = nil
    public init(one: T) {
        self.one = one
    }
    
    public init(more: [T]) {
        self.more = more
    }
    
    public init(arrayLiteral elements: T...) {
        if elements.count == 1 {
            self.one = elements[0]
        } else {
            self.more = elements
        }
    }
}

extension OneOrMore: Jsonable {
    public var jsonString: String {
        if let datas = self.more {
            return datas.jsonString
        } else if let data = self.one {
            return obtainJsonString(from: data)
        }
        return "\"null\""
    }
}

extension OneOrMore {
    public subscript(index: Int) -> T? {
        if one != nil {
            return index == 0 ? one : nil
        }
        return more![index]
    }
}
