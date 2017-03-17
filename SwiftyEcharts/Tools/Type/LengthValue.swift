//
//  LengthValue.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 15/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 用来同意表示长度的值， 之后可以通过数值或者通过数值加%（见 Percent.swift ）
///
/// 例如通过标示宽度可以通过下面例子来表示:
///
///     .width(30.0)
///
/// 或者
///
///     .width(32.0%)
public protocol LengthValue: Jsonable { }

/// 保证Float, Double, Int 都支持 LengthValue 协议
extension Float: LengthValue { }
extension Double: LengthValue { }
extension Int: LengthValue { }
