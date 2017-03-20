//
//  MapOptions.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 16/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import SwiftyEcharts

public struct MapOptions {
    
    // MARK: 模拟迁徙
    /// 地址: http://echarts.baidu.com/demo.html#geo-lines
    static func geoLinesOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
    
    // MARK: 65k+ 飞机航线
    /// 地址: http://echarts.baidu.com/demo.html#lines-airline
    static func linesAirlineOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
    
    // MARK: 北京公交路线 - 百度地图
    /// 地址: http://echarts.baidu.com/demo.html#lines-bmap-bus
    static func linesBmapBusOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
    
    // MARK: 北京公交路线 - 线特效
    /// 地址: http://echarts.baidu.com/demo.html#lines-bmap-effect
    static func linesBmapEffectOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
    
    // MARK: 杭州热门步行路线 - 百度地图
    /// 地址: http://echarts.baidu.com/demo.html#lines-bmap
    static func linesBmapOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
    
    // MARK: iPhone销量
    /// 地址: http://echarts.baidu.com/demo.html#map-china-dataRange
    static func mapChinaDataRangeOption() -> Option {
        let serieTemplate = MapSerie(
            .map("china"),
            .label(Label(
                .normal(CommonLabelStyle(.show(true))),
                .emphasis(CommonLabelStyle(.show(true)))
                ))
        )
        
        var iphone3Data = serieTemplate
        iphone3Data.name = "iphone3"
        iphone3Data.roam = .disable
        iphone3Data.data = [
            MapSerieData(.name("北京"), .value(Float(arc4random_uniform(1000)))),
            MapSerieData(.name("天津"), .value(Float(arc4random_uniform(1000)))),
            MapSerieData(.name("上海"), .value(Float(arc4random_uniform(1000)))),
            MapSerieData(.name("重庆"), .value(Float(arc4random_uniform(1000)))),
            MapSerieData(.name("河北"), .value(Float(arc4random_uniform(1000)))),
            MapSerieData(.name("河南"), .value(Float(arc4random_uniform(1000)))),
            MapSerieData(.name("云南"), .value(Float(arc4random_uniform(1000)))),
            MapSerieData(.name("辽宁"), .value(Float(arc4random_uniform(1000)))),
            MapSerieData(.name("黑龙江"), .value(Float(arc4random_uniform(1000)))),
            MapSerieData(.name("湖南"), .value(Float(arc4random_uniform(1000)))),
            MapSerieData(.name("安徽"), .value(Float(arc4random_uniform(1000)))),
            MapSerieData(.name("山东"), .value(Float(arc4random_uniform(1000)))),
            MapSerieData(.name("新疆"), .value(Float(arc4random_uniform(1000)))),
            MapSerieData(.name("江苏"), .value(Float(arc4random_uniform(1000)))),
            MapSerieData(.name("浙江"), .value(Float(arc4random_uniform(1000)))),
            MapSerieData(.name("江西"), .value(Float(arc4random_uniform(1000)))),
            MapSerieData(.name("湖北"), .value(Float(arc4random_uniform(1000)))),
            MapSerieData(.name("广西"), .value(Float(arc4random_uniform(1000)))),
            MapSerieData(.name("甘肃"), .value(Float(arc4random_uniform(1000)))),
            MapSerieData(.name("山西"), .value(Float(arc4random_uniform(1000)))),
            MapSerieData(.name("内蒙古"), .value(Float(arc4random_uniform(1000)))),
            MapSerieData(.name("陕西"), .value(Float(arc4random_uniform(1000)))),
            MapSerieData(.name("吉林"), .value(Float(arc4random_uniform(1000)))),
            MapSerieData(.name("福建"), .value(Float(arc4random_uniform(1000)))),
            MapSerieData(.name("贵州"), .value(Float(arc4random_uniform(1000)))),
            MapSerieData(.name("广东"), .value(Float(arc4random_uniform(1000)))),
            MapSerieData(.name("青海"), .value(Float(arc4random_uniform(1000)))),
            MapSerieData(.name("西藏"), .value(Float(arc4random_uniform(1000)))),
            MapSerieData(.name("四川"), .value(Float(arc4random_uniform(1000)))),
            MapSerieData(.name("宁夏"), .value(Float(arc4random_uniform(1000)))),
            MapSerieData(.name("海南"), .value(Float(arc4random_uniform(1000)))),
            MapSerieData(.name("台湾"), .value(Float(arc4random_uniform(1000)))),
            MapSerieData(.name("香港"), .value(Float(arc4random_uniform(1000)))),
            MapSerieData(.name("澳门"), .value(Float(arc4random_uniform(1000))))
        ]
        
        var iphone4Data = serieTemplate
        iphone4Data.name = "iphone4"
        iphone4Data.data = [
            MapSerieData(.name("北京"), .value(Float(arc4random_uniform(1000)))),
            MapSerieData(.name("天津"), .value(Float(arc4random_uniform(1000)))),
            MapSerieData(.name("上海"), .value(Float(arc4random_uniform(1000)))),
            MapSerieData(.name("重庆"), .value(Float(arc4random_uniform(1000)))),
            MapSerieData(.name("河北"), .value(Float(arc4random_uniform(1000)))),
            MapSerieData(.name("安徽"), .value(Float(arc4random_uniform(1000)))),
            MapSerieData(.name("新疆"), .value(Float(arc4random_uniform(1000)))),
            MapSerieData(.name("浙江"), .value(Float(arc4random_uniform(1000)))),
            MapSerieData(.name("江西"), .value(Float(arc4random_uniform(1000)))),
            MapSerieData(.name("山西"), .value(Float(arc4random_uniform(1000)))),
            MapSerieData(.name("内蒙古"), .value(Float(arc4random_uniform(1000)))),
            MapSerieData(.name("吉林"), .value(Float(arc4random_uniform(1000)))),
            MapSerieData(.name("福建"), .value(Float(arc4random_uniform(1000)))),
            MapSerieData(.name("广东"), .value(Float(arc4random_uniform(1000)))),
            MapSerieData(.name("西藏"), .value(Float(arc4random_uniform(1000)))),
            MapSerieData(.name("四川"), .value(Float(arc4random_uniform(1000)))),
            MapSerieData(.name("宁夏"), .value(Float(arc4random_uniform(1000)))),
            MapSerieData(.name("香港"), .value(Float(arc4random_uniform(1000)))),
            MapSerieData(.name("澳门"), .value(Float(arc4random_uniform(1000))))

        ]
        
        var iphone5Data = serieTemplate
        iphone5Data.name = "iphone5"
        iphone5Data.data = [
            MapSerieData(.name("北京"), .value(Float(arc4random_uniform(1000)))),
            MapSerieData(.name("天津"), .value(Float(arc4random_uniform(1000)))),
            MapSerieData(.name("上海"), .value(Float(arc4random_uniform(1000)))),
            MapSerieData(.name("广东"), .value(Float(arc4random_uniform(1000)))),
            MapSerieData(.name("台湾"), .value(Float(arc4random_uniform(1000)))),
            MapSerieData(.name("香港"), .value(Float(arc4random_uniform(1000)))),
            MapSerieData(.name("澳门"), .value(Float(arc4random_uniform(1000))))

        ]
        
        return Option(
            .title(Title(
                .text("iphone销量"),
                .subtext("纯属虚构"),
                .left(.center)
                )),
            .tooltip(Tooltip(
                .trigger(.item)
                )),
            .legend(Legend(
                .orient(.vertical),
                .left(.left),
                .data(["iphone3","iphone4","iphone5"])
                )),
            .visualMap(ContinuousVisualMap(
                .min(0),
                .max(2500),
                .left(.left),
                .top(.bottom),
                .text(["高", "低"]),
                .calculable(true)
                )),
            .toolbox(Toolbox(
                .show(true),
                .orient(.vertical),
                .left(.right),
                .top(.center),
                .feature(ToolboxFeature(
                    .dataView(ToolboxFeatureDataView(.readOnly(false))),
                    .restore(ToolboxFeatureRestore()),
                    .saveAsImage(ToolboxFeatureSaveAsImage())
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
    static func mapChinaOption() -> Option {
        return Option(
            .tooltip(Tooltip(
                .trigger(.item),
                .formatter(.string("{b}"))
                )),
            .series([
                MapSerie(
                    .name("中国"),
                    .map("china2"),
                    .selectedMode(.multiple),
                    .label(Label(
                        .normal(CommonLabelStyle(.show(true))),
                        .emphasis(CommonLabelStyle(.show(true)))
                        )),
                    .data([
                        MapSerieData(
                            .name("广东"),
                            .selected(true))
                            ])
                )
                ])
        )
    }
    
    // MARK: 香港18区人口密度 （2011）
    /// 地址: http://echarts.baidu.com/demo.html#map-HK
    static func mapHKOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
    
    // MARK: Map Locate
    /// 地址: http://echarts.baidu.com/demo.html#map-locate
    static func mapLocateOption() -> Option {
        return Option(
            .tooltip(Tooltip(
                .trigger(.item),
                .formatter(.string("{b}"))
                )),
            .series([
                MapSerie(
                    .name("中国"),
                    .map("china"),
                    .selectedMode(.multiple),
                    .label(Label(
                        .normal(CommonLabelStyle(
                            .show(true)
                            )),
                        .emphasis(CommonLabelStyle(
                            .show(true)
                            ))
                    ))
                )
                ])
        )
    }
    
    // MARK: 34 省切换查看
    /// 地址: http://echarts.baidu.com/demo.html#map-province
    static func mapProvinceOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
    
    // MARK: USA Population Estimates (2012)
    /// 地址: http://echarts.baidu.com/demo.html#map-usa
    static func mapUsaOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
    
    // MARK: World Population (2010)
    /// 地址: http://echarts.baidu.com/demo.html#map-world-dataRange
    static func mapWorldDataRangeOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
    
    // MARK: map and scatter share a geo
    /// 地址: http://echarts.baidu.com/demo.html#geo-map-scatter
    static func geoMapScatterOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
    
    // MARK: Map World
    /// 地址: http://echarts.baidu.com/demo.html#map-world
    static func mapWorldOption() -> Option {
        return Option(
            .tooltip(Tooltip(
                .trigger(.item),
                .formatter(.string("{b}"))
                )),
            .geo(Geo(
//                .name("世界地图"), // FIXME: name 和 type 好像没起作用
//                .type(.map)
                .map("world"),
                .roam(true),
                .selectedMode(.single),
                .label(FormattedLabel(
                    .normal(FormattedLabelStyle(
                        .show(false),
                        .formatter(.function("function (params) { var nameMap = { 'Afghanistan':'阿富汗', 'Angola':'安哥拉', 'Albania':'阿尔巴尼亚', 'United Arab Emirates':'阿联酋', 'Argentina':'阿根廷', 'Armenia':'亚美尼亚', 'French Southern and Antarctic Lands':'法属南半球和南极领地', 'Australia':'澳大利亚', 'Austria':'奥地利', 'Azerbaijan':'阿塞拜疆', 'Burundi':'布隆迪', 'Belgium':'比利时', 'Benin':'贝宁', 'Burkina Faso':'布基纳法索', 'Bangladesh':'孟加拉国', 'Bulgaria':'保加利亚', 'The Bahamas':'巴哈马', 'Bosnia and Herzegovina':'波斯尼亚和黑塞哥维那', 'Belarus':'白俄罗斯', 'Belize':'伯利兹', 'Bermuda':'百慕大', 'Bolivia':'玻利维亚', 'Brazil':'巴西', 'Brunei':'文莱', 'Bhutan':'不丹', 'Botswana':'博茨瓦纳', 'Central African Republic':'中非共和国', 'Canada':'加拿大', 'Switzerland':'瑞士', 'Chile':'智利', 'China':'中国', 'Ivory Coast':'象牙海岸', 'Cameroon':'喀麦隆', 'Democratic Republic of the Congo':'刚果民主共和国', 'Republic of the Congo':'刚果共和国', 'Colombia':'哥伦比亚', 'Costa Rica':'哥斯达黎加', 'Cuba':'古巴', 'Northern Cyprus':'北塞浦路斯', 'Cyprus':'塞浦路斯', 'Czech Republic':'捷克共和国', 'Germany':'德国', 'Djibouti':'吉布提', 'Denmark':'丹麦', 'Dominican Republic':'多明尼加共和国', 'Algeria':'阿尔及利亚', 'Ecuador':'厄瓜多尔', 'Egypt':'埃及', 'Eritrea':'厄立特里亚', 'Spain':'西班牙', 'Estonia':'爱沙尼亚', 'Ethiopia':'埃塞俄比亚', 'Finland':'芬兰', 'Fiji':'斐', 'Falkland Islands':'福克兰群岛', 'France':'法国', 'Gabon':'加蓬', 'United Kingdom':'英国', 'Georgia':'格鲁吉亚', 'Ghana':'加纳', 'Guinea':'几内亚', 'Gambia':'冈比亚', 'Guinea Bissau':'几内亚比绍', 'Equatorial Guinea':'赤道几内亚', 'Greece':'希腊', 'Greenland':'格陵兰', 'Guatemala':'危地马拉', 'French Guiana':'法属圭亚那', 'Guyana':'圭亚那', 'Honduras':'洪都拉斯', 'Croatia':'克罗地亚', 'Haiti':'海地', 'Hungary':'匈牙利', 'Indonesia':'印尼', 'India':'印度', 'Ireland':'爱尔兰', 'Iran':'伊朗', 'Iraq':'伊拉克', 'Iceland':'冰岛', 'Israel':'以色列', 'Italy':'意大利', 'Jamaica':'牙买加', 'Jordan':'约旦', 'Japan':'日本', 'Kazakhstan':'哈萨克斯坦', 'Kenya':'肯尼亚', 'Kyrgyzstan':'吉尔吉斯斯坦', 'Cambodia':'柬埔寨', 'South Korea':'韩国', 'Kosovo':'科索沃', 'Kuwait':'科威特', 'Laos':'老挝', 'Lebanon':'黎巴嫩', 'Liberia':'利比里亚', 'Libya':'利比亚', 'Sri Lanka':'斯里兰卡', 'Lesotho':'莱索托', 'Lithuania':'立陶宛', 'Luxembourg':'卢森堡', 'Latvia':'拉脱维亚', 'Morocco':'摩洛哥', 'Moldova':'摩尔多瓦', 'Madagascar':'马达加斯加', 'Mexico':'墨西哥', 'Macedonia':'马其顿', 'Mali':'马里', 'Myanmar':'缅甸', 'Montenegro':'黑山', 'Mongolia':'蒙古', 'Mozambique':'莫桑比克', 'Mauritania':'毛里塔尼亚', 'Malawi':'马拉维', 'Malaysia':'马来西亚', 'Namibia':'纳米比亚', 'New Caledonia':'新喀里多尼亚', 'Niger':'尼日尔', 'Nigeria':'尼日利亚', 'Nicaragua':'尼加拉瓜', 'Netherlands':'荷兰', 'Norway':'挪威', 'Nepal':'尼泊尔', 'New Zealand':'新西兰', 'Oman':'阿曼', 'Pakistan':'巴基斯坦', 'Panama':'巴拿马', 'Peru':'秘鲁', 'Philippines':'菲律宾', 'Papua New Guinea':'巴布亚新几内亚', 'Poland':'波兰', 'Puerto Rico':'波多黎各', 'North Korea':'北朝鲜', 'Portugal':'葡萄牙', 'Paraguay':'巴拉圭', 'Qatar':'卡塔尔', 'Romania':'罗马尼亚', 'Russia':'俄罗斯', 'Rwanda':'卢旺达', 'Western Sahara':'西撒哈拉', 'Saudi Arabia':'沙特阿拉伯', 'Sudan':'苏丹', 'South Sudan':'南苏丹', 'Senegal':'塞内加尔', 'Solomon Islands':'所罗门群岛', 'Sierra Leone':'塞拉利昂', 'El Salvador':'萨尔瓦多', 'Somaliland':'索马里兰', 'Somalia':'索马里', 'Republic of Serbia':'塞尔维亚共和国', 'Suriname':'苏里南', 'Slovakia':'斯洛伐克', 'Slovenia':'斯洛文尼亚', 'Sweden':'瑞典', 'Swaziland':'斯威士兰', 'Syria':'叙利亚', 'Chad':'乍得', 'Togo':'多哥', 'Thailand':'泰国', 'Tajikistan':'塔吉克斯坦', 'Turkmenistan':'土库曼斯坦', 'East Timor':'东帝汶', 'Trinidad and Tobago':'特里尼达和多巴哥', 'Tunisia':'突尼斯', 'Turkey':'土耳其', 'United Republic of Tanzania':'坦桑尼亚联合共和国', 'Uganda':'乌干达', 'Ukraine':'乌克兰', 'Uruguay':'乌拉圭', 'United States of America':'美国', 'Uzbekistan':'乌兹别克斯坦', 'Venezuela':'委内瑞拉', 'Vietnam':'越南', 'Vanuatu':'瓦努阿图', 'West Bank':'西岸', 'Yemen':'也门', 'South Africa':'南非', 'Zambia':'赞比亚', 'Zimbabwe':'津巴布韦' }; return nameMap[params.name];}"))
                        )),
                    .emphasis(FormattedLabelStyle(
                        .show(true)
                        ))
                    ))
                )),
            .series([])
        )
    }
    
}
