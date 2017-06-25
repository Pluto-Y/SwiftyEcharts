//
//  OneOrMore.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 19/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 针对那些可以是一个组件也可以是多个组件组成的属性的抽象
///
/// 例如在 Option 中存在许多即可以传递一个也可以传递多个的组件
///
/// 并且保证其可以通过数组常量来进行创建
public final class OneOrMore<T>: ExpressibleByArrayLiteral {
    fileprivate var one: T? = nil
    fileprivate var more: [T]? = nil
    
    public init(one: T) {
        self.one = one
    }
    
    public init(more: [T]) {
        if more.count == 1 {
            self.one = more[0]
        } else {
            self.more = more
        }
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
        return "null".jsonString
    }
}

// MARK: - 实现下标的拓展
extension OneOrMore {
    public subscript(index: Int) -> T? {
        if one != nil {
            return index == 0 ? one : nil
        }
        return more![index]
    }
}
