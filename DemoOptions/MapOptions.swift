//
//  MapOptions.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 16/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import SwiftyEcharts
import Foundation

public final class MapOptions {
    
    // MARK: 模拟迁徙
    /// 地址: http://echarts.baidu.com/demo.html#geo-lines
    static func geoLinesOption() -> Option {
        let geoCoordMap: [String: [Double]] = ["上海": [121.4648,31.2891],
                                               "东莞": [113.8953,22.901],
                                               "东营": [118.7073,37.5513],
                                               "中山": [113.4229,22.478],
                                               "临汾": [111.4783,36.1615],
                                               "临沂": [118.3118,35.2936],
                                               "丹东": [124.541,40.4242],
                                               "丽水": [119.5642,28.1854],
                                               "乌鲁木齐": [87.9236,43.5883],
                                               "佛山": [112.8955,23.1097],
                                               "保定": [115.0488,39.0948],
                                               "兰州": [103.5901,36.3043],
                                               "包头": [110.3467,41.4899],
                                               "北京": [116.4551,40.2539],
                                               "北海": [109.314,21.6211],
                                               "南京": [118.8062,31.9208],
                                               "南宁": [108.479,23.1152],
                                               "南昌": [116.0046,28.6633],
                                               "南通": [121.1023,32.1625],
                                               "厦门": [118.1689,24.6478],
                                               "台州": [121.1353,28.6688],
                                               "合肥": [117.29,32.0581],
                                               "呼和浩特": [111.4124,40.4901],
                                               "咸阳": [108.4131,34.8706],
                                               "哈尔滨": [127.9688,45.368],
                                               "唐山": [118.4766,39.6826],
                                               "嘉兴": [120.9155,30.6354],
                                               "大同": [113.7854,39.8035],
                                               "大连": [122.2229,39.4409],
                                               "天津": [117.4219,39.4189],
                                               "太原": [112.3352,37.9413],
                                               "威海": [121.9482,37.1393],
                                               "宁波": [121.5967,29.6466],
                                               "宝鸡": [107.1826,34.3433],
                                               "宿迁": [118.5535,33.7775],
                                               "常州": [119.4543,31.5582],
                                               "广州": [113.5107,23.2196],
                                               "廊坊": [116.521,39.0509],
                                               "延安": [109.1052,36.4252],
                                               "张家口": [115.1477,40.8527],
                                               "徐州": [117.5208,34.3268],
                                               "德州": [116.6858,37.2107],
                                               "惠州": [114.6204,23.1647],
                                               "成都": [103.9526,30.7617],
                                               "扬州": [119.4653,32.8162],
                                               "承德": [117.5757,41.4075],
                                               "拉萨": [91.1865,30.1465],
                                               "无锡": [120.3442,31.5527],
                                               "日照": [119.2786,35.5023],
                                               "昆明": [102.9199,25.4663],
                                               "杭州": [119.5313,29.8773],
                                               "枣庄": [117.323,34.8926],
                                               "柳州": [109.3799,24.9774],
                                               "株洲": [113.5327,27.0319],
                                               "武汉": [114.3896,30.6628],
                                               "汕头": [117.1692,23.3405],
                                               "江门": [112.6318,22.1484],
                                               "沈阳": [123.1238,42.1216],
                                               "沧州": [116.8286,38.2104],
                                               "河源": [114.917,23.9722],
                                               "泉州": [118.3228,25.1147],
                                               "泰安": [117.0264,36.0516],
                                               "泰州": [120.0586,32.5525],
                                               "济南": [117.1582,36.8701],
                                               "济宁": [116.8286,35.3375],
                                               "海口": [110.3893,19.8516],
                                               "淄博": [118.0371,36.6064],
                                               "淮安": [118.927,33.4039],
                                               "深圳": [114.5435,22.5439],
                                               "清远": [112.9175,24.3292],
                                               "温州": [120.498,27.8119],
                                               "渭南": [109.7864,35.0299],
                                               "湖州": [119.8608,30.7782],
                                               "湘潭": [112.5439,27.7075],
                                               "滨州": [117.8174,37.4963],
                                               "潍坊": [119.0918,36.524],
                                               "烟台": [120.7397,37.5128],
                                               "玉溪": [101.9312,23.8898],
                                               "珠海": [113.7305,22.1155],
                                               "盐城": [120.2234,33.5577],
                                               "盘锦": [121.9482,41.0449],
                                               "石家庄": [114.4995,38.1006],
                                               "福州": [119.4543,25.9222],
                                               "秦皇岛": [119.2126,40.0232],
                                               "绍兴": [120.564,29.7565],
                                               "聊城": [115.9167,36.4032],
                                               "肇庆": [112.1265,23.5822],
                                               "舟山": [122.2559,30.2234],
                                               "苏州": [120.6519,31.3989],
                                               "莱芜": [117.6526,36.2714],
                                               "菏泽": [115.6201,35.2057],
                                               "营口": [122.4316,40.4297],
                                               "葫芦岛": [120.1575,40.578],
                                               "衡水": [115.8838,37.7161],
                                               "衢州": [118.6853,28.8666],
                                               "西宁": [101.4038,36.8207],
                                               "西安": [109.1162,34.2004],
                                               "贵阳": [106.6992,26.7682],
                                               "连云港": [119.1248,34.552],
                                               "邢台": [114.8071,37.2821],
                                               "邯郸": [114.4775,36.535],
                                               "郑州": [113.4668,34.6234],
                                               "鄂尔多斯": [108.9734,39.2487],
                                               "重庆": [107.7539,30.1904],
                                               "金华": [120.0037,29.1028],
                                               "铜川": [109.0393,35.1947],
                                               "银川": [106.3586,38.1775],
                                               "镇江": [119.4763,31.9702],
                                               "长春": [125.8154,44.2584],
                                               "长沙": [113.0823,28.2568],
                                               "长治": [112.8625,36.4746],
                                               "阳泉": [113.4778,38.0951],
                                               "青岛": [120.4651,36.3373],
                                               "韶关": [113.7964,24.7028]
        ]
        
        let BJData: [[[String: Jsonable]]] = [
            [["name":"北京"], ["name":"上海","value":95]],
            [["name":"北京"], ["name":"广州","value":90]],
            [["name":"北京"], ["name":"大连","value":80]],
            [["name":"北京"], ["name":"南宁","value":70]],
            [["name":"北京"], ["name":"南昌","value":60]],
            [["name":"北京"], ["name":"拉萨","value":50]],
            [["name":"北京"], ["name":"长春","value":40]],
            [["name":"北京"], ["name":"包头","value":30]],
            [["name":"北京"], ["name":"重庆","value":20]],
            [["name":"北京"], ["name":"常州","value":10]]
        ]
        
        let SHData: [[[String: Jsonable]]] = [
            [["name":"上海"],["name":"包头","value":95]],
            [["name":"上海"],["name":"昆明","value":90]],
            [["name":"上海"],["name":"广州","value":80]],
            [["name":"上海"],["name":"郑州","value":70]],
            [["name":"上海"],["name":"长春","value":60]],
            [["name":"上海"],["name":"重庆","value":50]],
            [["name":"上海"],["name":"长沙","value":40]],
            [["name":"上海"],["name":"北京","value":30]],
            [["name":"上海"],["name":"丹东","value":20]],
            [["name":"上海"],["name":"大连","value":10]]
        ]
        
        let GZData: [[[String: Jsonable]]] = [
            [["name":"广州"],["name":"福州","value":95]],
            [["name":"广州"],["name":"太原","value":90]],
            [["name":"广州"],["name":"长春","value":80]],
            [["name":"广州"],["name":"重庆","value":70]],
            [["name":"广州"],["name":"西安","value":60]],
            [["name":"广州"],["name":"成都","value":50]],
            [["name":"广州"],["name":"常州","value":40]],
            [["name":"广州"],["name":"北京","value":30]],
            [["name":"广州"],["name":"北海","value":20]],
            [["name":"广州"],["name":"海口","value":10]]
        ]
        
        let planePath: String = "path://M1705.06,1318.313v-89.254l-319.9-221.799l0.073-208.063c0.521-84.662-26.629-121.796-63.961-121.491c-37.332-0.305-64.482,36.829-63.961,121.491l0.073,208.063l-319.9,221.799v89.254l330.343-157.288l12.238,241.308l-134.449,92.931l0.531,42.034l175.125-42.917l175.125,42.917l0.531-42.034l-134.449-92.931l12.238-241.308L1705.06,1318.313z";
        
        let convertData: ([[[String: Jsonable]]]) -> [[String: Jsonable]] = { (data: [[[String: Jsonable]]]) in
            var res: [[String: Jsonable]] = []
            for i in 0..<data.count {
                let dataItem = data[i]
                guard let fromCoord = geoCoordMap[(dataItem[0]["name"] as! String)] else { continue }
                guard let toCoord = geoCoordMap[(dataItem[1]["name"] as! String)] else { continue }
                res.append([
                    "formName": (dataItem[0]["name"] as! String),
                    "toName": (dataItem[1]["name"] as! String),
                    "coords": [fromCoord, toCoord]
                    ])
            }
            return res
        }
        
        let color: [Color] = ["#a6c84c", "#ffa022", "#46bee9"]
        var series: [Serie] = []
        let datas: [[Jsonable]] = [["北京", BJData], ["上海", SHData], ["广州", GZData]]
        for i in 0..<datas.count {
            let item = datas[i]
            let convertDatas: [[[String: Jsonable]]] = item[1] as! [[[String: Jsonable]]]
            let serieData: [Jsonable] = convertData(convertDatas).map { $0 as Jsonable }
            series.append(LinesSerie(
                .name("\(item[0]) Top10"),
                .zlevel(1),
                .effect(LinesSerie.Effect(
                    .show(true),
                    .period(6),
                    .trailLength(0.7),
                    .color("#fff"),
                    .symbolSize(3)
                    )),
                .lineStyle(EmphasisLineStyle(
                    .normal(LineStyle(
                        .color(color[i]),
                        .width(0),
                        .curveness(0.2)
                        ))
                    )),
                .data(serieData)
                ))
            series.append(LinesSerie(
                .name("\(item[0]) Top10"),
                .zlevel(2),
                .symbols([.none, .arrow]),
                .symbolSize(10),
                .effect(LinesSerie.Effect(
                    .show(true),
                    .period(6),
                    .trailLength(0),
                    .symbol(.path(planePath)),
                    .symbolSize(15)
                    )),
                .lineStyle(EmphasisLineStyle(
                    .normal(LineStyle(
                        .color(color[i]),
                        .width(0),
                        .opacity(0.6),
                        .curveness(0.2)
                        ))
                    )),
                .data(serieData)
                ))
            series.append(EffectScatterSerie(
                .name("\(item[0]) Top10"),
                .coordinateSystem(.geo),
                .zlevel(2),
                .rippleEffect(EffectScatterSerie.RippleEffect(
                    .brushType(.stroke)
                    )),
                .label(EmphasisLabel(
                    .normal(LabelStyle(
                        .show(true),
                        .position(.right),
                        .formatter(.string("{b}"))
                        ))
                    )),
                .symbolSize(.function("function (val) {return val[2] / 8;}")),
                .itemStyle(ItemStyle(
                    .normal(CommonItemStyleContent(
                        .color(color[i])
                        ))
                    )),
                .data(convertDatas.map { dataItem in
                    let name = dataItem[1]["name"] as! String
                    var value = geoCoordMap[name]!.map { $0 as Jsonable }
                    value.append(contentsOf: [(dataItem[1] as Jsonable)])
                    let result: [String: Jsonable] = [ "name": name, "value": value ]
                    return  result as Jsonable
                    })
                ))
        }
        return Option(
            .backgroundColor("#404a59"),
            .title(Title(
                .text("模拟迁移"),
                .subtext("数据纯属虚构"),
                .left(.center),
                .textStyle(TextStyle(
                    .color("#fff")
                    ))
                )),
            .tooltip(Tooltip(
                .trigger(.item)
                )),
            .legend(Legend(
                .orient(.vertical),
                .top(.bottom),
                .left(.right),
                .data(["北京 Top10", "上海 Top10", "广州 Top10"]),
                .textStyle(TextStyle(
                    .color("#fff")
                    )),
                .selectedMode(.single)
                )),
            .geo(Geo(
                .map("china"),
                .label(EmphasisLabel(
                    .emphasis(LabelStyle(
                        .show(false)
                        ))
                    )),
                .roam(true),
                .itemStyle(ItemStyle(
                    .normal(CommonItemStyleContent(
                        .areaColor(.hexColor("#323c48")),
                        .borderColor("#404a59")
                        )),
                    .emphasis(CommonItemStyleContent(
                        .areaColor(.hexColor("#2a333d"))
                        ))
                    ))
                )),
            .series(series)
        )
    }
    
