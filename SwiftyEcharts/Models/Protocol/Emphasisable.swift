//
//  LabelType.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 03/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 针对那些有 '正常' 和 '高亮' 两种样式的组件的接口， 例如 `ItemStyle`, `AreaStyle` `Label` 等
public protocol Emphasisable {
    
    /// 样式，针对不同的组件有不同的样式
    associatedtype Style
    
    /// 默认样式，即非触发 '高亮' 情况下的样式
    var normal: Style? { get  set }
    /// 高亮样式
    var emphasis: Style? { get set }
}
