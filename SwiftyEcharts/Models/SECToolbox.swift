//
//  SECToolbox.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 16/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

/// 工具栏。内置有导出图片，数据视图，动态类型切换，数据区域缩放，重置五个工具。
public struct SECToolbox : SECDisplayable {
    
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
    public struct Feature {
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
        /// - Note: 暂不支持
        public var brush: Brush?

    }
    
    /// 是否显示工具栏组件。
    public var show: Bool?
    /// 工具栏 icon 的布局朝向。
    public var orient: SECOrient?
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
    public var left: SECPosition?
    /// 工具栏组件离容器上侧的距离。
    ///
    /// top 的值可以是像 20 这样的具体像素值，可以是像 '20%' 这样相对于容器高宽的百分比，也可以是 'top', 'middle', 'bottom'。
    ///
    /// 如果 top 的值为'top', 'middle', 'bottom'，组件会根据相应的位置自动对齐。
    public var top: SECPosition?
    /// 工具栏组件离容器右侧的距离。
    ///
    /// right 的值可以是像 20 这样的具体像素值，可以是像 '20%' 这样相对于容器高宽的百分比。
    ///
    /// 默认自适应。
    public var right: SECPosition?
    /// 工具栏组件离容器下侧的距离。
    ///
    /// bottom 的值可以是像 20 这样的具体像素值，可以是像 '20%' 这样相对于容器高宽的百分比。
    ///
    /// 默认自适应。
    public var bottom: SECPosition?
    /// 工具栏组件的宽度。默认自适应。
    public var width: Float?
    /// 工具栏组件的高度。默认自适应。
    public var height: Float?
}

extension SECToolbox {
    public struct IconStyleContent : SECOpacitable {
        public var color: SECColor?
        public var borderColor: SECColor?
        public var borderWidth: Float?
        public var borderType: SECLineType?
        public var shadowBlur: Float?
        public var shadowColor: SECColor?
        public var shadowOffsetX: Float?
        public var shadowOffsetY: Float?
        public var opacity: Float? {
            didSet {
                validateOpacity()
            }
        }
        /// 文本位置，'left' / 'right' / 'top' / 'bottom'。
        public var textPosistion: SECPosition?
        /// 文本对齐方式，'left' / 'right'。
        public var textAlign: SECAlign?
        
        public init() { }
    }
    
    public struct IconStyle : SECEmphasisable {
        public typealias Style = IconStyleContent
        
        public var normal: Style?
        public var emphasis: Style?
        
        public init() { }
    }
}

extension SECToolbox.Feature {
    /// 保存为图片。
    public struct SaveAsImage : SECDisplayable {
        public enum Type : String, SECJsonable {
            case png = "png"
            case jpeg = "jpeg"
            
            public var jsonString: String {
                return "\"\(self.rawValue)\""
            }
        }
        
        /// 保存的图片格式。支持 'png' 和 'jpeg'。
        public var type: Type?
        /// 保存的文件名称，默认使用 title.text 作为名称。
        public var name: String?
        /// 保存的图片背景色，默认使用 backgroundColor，如果backgroundColor不存在的话会取白色。
        public var backgroundColor: SECColor?
        /// 保存为图片时忽略的组件列表，默认忽略工具栏。
        public var excludeComponents: [String]? // FIXME: 是否需要抽象
        /// 是否显示该工具。
        public var show: Bool?
        ///
        public var title: String?
        /// Icon 的 path 字符串，ECharts 3 中支持使用自定义的 svg path 作为 icon，格式参见 SVG PathData。可以从 Adobe Illustrator 等工具编辑导出。
        public var icon: String? // FIXME: 暂时还不理解
        /// icon 样式设置。
        public var iconStyle: SECToolbox.IconStyle?
        /// 保存图片的分辨率比例，默认跟容器相同大小，如果需要保存更高分辨率的，可以设置为大于 1 的值，例如 2。
        public var pixelRatio: Float?
    }
}

extension SECToolbox.Feature {
    /// 配置项还原。
    public struct Restore : SECDisplayable {
        /// 是否显示该工具。
        public var show: Bool?
        /// 标题
        public var title: String?
        /// Icon 的 path 字符串，ECharts 3 中支持使用自定义的 svg path 作为 icon，格式参见 SVG PathData。可以从 Adobe Illustrator 等工具编辑导出。
        public var icon: String? // FIXME: 暂时还不理解
        /// icon 样式设置。
        public var iconStyle: SECToolbox.IconStyle?
    }
}

