//
//  Jsonable.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 04/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Foundation

public protocol Jsonable{
    var jsonString: String { get }
}

public extension Jsonable where Self: CustomStringConvertible {
    var jsonString: String {
        return "\"\(self.description)\""
    }
}

public extension Jsonable {
    var jsonString: String {
        return "\(self)"
    }
    
//    internal func toJson() -> String {
//        return self.jsonString
//    }
}

extension Bool: Jsonable {
    public var jsonString: String {
        return "\(self)"
    }
}
extension Int: Jsonable {
    public var jsonString: String {
        return "\(self)"
    }
}
extension Int8: Jsonable {
    public var jsonString: String {
        return "\(self)"
    }
}
extension Int16: Jsonable {
    public var jsonString: String {
        return "\(self)"
    }
}
extension Int32: Jsonable {
    public var jsonString: String {
        return "\(self)"
    }
}
extension Int64: Jsonable {
    public var jsonString: String {
        return "\(self)"
    }
}
extension UInt: Jsonable {
    public var jsonString: String {
        return "\(self)"
    }
}
extension UInt8: Jsonable {
    public var jsonString: String {
        return "\(self)"
    }
}
extension UInt16: Jsonable {
    public var jsonString: String {
        return "\(self)"
    }
}
extension UInt32: Jsonable {
    public var jsonString: String {
        return "\(self)"
    }
}
extension UInt64: Jsonable {
    public var jsonString: String {
        return "\(self)"
    }
}
extension Double: Jsonable {
    public var jsonString: String {
        return "\(self)"
    }
}
extension Float: Jsonable {
    public var jsonString: String {
        return "\(self)"
    }
}

extension String: Jsonable {
    public var jsonString: String {
        return "\"\(self)\""
    }
}

extension NSNull: Jsonable {
    public var jsonString: String {
        return "null"
    }
}

extension Optional: CustomStringConvertible {
    
    public var jsonString: String {
        return description
    }
    
    public var description: String {
        switch self {
        case .none:
            return "null"
        case let .some(value):
            if value is Jsonable {
                return (value as! Jsonable).jsonString
            } else {
                return "\(value)"
            }
        }
    }
}

internal func obtainJsonString(from value: Any) -> String {
    if let a = value as? [Jsonable] { // 处理数据
        return a.jsonString
    } else if let a = value as? NSArray {
        return a.jsonString
    } else if let d = value as? [String: Jsonable] {
        return d.jsonString
    } else if let d = value as? NSDictionary {
        return d.jsonString
    } else if let s = value as? String { // 处理字符串常量的情况
        return s.jsonString
    } else if let i = value as? Jsonable {
        return i.jsonString
    } else if let d = value as? CustomStringConvertible {
        return "\(d.description)"
    } else {
        return "\(value)"
    }
 
}

extension NSNumber: Jsonable {
    public var jsonString: String {
        return self.description
    }
}

extension Array: Jsonable {
    public var jsonString: String {
        var jsonStr = "[\n"
        
        if self.count > 0 {
            for item in self {
                jsonStr += obtainJsonString(from: item)
                jsonStr += ",\n"
            }
            
            // 移除最后一个','与'\n'符号
            jsonStr = jsonStr.substring(to: jsonStr.index(jsonStr.endIndex, offsetBy: -2))
        }
        
        jsonStr += "\n]"
        return jsonStr
    }
}

extension NSArray: Jsonable {
    public var jsonString: String {
        var jsonStr = "[\n"
        
        if self.count > 0 {
            for item in self {
                jsonStr += obtainJsonString(from: item)
                jsonStr += ",\n"
            }
            
            // 移除最后一个','与'\n'符号
            jsonStr = jsonStr.substring(to: jsonStr.index(jsonStr.endIndex, offsetBy: -2))
        }
        
        jsonStr += "\n]"
        return jsonStr
    }
}

extension Dictionary: Jsonable {
    public var jsonString: String {
        var jsonStr = "{\n"
        
        if self.keys.count > 0 {
            let sortedKeys = Array(self.keys).sorted {String(describing: $0) < String(describing: $1)}
            for key in sortedKeys {
                let value = self[key]!
                jsonStr += "\"\(key)\":"
                jsonStr += obtainJsonString(from: value)
                jsonStr += ",\n"
            }
            
            // 移除最后一个','与'\n'符号
            jsonStr = jsonStr.substring(to: jsonStr.index(jsonStr.endIndex, offsetBy: -2))
        }
        
        jsonStr += "\n}"
        return jsonStr
    }

}

extension NSDictionary: Jsonable {
    public var jsonString: String {
        var jsonStr = "{\n"
        
        if self.allKeys.count > 0 {
            let sortedKeys = Array(self.allKeys).sorted {String(describing: $0) < String(describing: $1)}
            for key in sortedKeys {
                let value = self[key as! NSCopying]!
                jsonStr += "\"\(key)\":"
                jsonStr += obtainJsonString(from: value)
                jsonStr += ",\n"
            }
            
            // 移除最后一个','与'\n'符号
            jsonStr = jsonStr.substring(to: jsonStr.index(jsonStr.endIndex, offsetBy: -2))
        }
        
        jsonStr += "\n}"
        return jsonStr
    }
}
