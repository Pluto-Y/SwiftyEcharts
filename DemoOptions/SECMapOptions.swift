//
//  SECMapOptions.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 16/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import SwiftyEcharts

public struct SECMapOptions {
    
    // MARK: 模拟迁徙
    /// 地址: http://echarts.baidu.com/demo.html#geo-lines
    static func geoLinesOption() -> SECOption {
        // TODO: 添加实现
        return SECOption(
        )
    }
    
    // MARK: 65k+ 飞机航线
    /// 地址: http://echarts.baidu.com/demo.html#lines-airline
    static func linesAirlineOption() -> SECOption {
        // TODO: 添加实现
        return SECOption(
        )
    }
    
    // MARK: 北京公交路线 - 百度地图
    /// 地址: http://echarts.baidu.com/demo.html#lines-bmap-bus
    static func linesBmapBusOption() -> SECOption {
        // TODO: 添加实现
        return SECOption(
        )
    }
    
    // MARK: 北京公交路线 - 线特效
    /// 地址: http://echarts.baidu.com/demo.html#lines-bmap-effect
    static func linesBmapEffectOption() -> SECOption {
        // TODO: 添加实现
        return SECOption(
        )
    }
    
    // MARK: 杭州热门步行路线 - 百度地图
    /// 地址: http://echarts.baidu.com/demo.html#lines-bmap
    static func linesBmapOption() -> SECOption {
        // TODO: 添加实现
        return SECOption(
        )
    }
    
    // MARK: iPhone销量
    /// 地址: http://echarts.baidu.com/demo.html#map-china-dataRange
    static func mapChinaDataRangeOption() -> SECOption {
        let serieTemplate = SECMapSerie(
            .map("china"),
            .label(SECLabel(
                .normal(SECCommonLabelStyle(.show(true))),
                .emphasis(SECCommonLabelStyle(.show(true)))
                ))
        )
        
        var iphone3Data = serieTemplate
        iphone3Data.name = "iphone3"
        iphone3Data.roam = .disable
        iphone3Data.data = [
            SECMapSerieData(.name("北京"), .value(Float(arc4random_uniform(1000)))),
            SECMapSerieData(.name("天津"), .value(Float(arc4random_uniform(1000)))),
            SECMapSerieData(.name("上海"), .value(Float(arc4random_uniform(1000)))),
            SECMapSerieData(.name("重庆"), .value(Float(arc4random_uniform(1000)))),
            SECMapSerieData(.name("河北"), .value(Float(arc4random_uniform(1000)))),
            SECMapSerieData(.name("河南"), .value(Float(arc4random_uniform(1000)))),
            SECMapSerieData(.name("云南"), .value(Float(arc4random_uniform(1000)))),
            SECMapSerieData(.name("辽宁"), .value(Float(arc4random_uniform(1000)))),
            SECMapSerieData(.name("黑龙江"), .value(Float(arc4random_uniform(1000)))),
            SECMapSerieData(.name("湖南"), .value(Float(arc4random_uniform(1000)))),
            SECMapSerieData(.name("安徽"), .value(Float(arc4random_uniform(1000)))),
            SECMapSerieData(.name("山东"), .value(Float(arc4random_uniform(1000)))),
            SECMapSerieData(.name("新疆"), .value(Float(arc4random_uniform(1000)))),
            SECMapSerieData(.name("江苏"), .value(Float(arc4random_uniform(1000)))),
            SECMapSerieData(.name("浙江"), .value(Float(arc4random_uniform(1000)))),
            SECMapSerieData(.name("江西"), .value(Float(arc4random_uniform(1000)))),
            SECMapSerieData(.name("湖北"), .value(Float(arc4random_uniform(1000)))),
            SECMapSerieData(.name("广西"), .value(Float(arc4random_uniform(1000)))),
            SECMapSerieData(.name("甘肃"), .value(Float(arc4random_uniform(1000)))),
            SECMapSerieData(.name("山西"), .value(Float(arc4random_uniform(1000)))),
            SECMapSerieData(.name("内蒙古"), .value(Float(arc4random_uniform(1000)))),
            SECMapSerieData(.name("陕西"), .value(Float(arc4random_uniform(1000)))),
            SECMapSerieData(.name("吉林"), .value(Float(arc4random_uniform(1000)))),
            SECMapSerieData(.name("福建"), .value(Float(arc4random_uniform(1000)))),
            SECMapSerieData(.name("贵州"), .value(Float(arc4random_uniform(1000)))),
            SECMapSerieData(.name("广东"), .value(Float(arc4random_uniform(1000)))),
            SECMapSerieData(.name("青海"), .value(Float(arc4random_uniform(1000)))),
            SECMapSerieData(.name("西藏"), .value(Float(arc4random_uniform(1000)))),
            SECMapSerieData(.name("四川"), .value(Float(arc4random_uniform(1000)))),
            SECMapSerieData(.name("宁夏"), .value(Float(arc4random_uniform(1000)))),
            SECMapSerieData(.name("海南"), .value(Float(arc4random_uniform(1000)))),
            SECMapSerieData(.name("台湾"), .value(Float(arc4random_uniform(1000)))),
            SECMapSerieData(.name("香港"), .value(Float(arc4random_uniform(1000)))),
            SECMapSerieData(.name("澳门"), .value(Float(arc4random_uniform(1000))))
        ]
        
        var iphone4Data = serieTemplate
        iphone4Data.name = "iphone4"
        iphone4Data.data = [
            SECMapSerieData(.name("北京"), .value(Float(arc4random_uniform(1000)))),
            SECMapSerieData(.name("天津"), .value(Float(arc4random_uniform(1000)))),
            SECMapSerieData(.name("上海"), .value(Float(arc4random_uniform(1000)))),
            SECMapSerieData(.name("重庆"), .value(Float(arc4random_uniform(1000)))),
            SECMapSerieData(.name("河北"), .value(Float(arc4random_uniform(1000)))),
            SECMapSerieData(.name("安徽"), .value(Float(arc4random_uniform(1000)))),
            SECMapSerieData(.name("新疆"), .value(Float(arc4random_uniform(1000)))),
            SECMapSerieData(.name("浙江"), .value(Float(arc4random_uniform(1000)))),
            SECMapSerieData(.name("江西"), .value(Float(arc4random_uniform(1000)))),
            SECMapSerieData(.name("山西"), .value(Float(arc4random_uniform(1000)))),
            SECMapSerieData(.name("内蒙古"), .value(Float(arc4random_uniform(1000)))),
            SECMapSerieData(.name("吉林"), .value(Float(arc4random_uniform(1000)))),
            SECMapSerieData(.name("福建"), .value(Float(arc4random_uniform(1000)))),
            SECMapSerieData(.name("广东"), .value(Float(arc4random_uniform(1000)))),
            SECMapSerieData(.name("西藏"), .value(Float(arc4random_uniform(1000)))),
            SECMapSerieData(.name("四川"), .value(Float(arc4random_uniform(1000)))),
            SECMapSerieData(.name("宁夏"), .value(Float(arc4random_uniform(1000)))),
            SECMapSerieData(.name("香港"), .value(Float(arc4random_uniform(1000)))),
            SECMapSerieData(.name("澳门"), .value(Float(arc4random_uniform(1000))))

        ]
        
        var iphone5Data = serieTemplate
        iphone5Data.name = "iphone5"
        iphone5Data.data = [
            SECMapSerieData(.name("北京"), .value(Float(arc4random_uniform(1000)))),
            SECMapSerieData(.name("天津"), .value(Float(arc4random_uniform(1000)))),
            SECMapSerieData(.name("上海"), .value(Float(arc4random_uniform(1000)))),
            SECMapSerieData(.name("广东"), .value(Float(arc4random_uniform(1000)))),
            SECMapSerieData(.name("台湾"), .value(Float(arc4random_uniform(1000)))),
            SECMapSerieData(.name("香港"), .value(Float(arc4random_uniform(1000)))),
            SECMapSerieData(.name("澳门"), .value(Float(arc4random_uniform(1000))))

        ]
        
        return SECOption(
            .title(SECTitle(
                .text("iphone销量"),
                .subtext("纯属虚构"),
                .left(.center)
                )),
            .tooltip(SECTooltip(
                .trigger(.item)
                )),
            .legend(SECLegend(
                .orient(.vertical),
                .left(.left),
                .data(["iphone3","iphone4","iphone5"])
                )),
            .visualMap(SECContinuousVisualMap(
                .min(0),
                .max(2500),
                .left(.left),
                .top(.bottom),
                .text(["高", "低"]),
                .calculable(true)
                )),
            .toolbox(SECToolbox(
                .show(true),
                .orient(.vertical),
                .left(.right),
                .top(.center),
                .feature(SECTFeature(
                    .dataView(SECTFDataView(.readOnly(false))),
                    .restore(SECTFRestore()),
                    .saveAsImage(SECTFSaveAsImage())
                    ))
                )),
            .series([
                iphone3Data,
                iphone4Data,
                iphone5Data
                ])
        )
    }

