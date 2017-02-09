//
//  SECGeo.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 09/02/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

public struct SECGeo : SECDisplayable, SECZable {
    public struct ScaleLimit {
        public var min: Float?
        public var max: Float?
    }
    public struct Region {
        public var name: String?
        public var selected: Bool?
        public var itemStyle: SECItemStyle?
        public var label: SECLabel?
    }
    public var show: Bool?
    public var map: String?
    public var roam: Bool?
    public var center: [Float]?
    public var aspectScale: Float?
    public var zoom: Float?
    public var scaleLimit: ScaleLimit?
    public var nameMap: String?
    public var selectedMode: SECSelectedMode?
    public var label: SECLabel?
    public var itemStyle: SECItemStyle?
    public var zlevel: Float?
    public var z: Float?
    public var left: SECPosition?
    public var top: SECPosition?
    public var right: SECPosition?
    public var bottom: SECPosition?
    public var layoutCenter: String?
    public var layoutSize: String?
    public var regions: [Region]?
    public var silent: Bool?
}

extension SECGeo : SECMappable {
    public func mapping(map: SECMap) {
        // TODO: 添加实现代码
    }
}
