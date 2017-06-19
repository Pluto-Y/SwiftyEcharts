//
//  Symbol.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 06/12/2016.
//  Copyright © 2016 com.pluto-y. All rights reserved.
//


/// ECharts 提供的标记类型包括 'circle', 'rect', 'roundRect', 'triangle', 'diamond', 'pin', 'arrow'
///
/// 也可以通过 image(url) 设置为图片，其中 url 为图片的链接。
///
/// 在 ECharts 3 里可以通过 'path://' 将图标设置为任意的矢量路径。这种方式相比于使用图片的方式，不用担心因为缩放而产生锯齿或模糊，而且可以设置为任意颜色。路径图形会自适应调整为合适（如果是 symbol 的话就是 symbolSize）的大小。路径的格式参见 SVG PathData。可以从 Adobe Illustrator 等工具编辑导出。
public enum Symbol: CustomStringConvertible, Jsonable {
    case emptyCircle
    case circle
    case rect
    case roundRect
    case triangle
    case diamond
    case pin
    case arrow
    case none
    case image(String)
    case path(String)
    
    public var description: String {
        switch self {
        case .emptyCircle:
            return "emptyCircle"
        case .circle:
            return "circle"
        case .rect:
            return "rect"
        case .roundRect:
            return "roundRect"
        case .triangle:
            return "triangle"
        case .diamond:
            return "diamond"
        case .pin:
            return "pin"
        case .arrow:
            return "arrow"
        case .none:
            return "none"
        case let .image(url):
            return url
        case let .path(path):
            return path
        }
    }
}

public protocol Symbolized {
    var symbol: OneOrMore<Symbol>? { get set }
    var symbolSize: FunctionOrFloatOrPair? { get set }
    var symbolRotate: Float? { get set }
    var symbolOffset: Point? { get set }
}
