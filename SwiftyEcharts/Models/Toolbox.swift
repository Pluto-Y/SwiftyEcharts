//
//  Toolbox.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 16/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 工具栏。内置有导出图片，数据视图，动态类型切换，数据区域缩放，重置五个工具。
public final class Toolbox: Displayable, Zable {
    
    /// 各工具配置项。
    /// 除了各个内置的工具按钮外，还可以自定义工具按钮。
    ///
    /// 注意，自定义的工具名字，只能以 my 开头，
    ///
    /// 例如下例中的 myTool1，myTool2：
    ///
    ///     {
    ///         toolbox: {
    ///             feature: {
    ///                 myTool1: {
    ///                     show: true,
    ///                     title: '自定义扩展方法1',
    ///                     icon: 'path://M432.45,595.444c0,2.177-4.661,6.82-11.305,6.82c-6.475,0-11.306-4.567-11.306-6.82s4.852-6.812,11.306-6.812C427.841,588.632,432.452,593.191,432.45,595.444L432.45,595.444z M421.155,589.876c-3.009,0-5.448,2.495-5.448,5.572s2.439,5.572,5.448,5.572c3.01,0,5.449-2.495,5.449-5.572C426.604,592.371,424.165,589.876,421.155,589.876L421.155,589.876z M421.146,591.891c-1.916,0-3.47,1.589-3.47,3.549c0,1.959,1.554,3.548,3.47,3.548s3.469-1.589,3.469-3.548C424.614,593.479,423.062,591.891,421.146,591.891L421.146,591.891zM421.146,591.891',
    ///                     onclick: function (){
    ///                         alert('myToolHandler1')
    ///                     }
    ///                 },
    ///                 myTool2: {
    ///                     show: true,
    ///                     title: '自定义扩展方法',
    ///                     icon: 'image://http://echarts.baidu.com/images/favicon.png',
    ///                     onclick: function (){
    ///                         alert('myToolHandler2')
    ///                     }
    ///                 }
    ///             }
    ///         }
    ///     }
    public final class Feature {
        /// 保存为图片。
        public var saveAsImage: SaveAsImage?
        /// 配置项还原。
        public var restore: Restore?
        /// 数据视图工具，可以展现当前图表所用的数据，编辑后可以动态更新。
        public var dataView: DataView?
        /// 数据区域缩放。目前只支持直角坐标系的缩放。
        public var dataZoom: DataZoom?
        /// 动态类型切换
        public var magicType: MagicType?
        /// 选框组件的控制按钮。
        ///
        public var brush: Brush?

    }
    
    /// 是否显示工具栏组件。
    public var show: Bool?
    /// 工具栏 icon 的布局朝向。
    public var orient: Orient?
    /// 工具栏 icon 的大小。
    public var itemSize: Float?
    /// 工具栏 icon 每项之间的间隔。横向布局时为水平间隔，纵向布局时为纵向间隔。
    public var itemGap: Float?
    /// 是否在鼠标 hover 的时候显示每个工具 icon 的标题。
    public var showTitle: Bool?
    /// 各工具配置项。
    public var feature: Feature?
    /// 公用的 icon 样式设置。
    public var iconStyle: IconStyle?
    /// 所有图形的 zlevel 值。
    ///
    /// zlevel用于 Canvas 分层，不同zlevel值的图形会放置在不同的 Canvas 中，Canvas 分层是一种常见的优化手段。我们可以把一些图形变化频繁（例如有动画）的组件设置成一个单独的zlevel。需要注意的是过多的 Canvas 会引起内存开销的增大，在手机端上需要谨慎使用以防崩溃。
    ///
    /// zlevel 大的 Canvas 会放在 zlevel 小的 Canvas 的上面。
    public var zlevel: Float?
    /// 组件的所有图形的z值。控制图形的前后顺序。z值小的图形会被z值大的图形覆盖。
    ///
    /// z相比zlevel优先级更低，而且不会创建新的 Canvas。
    public var z: Float?
    
