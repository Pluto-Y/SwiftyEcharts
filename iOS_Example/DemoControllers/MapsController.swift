//
//  MapsController.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 15/03/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import UIKit

class MapsController: BaseDemoController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        menus = ["模拟迁徙(暂缺)", "65k+ 飞机航线(暂缺)", "北京公交路线 - 百度地图(暂缺)", "北京公交路线 - 线特效(暂缺)", "杭州热门步行路线 - 百度地图(暂缺)", "iPhone销量", "Map China", "香港18区人口密度 （2011）(暂缺)", "Map Locate(暂缺)", "34 省切换查看(暂缺)", "USA Population Estimates (2012)(暂缺)", "World Population (2010)(暂缺)", "map and scatter share a geo(暂缺)", "Map World"]
        
        optionClosures = [SECMapOptions.geoLinesOption, SECMapOptions.linesAirlineOption, SECMapOptions.linesBmapBusOption, SECMapOptions.linesBmapEffectOption, SECMapOptions.linesBmapOption, SECMapOptions.mapChinaDataRangeOption, SECMapOptions.mapChinaOption, SECMapOptions.mapHKOption, SECMapOptions.mapLocateOption, SECMapOptions.mapProvinceOption, SECMapOptions.mapUsaOption, SECMapOptions.mapWorldDataRangeOption, SECMapOptions.geoMapScatterOption, SECMapOptions.mapWorldOption]
        
        self.title = "地图"
        
    }

    

}
