//
//  ParallelAxis.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 09/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//
    
public final class ParallelAxis {

    /// 在坐标轴上可以进行框选，这里是一些框选的设置。
    public final class AreaSelectedStyle: Colorful, Opacitable {
        /// 框选范围的宽度。
        public var width: Float?
        /// 选框的边框宽度。
        public var borderWidth: Float?
        /// 选框的边框颜色。
        public var borderColor: Color?
        /// 选框的填充色。
        public var color: Color?
        /// 选框的透明度。
        public var opacity: Float?
    }
    
    public typealias NameLocation = Location
    
    /// 坐标轴的维度序号。
    ///
    /// 例如 series-parallel.data 中有如下数据：
    ///
    ///     [
    ///         [1,  55,  9,   56,  0.46,  18,  6,  '良'],
    ///         [2,  25,  11,  21,  0.65,  34,  9,  '优'],
    ///         [3,  56,  7,   63,  0.3,   14,  5,  '良'],
    ///         [4,  33,  7,   29,  0.33,  16,  6,  '优'],
    ///         { // 数据项也可以是 Object，从而里面能含有对线条的特殊设置。
    ///             value: [5,  42,  24,  44,  0.76,  40,  16, '优']
    ///             lineStyle: {...},
    ///         }
    ///         ...
    ///     ]
    ///
    /// 数据中，每一行是一个『数据项』，每一列属于一个『维度』。（例如上面数据每一列的含义分别是：『日期』,『AQI指数』, 『PM2.5』, 『PM10』, 『一氧化碳值』, 『二氧化氮值』, 『二氧化硫值』）。
    ///
    /// dim 定义了数据的哪个维度（即哪个『列』）会对应到此坐标轴上。
    ///
    /// 从 0 开始计数。例如，假设坐标轴的 dim 为 1，则表示数据中的第二列会对应到此坐标轴上。
    public var dim: Float?
    /// 用于定义『坐标轴』对应到哪个『坐标系』中。
    ///
    /// 比如有如下配置：
    ///     myChart.setOption({
    ///         parallel: [
    ///             {...},                      // 第一个平行坐标系
    ///             {...}                       // 第二个平行坐标系
    ///         ],
    ///         parallelAxis: [
    ///             {parallelIndex: 1, ...},    // 第一个坐标轴，对应到第二个平行坐标系
    ///             {parallelIndex: 0, ...},    // 第二个坐标轴，对应到第一个平行坐标系
    ///             {parallelIndex: 1, ...},    // 第三个坐标轴，对应到第二个平行坐标系
    ///             {parallelIndex: 0, ...}     // 第四个坐标轴，对应到第一个平行坐标系
    ///         ],
    ///         ...
    ///     });
    ///
    /// 只有一个平行坐标系时可不用设置，自动取默认值 0。
    public var parallelIndex: UInt8?
    /// 是否坐标轴刷选的时候，实时刷新视图。如果设为 false，则在刷选动作结束时候，才刷新视图。
    ///
    /// 大数据量时，建议设置成 false，从而避免卡顿。
    public var realtime: Bool?
    /// 在坐标轴上可以进行框选，这里是一些框选的设置。
    public var areaSelectedStyle: AreaSelectedStyle?
    /// 坐标轴类型。
    public var type: AxisType?
    /// 坐标轴名称。
    public var name: String?
    /// 坐标轴名称的文字样式。
    public var nameTextStyle: TextStyle?
    /// 坐标轴名称显示位置
    public var nameLocation: NameLocation?
    /// 坐标轴名称与轴线之间的距离。
    public var nameGap: Float?
    /// 坐标轴名字旋转，角度值。
    public var nameRotate: Float?
    /// 是否是反向坐标轴。ECharts 3 中新加。
    public var inverse: Bool?
    /// 坐标轴两边留白策略，类目轴和非类目轴的设置和表现不一样。
    ///
    /// 类目轴中 boundaryGap 可以配置为 true 和 false。默认为 true，这时候刻度只是作为分隔线，标签和数据点都会在两个刻度之间的带(band)中间。
    ///
    /// 非类目轴，包括时间，数值，对数轴，boundaryGap是一个两个值的数组，分别表示数据最小值和最大值的延伸范围，可以直接设置数值或者相对的百分比，在设置 min 和 max 后无效。 示例：
    ///
    /// boundaryGap: ['20%', '20%']
    public var boundaryGap: BoundaryGap?
    /// 坐标轴刻度最小值。
    ///
    /// 可以设置成特殊值 'dataMin'，此时取数据在该轴上的最小值作为最小刻度。
    ///
    /// 不设置时会自动计算最小值保证坐标轴刻度的均匀分布。
    ///
    /// 在类目轴中，也可以设置为类目的序数（如类目轴 data: ['类A', '类B', '类C'] 中，序数 2 表示 '类C'。也可以设置为负数，如 -3）。
    public var min: Float?
    /// 坐标轴刻度最大值。
    ///
    /// 可以设置成特殊值 'dataMax'，此时取数据在该轴上的最大值作为最大刻度。
    ///
    /// 不设置时会自动计算最大值保证坐标轴刻度的均匀分布。
    ///
    /// 在类目轴中，也可以设置为类目的序数（如类目轴 data: ['类A', '类B', '类C'] 中，序数 2 表示 '类C'。也可以设置为负数，如 -3）。
    public var max: Float?
    /// 只在数值轴中（type: 'value'）有效。
    ///
    /// 是否是脱离 0 值比例。设置成 true 后坐标刻度不会强制包含零刻度。在双数值轴的散点图中比较有用。
    ///
    /// 在设置 min 和 max 之后该配置项无效。
    public var scale: Bool?
    /// 坐标轴的分割段数，需要注意的是这个分割段数只是个预估值，最后实际显示的段数会在这个基础上根据分割后坐标轴刻度显示的易读程度作调整。
    ///
    /// 在类目轴中无效。
    public var splitNumber: UInt8?
    /// 自动计算的坐标轴最小间隔大小。
    ///
    /// 例如可以设置成1保证坐标轴分割刻度显示成整数。
    /// 
    ///     {
    ///         minInterval: 1
    ///     }
    ///
    /// 只在数值轴中（type: 'value'）有效。
    public var minInterval: UInt8?
    /// 强制设置坐标轴分割间隔。
    ///
    /// 因为 splitNumber 是预估的值，实际根据策略计算出来的刻度可能无法达到想要的效果，这时候可以使用 interval 配合 min、max 强制设定刻度划分，一般不建议使用。
    ///
    /// 无法在类目轴中使用。在时间轴（type: 'time'）中需要传时间戳，在对数轴（type: 'log'）中需要传指数值。
    public var interval: Int?
    /// 对数轴的底数，只在对数轴中（type: 'log'）有效。
    public var logBase: Float?
    /// 坐标轴是否是静态无法交互。
    public var silent: Bool?
    /// 坐标轴的标签是否响应和触发鼠标事件，默认不响应。
    ///
    /// 事件参数如下：
    ///
    ///     {
    ///         // 组件类型，xAxis, yAxis, radiusAxis, angleAxis
    ///         // 对应组件类型都会有一个属性表示组件的 index，例如 xAxis 就是 xAxisIndex
    ///         componentType: string,
    ///         // 未格式化过的刻度值, 点击刻度标签有效
    ///         value: '',
    ///         // 坐标轴名称, 点击坐标轴名称有效
    ///         name: ''
    ///     }
    public var triggerEvent: Bool?
    /// 坐标轴轴线相关设置。
    public var axisLine: AxisLine?
    /// 坐标轴刻度相关设置。
    public var axisTick: AxisTick?
    /// 坐标轴刻度标签的相关设置。
    public var axisLabel: AxisLabel?
    /// 类目数据，在类目轴（type: 'category'）中有效。
    ///
    /// 示例：
    ///     // 所有类目名称列表
    ///     data: ['周一', '周二', '周三', '周四', '周五', '周六', '周日']
    ///     // 每一项也可以是具体的配置项，此时取配置项中的 `value` 为类目名
    ///     data: [{
    ///         value: '周一',
    ///         // 突出周一
    ///         textStyle: {
    ///             fontSize: 20,
    ///             color: 'red'
    ///         }
    ///     }, '周二', '周三', '周四', '周五', '周六', '周日']
    public var data: [Jsonable]?
}