    // MARK: Map China
    /// 地址: http://echarts.baidu.com/demo.html#map-china
    static func mapChinaOption() -> SECOption {
        return SECOption(
            .tooltip(SECTooltip(
                .trigger(.item),
                .formatter(.string("{b}"))
                )),
            .series([
                SECMapSerie(
                    .name("中国"),
                    .map("china2"),
                    .selectedMode(.multiple),
                    .label(SECLabel(
                        .normal(SECCommonLabelStyle(.show(true))),
                        .emphasis(SECCommonLabelStyle(.show(true)))
                        )),
                    .data([
                        SECMapSerieData(
                            .name("广东"),
                            .selected(true))
                            ])
                )
                ])
        )
    }
    
    // MARK: 香港18区人口密度 （2011）
    /// 地址: http://echarts.baidu.com/demo.html#map-HK
    static func mapHKOption() -> SECOption {
        // TODO: 添加实现
        return SECOption(
        )
    }
    
    // MARK: Map Locate
    /// 地址: http://echarts.baidu.com/demo.html#map-locate
    static func mapLocateOption() -> SECOption {
        // TODO: 添加实现
        return SECOption(
        )
    }
    
    // MARK: 34 省切换查看
    /// 地址: http://echarts.baidu.com/demo.html#map-province
    static func mapProvinceOption() -> SECOption {
        // TODO: 添加实现
        return SECOption(
        )
    }
    
    // MARK: USA Population Estimates (2012)
    /// 地址: http://echarts.baidu.com/demo.html#map-usa
    static func mapUsaOption() -> SECOption {
        // TODO: 添加实现
        return SECOption(
        )
    }
    
    // MARK: World Population (2010)
    /// 地址: http://echarts.baidu.com/demo.html#map-world-dataRange
    static func mapWorldDataRangeOption() -> SECOption {
        // TODO: 添加实现
        return SECOption(
        )
    }
    
    // MARK: map and scatter share a geo
    /// 地址: http://echarts.baidu.com/demo.html#geo-map-scatter
    static func geoMapScatterOption() -> SECOption {
        // TODO: 添加实现
        return SECOption(
        )
    }
    
    // MARK: Map World
    /// 地址: http://echarts.baidu.com/demo.html#map-world
    static func mapWorldOption() -> SECOption {
        // TODO: 添加实现
        return SECOption(
        )
    }
    
}
