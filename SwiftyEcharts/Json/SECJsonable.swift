//
//  SECJsonable.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 04/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public protocol SECJsonable: CustomStringConvertible {
    
}

extension SECJsonable {
    func toJson() -> String {
        return self.description
    }
}

extension Bool: SECJsonable {}
extension Int: SECJsonable {}
extension Double: SECJsonable {}
extension Float: SECJsonable {}
extension String: SECJsonable {
    public var description: String {
        return self
    }
}

extension Array: SECJsonable {}
extension Dictionary: SECJsonable {}

extension Array where Element: SECJsonable {
    public func toJson() -> String {
        var jsonStr = "[ \n"
        for item in self {
            jsonStr += "\(item.toJson()),"
        }
        jsonStr += "]"
        return jsonStr
    }
}