extension ParallelAxis.AreaSelectedStyle: Enumable {
    public enum Enums {
        case width(Float), borderWidth(Float), borderColor(Color), color(Color), opacity(Float)
    }
    
    public typealias ContentEnum = Enums
    
    public convenience init(_ elements: Enums...) {
        self.init()
        for ele in elements {
            switch ele {
            case let .width(width):
                self.width = width
            case let .borderWidth(borderWidth):
                self.borderWidth = borderWidth
            case let .borderColor(borderColor):
                self.borderColor = borderColor
            case let .color(color):
                self.color = color
            case let .opacity(opacity):
                self.opacity = opacity
            }
        }
    }
}

extension ParallelAxis.AreaSelectedStyle: Mappable {
    public func mapping(_ map: Mapper) {
        map["width"] = width
        map["borderWidth"] = borderWidth
        map["borderColor"] = borderColor
        map["color"] = color
        map["opacity"] = opacity
    }
}

extension ParallelAxis: Enumable {
	public enum Enums {
		case dim(Float), parallelIndex(UInt8), realtime(Bool), areaSelectedStyle(AreaSelectedStyle), type(AxisType), name(String), nameTextStyle(TextStyle), nameLocation(NameLocation), nameGap(Float), nameRotate(Float), inverse(Bool), boundaryGap(BoundaryGap), min(Float), max(Float), scale(Bool), splitNumber(UInt8), minInterval(UInt8), interval(Int), logBase(Float), silent(Bool), triggerEvent(Bool), axisLine(AxisLine), axisTick(AxisTick), axisLabel(AxisLabel), data([Jsonable])
	}