    // MARK: 65k+ 飞机航线
    /// 地址: http://echarts.baidu.com/demo.html#lines-airline
    static func linesAirlineOption() -> Option {
        guard let jsonUrl = Bundle.main.url(forResource: "LineAirline", withExtension: "json") else {
            return Option()
        }
        
        guard let jsonData = try? Data(contentsOf: jsonUrl) else {
            return Option()
        }
        
        guard let jsonObj = try? JSONSerialization.jsonObject(with: jsonData, options: []) else {
            return Option()
        }
        
        let data = jsonObj as! [String : Any]
        let airports = data["airports"] as! [[Any]]
        let getAirportCoord: (Int) -> [Jsonable] = { idx in
            let dataObj = airports[idx]
            return [
                (dataObj[3] as? Jsonable) ?? ((dataObj[3] as! Float) as Jsonable),
                (dataObj[4] as? Jsonable) ?? ((dataObj[4] as! Float) as Jsonable)
            ]
        }
        
        let routeDatas: [[Any]] = data["routes"] as! [[Any]]
        var routes: [[[Jsonable]]] = []
        for route in routeDatas {
            routes.append([getAirportCoord(route[1] as! Int), getAirportCoord(route[2] as! Int)])
        }
        
        return Option( // FIXME: 添加 showLoading 和  hideLoading
            .title(Title(
                .text("World Flights"),
                .left(.center),
                .textStyle(TextStyle(
                    .color("#eee")
                    ))
                )),
            .backgroundColor("#003"),
            //            .tooltip(Tooltip(
            //                .formatter(.function("var routes = \()")) // FIXME: 缺少 formatter
            //            )),
            .geo(Geo(
                .map("world"),
                .left(.value(0)),
                .right(.value(0)),
                .silent(true),
                .itemStyle(ItemStyle(
                    .normal(ItemStyle.Style(
                        .borderColor("#003"),
                        .color("#005")
                        ))
                    ))
                )),
            .series([
                LinesSerie(
                    .coordinateSystem(.geo),
                    .data(routes),
                    .large(true),
                    .largeThreshold(100),
                    .lineStyle(EmphasisLineStyle(
                        .normal(EmphasisLineStyle.Style(
                            .opacity(0.05),
                            .width(0.5),
                            .curveness(0.3)
                            ))
                        ))
                )
                ]),
            .blendMode(.lighter)
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
            .label(EmphasisLabel(
                .normal(LabelStyle(.show(true))),
                .emphasis(LabelStyle(.show(true)))
                ))
        )
        
        let iphone3Data = serieTemplate
        iphone3Data.name = "iphone3"
        iphone3Data.roam = false
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
        
        let iphone4Data = serieTemplate
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
        
        let iphone5Data = serieTemplate
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
                    .label(EmphasisLabel(
                        .normal(LabelStyle(.show(true))),
                        .emphasis(LabelStyle(.show(true)))
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
        return Option(
            .title(Title(
                .text("香港18区人口密度 （2011）"),
                .subtext("人口密度数据来自Wikipedia"),
                .sublink("http://zh.wikipedia.org/wiki/%E9%A6%99%E6%B8%AF%E8%A1%8C%E6%94%BF%E5%8D%80%E5%8A%83#cite_note-12")
                )),
            .tooltip(Tooltip(
                .trigger(.item),
                .formatter(.string("{b}<br/>{c} (p / km2)"))
                )),
            .toolbox(Toolbox(
                .show(true),
                .orient(.vertical),
                .left(.right),
                .top(.center),
                .feature(ToolboxFeature(
                    .dataView(ToolboxFeatureDataView(
                        .readOnly(false)
                        )),
                    .restore(ToolboxFeatureRestore()),
                    .saveAsImage(ToolboxFeatureSaveAsImage())
                    ))
                )),
            .visualMap(ContinuousVisualMap(
                .min(800),
                .max(50000),
                .text(["High", "Low"]),
                .realtime(false),
                .calculable(true),
                .inRange([
                    "color": ["lightskyblue", "yellow", "orangered"]
                    ])
                )),
            .series([
                MapSerie(
                    .name("香港18区人口密度"),
                    .map("HK"), // 自定义扩展图表类型
                    .label(EmphasisLabel( // 由ItemStyle中直接抽象出来即可用
                        .normal(LabelStyle(.show(true))),
                        .emphasis(LabelStyle(.show(true)))
                        )),
                    .data([
                        [ "name": "中西区", "value": 20057.34 ],
                        [ "name": "湾仔", "value": 15477.48 ],
                        [ "name": "东区", "value": 31686.1 ],
                        [ "name": "南区", "value": 6992.6 ],
                        [ "name": "油尖旺", "value": 44045.49 ],
                        [ "name": "深水埗", "value": 40689.64 ],
                        [ "name": "九龙城", "value": 37659.78 ],
                        [ "name": "黄大仙", "value": 45180.97 ],
                        [ "name": "观塘", "value": 55204.26 ],
                        [ "name": "葵青", "value": 21900.9 ],
                        [ "name": "荃湾", "value": 4918.26 ],
                        [ "name": "屯门", "value": 5881.84 ],
                        [ "name": "元朗", "value": 4178.01 ],
                        [ "name": "北区", "value": 2227.92 ],
                        [ "name": "大埔", "value": 2180.98 ],
                        [ "name": "沙田", "value": 9172.94 ],
                        [ "name": "西贡", "value": 3368 ],
                        [ "name": "离岛", "value": 806.98 ]
                        ]),
                    // 自定义名称映射
                    .nameMap([
                        "Central and Western": "中西区",
                        "Eastern": "东区",
                        "Islands": "离岛",
                        "Kowloon City": "九龙城",
                        "Kwai Tsing": "葵青",
                        "Kwun Tong": "观塘",
                        "North": "北区",
                        "Sai Kung": "西贡",
                        "Sha Tin": "沙田",
                        "Sham Shui Po": "深水埗",
                        "Southern": "南区",
                        "Tai Po": "大埔",
                        "Tsuen Wan": "荃湾",
                        "Tuen Mun": "屯门",
                        "Wan Chai": "湾仔",
                        "Wong Tai Sin": "黄大仙",
                        "Yau Tsim Mong": "油尖旺",
                        "Yuen Long": "元朗"
                        ])
                )
                ])
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
                    .label(EmphasisLabel(
                        .normal(LabelStyle(
                            .show(true)
                            )),
                        .emphasis(LabelStyle(
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
        return Option(
            .title(Title(
                .text("USA Population Estimates (2012)"),
                .subtext("Data from www.census.gov"),
                .sublink("http://www.census.gov/popest/data/datasets.html"),
                .left(.right)
                )),
            .tooltip(Tooltip(
                .trigger(.item),
                .showDelay(0),
                .transitionDuration(0.2),
                .formatter(.function("function (params) { var value = (params.value + '').split('.'); value = value[0].replace(/(\\d{1,3})(?=(?:\\d{3})+(?!\\d))/g, '$1,'); return params.seriesName + '<br/>' + params.name + ': ' + value; }"))
                )),
            .visualMap(ContinuousVisualMap(
                .left(.right),
                .min(500000),
                .max(38000000),
                .inRange([
                    "color": ["#313695", "#4575b4", "#74add1", "#abd9e9", "#e0f3f8", "#ffffbf", "#fee090", "#fdae61", "#f46d43", "#d73027", "#a50026"]
                    ]),
                .text(["High", "Low"]),
                .calculable(true)
                )),
            .toolbox(Toolbox(
                .show(true),
                .left(.left),
                .top(.top),
                .feature(ToolboxFeature(
                    .dataView(ToolboxFeatureDataView(.readOnly(false))),
                    .restore(ToolboxFeatureRestore()),
                    .saveAsImage(ToolboxFeatureSaveAsImage())
                    ))
                )),
            .series([
                MapSerie(
                    .name("USA PopEstimates"),
                    .roam(true),
                    .map("USA"),
                    .label(EmphasisLabel(
                        .emphasis(LabelStyle(
                            .show(true)
                            ))
                        )),
                    .data([
                        [ "name": "Alabama", "value": 4822023 ],
                        [ "name": "Alaska", "value": 731449 ],
                        [ "name": "Arizona", "value": 6553255 ],
                        [ "name": "Arkansas", "value": 2949131 ],
                        [ "name": "California", "value": 38041430 ],
                        [ "name": "Colorado", "value": 5187582 ],
                        [ "name": "Connecticut", "value": 3590347 ],
                        [ "name": "Delaware", "value": 917092 ],
                        [ "name": "District of Columbia", "value": 632323 ],
                        [ "name": "Florida", "value": 19317568 ],
                        [ "name": "Georgia", "value": 9919945 ],
                        [ "name": "Hawaii", "value": 1392313 ],
                        [ "name": "Idaho", "value": 1595728 ],
                        [ "name": "Illinois", "value": 12875255 ],
                        [ "name": "Indiana", "value": 6537334 ],
                        [ "name": "Iowa", "value": 3074186 ],
                        [ "name": "Kansas", "value": 2885905 ],
                        [ "name": "Kentucky", "value": 4380415 ],
                        [ "name": "Louisiana", "value": 4601893 ],
                        [ "name": "Maine", "value": 1329192 ],
                        [ "name": "Maryland", "value": 5884563 ],
                        [ "name": "Massachusetts", "value": 6646144 ],
                        [ "name": "Michigan", "value": 9883360 ],
                        [ "name": "Minnesota", "value": 5379139 ],
                        [ "name": "Mississippi", "value": 2984926 ],
                        [ "name": "Missouri", "value": 6021988 ],
                        [ "name": "Montana", "value": 1005141 ],
                        [ "name": "Nebraska", "value": 1855525 ],
                        [ "name": "Nevada", "value": 2758931 ],
                        [ "name": "New Hampshire", "value": 1320718 ],
                        [ "name": "New Jersey", "value": 8864590 ],
                        [ "name": "New Mexico", "value": 2085538 ],
                        [ "name": "New York", "value": 19570261 ],
                        [ "name": "North Carolina", "value": 9752073 ],
                        [ "name": "North Dakota", "value": 699628 ],
                        [ "name": "Ohio", "value": 11544225 ],
                        [ "name": "Oklahoma", "value": 3814820 ],
                        [ "name": "Oregon", "value": 3899353 ],
                        [ "name": "Pennsylvania", "value": 12763536 ],
                        [ "name": "Rhode Island", "value": 1050292 ],
                        [ "name": "South Carolina", "value": 4723723 ],
                        [ "name": "South Dakota", "value": 833354 ],
                        [ "name": "Tennessee", "value": 6456243 ],
                        [ "name": "Texas", "value": 26059203 ],
                        [ "name": "Utah", "value": 2855287 ],
                        [ "name": "Vermont", "value": 626011 ],
                        [ "name": "Virginia", "value": 8185867 ],
                        [ "name": "Washington", "value": 6897012 ],
                        [ "name": "West Virginia", "value": 1855413 ],
                        [ "name": "Wisconsin", "value": 5726398 ],
                        [ "name": "Wyoming", "value": 576412 ],
                        [ "name": "Puerto Rico", "value": 3667084 ]
                        ])
                    //                    .textFixed // FIXME: 暂时不生效
                    //                    .itemStyle(ItemStyle( // ItemStyle 没有 Label , 使用 MapSerie 中的 Label 替换
                    //                        .emphasis(CommonItemStyleContent(
                    //                            .label
                    //                            ))
                    //                        ))
                )
                ])
        )
    }
    
    // MARK: World Population (2010)
    /// 地址: http://echarts.baidu.com/demo.html#map-world-dataRange
    static func mapWorldDataRangeOption() -> Option {
        return Option(
            .title(Title(
                .text("World Population (2010)"),
                .subtext("from United Nations, Total population, both sexes combined, as of 1 July (thousands)"),
                .sublink("http://esa.un.org/wpp/Excel-Data/population.htm"),
                .left(.center),
                .top(.top)
                )),
            .tooltip(Tooltip(
                .trigger(.item),
                .formatter(.function("function (params) {var value = (params.value + '').split('.');value = value[0].replace(/(\\d{1,3})(?=(?:\\d{3})+(?!\\d))/g, '$1,') + '.' + value[1];return params.seriesName + '<br/>' + params.name + ' : ' + value;}"))
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
            .visualMap(ContinuousVisualMap(
                .min(0),
                .max(1000000),
                .text(["High", "Low"]),
                .realtime(false),
                .calculable(true),
                .inRange([
                    "color": ["lightskyblue","yellow", "orangered"]
                    ])
                )),
            .series([
                MapSerie(
                    .name("World Population (2010)"),
                    .map("world"), // 好像应该是 map, demo 里面是 mapType
                    .roam(true),
                    .itemStyle(ItemStyle(
                        .emphasis(CommonItemStyleContent(
                            //                            .label(FormattedLabel(.show(true))) // FIXME: 缺少 label？
                            ))
                        )),
                    .data([
                        [ "name": "Afghanistan", "value": 28397.812 ],
                        [ "name": "Angola", "value": 19549.124 ],
                        [ "name": "Albania", "value": 3150.143 ],
                        [ "name": "United Arab Emirates", "value": 8441.537 ],
                        [ "name": "Argentina", "value": 40374.224 ],
                        [ "name": "Armenia", "value": 2963.496 ],
                        [ "name": "French Southern and Antarctic Lands", "value": 268.065 ],
                        [ "name": "Australia", "value": 22404.488 ],
                        [ "name": "Austria", "value": 8401.924 ],
                        [ "name": "Azerbaijan", "value": 9094.718 ],
                        [ "name": "Burundi", "value": 9232.753 ],
                        [ "name": "Belgium", "value": 10941.288 ],
                        [ "name": "Benin", "value": 9509.798 ],
                        [ "name": "Burkina Faso", "value": 15540.284 ],
                        [ "name": "Bangladesh", "value": 151125.475 ],
                        [ "name": "Bulgaria", "value": 7389.175 ],
                        [ "name": "The Bahamas", "value": 66402.316 ],
                        [ "name": "Bosnia and Herzegovina", "value": 3845.929 ],
                        [ "name": "Belarus", "value": 9491.07 ],
                        [ "name": "Belize", "value": 308.595 ],
                        [ "name": "Bermuda", "value": 64.951 ],
                        [ "name": "Bolivia", "value": 716.939 ],
                        [ "name": "Brazil", "value": 195210.154 ],
                        [ "name": "Brunei", "value": 27.223 ],
                        [ "name": "Bhutan", "value": 716.939 ],
                        [ "name": "Botswana", "value": 1969.341 ],
                        [ "name": "Central African Republic", "value": 4349.921 ],
                        [ "name": "Canada", "value": 34126.24 ],
                        [ "name": "Switzerland", "value": 7830.534 ],
                        [ "name": "Chile", "value": 17150.76 ],
                        [ "name": "China", "value": 1359821.465 ],
                        [ "name": "Ivory Coast", "value": 60508.978 ],
                        [ "name": "Cameroon", "value": 20624.343 ],
                        [ "name": "Democratic Republic of the Congo", "value": 62191.161 ],
                        [ "name": "Republic of the Congo", "value": 3573.024 ],
                        [ "name": "Colombia", "value": 46444.798 ],
                        [ "name": "Costa Rica", "value": 4669.685 ],
                        [ "name": "Cuba", "value": 11281.768 ],
                        [ "name": "Northern Cyprus", "value": 1.468 ],
                        [ "name": "Cyprus", "value": 1103.685 ],
                        [ "name": "Czech Republic", "value": 10553.701 ],
                        [ "name": "Germany", "value": 83017.404 ],
                        [ "name": "Djibouti", "value": 834.036 ],
                        [ "name": "Denmark", "value": 5550.959 ],
                        [ "name": "Dominican Republic", "value": 10016.797 ],
                        [ "name": "Algeria", "value": 37062.82 ],
                        [ "name": "Ecuador", "value": 15001.072 ],
                        [ "name": "Egypt", "value": 78075.705 ],
                        [ "name": "Eritrea", "value": 5741.159 ],
                        [ "name": "Spain", "value": 46182.038 ],
                        [ "name": "Estonia", "value": 1298.533 ],
                        [ "name": "Ethiopia", "value": 87095.281 ],
                        [ "name": "Finland", "value": 5367.693 ],
                        [ "name": "Fiji", "value": 860.559 ],
                        [ "name": "Falkland Islands", "value": 49.581 ],
                        [ "name": "France", "value": 63230.866 ],
                        [ "name": "Gabon", "value": 1556.222 ],
                        [ "name": "United Kingdom", "value": 62066.35 ],
                        [ "name": "Georgia", "value": 4388.674 ],
                        [ "name": "Ghana", "value": 24262.901 ],
                        [ "name": "Guinea", "value": 10876.033 ],
                        [ "name": "Gambia", "value": 1680.64 ],
                        [ "name": "Guinea Bissau", "value": 10876.033 ],
                        [ "name": "Equatorial Guinea", "value": 696.167 ],
                        [ "name": "Greece", "value": 11109.999 ],
                        [ "name": "Greenland", "value": 56.546 ],
                        [ "name": "Guatemala", "value": 14341.576 ],
                        [ "name": "French Guiana", "value": 231.169 ],
                        [ "name": "Guyana", "value": 786.126 ],
                        [ "name": "Honduras", "value": 7621.204 ],
                        [ "name": "Croatia", "value": 4338.027 ],
                        [ "name": "Haiti", "value": 9896.4 ],
                        [ "name": "Hungary", "value": 10014.633 ],
                        [ "name": "Indonesia", "value": 240676.485 ],
                        [ "name": "India", "value": 1205624.648 ],
                        [ "name": "Ireland", "value": 4467.561 ],
                        [ "name": "Iran", "value": 240676.485 ],
                        [ "name": "Iraq", "value": 30962.38 ],
                        [ "name": "Iceland", "value": 318.042 ],
                        [ "name": "Israel", "value": 7420.368 ],
                        [ "name": "Italy", "value": 60508.978 ],
                        [ "name": "Jamaica", "value": 2741.485 ],
                        [ "name": "Jordan", "value": 6454.554 ],
                        [ "name": "Japan", "value": 127352.833 ],
                        [ "name": "Kazakhstan", "value": 15921.127 ],
                        [ "name": "Kenya", "value": 40909.194 ],
                        [ "name": "Kyrgyzstan", "value": 5334.223 ],
                        [ "name": "Cambodia", "value": 14364.931 ],
                        [ "name": "South Korea", "value": 51452.352 ],
                        [ "name": "Kosovo", "value": 97.743 ],
                        [ "name": "Kuwait", "value": 2991.58 ],
                        [ "name": "Laos", "value": 6395.713 ],
                        [ "name": "Lebanon", "value": 4341.092 ],
                        [ "name": "Liberia", "value": 3957.99 ],
                        [ "name": "Libya", "value": 6040.612 ],
                        [ "name": "Sri Lanka", "value": 20758.779 ],
                        [ "name": "Lesotho", "value": 2008.921 ],
                        [ "name": "Lithuania", "value": 3068.457 ],
                        [ "name": "Luxembourg", "value": 507.885 ],
                        [ "name": "Latvia", "value": 2090.519 ],
                        [ "name": "Morocco", "value": 31642.36 ],
                        [ "name": "Moldova", "value": 103.619 ],
                        [ "name": "Madagascar", "value": 21079.532 ],
                        [ "name": "Mexico", "value": 117886.404 ],
                        [ "name": "Macedonia", "value": 507.885 ],
                        [ "name": "Mali", "value": 13985.961 ],
                        [ "name": "Myanmar", "value": 51931.231 ],
                        [ "name": "Montenegro", "value": 620.078 ],
                        [ "name": "Mongolia", "value": 2712.738 ],
                        [ "name": "Mozambique", "value": 23967.265 ],
                        [ "name": "Mauritania", "value": 3609.42 ],
                        [ "name": "Malawi", "value": 15013.694 ],
                        [ "name": "Malaysia", "value": 28275.835 ],
                        [ "name": "Namibia", "value": 2178.967 ],
                        [ "name": "New Caledonia", "value": 246.379 ],
                        [ "name": "Niger", "value": 15893.746 ],
                        [ "name": "Nigeria", "value": 159707.78 ],
                        [ "name": "Nicaragua", "value": 5822.209 ],
                        [ "name": "Netherlands", "value": 16615.243 ],
                        [ "name": "Norway", "value": 4891.251 ],
                        [ "name": "Nepal", "value": 26846.016 ],
                        [ "name": "New Zealand", "value": 4368.136 ],
                        [ "name": "Oman", "value": 2802.768 ],
                        [ "name": "Pakistan", "value": 173149.306 ],
                        [ "name": "Panama", "value": 3678.128 ],
                        [ "name": "Peru", "value": 29262.83 ],
                        [ "name": "Philippines", "value": 93444.322 ],
                        [ "name": "Papua New Guinea", "value": 6858.945 ],
                        [ "name": "Poland", "value": 38198.754 ],
                        [ "name": "Puerto Rico", "value": 3709.671 ],
                        [ "name": "North Korea", "value": 1.468 ],
                        [ "name": "Portugal", "value": 10589.792 ],
                        [ "name": "Paraguay", "value": 6459.721 ],
                        [ "name": "Qatar", "value": 1749.713 ],
                        [ "name": "Romania", "value": 21861.476 ],
                        [ "name": "Russia", "value": 21861.476 ],
                        [ "name": "Rwanda", "value": 10836.732 ],
                        [ "name": "Western Sahara", "value": 514.648 ],
                        [ "name": "Saudi Arabia", "value": 27258.387 ],
                        [ "name": "Sudan", "value": 35652.002 ],
                        [ "name": "South Sudan", "value": 9940.929 ],
                        [ "name": "Senegal", "value": 12950.564 ],
                        [ "name": "Solomon Islands", "value": 526.447 ],
                        [ "name": "Sierra Leone", "value": 5751.976 ],
                        [ "name": "El Salvador", "value": 6218.195 ],
                        [ "name": "Somaliland", "value": 9636.173 ],
                        [ "name": "Somalia", "value": 9636.173 ],
                        [ "name": "Republic of Serbia", "value": 3573.024 ],
                        [ "name": "Suriname", "value": 524.96 ],
                        [ "name": "Slovakia", "value": 5433.437 ],
                        [ "name": "Slovenia", "value": 2054.232 ],
                        [ "name": "Sweden", "value": 9382.297 ],
                        [ "name": "Swaziland", "value": 1193.148 ],
                        [ "name": "Syria", "value": 7830.534 ],
                        [ "name": "Chad", "value": 11720.781 ],
                        [ "name": "Togo", "value": 6306.014 ],
                        [ "name": "Thailand", "value": 66402.316 ],
                        [ "name": "Tajikistan", "value": 7627.326 ],
                        [ "name": "Turkmenistan", "value": 5041.995 ],
                        [ "name": "East Timor", "value": 10016.797 ],
                        [ "name": "Trinidad and Tobago", "value": 1328.095 ],
                        [ "name": "Tunisia", "value": 10631.83 ],
                        [ "name": "Turkey", "value": 72137.546 ],
                        [ "name": "United Republic of Tanzania", "value": 44973.33 ],
                        [ "name": "Uganda", "value": 33987.213 ],
                        [ "name": "Ukraine", "value": 46050.22 ],
                        [ "name": "Uruguay", "value": 3371.982 ],
                        [ "name": "United States of America", "value": 312247.116 ],
                        [ "name": "Uzbekistan", "value": 27769.27 ],
                        [ "name": "Venezuela", "value": 236.299 ],
                        [ "name": "Vietnam", "value": 89047.397 ],
                        [ "name": "Vanuatu", "value": 236.299 ],
                        [ "name": "West Bank", "value": 13.565 ],
                        [ "name": "Yemen", "value": 22763.008 ],
                        [ "name": "South Africa", "value": 51452.352 ],
                        [ "name": "Zambia", "value": 13216.985 ],
                        [ "name": "Zimbabwe", "value": 13076.978 ]
                        ])
                )
                ])
        )
    }
    
    // MARK: map and scatter share a geo
    /// 地址: http://echarts.baidu.com/demo.html#geo-map-scatter
    static func geoMapScatterOption() -> Option {
        let data: [[String: Jsonable]] = [
            [ "name": "海门", "value": 9 ],
            [ "name": "鄂尔多斯", "value": 12 ],
            [ "name": "招远", "value": 12 ],
            [ "name": "舟山", "value": 12 ],
            [ "name": "齐齐哈尔", "value": 14 ],
            [ "name": "盐城", "value": 15 ],
            [ "name": "赤峰", "value": 16 ],
            [ "name": "青岛", "value": 18 ],
            [ "name": "乳山", "value": 18 ],
            [ "name": "金昌", "value": 19 ],
            [ "name": "泉州", "value": 21 ],
            [ "name": "南通", "value": 23 ],
            [ "name": "拉萨", "value": 24 ],
            [ "name": "云浮", "value": 24 ],
            [ "name": "上海", "value": 25 ],
            [ "name": "攀枝花", "value": 25 ],
            [ "name": "承德", "value": 25 ],
            [ "name": "汕尾", "value": 26 ],
            [ "name": "丹东", "value": 27 ],
            [ "name": "瓦房店", "value": 30 ],
            [ "name": "延安", "value": 38 ],
            [ "name": "咸阳", "value": 43 ],
            [ "name": "南昌", "value": 54 ],
            [ "name": "柳州", "value": 54 ],
            [ "name": "三亚", "value": 54 ],
            [ "name": "泸州", "value": 57 ],
            [ "name": "克拉玛依", "value": 72 ]
        ]
        
        let geoCoordMap: [String: [Float]] = [
            "海门":[121.15,31.89],
            "鄂尔多斯":[109.781327,39.608266],
            "招远":[120.38,37.35],
            "舟山":[122.207216,29.985295],
            "齐齐哈尔":[123.97,47.33],
            "盐城":[120.13,33.38],
            "赤峰":[118.87,42.28],
            "青岛":[120.33,36.07],
            "乳山":[121.52,36.89],
            "金昌":[102.188043,38.520089],
            "泉州":[118.58,24.93],
            "莱西":[120.53,36.86],
            "日照":[119.46,35.42],
            "胶南":[119.97,35.88],
            "南通":[121.05,32.08],
            "拉萨":[91.11,29.97],
            "云浮":[112.02,22.93],
            "梅州":[116.1,24.55],
            "文登":[122.05,37.2],
            "上海":[121.48,31.22],
            "攀枝花":[101.718637,26.582347],
            "威海":[122.1,37.5],
            "承德":[117.93,40.97],
            "厦门":[118.1,24.46],
            "汕尾":[115.375279,22.786211],
            "潮州":[116.63,23.68],
            "丹东":[124.37,40.13],
            "太仓":[121.1,31.45],
            "曲靖":[103.79,25.51],
            "烟台":[121.39,37.52],
            "福州":[119.3,26.08],
            "瓦房店":[121.979603,39.627114],
            "即墨":[120.45,36.38],
            "抚顺":[123.97,41.97],
            "玉溪":[102.52,24.35],
            "张家口":[114.87,40.82],
            "阳泉":[113.57,37.85],
            "莱州":[119.942327,37.177017],
            "湖州":[120.1,30.86],
            "汕头":[116.69,23.39],
            "昆山":[120.95,31.39],
            "宁波":[121.56,29.86],
            "湛江":[110.359377,21.270708],
            "揭阳":[116.35,23.55],
            "荣成":[122.41,37.16],
            "连云港":[119.16,34.59],
            "葫芦岛":[120.836932,40.711052],
            "常熟":[120.74,31.64],
            "东莞":[113.75,23.04],
            "河源":[114.68,23.73],
            "淮安":[119.15,33.5],
            "泰州":[119.9,32.49],
            "南宁":[108.33,22.84],
            "营口":[122.18,40.65],
            "惠州":[114.4,23.09],
            "江阴":[120.26,31.91],
            "蓬莱":[120.75,37.8],
            "韶关":[113.62,24.84],
            "嘉峪关":[98.289152,39.77313],
            "广州":[113.23,23.16],
            "延安":[109.47,36.6],
            "太原":[112.53,37.87],
            "清远":[113.01,23.7],
            "中山":[113.38,22.52],
            "昆明":[102.73,25.04],
            "寿光":[118.73,36.86],
            "盘锦":[122.070714,41.119997],
            "长治":[113.08,36.18],
            "深圳":[114.07,22.62],
            "珠海":[113.52,22.3],
            "宿迁":[118.3,33.96],
            "咸阳":[108.72,34.36],
            "铜川":[109.11,35.09],
            "平度":[119.97,36.77],
            "佛山":[113.11,23.05],
            "海口":[110.35,20.02],
            "江门":[113.06,22.61],
            "章丘":[117.53,36.72],
            "肇庆":[112.44,23.05],
            "大连":[121.62,38.92],
            "临汾":[111.5,36.08],
            "吴江":[120.63,31.16],
            "石嘴山":[106.39,39.04],
            "沈阳":[123.38,41.8],
            "苏州":[120.62,31.32],
            "茂名":[110.88,21.68],
            "嘉兴":[120.76,30.77],
            "长春":[125.35,43.88],
            "胶州":[120.03336,36.264622],
            "银川":[106.27,38.47],
            "张家港":[120.555821,31.875428],
            "三门峡":[111.19,34.76],
            "锦州":[121.15,41.13],
            "南昌":[115.89,28.68],
            "柳州":[109.4,24.33],
            "三亚":[109.511909,18.252847],
            "自贡":[104.778442,29.33903],
            "吉林":[126.57,43.87],
            "阳江":[111.95,21.85],
            "泸州":[105.39,28.91],
            "西宁":[101.74,36.56],
            "宜宾":[104.56,29.77],
            "呼和浩特":[111.65,40.82],
            "成都":[104.06,30.67],
            "大同":[113.3,40.12],
            "镇江":[119.44,32.2],
            "桂林":[110.28,25.29],
            "张家界":[110.479191,29.117096],
            "宜兴":[119.82,31.36],
            "北海":[109.12,21.49],
            "西安":[108.95,34.27],
            "金坛":[119.56,31.74],
            "东营":[118.49,37.46],
            "牡丹江":[129.58,44.6],
            "遵义":[106.9,27.7],
            "绍兴":[120.58,30.01],
            "扬州":[119.42,32.39],
            "常州":[119.95,31.79],
            "潍坊":[119.1,36.62],
            "重庆":[106.54,29.59],
            "台州":[121.420757,28.656386],
            "南京":[118.78,32.04],
            "滨州":[118.03,37.36],
            "贵阳":[106.71,26.57],
            "无锡":[120.29,31.59],
            "本溪":[123.73,41.3],
            "克拉玛依":[84.77,45.59],
            "渭南":[109.5,34.52],
            "马鞍山":[118.48,31.56],
            "宝鸡":[107.15,34.38],
            "焦作":[113.21,35.24],
            "句容":[119.16,31.95],
            "北京":[116.46,39.92],
            "徐州":[117.2,34.26],
            "衡水":[115.72,37.72],
            "包头":[110,40.58],
            "绵阳":[104.73,31.48],
            "乌鲁木齐":[87.68,43.77],
            "枣庄":[117.57,34.86],
            "杭州":[120.19,30.26],
            "淄博":[118.05,36.78],
            "鞍山":[122.85,41.12],
            "溧阳":[119.48,31.43],
            "库尔勒":[86.06,41.68],
            "安阳":[114.35,36.1],
            "开封":[114.35,34.79],
            "济南":[117,36.65],
            "德阳":[104.37,31.13],
            "温州":[120.65,28.01],
            "九江":[115.97,29.71],
            "邯郸":[114.47,36.6],
            "临安":[119.72,30.23],
            "兰州":[103.73,36.03],
            "沧州":[116.83,38.33],
            "临沂":[118.35,35.05],
            "南充":[106.110698,30.837793],
            "天津":[117.2,39.13],
            "富阳":[119.95,30.07],
            "泰安":[117.13,36.18],
            "诸暨":[120.23,29.71],
            "郑州":[113.65,34.76],
            "哈尔滨":[126.63,45.75],
            "聊城":[115.97,36.45],
            "芜湖":[118.38,31.33],
            "唐山":[118.02,39.63],
            "平顶山":[113.29,33.75],
            "邢台":[114.48,37.05],
            "德州":[116.29,37.45],
            "济宁":[116.59,35.38],
            "荆州":[112.239741,30.335165],
            "宜昌":[111.3,30.7],
            "义乌":[120.06,29.32],
            "丽水":[119.92,28.45],
            "洛阳":[112.44,34.7],
            "秦皇岛":[119.57,39.95],
            "株洲":[113.16,27.83],
            "石家庄":[114.48,38.03],
            "莱芜":[117.67,36.19],
            "常德":[111.69,29.05],
            "保定":[115.48,38.85],
            "湘潭":[112.91,27.87],
            "金华":[119.64,29.12],
            "岳阳":[113.09,29.37],
            "长沙":[113,28.21],
            "衢州":[118.88,28.97],
            "廊坊":[116.7,39.53],
            "菏泽":[115.480656,35.23375],
            "合肥":[117.27,31.86],
            "武汉":[114.31,30.52],
            "大庆":[125.03,46.58]
        ]
        
        let convertData: ([[String: Jsonable]]) -> [[String: Jsonable]] = {data in
            var res: [[String: Jsonable]] = []
            for d in data {
                let name: String = d["name"] as! String
                let geoCoord: [Float]? = geoCoordMap[name]
                let value: Int = d["value"] as! Int
                if var geoCoord = geoCoord {
                    geoCoord.append(Float(value))
                    res.append([
                        "name": name,
                        "value": (geoCoord as Jsonable)
                        ])
                }
            }
            return res
        }
        
        let randomValue: () -> Int = {
            return Int(arc4random_uniform(1000))
        }
        
        let scatterData = convertData(data).map { $0 as Jsonable }
        
        return Option(
            .tooltip(Tooltip()),
            .visualMap(ContinuousVisualMap(
                .min(0),
                .max(1500),
                .left(.left),
                .top(.bottom),
                .text(["High", "Low"]),
                .seriesIndex([1]),
                .inRange([
                    "color": ["#e0ffff", "#006edd"]
                    ]),
                .calculable(true)
                )),
            .geo(Geo(
                .map("china"),
                .roam(true),
                .label(EmphasisLabel(
                    .normal(LabelStyle(
                        .show(true),
                        .color(.rgba(0, 0, 0, 0.4))
                        ))
                    )),
                .itemStyle(ItemStyle(
                    .normal(CommonItemStyleContent(
                        .borderColor(.rgba(0, 0, 0, 0.2))
                        )),
                    .emphasis(CommonItemStyleContent(
                        .shadowOffsetX(0),
                        .shadowOffsetY(0),
                        .shadowBlur(20),
                        .borderWidth(0),
                        .shadowColor(.rgba(0, 0, 0, 0.5))
                        ))
                    ))
                )),
            .series([
                ScatterSerie(
                    .coordinateSystem(.geo),
                    .data(scatterData),
                    .symbolSize(20),
                    .symbol(.path("path://M1705.06,1318.313v-89.254l-319.9-221.799l0.073-208.063c0.521-84.662-26.629-121.796-63.961-121.491c-37.332-0.305-64.482,36.829-63.961,121.491l0.073,208.063l-319.9,221.799v89.254l330.343-157.288l12.238,241.308l-134.449,92.931l0.531,42.034l175.125-42.917l175.125,42.917l0.531-42.034l-134.449-92.931l12.238-241.308L1705.06,1318.313z")),
                    .symbolRotate(35),
                    .label(EmphasisLabel(
                        .normal(LabelStyle(
                            .formatter(.string("{b}")),
                            .position(.right),
                            .show(false)
                            )),
                        .emphasis(LabelStyle(
                            .show(true)
                            ))
                        )),
                    .itemStyle(ItemStyle(
                        .normal(CommonItemStyleContent(
                            .color("#f06c00")
                            ))
                        ))
                ),
                MapSerie(
                    .name("categoryA"),
                    .geoIndex(0),
                    .data([
                        [ "name": "北京", "value": randomValue() ],
                        [ "name": "天津", "value": randomValue() ],
                        [ "name": "上海", "value": randomValue() ],
                        [ "name": "重庆", "value": randomValue() ],
                        [ "name": "河北", "value": randomValue() ],
                        [ "name": "河南", "value": randomValue() ],
                        [ "name": "云南", "value": randomValue() ],
                        [ "name": "辽宁", "value": randomValue() ],
                        [ "name": "黑龙江", "value": randomValue() ],
                        [ "name": "湖南", "value": randomValue() ],
                        [ "name": "安徽", "value": randomValue() ],
                        [ "name": "山东", "value": randomValue() ],
                        [ "name": "新疆", "value": randomValue() ],
                        [ "name": "江苏", "value": randomValue() ],
                        [ "name": "浙江", "value": randomValue() ],
                        [ "name": "江西", "value": randomValue() ],
                        [ "name": "湖北", "value": randomValue() ],
                        [ "name": "广西", "value": randomValue() ],
                        [ "name": "甘肃", "value": randomValue() ],
                        [ "name": "山西", "value": randomValue() ],
                        [ "name": "内蒙古", "value": randomValue() ],
                        [ "name": "陕西", "value": randomValue() ],
                        [ "name": "吉林", "value": randomValue() ],
                        [ "name": "福建", "value": randomValue() ],
                        [ "name": "贵州", "value": randomValue() ],
                        [ "name": "广东", "value": randomValue() ],
                        [ "name": "青海", "value": randomValue() ],
                        [ "name": "西藏", "value": randomValue() ],
                        [ "name": "四川", "value": randomValue() ],
                        [ "name": "宁夏", "value": randomValue() ],
                        [ "name": "海南", "value": randomValue() ],
                        [ "name": "台湾", "value": randomValue() ],
                        [ "name": "香港", "value": randomValue() ],
                        [ "name": "澳门", "value": randomValue() ]
                        ])
                )
                ])
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
                .label(EmphasisLabel(
                    .normal(LabelStyle(
                        .show(false),
                        .formatter(.function("function (params) { var nameMap = { 'Afghanistan':'阿富汗', 'Angola':'安哥拉', 'Albania':'阿尔巴尼亚', 'United Arab Emirates':'阿联酋', 'Argentina':'阿根廷', 'Armenia':'亚美尼亚', 'French Southern and Antarctic Lands':'法属南半球和南极领地', 'Australia':'澳大利亚', 'Austria':'奥地利', 'Azerbaijan':'阿塞拜疆', 'Burundi':'布隆迪', 'Belgium':'比利时', 'Benin':'贝宁', 'Burkina Faso':'布基纳法索', 'Bangladesh':'孟加拉国', 'Bulgaria':'保加利亚', 'The Bahamas':'巴哈马', 'Bosnia and Herzegovina':'波斯尼亚和黑塞哥维那', 'Belarus':'白俄罗斯', 'Belize':'伯利兹', 'Bermuda':'百慕大', 'Bolivia':'玻利维亚', 'Brazil':'巴西', 'Brunei':'文莱', 'Bhutan':'不丹', 'Botswana':'博茨瓦纳', 'Central African Republic':'中非共和国', 'Canada':'加拿大', 'Switzerland':'瑞士', 'Chile':'智利', 'China':'中国', 'Ivory Coast':'象牙海岸', 'Cameroon':'喀麦隆', 'Democratic Republic of the Congo':'刚果民主共和国', 'Republic of the Congo':'刚果共和国', 'Colombia':'哥伦比亚', 'Costa Rica':'哥斯达黎加', 'Cuba':'古巴', 'Northern Cyprus':'北塞浦路斯', 'Cyprus':'塞浦路斯', 'Czech Republic':'捷克共和国', 'Germany':'德国', 'Djibouti':'吉布提', 'Denmark':'丹麦', 'Dominican Republic':'多明尼加共和国', 'Algeria':'阿尔及利亚', 'Ecuador':'厄瓜多尔', 'Egypt':'埃及', 'Eritrea':'厄立特里亚', 'Spain':'西班牙', 'Estonia':'爱沙尼亚', 'Ethiopia':'埃塞俄比亚', 'Finland':'芬兰', 'Fiji':'斐', 'Falkland Islands':'福克兰群岛', 'France':'法国', 'Gabon':'加蓬', 'United Kingdom':'英国', 'Georgia':'格鲁吉亚', 'Ghana':'加纳', 'Guinea':'几内亚', 'Gambia':'冈比亚', 'Guinea Bissau':'几内亚比绍', 'Equatorial Guinea':'赤道几内亚', 'Greece':'希腊', 'Greenland':'格陵兰', 'Guatemala':'危地马拉', 'French Guiana':'法属圭亚那', 'Guyana':'圭亚那', 'Honduras':'洪都拉斯', 'Croatia':'克罗地亚', 'Haiti':'海地', 'Hungary':'匈牙利', 'Indonesia':'印尼', 'India':'印度', 'Ireland':'爱尔兰', 'Iran':'伊朗', 'Iraq':'伊拉克', 'Iceland':'冰岛', 'Israel':'以色列', 'Italy':'意大利', 'Jamaica':'牙买加', 'Jordan':'约旦', 'Japan':'日本', 'Kazakhstan':'哈萨克斯坦', 'Kenya':'肯尼亚', 'Kyrgyzstan':'吉尔吉斯斯坦', 'Cambodia':'柬埔寨', 'South Korea':'韩国', 'Kosovo':'科索沃', 'Kuwait':'科威特', 'Laos':'老挝', 'Lebanon':'黎巴嫩', 'Liberia':'利比里亚', 'Libya':'利比亚', 'Sri Lanka':'斯里兰卡', 'Lesotho':'莱索托', 'Lithuania':'立陶宛', 'Luxembourg':'卢森堡', 'Latvia':'拉脱维亚', 'Morocco':'摩洛哥', 'Moldova':'摩尔多瓦', 'Madagascar':'马达加斯加', 'Mexico':'墨西哥', 'Macedonia':'马其顿', 'Mali':'马里', 'Myanmar':'缅甸', 'Montenegro':'黑山', 'Mongolia':'蒙古', 'Mozambique':'莫桑比克', 'Mauritania':'毛里塔尼亚', 'Malawi':'马拉维', 'Malaysia':'马来西亚', 'Namibia':'纳米比亚', 'New Caledonia':'新喀里多尼亚', 'Niger':'尼日尔', 'Nigeria':'尼日利亚', 'Nicaragua':'尼加拉瓜', 'Netherlands':'荷兰', 'Norway':'挪威', 'Nepal':'尼泊尔', 'New Zealand':'新西兰', 'Oman':'阿曼', 'Pakistan':'巴基斯坦', 'Panama':'巴拿马', 'Peru':'秘鲁', 'Philippines':'菲律宾', 'Papua New Guinea':'巴布亚新几内亚', 'Poland':'波兰', 'Puerto Rico':'波多黎各', 'North Korea':'北朝鲜', 'Portugal':'葡萄牙', 'Paraguay':'巴拉圭', 'Qatar':'卡塔尔', 'Romania':'罗马尼亚', 'Russia':'俄罗斯', 'Rwanda':'卢旺达', 'Western Sahara':'西撒哈拉', 'Saudi Arabia':'沙特阿拉伯', 'Sudan':'苏丹', 'South Sudan':'南苏丹', 'Senegal':'塞内加尔', 'Solomon Islands':'所罗门群岛', 'Sierra Leone':'塞拉利昂', 'El Salvador':'萨尔瓦多', 'Somaliland':'索马里兰', 'Somalia':'索马里', 'Republic of Serbia':'塞尔维亚共和国', 'Suriname':'苏里南', 'Slovakia':'斯洛伐克', 'Slovenia':'斯洛文尼亚', 'Sweden':'瑞典', 'Swaziland':'斯威士兰', 'Syria':'叙利亚', 'Chad':'乍得', 'Togo':'多哥', 'Thailand':'泰国', 'Tajikistan':'塔吉克斯坦', 'Turkmenistan':'土库曼斯坦', 'East Timor':'东帝汶', 'Trinidad and Tobago':'特里尼达和多巴哥', 'Tunisia':'突尼斯', 'Turkey':'土耳其', 'United Republic of Tanzania':'坦桑尼亚联合共和国', 'Uganda':'乌干达', 'Ukraine':'乌克兰', 'Uruguay':'乌拉圭', 'United States of America':'美国', 'Uzbekistan':'乌兹别克斯坦', 'Venezuela':'委内瑞拉', 'Vietnam':'越南', 'Vanuatu':'瓦努阿图', 'West Bank':'西岸', 'Yemen':'也门', 'South Africa':'南非', 'Zambia':'赞比亚', 'Zimbabwe':'津巴布韦' }; return nameMap[params.name];}"))
                        )),
                    .emphasis(LabelStyle(
                        .show(true)
                        ))
                    ))
                )),
            .series([])
        )
    }
    
}