    /// 工具栏组件离容器左侧的距离。
    ///
    /// left 的值可以是像 20 这样的具体像素值，可以是像 '20%' 这样相对于容器高宽的百分比，也可以是 'left', 'center', 'right'。
    ///
    /// 如果 left 的值为'left', 'center', 'right'，组件会根据相应的位置自动对齐。
    public var left: Position?
    /// 工具栏组件离容器上侧的距离。
    ///
    /// top 的值可以是像 20 这样的具体像素值，可以是像 '20%' 这样相对于容器高宽的百分比，也可以是 'top', 'middle', 'bottom'。
    ///
    /// 如果 top 的值为'top', 'middle', 'bottom'，组件会根据相应的位置自动对齐。
    public var top: Position?
    /// 工具栏组件离容器右侧的距离。
    ///
    /// right 的值可以是像 20 这样的具体像素值，可以是像 '20%' 这样相对于容器高宽的百分比。
    ///
    /// 默认自适应。
    public var right: Position?
    /// 工具栏组件离容器下侧的距离。
    ///
    /// bottom 的值可以是像 20 这样的具体像素值，可以是像 '20%' 这样相对于容器高宽的百分比。
    ///
    /// 默认自适应。
    public var bottom: Position?
    /// 工具栏组件的宽度。默认自适应。
    public var width: Float?
    /// 工具栏组件的高度。默认自适应。
    public var height: Float?
}

// MARK: - Toolbox.IconStyle
extension Toolbox {
    public final class IconStyleContent: Opacitable {
        public var color: Color?
        public var borderColor: Color?
        public var borderWidth: Float?
        public var borderType: LineType?
        public var shadowBlur: Float?
        public var shadowColor: Color?
        public var shadowOffsetX: Float?
        public var shadowOffsetY: Float?
        public var opacity: Float? {
            didSet {
                validateOpacity()
            }
        }
        /// 文本位置，'left' / 'right' / 'top' / 'bottom'。
        public var textPosition: Position?
        /// 文本对齐方式，'left' / 'right'。
        public var textAlign: Align?
        
        public init() { }
    }
    
    public final class IconStyle: Emphasisable {
        public typealias Style = IconStyleContent
        
        public var normal: Style?
        public var emphasis: Style?
        
        public init() { }
    }
}

extension Toolbox.IconStyleContent: Enumable {
    public enum Enums {
        case color(Color), borderColor(Color), borderWidth(Float), borderType(LineType), shadowBlur(Float), shadowColor(Color), shadowOffsetX(Float), shadowOffsetY(Float), opacity(Float), textPosition(Position), textAlign(Align)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .color(color):
                self.color = color
            case let .borderColor(color):
                self.borderColor = color
            case let .borderWidth(width):
                self.borderWidth = width
            case let .borderType(borderType):
                self.borderType = borderType
            case let .shadowBlur(blur):
                self.shadowBlur = blur
            case let .shadowColor(color):
                self.shadowColor = color
            case let .shadowOffsetX(x):
                self.shadowOffsetX = x
            case let .shadowOffsetY(y):
                self.shadowOffsetY = y
            case let .opacity(opacity):
                self.opacity = opacity
            case let .textPosition(textPosition):
                self.textPosition = textPosition
            case let .textAlign(textAlign):
                self.textAlign = textAlign
            }
        }
    }
}

extension Toolbox.IconStyleContent: Mappable {
    public func mapping(_ map: Mapper) {
        map["color"] = color
        map["borderColor"] = borderColor
        map["borderWidth"] = borderWidth
        map["borderType"] = borderType
        map["shadowBlur"] = shadowBlur
        map["shadowColor"] = shadowColor
        map["shadowOffsetX"] = shadowOffsetX
        map["shadowOffsetY"] = shadowOffsetY
        map["opacity"] = opacity
        map["textPosition"] = textPosition
        map["textAlign"] = textAlign
    }
}