	public typealias ContentEnum = Enums

	public convenience init(_ elements: Enums...) {
        self.init()
		for ele in elements {
			switch ele {
				case let .dim(dim):
					self.dim = dim
				case let .parallelIndex(parallelIndex):
					self.parallelIndex = parallelIndex
				case let .realtime(realtime):
					self.realtime = realtime
				case let .areaSelectedStyle(areaSelectedStyle):
					self.areaSelectedStyle = areaSelectedStyle
				case let .type(type):
					self.type = type
				case let .name(name):
					self.name = name
				case let .nameTextStyle(nameTextStyle):
					self.nameTextStyle = nameTextStyle
				case let .nameLocation(nameLocation):
					self.nameLocation = nameLocation
				case let .nameGap(nameGap):
					self.nameGap = nameGap
				case let .nameRotate(nameRotate):
					self.nameRotate = nameRotate
				case let .inverse(inverse):
					self.inverse = inverse
				case let .boundaryGap(boundaryGap):
					self.boundaryGap = boundaryGap
				case let .min(min):
					self.min = min
				case let .max(max):
					self.max = max
				case let .scale(scale):
					self.scale = scale
				case let .splitNumber(splitNumber):
					self.splitNumber = splitNumber
				case let .minInterval(minInterval):
					self.minInterval = minInterval
				case let .interval(interval):
					self.interval = interval
				case let .logBase(logBase):
					self.logBase = logBase
				case let .silent(silent):
					self.silent = silent
				case let .triggerEvent(triggerEvent):
					self.triggerEvent = triggerEvent
				case let .axisLine(axisLine):
					self.axisLine = axisLine
				case let .axisTick(axisTick):
					self.axisTick = axisTick
				case let .axisLabel(axisLabel):
					self.axisLabel = axisLabel
				case let .data(data):
					self.data = data
			}
		}
	}
}

extension ParallelAxis: Mappable {
	public func mapping(_ map: Mapper) {
		map["dim"] = dim
		map["parallelIndex"] = parallelIndex
		map["realtime"] = realtime
		map["areaSelectedStyle"] = areaSelectedStyle
		map["type"] = type
		map["name"] = name
		map["nameTextStyle"] = nameTextStyle
		map["nameLocation"] = nameLocation
		map["nameGap"] = nameGap
		map["nameRotate"] = nameRotate
		map["inverse"] = inverse
		map["boundaryGap"] = boundaryGap
		map["min"] = min
		map["max"] = max
		map["scale"] = scale
		map["splitNumber"] = splitNumber
		map["minInterval"] = minInterval
		map["interval"] = interval
		map["logBase"] = logBase
		map["silent"] = silent
		map["triggerEvent"] = triggerEvent
		map["axisLine"] = axisLine
		map["axisTick"] = axisTick
		map["axisLabel"] = axisLabel
		map["data"] = data
	}
}
