//
//  SECPercent.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 15/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public struct SECPercent {
    public var precision: UInt8 = 2
    private let value: Double
}

extension SECPercent : FloatLiteralConvertible {
    public init(floatLiteral value: Double)  {
        self.value = value
    }
}

extension SECPercent : SECJsonable {
    public var jsonString: String {
        let formatStr = String(format: "%%.%df", precision)
        return "\"\(String(format: formatStr, value))%\""
    }
}