extension Toolbox.IconStyle: Enumable {
    public enum Enums {
        case normal(Style), emphasis(Style)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .normal(normal):
                self.normal = normal
            case let .emphasis(emphasis):
                self.emphasis = emphasis
            }
        }
    }
}

extension Toolbox.IconStyle: Mappable {
    public func mapping(_ map: Mapper) {
        map["normal"] = normal
        map["emphasis"] = emphasis
    }
}

// MARK: - Toolbox.Feature.SaveAsImage
extension Toolbox.Feature {
    /// 保存为图片。
    public final class SaveAsImage: Displayable {
        public enum `Type`: String, Jsonable {
            case png = "png"
            case jpeg = "jpeg"
            
            public var jsonString: String {
                return self.rawValue.jsonString
            }
        }
        
        /// 保存的图片格式。支持 'png' 和 'jpeg'。
        public var type: Type?
        /// 保存的文件名称，默认使用 title.text 作为名称。
        public var name: String?
        /// 保存的图片背景色，默认使用 backgroundColor，如果backgroundColor不存在的话会取白色。
        public var backgroundColor: Color?
        /// 保存为图片时忽略的组件列表，默认忽略工具栏。
        public var excludeComponents: [String]? // FIXME: 是否需要抽象
        /// 是否显示该工具。
        public var show: Bool?
        ///
        public var title: String?
        /// Icon 的 path 字符串，ECharts 3 中支持使用自定义的 svg path 作为 icon，格式参见 SVG PathData。可以从 Adobe Illustrator 等工具编辑导出。
        public var icon: String? // FIXME: 暂时还不理解
        /// icon 样式设置。
        public var iconStyle: Toolbox.IconStyle?
        /// 保存图片的分辨率比例，默认跟容器相同大小，如果需要保存更高分辨率的，可以设置为大于 1 的值，例如 2。
        public var pixelRatio: Float?
    }
}

extension Toolbox.Feature.SaveAsImage: Enumable {
    public enum Enums {
        case type(Type), name(String), backgroundColor(Color), excludeComponents([String]), show(Bool), title(String), icon(String), iconStyle(Toolbox.IconStyle), pixelRatio(Float)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .type(type):
                self.type = type
            case let .name(name):
                self.name = name
            case let .backgroundColor(backgroundColor):
                self.backgroundColor = backgroundColor
            case let .excludeComponents(excludeComponents):
                self.excludeComponents = excludeComponents
            case let .show(show):
                self.show = show
            case let .title(title):
                self.title = title
            case let .icon(icon):
                self.icon = icon
            case let .iconStyle(iconStyle):
                self.iconStyle = iconStyle
            case let .pixelRatio(pixelRatio):
                self.pixelRatio = pixelRatio
            }
        }
    }
}

extension Toolbox.Feature.SaveAsImage: Mappable {
    public func mapping(_ map: Mapper) {
        map["type"] = type
        map["name"] = name
        map["backgroundColor"] = backgroundColor
        map["excludeComponents"] = excludeComponents
        map["show"] = show
        map["title"] = title
        map["icon"] = icon
        map["iconStyle"] = iconStyle
        map["pixelRatio"] = pixelRatio
    }
}

// MARK: - Toolbox.Feature.Restore
extension Toolbox.Feature {
    /// 配置项还原。
    public final class Restore: Displayable {
        /// 是否显示该工具。
        public var show: Bool?
        /// 标题
        public var title: String?
        /// Icon 的 path 字符串，ECharts 3 中支持使用自定义的 svg path 作为 icon，格式参见 SVG PathData。可以从 Adobe Illustrator 等工具编辑导出。
        public var icon: String? // FIXME: 暂时还不理解
        /// icon 样式设置。
        public var iconStyle: Toolbox.IconStyle?
    }
}

