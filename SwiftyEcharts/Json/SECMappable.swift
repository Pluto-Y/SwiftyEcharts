//
//  SECMappable.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 04/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public protocol SECMappable {
    var mapDic: [String: SECJsonable] { get set }
    func mapping()
}

extension SECMappable {
    public func mappingJson() -> String {
        var jsonStr = "{ \n"
        for (key, value) in mapDic {
            if value is Array<SECMappable> {
                if let x = value as? [SECMappable] {
                    jsonStr += x.toJson()
                }
            } else if value is Dictionary<String, SECMappable> {
                jsonStr += "'\(key)': {\n"
                //                json
            } else if value is Bool
                || value is Int
                || value is Double
                || value is Float
                || value is String {
                jsonStr += "'\(key)':\(value.toJson()),"
            }
            jsonStr += ","
        }
        jsonStr += "}"
        return jsonStr
    }
}
