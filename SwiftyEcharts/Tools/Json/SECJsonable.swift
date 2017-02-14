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

extension Bool: SECJsonable {
    public var jsonString: String {
        return "\(self)"
    }
}
extension Int: SECJsonable {
    public var jsonString: String {
        return "\(self)"
    }
}
extension Int8: SECJsonable {
    public var jsonString: String {
        return "\(self)"
    }
}
extension Int16: SECJsonable {
    public var jsonString: String {
        return "\(self)"
    }
}
extension Int32: SECJsonable {
    public var jsonString: String {
        return "\(self)"
    }
}
extension Int64: SECJsonable {
    public var jsonString: String {
        return "\(self)"
    }
}
extension UInt: SECJsonable {
    public var jsonString: String {
        return "\(self)"
    }
}
extension UInt8: SECJsonable {
    public var jsonString: String {
        return "\(self)"
    }
}
extension UInt16: SECJsonable {
    public var jsonString: String {
        return "\(self)"
    }
}
extension UInt32: SECJsonable {
    public var jsonString: String {
        return "\(self)"
    }
}
extension UInt64: SECJsonable {
    public var jsonString: String {
        return "\(self)"
    }
}
extension Double: SECJsonable {
    public var jsonString: String {
        return "\(self)"
    }
}
extension Float: SECJsonable {
    public var jsonString: String {
        return "\(self)"
    }
}

extension String: SECJsonable {
    public var jsonString: String {
        return "\"\(self)\""
    }
}

extension Optional: CustomStringConvertible {
    
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

extension Array: SECJsonable {
    public var jsonString: String {
        var jsonStr = "[\n"
        for item in self {
            if let i = item as? SECJsonable {
                jsonStr += "\(i.toJson())"
            } else if let d = item as? CustomStringConvertible {
                jsonStr += "\(d.description)"
            } else {
                jsonStr += "\(item)"
            }
            jsonStr += ",\n"
        }
        jsonStr = jsonStr.substringToIndex(jsonStr.endIndex.predecessor().predecessor())
        jsonStr += "\n]"
        return jsonStr
    }
}

extension Dictionary: SECJsonable {
    public var jsonString: String {
        var jsonStr = "{\n"
        
        if self.keys.count > 0 {
            let sortedKeys = Array(self.keys).sort { String($0) < String($1) }
            
            for key in sortedKeys {
                let value = self[key]!
                jsonStr += "\"\(key)\":"
                if let v = value as? SECJsonable {
                    jsonStr += "\(v.toJson())"
                } else if let d = value as? CustomStringConvertible {
                    jsonStr += "\(d.description)"
                } else {
                    jsonStr += "\(value)"
                }
                jsonStr += ",\n"
            }
            
            // 移除最后一个','与'\n'符号
            jsonStr = jsonStr.substringToIndex(jsonStr.endIndex.predecessor().predecessor())
        }
        
        jsonStr += "\n}"
        return jsonStr
    }
}