extension Toolbox.Feature.Restore: Enumable {
    public enum Enums {
        case show(Bool), title(String), icon(String), iconStyle(Toolbox.IconStyle)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .show(show):
                self.show = show
            case let .title(title):
                self.title = title
            case let .icon(icon):
                self.icon = icon
            case let .iconStyle(iconStyle):
                self.iconStyle = iconStyle
            }
        }
    }
}

extension Toolbox.Feature.Restore: Mappable {
    public func mapping(_ map: Mapper) {
        map["show"] = show
        map["title"] = title
        map["icon"] = icon
        map["iconStyle"] = iconStyle
    }
}

// MARK: - Toolbox.Feature.DataView
extension Toolbox.Feature {
    /// 数据视图工具，可以展现当前图表所用的数据，编辑后可以动态更新。
    public final class DataView: Displayable {
        /// 是否显示该工具。
        public var show: Bool?
        /// 标题
        public var title: String?
        /// Icon 的 path 字符串，ECharts 3 中支持使用自定义的 svg path 作为 icon，格式参见 SVG PathData。可以从 Adobe Illustrator 等工具编辑导出。
        public var icon: String? // FIXME: 暂时还不理解
        /// 数据视图 icon 样式设置。
        public var iconStyle: Toolbox.IconStyle?
        /// 是否不可编辑（只读）。
        public var readOnly: Bool?
//        public var optionToContent: String? // FIXME: 是否需要封装?
//        public var contentToOption: String? // FIXME: 是否需要封装?
        /// 数据视图上有三个话术，默认是['数据视图', '关闭', '刷新']。
        public var lang: [String]?
        /// 数据视图浮层背景色。
        public var backgroundColor: Color?
        /// 数据视图浮层文本输入区背景色。
        public var textareaColor: Color?
        /// 数据视图浮层文本输入区边框颜色。
        public var textareaBorderColor: Color?
        /// 文本颜色。
        public var textColor: Color?
        /// 按钮颜色。
        public var buttonColor: Color?
        /// 按钮文本颜色。
        public var buttonTextColor: Color?
    }
}

extension Toolbox.Feature.DataView: Enumable {
    public enum Enums {
        case show(Bool), title(String), icon(String), iconStyle(Toolbox.IconStyle), readOnly(Bool), lang([String]), backgroundColor(Color), textareaColor(Color), textareaBorderColor(Color), textColor(Color), buttonColor(Color), buttonTextColor(Color)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .show(show):
                self.show = show
            case let .title(title):
                self.title = title
            case let .icon(icon):
                self.icon = icon
            case let .iconStyle(iconStyle):
                self.iconStyle = iconStyle
            case let .readOnly(readOnly):
                self.readOnly = readOnly
            case let .lang(lang):
                self.lang = lang
            case let .backgroundColor(backgroundColor):
                self.backgroundColor = backgroundColor
            case let .textareaColor(textareaColor):
                self.textareaColor = textareaColor
            case let .textareaBorderColor(textareaBorderColor):
                self.textareaBorderColor = textareaBorderColor
            case let .textColor(textColor):
                self.textColor = textColor
            case let .buttonColor(buttonColor):
                self.buttonColor = buttonColor
            case let .buttonTextColor(buttonTextColor):
                self.buttonTextColor = buttonTextColor
            }
        }
    }
}

extension Toolbox.Feature.DataView: Mappable {
    public func mapping(_ map: Mapper) {
        map["show"] = show
        map["title"] = title
        map["icon"] = icon
        map["iconStyle"] = iconStyle
        map["readOnly"] = readOnly
//        map["optionToContent"] = optionToContent
//        map["contentToOption"] = contentToOption
        map["lang"] = lang
        map["backgroundColor"] = backgroundColor
        map["textareaColor"] = textareaColor
        map["textareaBorderColor"] = textareaBorderColor
        map["textColor"] = textColor
        map["buttonColor"] = buttonColor
        map["buttonTextColor"] = buttonTextColor
    }
}

