//
//  Opacitable.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 03/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 当一个控件支持透明是，则实现此协议即可
public protocol Opacitable: class {
    /// 图形透明度。支持从 0 到 1 的数字，为 0 时不绘制该图形。
    var opacity: Float? { get set }
}

extension Opacitable {
    @discardableResult
    public func validateOpacity() -> Bool {
        guard let opacity = opacity else {
            return false
        }
        if opacity < Float(0.0) {
            self.opacity = 0.0
            return false
        } else if opacity > Float(1.0) {
            self.opacity = 1.0
            return false
        }
        return true
    }
}
