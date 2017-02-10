//
//  SECParallel.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 09/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public struct SECParallel : SECZable {
    
    public struct ParallelAxisDefault { 
        
        public struct Data {
            public var value: String?
            public var textStyle: SECTextStyle?
        }
        
        public var type: SECAxisType?
        public var name: String? 
        public var nameLocation: SECPosition? 
        public var nameTextStyle: SECTextStyle? 
        public var nameGap: Float? 
        public var nameRotate: Float? 
        public var inverse: Bool? 
        public var boundaryGap: SECBoundaryGap? 
        public var min: String? 
        public var max: String? 
        public var scale: Bool? 
        public var splitNumber: UInt8? 
        public var minInterval: UInt8? 
        public var interval: UInt?
        public var logBase: Float?
        public var silent: Bool?
        public var triggerEvent: Bool?
        public var axisLine: SECAxisLine?
        public var axisTick: SECAxisTick?
        public var axisLabel: SECAxisLabel?
        
    }
    
    public var zlevel: Float?
    public var z: Float?
    public var left: SECPosition?
    public var top: SECPosition?
    public var right: SECPosition?
    public var bottom: SECPosition?
    public var width: Float?
    public var height: Float?
    public var layout: SECOrient?
    public var axisExpandable: Bool?
    public var axisExpandCenter: Float?
    public var axisExpandCount: Float?
    public var axisExpandWidth: Float?
    public var parallelAxisDefault: ParallelAxisDefault?
}

extension SECParallel : SECEnumable {
	public enum Enums {
		case zlevel(Float), z(Float), left(SECPosition), top(SECPosition), right(SECPosition), bottom(SECPosition), width(Float), height(Float), layout(SECOrient), axisExpandable(Bool), axisExpandCenter(Float), axisExpandCount(Float), axisExpandWidth(Float), parallelAxisDefault(ParallelAxisDefault)
	}

	public typealias ContentEnum = Enums

	public init(_ elements: Enums...) {
		for ele in elements {
			switch ele {
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
				case let .layout(layout):
					self.layout = layout
				case let .axisExpandable(axisExpandable):
					self.axisExpandable = axisExpandable
				case let .axisExpandCenter(axisExpandCenter):
					self.axisExpandCenter = axisExpandCenter
				case let .axisExpandCount(axisExpandCount):
					self.axisExpandCount = axisExpandCount
				case let .axisExpandWidth(axisExpandWidth):
					self.axisExpandWidth = axisExpandWidth
				case let .parallelAxisDefault(parallelAxisDefault):
					self.parallelAxisDefault = parallelAxisDefault
			}
		}
	}
}

extension SECParallel : SECMappable {
    public func mapping(map: SECMap) {
        // TODO: 添加实现代码
    }
}