// MARK: - Toolbox.Feature.DataZoom
extension Toolbox.Feature {
    /// 数据区域缩放。目前只支持直角坐标系的缩放。
    public final class DataZoom: Displayable {
        
        /// 指定哪些 Axis 被控制
        ///
        /// - bool: 如果设置为 false 则不控制任何x轴
        /// - int: 如果设置成 3 则控制 axisIndex 为 3 的x轴
        /// - array: 如果设置为 [0, 3] 则控制 axisIndex 为 0 和 3 的x轴。
        public enum AxisIndexSelector: Jsonable {
            case bool(Bool)
            case int(UInt)
            case array([UInt])
            
            public var jsonString: String {
                switch self {
                case let .bool(b):
                    if b {
                        return "all".jsonString
                    } else {
                        return "none".jsonString
                    }
                case let .int(i):
                    return "\(i)"
                case let .array(arr):
                    return arr.jsonString
                }
            }
        }
        
        /// 缩放和还原的标题文本。
        public final class Title {
            /// 缩放标题
            public var zoom: String?
            /// 还原标题
            public var back: String?
        }
        
        /// 缩放和还原的 icon path。
        public final class Icon {
            /// 缩放Icon 的 path 字符串，ECharts 3 中支持使用自定义的 svg path 作为 icon，格式参见 SVG PathData。可以从 Adobe Illustrator 等工具编辑导出。
            public var zoom: String?
            /// 还原Icon 的 path 字符串，ECharts 3 中支持使用自定义的 svg path 作为 icon，格式参见 SVG PathData。可以从 Adobe Illustrator 等工具编辑导出。
            public var back: String?
        }
        
        /// 是否显示该工具。
        public var show: Bool?
        /// 缩放和还原的标题文本。
        public var title: Title?
        /// 缩放和还原的 icon path。
        public var icon: Icon?
        /// 数据区域缩放 icon 样式设置。
        public var iconStyle: Toolbox.IconStyle?
        /// 指定哪些 xAxis 被控制。如果缺省则控制所有的x轴。如果设置为 false 则不控制任何x轴。如果设置成 3 则控制 axisIndex 为 3 的x轴。如果设置为 [0, 3] 则控制 axisIndex 为 0 和 3 的x轴。
        public var xAxisIndex: AxisIndexSelector?
        /// 指定哪些 yAxis 被控制。如果缺省则控制所有的y轴。如果设置为 false 则不控制任何y轴。如果设置成 3 则控制 axisIndex 为 3 的y轴。如果设置为 [0, 3] 则控制 axisIndex 为 0 和 3 的y轴。
        public var yAxisIndex: AxisIndexSelector?
    }
}

extension Toolbox.Feature.DataZoom.AxisIndexSelector: ExpressibleByBooleanLiteral, ExpressibleByIntegerLiteral, ExpressibleByArrayLiteral {
    
    public init(booleanLiteral value: Bool) {
        self = .bool(value)
    }

    public init(integerLiteral value: UInt) {
        self = .int(value)
    }

    public init(arrayLiteral elements: UInt...) {
        self = .array(elements)
    }
    
}

extension Toolbox.Feature.DataZoom.Title: Enumable {
    public enum Enums {
        case zoom(String), back(String)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .zoom(zoom):
                self.zoom = zoom
            case let .back(back):
                self.back = back
            }
        }
    }
}

extension Toolbox.Feature.DataZoom.Title: Mappable {
    public func mapping(_ map: Mapper) {
        map["zoom"] = zoom
        map["back"] = back
    }
}

extension Toolbox.Feature.DataZoom.Icon: Enumable {
    public enum Enums {
        case zoom(String), back(String)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .zoom(zoom):
                self.zoom = zoom
            case let .back(back):
                self.back = back
            }
        }
    }
}

extension Toolbox.Feature.DataZoom.Icon: Mappable {
    public func mapping(_ map: Mapper) {
        map["zoom"] = zoom
        map["back"] = back
    }
}

