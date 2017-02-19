//
//  SECJsonable.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 04/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public protocol SECJsonable{
    var jsonString: String { get }
}

public extension SECJsonable where Self: CustomStringConvertible {
    var jsonString: String {
        return "\"\(self.description)\""
    }
}

public extension SECJsonable {
    var jsonString: String {
        return "\(self)"
    }
    
    internal func toJson() -> String {
        return self.jsonString
    }
}

extension Bool : SECJsonable {
    public var jsonString: String {
        return "\(self)"
    }
}
extension Int : SECJsonable {
    public var jsonString: String {
        return "\(self)"
    }
}
extension Int8 : SECJsonable {
    public var jsonString: String {
        return "\(self)"
    }
}
extension Int16 : SECJsonable {
    public var jsonString: String {
        return "\(self)"
    }
}
extension Int32 : SECJsonable {
    public var jsonString: String {
        return "\(self)"
    }
}
extension Int64 : SECJsonable {
    public var jsonString: String {
        return "\(self)"
    }
}
extension UInt : SECJsonable {
    public var jsonString: String {
        return "\(self)"
    }
}
extension UInt8 : SECJsonable {
    public var jsonString: String {
        return "\(self)"
    }
}
extension UInt16 : SECJsonable {
    public var jsonString: String {
        return "\(self)"
    }
}
extension UInt32 : SECJsonable {
    public var jsonString: String {
        return "\(self)"
    }
}
extension UInt64 : SECJsonable {
    public var jsonString: String {
        return "\(self)"
    }
}
extension Double : SECJsonable {
    public var jsonString: String {
        return "\(self)"
    }
}
extension Float : SECJsonable {
    public var jsonString: String {
        return "\(self)"
    }
}

extension String : SECJsonable {
    public var jsonString: String {
        return "\"\(self)\""
    }
}

extension Optional : CustomStringConvertible {
    
    public var jsonString: String {
        return description
    }
    
    public var description: String {
        switch self {
        case .None:
            return "null"
        case let .Some(value):
            if value is SECJsonable {
                return (value as! SECJsonable).toJson()
            } else {
                return "\(value)"
            }
        }
    }
}

internal func obtainJsonString(from value: Any) -> String {
    if let i = value as? SECJsonable {
        return "\(i.toJson())"
    } else if let s = value as? String { // 处理字符串常量的情况
        return "\(s.jsonString)"
    } else if let d = value as? CustomStringConvertible {
        return "\(d.description)"
    } else {
        return "\(value)"
    }
 
}

extension Array : SECJsonable {
    public var jsonString: String {
        var jsonStr = "[\n"
        
        if self.count > 0 {
            for item in self {
                jsonStr += obtainJsonString(from: item)
                jsonStr += ",\n"
            }
            
            // 移除最后一个','与'\n'符号
            jsonStr = jsonStr.substringToIndex(jsonStr.endIndex.predecessor().predecessor())
        }
        
        jsonStr += "\n]"
        return jsonStr
    }
}

extension Dictionary : SECJsonable {
    public var jsonString: String {
        var jsonStr = "{\n"
        
        if self.keys.count > 0 {
            let sortedKeys = Array(self.keys).sort { String($0) < String($1) }
            
            for key in sortedKeys {
                let value = self[key]!
                jsonStr += "\"\(key)\":"
                jsonStr += obtainJsonString(from: value)
                jsonStr += ",\n"
            }
            
            // 移除最后一个','与'\n'符号
            jsonStr = jsonStr.substringToIndex(jsonStr.endIndex.predecessor().predecessor())
        }
        
        jsonStr += "\n}"
        return jsonStr
    }
}
