//
//  GraphicType.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 10/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 原生图形元素组件的类型
///
/// - group: group 是唯一的可以有子节点的容器。group 可以用来整体定位一组图形元素。
/// - image: 图片
/// - text: 文本块
/// - rect: 矩形
/// - circle: 圆
/// - ring: 圆环
/// - sector: 扇形
/// - arc: 圆弧
/// - polygon: 多边形
/// - polyline: 折线
/// - line: 直线
/// - bezierCurve: 二次或三次贝塞尔曲线
public enum GraphicType: String, Jsonable {
    case group = "group"
    case image = "image"
    case text = "text"
    case rect = "rect"
    case circle = "circle"
    case ring = "ring"
    case sector = "sector"
    case arc = "arc"
    case polygon = "polygon"
    case polyline = "polyline"
    case line = "line"
    case bezierCurve = "bezierCurve"
    
    public var jsonString: String {
        return self.rawValue.jsonString
    }
}