extension Toolbox.Feature.DataZoom: Enumable {
    public enum Enums {
        case show(Bool), title(Title), icon(Icon), iconStyle(Toolbox.IconStyle), xAxisIndex(AxisIndexSelector), yAxisIndex(AxisIndexSelector)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .show(show):
                self.show = show
            case let .title(title):
                self.title = title
            case let .icon(icon):
                self.icon = icon
            case let .iconStyle(iconStyle):
                self.iconStyle = iconStyle
            case let .xAxisIndex(xAxisIndex):
                self.xAxisIndex = xAxisIndex
            case let .yAxisIndex(yAxisIndex):
                self.yAxisIndex = yAxisIndex
            }
        }
    }
}

extension Toolbox.Feature.DataZoom: Mappable {
    public func mapping(_ map: Mapper) {
        map["show"] = show
        map["title"] = title
        map["icon"] = icon
        map["iconStyle"] = iconStyle
        map["xAxisIndex"] = xAxisIndex
        map["yAxisIndex"] = yAxisIndex
    }
}


// MARK: - Toolbox.Feature.MagicType
extension Toolbox.Feature {
    /// 动态类型切换 示例：
    ///
    ///     feature: {
    ///         magicType: {
    ///             type: ['line', 'bar', 'stack', 'tiled']
    ///         }
    ///     }
    public final class MagicType: Displayable {
        
        /// 动态类型切换可启用的动态类型
        ///
        /// - line: 折线图
        /// - bar: 柱状图
        /// - stack: 堆叠模式
        /// - tiled: 平铺模式
        public enum `Type`: String, Jsonable {
            case line = "line"
            case bar = "bar"
            case stack = "stack"
            case tiled = "tiled"
            
            public var jsonString: String {
                return self.rawValue.jsonString
            }
        }
        
        /// 各个类型的标题文本，可以分别配置。
        public final class Title {
            public var line: String?
            public var bar: String?
            public var stack: String?
            public var tiled: String?
        }
        
        /// 各个类型的 icon path，可以分别配置。
        public final class Icon {
            public var line: String?
            public var bar: String?
            public var stack: String?
            public var tiled: String?
        }
        
        /// 是否显示该工具。
        public var show: Bool?
        /// 启用的动态类型，包括'line'（切换为折线图）, 'bar'（切换为柱状图）, 'stack'（切换为堆叠模式）, 'tiled'（切换为平铺模式）。
        public var type: [Type]?
        /// 各个类型的标题文本，可以分别配置。
        public var title: Title?
        /// 各个类型的 icon path，可以分别配置。
        public var icon: Icon?
//        public var option? // 暂不支持
//        public seriesIndex: // 暂不支持
    }
}

extension Toolbox.Feature.MagicType.Title: Enumable {
    public enum Enums {
        case line(String), bar(String), stack(String), tiled(String)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .line(line):
                self.line = line
            case let .bar(bar):
                self.bar = bar
            case let .stack(stack):
                self.stack = stack
            case let .tiled(tiled):
                self.tiled = tiled
            }
        }
    }
}

extension Toolbox.Feature.MagicType.Title: Mappable {
    public func mapping(_ map: Mapper) {
        map["line"] = line
        map["bar"] = bar
        map["stack"] = stack
        map["tiled"] = tiled
    }
}

extension Toolbox.Feature.MagicType.Icon: Enumable {
    public enum Enums {
        case line(String), bar(String), stack(String), tiled(String)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .line(line):
                self.line = line
            case let .bar(bar):
                self.bar = bar
            case let .stack(stack):
                self.stack = stack
            case let .tiled(tiled):
                self.tiled = tiled
            }
        }
    }
}

extension Toolbox.Feature.MagicType.Icon: Mappable {
    public func mapping(_ map: Mapper) {
        map["line"] = line
        map["bar"] = bar
        map["stack"] = stack
        map["tiled"] = tiled
    }
}

