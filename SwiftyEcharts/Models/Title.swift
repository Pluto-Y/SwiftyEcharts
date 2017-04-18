//
//  Title.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 30/11/2016.
//  Copyright © 2016 com.pluto-y. All rights reserved.
//

/// 标题组件，包含主标题和副标题。
/// 在 ECharts 2.x 中单个 ECharts 实例最多只能拥有一个标题组件。但是在 ECharts 3 中可以存在任意多个标题组件，这在需要标题进行排版，或者单个实例中的多个图表都需要标题时会比较有用。
public final class Title: Borderable, Displayable, Textful, Zable {
    /// 是否显示标题组件
    public var show: Bool?
    /// 主标题文本，支持使用 \n 换。
    public var text: String?
    /// 主标题文本超链接
    public var link: String?
    /// 指定窗口打开主标题超链接。
    public var target: Target?
    /// 主标题文字样式
    public var textStyle: TextStyle?
    /// 标题文本水平对齐
    public var textAlign: Align?
    /// 标题文本垂直对齐
    public var textBaseline: VerticalAlign?
    /// 副标题文本，支持使用 \n 换行
    public var subtext: String?
    /// 副标题文本超链接
    public var sublink: String?
    /// 指定窗口打开副标题超链接
    public var subtarget: Target?
    /// 副标题文字样式
    public var subtextStyle: TextStyle?
    /// 标题内边距
    public var padding: Padding?
    /// 主副标题之间的间距
    public var itemGap: Float?
    /// 所有图形的`zlevel`值
    public var zlevel: Float?
    /// 组件的所有图形的z值。控制图形的前后顺序。z值小的图形会被z值大的图形覆盖。
    /// z相比zlevel优先级更低，而且不会创建新的 Canvas
    public var z: Float?
    /// grid 组件离容器左侧的距离。
    public var left: Position?
    /// grid 组件离容器上侧的距离。
    public var top: Position?
    /// grid 组件离容器右侧的距离。
    public var right: Position?
    /// grid 组件离容器下侧的距离。
    public var bottom: Position?
    /// 标题背景色，默认透明。
    public var backgroundColor: Color?
    /// 标题的边框颜色。支持的颜色格式同 backgroundColor。
    public var borderColor: Color?
    /// 标题的边框线宽。
    public var borderWidth: Float?
    /// 图形阴影的模糊大小。该属性配合 shadowColor,shadowOffsetX, shadowOffsetY 一起设置图形的阴影效果
    /// 注意：此配置项生效的前提是，设置了 show: true 以及值不为 tranparent 的背景色 backgroundColor。
    public var shadowBlur: Float?
    /// 阴影颜色
    /// 注意：此配置项生效的前提是，设置了 show: true。
    public var shadowColor: Color?
    /// 阴影水平方向上的偏移距离。
    /// 注意：此配置项生效的前提是，设置了 show: true。
    public var shadowOffsetX: Float?
    /// 阴影水平方向上的偏移距离。
    /// 注意：此配置项生效的前提是，设置了 show: true。
    public var shadowOffsetY: Float?
    
    public init() { }
}

extension Title: Enumable {
    public enum Enums {
        case show(Bool), text(String), link(String), target(Target), textStyle(TextStyle), textAlign(Align), textBaseline(VerticalAlign), subtext(String), sublink(String), subtarget(Target), subtextStyle(TextStyle), padding(Padding), itemGap(Float), zlevel(Float), z(Float), left(Position), x(Position), top(Position), y(Position), right(Position), bottom(Position), backgroundColor(Color), borderColor(Color), borderWidth(Float), shadowBlur(Float), shadowColor(Color), shadowOffsetX(Float), shadowOffsetY(Float)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .show(show):
                self.show = show
            case let .text(text):
                self.text = text
            case let .link(link):
                self.link = link
            case let .target(target):
                self.target = target
            case let .textStyle(textStyle):
                self.textStyle = textStyle
            case let .textAlign(align):
                self.textAlign = align
            case let .textBaseline(baseline):
                self.textBaseline = baseline
            case let .subtext(text):
                self.subtext = text
            case let .sublink(sublink):
                self.sublink = sublink
            case let .subtarget(target):
                self.subtarget = target
            case let .subtextStyle(textStyle):
                self.subtextStyle = textStyle
            case let .padding(padding):
                self.padding = padding
            case let .itemGap(itemGap):
                self.itemGap = itemGap
            case let .zlevel(zlevel):
                self.zlevel = zlevel
            case let .z(z):
                self.z = z
            case let .left(left):
                self.left = left
            case let .x(left):
                self.left = left
            case let .y(top):
                self.top = top
            case let .top(top):
                self.top = top
            case let .right(right):
                self.right = right
            case let .bottom(bottom):
                self.bottom = bottom
            case let .backgroundColor(backgroundColor):
                self.backgroundColor = backgroundColor
            case let .borderColor(color):
                self.borderColor = color
            case let .borderWidth(width):
                self.borderWidth = width
            case let .shadowBlur(blur):
                self.shadowBlur = blur
            case let .shadowColor(color):
                self.shadowColor = color
            case let .shadowOffsetX(x):
                self.shadowOffsetX = x
            case let .shadowOffsetY(y):
                self.shadowOffsetY = y
            }
        }
    }
}
extension Title: Mappable {
    public func mapping(_ map: Mapper) {
        map["show"] = show
        map["text"] = text
        map["link"] = link
        map["target"] = target
        map["textStyle"] = textStyle
        map["textAlign"] = textAlign
        map["textBaseline"] = textBaseline
        map["subtext"] = subtext
        map["sublink"] = sublink
        map["subtarget"] = subtarget
        map["subtextStyle"] = subtextStyle
        map["padding"] = padding
        map["itemGap"] = itemGap
        map["zlevel"] = zlevel
        map["z"] = z
        map["left"] = left
        map["top"] = top
        map["right"] = right
        map["bottom"] = bottom
        map["backgroundColor"] = backgroundColor
        map["borderColor"] = borderColor
        map["borderWidth"] = borderWidth
        map["shadowBlur"] = shadowBlur
        map["shadowColor"] = shadowColor
        map["shadowOffsetX"] = shadowOffsetX
        map["shadowOffsetY"] = shadowOffsetY
        
    }
}