extension SECToolbox.Feature {
    /// 数据视图工具，可以展现当前图表所用的数据，编辑后可以动态更新。
    public struct DataView : SECDisplayable {
        /// 是否显示该工具。
        public var show: Bool?
        /// 标题
        public var title: String?
        /// Icon 的 path 字符串，ECharts 3 中支持使用自定义的 svg path 作为 icon，格式参见 SVG PathData。可以从 Adobe Illustrator 等工具编辑导出。
        public var icon: String? // FIXME: 暂时还不理解
        /// 数据视图 icon 样式设置。
        public var iconStyle: SECToolbox.IconStyle?
        /// 是否不可编辑（只读）。
        public var readOnly: Bool?
//        public var optionToContent: String? // FIXME: 是否需要封装?
//        public var contentToOption: String? // FIXME: 是否需要封装?
        /// 数据视图上有三个话术，默认是['数据视图', '关闭', '刷新']。
        public var lang: [String]?
        /// 数据视图浮层背景色。
        public var backgroundColor: SECColor?
        /// 数据视图浮层文本输入区背景色。
        public var textareaColor: SECColor?
        /// 数据视图浮层文本输入区边框颜色。
        public var textareaBorderColor: SECColor?
        /// 文本颜色。
        public var textColor: SECColor?
        /// 按钮颜色。
        public var buttonColor: SECColor?
        /// 按钮文本颜色。
        public var buttonTextColor: SECColor?
    }
}

extension SECToolbox.Feature {
    /// 数据区域缩放。目前只支持直角坐标系的缩放。
    public struct DataZoom : SECDisplayable {
        
        /// 缩放和还原的标题文本。
        public struct Title {
            /// 缩放标题
            public var zoom: String?
            /// 还原标题
            public var back: String?
        }
        
        /// 缩放和还原的 icon path。
        public struct Icon {
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
        public var iconStyle: SECToolbox.IconStyle?
        /// 指定哪些 xAxis 被控制。如果缺省则控制所有的x轴。如果设置为 false 则不控制任何x轴。如果设置成 3 则控制 axisIndex 为 3 的x轴。如果设置为 [0, 3] 则控制 axisIndex 为 0 和 3 的x轴。
        public var xAxisIndex: UInt?
        /// 指定哪些 yAxis 被控制。如果缺省则控制所有的y轴。如果设置为 false 则不控制任何y轴。如果设置成 3 则控制 axisIndex 为 3 的y轴。如果设置为 [0, 3] 则控制 axisIndex 为 0 和 3 的y轴。
        public var yAxisIndex: UInt?
    }
}

extension SECToolbox.Feature {
    /// 动态类型切换 示例：
    ///
    ///     feature: {
    ///         magicType: {
    ///             type: ['line', 'bar', 'stack', 'tiled']
    ///         }
    ///     }
    public struct MagicType : SECDisplayable {
        
        /// 动态类型切换可启用的动态类型
        ///
        /// - line: 折线图
        /// - bar: 柱状图
        /// - stack: 堆叠模式
        /// - tiled: 平铺模式
        public enum Type : String, SECJsonable {
            case line = "line"
            case bar = "bar"
            case stack = "stack"
            case tiled = "tiled"
            
            public var jsonString: String {
                return "\"\(self.rawValue)\""
            }
        }
        
        /// 各个类型的标题文本，可以分别配置。
        public struct Title {
            public var line: String?
            public var bar: String?
            public var stack: String?
            public var tiled: String?
        }
        
        /// 各个类型的 icon path，可以分别配置。
        public struct Icon {
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

extension SECToolbox.Feature {
    /// 选框组件的控制按钮。
    ///
    /// 也可以不在这里指定，而是在 brush.toolbox 中指定。
    public struct Brush {
        /// 选框组件的控制按钮类型
        ///
        /// - rect: 开启矩形选框选择功能。
        /// - polygon: 开启任意形状选框选择功能。
        /// - lineX: 开启横向选择功能。
        /// - lineY: 开启纵向选择功能。
        /// - keep: 切换『单选』和『多选』模式。后者可支持同时画多个选框。前者支持单击清除所有选框。
        /// - clear: 清空所有选框。
        public enum Type: String, SECJsonable {
            case rect = "rect"
            case polygon = "polygon"
            case lineX = "lineX"
            case lineY = "lineY"
            case keep = "keep"
            case clear = "clear"
            
            public var jsonString: String {
                 return "\"\(self.rawValue)\""
            }
        }
        
        /// 每个按钮的 icon path。
        public struct Icon {
            public var rect: String?
            public var polygon: String?
            public var lineX: String?
            public var keep: String?
            public var clear: String?
        }
        
        /// 标题文本。
        public struct Title {
            public var rect: String?
            public var polygon: String?
            public var lineX: String?
            public var keep: String?
            public var clear: String?
        }
        
        public var type: [Type]?
        public var icon: Icon?
        public var title: Title?
    }
}