extension Toolbox.Feature.MagicType: Enumable {
    public enum Enums {
        case show(Bool), type([Type]), title(Title), icon(Icon)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .show(show):
                self.show = show
            case let .type(type):
                self.type = type
            case let .title(title):
                self.title = title
            case let .icon(icon):
                self.icon = icon
            }
        }
    }
}

extension Toolbox.Feature.MagicType: Mappable {
    public func mapping(_ map: Mapper) {
        map["show"] = show
        map["type"] = type
        map["title"] = title
        map["icon"] = icon
//        map["option"] = option
//        map["seriesIndex"] = seriesIndex
    }
}

// MARK: - Toolbox.Feature.Brush
extension Toolbox.Feature {
    /// 选框组件的控制按钮。
    ///
    /// 也可以不在这里指定，而是在 brush.toolbox 中指定。
    public final class Brush {
        /// 选框组件的控制按钮类型
        ///
        /// - rect: 开启矩形选框选择功能。
        /// - polygon: 开启任意形状选框选择功能。
        /// - lineX: 开启横向选择功能。
        /// - lineY: 开启纵向选择功能。
        /// - keep: 切换『单选』和『多选』模式。后者可支持同时画多个选框。前者支持单击清除所有选框。
        /// - clear: 清空所有选框。
        public enum `Type`: String, Jsonable {
            case rect = "rect"
            case polygon = "polygon"
            case lineX = "lineX"
            case lineY = "lineY"
            case keep = "keep"
            case clear = "clear"
            
            public var jsonString: String {
                 return self.rawValue.jsonString
            }
        }
        
        /// 每个按钮的 icon path。
        public final class Icon {
            public var rect: String?
            public var polygon: String?
            public var lineX: String?
            public var lineY: String?
            public var keep: String?
            public var clear: String?
        }
        
        /// 标题文本。
        public final class Title {
            public var rect: String?
            public var polygon: String?
            public var lineX: String?
            public var lineY: String?
            public var keep: String?
            public var clear: String?
        }
        
        public var type: [Type]?
        public var icon: Icon?
        public var title: Title?
    }
}

extension Toolbox.Feature.Brush.Icon: Enumable {
    public enum Enums {
        case rect(String), polygon(String), lineX(String), lineY(String), keep(String), clear(String)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .rect(rect):
                self.rect = rect
            case let .polygon(polygon):
                self.polygon = polygon
            case let .lineX(lineX):
                self.lineX = lineX
            case let .lineY(lineY):
                self.lineY = lineY
            case let .keep(keep):
                self.keep = keep
            case let .clear(clear):
                self.clear = clear
            }
        }
    }
}

extension Toolbox.Feature.Brush.Icon: Mappable {
    public func mapping(_ map: Mapper) {
        map["rect"] = rect
        map["polygon"] = polygon
        map["lineX"] = lineX
        map["lineY"] = lineY
        map["keep"] = keep
        map["clear"] = clear
    }
}

extension Toolbox.Feature.Brush.Title: Enumable {
    public enum Enums {
        case rect(String), polygon(String), lineX(String), lineY(String), keep(String), clear(String)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .rect(rect):
                self.rect = rect
            case let .polygon(polygon):
                self.polygon = polygon
            case let .lineX(lineX):
                self.lineX = lineX
            case let .lineY(lineY):
                self.lineY = lineY
            case let .keep(keep):
                self.keep = keep
            case let .clear(clear):
                self.clear = clear
            }
        }
    }
}

extension Toolbox.Feature.Brush.Title: Mappable {
    public func mapping(_ map: Mapper) {
        map["rect"] = rect
        map["polygon"] = polygon
        map["lineX"] = lineX
        map["lineY"] = lineY
        map["keep"] = keep
        map["clear"] = clear
    }
}

extension Toolbox.Feature.Brush: Enumable {
    public enum Enums {
        case type([Type]), icon(Icon), title(Title)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .type(type):
                self.type = type
            case let .icon(icon):
                self.icon = icon
            case let .title(title):
                self.title = title
            }
        }
    }
}

extension Toolbox.Feature.Brush: Mappable {
    public func mapping(_ map: Mapper) {
        map["type"] = type
        map["icon"] = icon
        map["title"] = title
    }
}

public typealias ToolboxFeature = Toolbox.Feature
public typealias ToolboxFeatureDataZoom = Toolbox.Feature.DataZoom
public typealias ToolboxFeatureDataView = Toolbox.Feature.DataView
public typealias ToolboxFeatureMagicType = Toolbox.Feature.MagicType
public typealias ToolboxFeatureRestore = Toolbox.Feature.Restore
public typealias ToolboxFeatureSaveAsImage = Toolbox.Feature.SaveAsImage
public typealias ToolboxFeatureBrush = Toolbox.Feature.Brush


extension Toolbox.Feature: Enumable {
    public enum Enums {
        case saveAsImage(ToolboxFeatureSaveAsImage), restore(ToolboxFeatureRestore), dataView(ToolboxFeatureDataView), dataZoom(ToolboxFeatureDataZoom), magicType(ToolboxFeatureMagicType), brush(ToolboxFeatureBrush)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .saveAsImage(saveAsImage):
                self.saveAsImage = saveAsImage
            case let .restore(restore):
                self.restore = restore
            case let .dataView(dataView):
                self.dataView = dataView
            case let .dataZoom(dataZoom):
                self.dataZoom = dataZoom
            case let .magicType(magicType):
                self.magicType = magicType
            case let .brush(brush):
                self.brush = brush
            }
        }
    }
}

extension Toolbox.Feature: Mappable {
    public func mapping(_ map: Mapper) {
        map["saveAsImage"] = saveAsImage
        map["restore"] = restore
        map["dataView"] = dataView
        map["dataZoom"] = dataZoom
        map["magicType"] = magicType
        map["brush"] = brush
    }
}


extension Toolbox: Enumable {
    public enum Enums {
        case show(Bool), orient(Orient), itemSize(Float), itemGap(Float), showTitle(Bool), feature(ToolboxFeature), iconStyle(IconStyle), zlevel(Float), z(Float), left(Position), top(Position), right(Position), bottom(Position), width(Float), height(Float)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .show(show):
                self.show = show
            case let .orient(orient):
                self.orient = orient
            case let .itemSize(itemSize):
                self.itemSize = itemSize
            case let .itemGap(itemGap):
                self.itemGap = itemGap
            case let .showTitle(showTitle):
                self.showTitle = showTitle
            case let .feature(feature):
                self.feature = feature
            case let .iconStyle(iconStyle):
                self.iconStyle = iconStyle
            case let .zlevel(zlevel):
                self.zlevel = zlevel
            case let .z(z):
                self.z = z
            case let .left(left):
                self.left = left
            case let .top(top):
                self.top = top
            case let .right(right):
                self.right = right
            case let .bottom(bottom):
                self.bottom = bottom
            case let .width(width):
                self.width = width
            case let .height(height):
                self.height = height
            }
        }
    }
}

extension Toolbox: Mappable {
    public func mapping(_ map: Mapper) {
        map["show"] = show
        map["orient"] = orient
        map["itemSize"] = itemSize
        map["itemGap"] = itemGap
        map["showTitle"] = showTitle
        map["feature"] = feature
        map["iconStyle"] = iconStyle
        map["zlevel"] = zlevel
        map["z"] = z
        map["left"] = left
        map["top"] = top
        map["right"] = right
        map["bottom"] = bottom
        map["width"] = width
        map["height"] = height
    }
}

// MARK: - Actions
public final class ToolboxRestoreAction: EchartsAction {
    public var type: EchartsActionType {
        return .restore
    }
    
    public typealias ContentEnum = EmptyEnum
    
    public convenience init(_ elements: EmptyEnum...) {
        self.init()
    }
    
    public func mapping(_ map: Mapper) {
        map["type"] = type
    }
}
