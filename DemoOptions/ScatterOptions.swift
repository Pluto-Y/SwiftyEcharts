//
//  ScatterOptions.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 16/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import SwiftyEcharts

public final class ScatterOptions {
    
    // MARK: 气泡图
    /// 地址: http://echarts.baidu.com/demo.html#bubble-gradient
    static func bubbleGradientOption() -> Option { // FIXME: 缺少 symbolSize 的函数支持
        let data: [[Jsonable]] = [
            [[28604,77,17096869,"Australia",1990],[31163,77.4,27662440,"Canada",1990],[1516,68,1154605773,"China",1990],[13670,74.7,10582082,"Cuba",1990],[28599,75,4986705,"Finland",1990],[29476,77.1,56943299,"France",1990],[31476,75.4,78958237,"Germany",1990],[28666,78.1,254830,"Iceland",1990],[1777,57.7,870601776,"India",1990],[29550,79.1,122249285,"Japan",1990],[2076,67.9,20194354,"North Korea",1990],[12087,72,42972254,"South Korea",1990],[24021,75.4,3397534,"New Zealand",1990],[43296,76.8,4240375,"Norway",1990],[10088,70.8,38195258,"Poland",1990],[19349,69.6,147568552,"Russia",1990],[10670,67.3,53994605,"Turkey",1990],[26424,75.7,57110117,"United Kingdom",1990],[37062,75.4,252847810,"United States",1990]],
            [[44056,81.8,23968973,"Australia",2015],[43294,81.7,35939927,"Canada",2015],[13334,76.9,1376048943,"China",2015],[21291,78.5,11389562,"Cuba",2015],[38923,80.8,5503457,"Finland",2015],[37599,81.9,64395345,"France",2015],[44053,81.1,80688545,"Germany",2015],[42182,82.8,329425,"Iceland",2015],[5903,66.8,1311050527,"India",2015],[36162,83.5,126573481,"Japan",2015],[1390,71.4,25155317,"North Korea",2015],[34644,80.7,50293439,"South Korea",2015],[34186,80.6,4528526,"New Zealand",2015],[64304,81.6,5210967,"Norway",2015],[24787,77.3,38611794,"Poland",2015],[23038,73.13,143456918,"Russia",2015],[19360,76.5,78665830,"Turkey",2015],[38225,81.4,64715810,"United Kingdom",2015],[53354,79.1,321773631,"United States",2015]]
        ]
        return Option(
            .backgroundColor(.radialGradient(0.3, 0.3, 0.8, [
                [
                    "offset": 0,
                    "color": Color.hexColor("#f7f8fa")
                ], [
                    "offset": 1,
                    "color": Color.hexColor("#cdd0d5")
                ]
                ], false)),
            .title(Title(
                .text("1990 与 2015 年各国家人均寿命与 GDP")
                )),
            .legend(Legend(
                .right(.value(10)),
                .data(["1990", "2015"])
                )),
            .xAxis(Axis(
                .splitLine(SplitLine(
                    .lineStyle(LineStyle(
                        .type(.dashed)
                        ))
                    ))
                )),
            .yAxis(Axis(
                .splitLine(SplitLine(
                    .lineStyle(LineStyle(
                        .type(.dashed)
                        ))
                    )),
                .scale(true)
                )),
            .series([
                ScatterSerie(
                    .name("1990"),
                    .data(data[0]),
                    .symbolSize("function (data) {return Math.sqrt(data[2]) / 5e2;}"),
                    .label(FormattedLabel(
                        .emphasis(FormattedLabelStyle(
                            .show(true),
                            .formatter(.string("function (param) {return param.data[3];}")),
                            .position(.top)
                            ))
                        )),
                    .itemStyle(ItemStyle(
                        .normal(CommonItemStyleContent(
                            .shadowBlur(10),
                            .shadowColor(.rgba(120, 36, 50, 0.5)),
                            .shadowOffsetY(5),
                            .color(.radialGradient(0.4, 0.3, 1, [
                                [
                                    "offset": 0,
                                    "color": Color.rgb(251, 118, 123)
                                ], [
                                    "offset": 1,
                                    "color": Color.rgb(204, 46, 72)
                                ]
                                ], true))
                            ))
                        ))
                ),
                ScatterSerie(
                    .name("2015"),
                    .data(data[1]),
                    .symbolSize("function (data) {return Math.sqrt(data[2]) / 5e2;}"),
                    .label(FormattedLabel(
                        .emphasis(FormattedLabelStyle(
                            .show(true),
                            .formatter(.string("function (param) {return param.data[3];}")),
                            .position(.top)
                            ))
                        )),
                    .itemStyle(ItemStyle(
                        .normal(CommonItemStyleContent(
                            .shadowBlur(10),
                            .shadowColor(.rgba(25, 100, 150, 0.5)),
                            .shadowOffsetY(5),
                            .color(.radialGradient(0.4, 0.3, 1, [
                                [
                                    "offset": 0,
                                    "color": Color.rgb(129, 227, 238)
                                ], [
                                    "offset": 1,
                                    "color": Color.rgb(25, 183, 207)
                                ]
                                ], false))
                            /*
                             
                            */
                            ))
                        ))
                )
                ])
        )
    }
    
    static let data: [[String: Jsonable]] = [
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
        [ "name": "莱西", "value": 21 ],
        [ "name": "日照", "value": 21 ],
        [ "name": "胶南", "value": 22 ],
        [ "name": "南通", "value": 23 ],
        [ "name": "拉萨", "value": 24 ],
        [ "name": "云浮", "value": 24 ],
        [ "name": "梅州", "value": 25 ],
        [ "name": "文登", "value": 25 ],
        [ "name": "上海", "value": 25 ],
        [ "name": "攀枝花", "value": 25 ],
        [ "name": "威海", "value": 25 ],
        [ "name": "承德", "value": 25 ],
        [ "name": "厦门", "value": 26 ],
        [ "name": "汕尾", "value": 26 ],
        [ "name": "潮州", "value": 26 ],
        [ "name": "丹东", "value": 27 ],
        [ "name": "太仓", "value": 27 ],
        [ "name": "曲靖", "value": 27 ],
        [ "name": "烟台", "value": 28 ],
        [ "name": "福州", "value": 29 ],
        [ "name": "瓦房店", "value": 30 ],
        [ "name": "即墨", "value": 30 ],
        [ "name": "抚顺", "value": 31 ],
        [ "name": "玉溪", "value": 31 ],
        [ "name": "张家口", "value": 31 ],
        [ "name": "阳泉", "value": 31 ],
        [ "name": "莱州", "value": 32 ],
        [ "name": "湖州", "value": 32 ],
        [ "name": "汕头", "value": 32 ],
        [ "name": "昆山", "value": 33 ],
        [ "name": "宁波", "value": 33 ],
        [ "name": "湛江", "value": 33 ],
        [ "name": "揭阳", "value": 34 ],
        [ "name": "荣成", "value": 34 ],
        [ "name": "连云港", "value": 35 ],
        [ "name": "葫芦岛", "value": 35 ],
        [ "name": "常熟", "value": 36 ],
        [ "name": "东莞", "value": 36 ],
        [ "name": "河源", "value": 36 ],
        [ "name": "淮安", "value": 36 ],
        [ "name": "泰州", "value": 36 ],
        [ "name": "南宁", "value": 37 ],
        [ "name": "营口", "value": 37 ],
        [ "name": "惠州", "value": 37 ],
        [ "name": "江阴", "value": 37 ],
        [ "name": "蓬莱", "value": 37 ],
        [ "name": "韶关", "value": 38 ],
        [ "name": "嘉峪关", "value": 38 ],
        [ "name": "广州", "value": 38 ],
        [ "name": "延安", "value": 38 ],
        [ "name": "太原", "value": 39 ],
        [ "name": "清远", "value": 39 ],
        [ "name": "中山", "value": 39 ],
        [ "name": "昆明", "value": 39 ],
        [ "name": "寿光", "value": 40 ],
        [ "name": "盘锦", "value": 40 ],
        [ "name": "长治", "value": 41 ],
        [ "name": "深圳", "value": 41 ],
        [ "name": "珠海", "value": 42 ],
        [ "name": "宿迁", "value": 43 ],
        [ "name": "咸阳", "value": 43 ],
        [ "name": "铜川", "value": 44 ],
        [ "name": "平度", "value": 44 ],
        [ "name": "佛山", "value": 44 ],
        [ "name": "海口", "value": 44 ],
        [ "name": "江门", "value": 45 ],
        [ "name": "章丘", "value": 45 ],
        [ "name": "肇庆", "value": 46 ],
        [ "name": "大连", "value": 47 ],
        [ "name": "临汾", "value": 47 ],
        [ "name": "吴江", "value": 47 ],
        [ "name": "石嘴山", "value": 49 ],
        [ "name": "沈阳", "value": 50 ],
        [ "name": "苏州", "value": 50 ],
        [ "name": "茂名", "value": 50 ],
        [ "name": "嘉兴", "value": 51 ],
        [ "name": "长春", "value": 51 ],
        [ "name": "胶州", "value": 52 ],
        [ "name": "银川", "value": 52 ],
        [ "name": "张家港", "value": 52 ],
        [ "name": "三门峡", "value": 53 ],
        [ "name": "锦州", "value": 54 ],
        [ "name": "南昌", "value": 54 ],
        [ "name": "柳州", "value": 54 ],
        [ "name": "三亚", "value": 54 ],
        [ "name": "自贡", "value": 56 ],
        [ "name": "吉林", "value": 56 ],
        [ "name": "阳江", "value": 57 ],
        [ "name": "泸州", "value": 57 ],
        [ "name": "西宁", "value": 57 ],
        [ "name": "宜宾", "value": 58 ],
        [ "name": "呼和浩特", "value": 58 ],
        [ "name": "成都", "value": 58 ],
        [ "name": "大同", "value": 58 ],
        [ "name": "镇江", "value": 59 ],
        [ "name": "桂林", "value": 59 ],
        [ "name": "张家界", "value": 59 ],
        [ "name": "宜兴", "value": 59 ],
        [ "name": "北海", "value": 60 ],
        [ "name": "西安", "value": 61 ],
        [ "name": "金坛", "value": 62 ],
        [ "name": "东营", "value": 62 ],
        [ "name": "牡丹江", "value": 63 ],
        [ "name": "遵义", "value": 63 ],
        [ "name": "绍兴", "value": 63 ],
        [ "name": "扬州", "value": 64 ],
        [ "name": "常州", "value": 64 ],
        [ "name": "潍坊", "value": 65 ],
        [ "name": "重庆", "value": 66 ],
        [ "name": "台州", "value": 67 ],
        [ "name": "南京", "value": 67 ],
        [ "name": "滨州", "value": 70 ],
        [ "name": "贵阳", "value": 71 ],
        [ "name": "无锡", "value": 71 ],
        [ "name": "本溪", "value": 71 ],
        [ "name": "克拉玛依", "value": 72 ],
        [ "name": "渭南", "value": 72 ],
        [ "name": "马鞍山", "value": 72 ],
        [ "name": "宝鸡", "value": 72 ],
        [ "name": "焦作", "value": 75 ],
        [ "name": "句容", "value": 75 ],
        [ "name": "北京", "value": 79 ],
        [ "name": "徐州", "value": 79 ],
        [ "name": "衡水", "value": 80 ],
        [ "name": "包头", "value": 80 ],
        [ "name": "绵阳", "value": 80 ],
        [ "name": "乌鲁木齐", "value": 84 ],
        [ "name": "枣庄", "value": 84 ],
        [ "name": "杭州", "value": 84 ],
        [ "name": "淄博", "value": 85 ],
        [ "name": "鞍山", "value": 86 ],
        [ "name": "溧阳", "value": 86 ],
        [ "name": "库尔勒", "value": 86 ],
        [ "name": "安阳", "value": 90 ],
        [ "name": "开封", "value": 90 ],
        [ "name": "济南", "value": 92 ],
        [ "name": "德阳", "value": 93 ],
        [ "name": "温州", "value": 95 ],
        [ "name": "九江", "value": 96 ],
        [ "name": "邯郸", "value": 98 ],
        [ "name": "临安", "value": 99 ],
        [ "name": "兰州", "value": 99 ],
        [ "name": "沧州", "value": 100 ],
        [ "name": "临沂", "value": 103 ],
        [ "name": "南充", "value": 104 ],
        [ "name": "天津", "value": 105 ],
        [ "name": "富阳", "value": 106 ],
        [ "name": "泰安", "value": 112 ],
        [ "name": "诸暨", "value": 112 ],
        [ "name": "郑州", "value": 113 ],
        [ "name": "哈尔滨", "value": 114 ],
        [ "name": "聊城", "value": 116 ],
        [ "name": "芜湖", "value": 117 ],
        [ "name": "唐山", "value": 119 ],
        [ "name": "平顶山", "value": 119 ],
        [ "name": "邢台", "value": 119 ],
        [ "name": "德州", "value": 120 ],
        [ "name": "济宁", "value": 120 ],
        [ "name": "荆州", "value": 127 ],
        [ "name": "宜昌", "value": 130 ],
        [ "name": "义乌", "value": 132 ],
        [ "name": "丽水", "value": 133 ],
        [ "name": "洛阳", "value": 134 ],
        [ "name": "秦皇岛", "value": 136 ],
        [ "name": "株洲", "value": 143 ],
        [ "name": "石家庄", "value": 147 ],
        [ "name": "莱芜", "value": 148 ],
        [ "name": "常德", "value": 152 ],
        [ "name": "保定", "value": 153 ],
        [ "name": "湘潭", "value": 154 ],
        [ "name": "金华", "value": 157 ],
        [ "name": "岳阳", "value": 169 ],
        [ "name": "长沙", "value": 175 ],
        [ "name": "衢州", "value": 177 ],
        [ "name": "廊坊", "value": 193 ],
        [ "name": "菏泽", "value": 194 ],
        [ "name": "合肥", "value": 229 ],
        [ "name": "武汉", "value": 273 ],
        [ "name": "大庆", "value": 279 ]
    ]
    
    static let geoCoordMap: [String: [Float]] = [
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
    
    static let convertData: ([[String: Jsonable]]) -> [Jsonable] = { data in
        var res: [Jsonable] = []
        for d in data {
            if let name = d["name"] as? String, var geoCoord = geoCoordMap[name], let value = d["value"] as? Int {
                geoCoord.append(Float(value))
                res.append([
                    "name": name,
                    "value": geoCoord
                    ])
            }
        }
        return res
    }
    
    // MARK: 全国主要城市空气质量 - 百度地图
    /// 地址: http://echarts.baidu.com/demo.html#effectScatter-bmap
    static func effectScatterBmapOption() -> Option {
        // TODO: 添加实现
        return Option(
            
        )
    }
    
    // MARK: 全国主要城市空气质量
    /// 地址: http://echarts.baidu.com/demo.html#effectScatter-map
    static func effectScatterMapOption() -> Option {
        let topFiveData = Array(data.sort { (a, b) -> Bool in
            if let aValue = a["value"] as? Float, let bValue = b["value"] as? Float {
                return bValue > aValue
            }
            return false
        }[0...5])
        return Option(
            .backgroundColor("#404a59"),
            .title(Title(
                .text("全国主要城市空气质量"),
                .subtext("data from PM25.in"),
                .sublink("http://ww.pm25.in"),
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
                .y(.bottom),
                .x(.right),
                .data(["pm2.5"]),
                .textStyle(TextStyle(
                    .color("#fff")
                    ))
                )),
            .geo(Geo(
                .map("china"),
                .label(FormattedLabel(
                    .emphasis(FormattedLabelStyle(
                        .show(false)
                        ))
                    ))
                )),
            .series([
                ScatterSerie(
                    .name("pm2.5"),
                    .coordinateSystem(.geo),
                    .data(convertData(data)),
//                    .symbolSize() // FIXME: 缺少对 symbolSize 函数的支持
                    .label(FormattedLabel(
                        .normal(FormattedLabelStyle(
                            .formatter(.string("{b}")),
                            .position(.right),
                            .show(false)
                            )),
                        .emphasis(FormattedLabelStyle(
                            .show(true)
                            ))
                        )),
                    .itemStyle(ItemStyle(
                        .normal(CommonItemStyleContent(
                            .color("#ddb926")
                            ))
                        ))
                ),
                EffectScatterSerie(
                    .name("Top 5"),
                    .coordinateSystem(.geo),
                    .data(topFiveData.map { return $0 as Jsonable}),
//                    .symbolSize() // FIXME: 缺少对 symbolSize 函数的支持
                    .showEffectOn(.render),
                    .rippleEffect(EffectScatterSerie.RippleEffect(
                        .brushType(.stroke)
                        )),
                    .hoverAnimation(true),
                    .label(FormattedLabel(
                        .normal(FormattedLabelStyle(
                            .formatter(.string("{b}")),
                            .position(.right),
                            .show(true)
                            ))
                        )),
                    .itemStyle(ItemStyle(
                        .normal(CommonItemStyleContent(
                            .color("#f4e925"),
                            .shadowBlur(10),
                            .shadowColor("#333")
                            ))
                        )),
                    .zlevel(1)
                )
            ])
        )
    }
    
    // MARK: Prices and Earnings 2012
    /// 地址: http://echarts.baidu.com/demo.html#map-parallel-prices
    static func mapParallelPricesOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
    
    // MARK: Anscombe's quartet
    /// 地址: http://echarts.baidu.com/demo.html#scatter-anscombe-quartet
    static func scatterAnscombeQuartetOption() -> Option {
        let dataAll: [[[Float]]] = [
            [
                [10.0, 8.04],
                [8.0, 6.95],
                [13.0, 7.58],
                [9.0, 8.81],
                [11.0, 8.33],
                [14.0, 9.96],
                [6.0, 7.24],
                [4.0, 4.26],
                [12.0, 10.84],
                [7.0, 4.82],
                [5.0, 5.68]
            ],
            [
                [10.0, 9.14],
                [8.0, 8.14],
                [13.0, 8.74],
                [9.0, 8.77],
                [11.0, 9.26],
                [14.0, 8.10],
                [6.0, 6.13],
                [4.0, 3.10],
                [12.0, 9.13],
                [7.0, 7.26],
                [5.0, 4.74]
            ],
            [
                [10.0, 7.46],
                [8.0, 6.77],
                [13.0, 12.74],
                [9.0, 7.11],
                [11.0, 7.81],
                [14.0, 8.84],
                [6.0, 6.08],
                [4.0, 5.39],
                [12.0, 8.15],
                [7.0, 6.42],
                [5.0, 5.73]
            ],
            [
                [8.0, 6.58],
                [8.0, 5.76],
                [8.0, 7.71],
                [8.0, 8.84],
                [8.0, 8.47],
                [8.0, 7.04],
                [8.0, 5.25],
                [19.0, 12.50],
                [8.0, 5.56],
                [8.0, 7.91],
                [8.0, 6.89]
            ]
        ]
        
        let markLineOpt = MarkLine(
            .animation(false),
            .label(FormattedLabel(
                .normal(FormattedLabel.Style(
                    .formatter(.string("y = 0.5 * x + 3")),
                    .textStyle(TextStyle(
                        .align(.right)
                        ))
                    ))
                )),
            .lineStyle(EmphasisLineStyle(
                .normal(LineStyle(
                    .type(.solid)
                    ))
                )),
            // FIXME: 缺少一个 tooltip
            .data([[
                MarkData(
                    .coord([0, 3]),
                    .symbol(.none)
                ),
                MarkData(
                    .coord([20, 13]),
                    .symbol(.none)
                )
                ]])
        )
        
        return Option(
            .title(Title(
                .text("Anscombe's quartet"),
                .x(.center),
                .y(.value(0))
                )),
            .grids([
                Grid(
                    .x(.value(7%)),
                    .y(.value(7%)),
                    .width(38%),
                    .height(38%)
                ),
                Grid(
                    .x2(.value(7%)),
                    .y(.value(7%)),
                    .width(38%),
                    .height(38%)
                ),
                Grid(
                    .x(.value(7%)),
                    .y2(.value(7%)),
                    .width(38%),
                    .height(38%)
                ),
                Grid(
                    .x2(.value(7%)),
                    .y2(.value(7%)),
                    .width(38%),
                    .height(38%)
                )
                ]),
            .tooltip(Tooltip(
                .formatter(.string("Group {a}: ({c})"))
                )),
            .xAxises([
                Axis(
                    .gridIndex(0),
                    .min(0),
                    .max(20)
                ),
                Axis(
                    .gridIndex(1),
                    .min(0),
                    .max(20)
                ),
                Axis(
                    .gridIndex(2),
                    .min(0),
                    .max(20)
                ),
                Axis(
                    .gridIndex(3),
                    .min(0),
                    .max(20)
                )
                ]),
            .yAxises([
                Axis(
                    .gridIndex(0),
                    .min(0),
                    .max(15)
                ),
                Axis(
                    .gridIndex(1),
                    .min(0),
                    .max(15)
                ),
                Axis(
                    .gridIndex(2),
                    .min(0),
                    .max(15)
                ),
                Axis(
                    .gridIndex(3),
                    .min(0),
                    .max(15)
                ),
                ]),
            .series([
                ScatterSerie(
                    .name("I"),
                    .xAxisIndex(0),
                    .yAxisIndex(0),
                    .data(dataAll[0].map { $0 as Jsonable}),
                    .markLine(markLineOpt)
                ),
                ScatterSerie(
                    .name("II"),
                    .xAxisIndex(1),
                    .yAxisIndex(1),
                    .data(dataAll[1].map { $0 as Jsonable}),
                    .markLine(markLineOpt)
                ),
                ScatterSerie(
                    .name("III"),
                    .xAxisIndex(2),
                    .yAxisIndex(2),
                    .data(dataAll[2].map { $0 as Jsonable}),
                    .markLine(markLineOpt)
                ),
                ScatterSerie(
                    .name("IV"),
                    .xAxisIndex(3),
                    .yAxisIndex(3),
                    .data(dataAll[3].map { $0 as Jsonable}),
                    .markLine(markLineOpt)
                )
                ])
        )
    }
    
    // MARK: Scatter Aqi Color
    /// 地址: http://echarts.baidu.com/demo.html#scatter-aqi-color
    static func scatterAqiColorOption() -> Option {
        let dataBJ: [[Jsonable]] = [
            [1,55,9,56,0.46,18,6,"良"],
            [2,25,11,21,0.65,34,9,"优"],
            [3,56,7,63,0.3,14,5,"良"],
            [4,33,7,29,0.33,16,6,"优"],
            [5,42,24,44,0.76,40,16,"优"],
            [6,82,58,90,1.77,68,33,"良"],
            [7,74,49,77,1.46,48,27,"良"],
            [8,78,55,80,1.29,59,29,"良"],
            [9,267,216,280,4.8,108,64,"重度污染"],
            [10,185,127,216,2.52,61,27,"中度污染"],
            [11,39,19,38,0.57,31,15,"优"],
            [12,41,11,40,0.43,21,7,"优"],
            [13,64,38,74,1.04,46,22,"良"],
            [14,108,79,120,1.7,75,41,"轻度污染"],
            [15,108,63,116,1.48,44,26,"轻度污染"],
            [16,33,6,29,0.34,13,5,"优"],
            [17,94,66,110,1.54,62,31,"良"],
            [18,186,142,192,3.88,93,79,"中度污染"],
            [19,57,31,54,0.96,32,14,"良"],
            [20,22,8,17,0.48,23,10,"优"],
            [21,39,15,36,0.61,29,13,"优"],
            [22,94,69,114,2.08,73,39,"良"],
            [23,99,73,110,2.43,76,48,"良"],
            [24,31,12,30,0.5,32,16,"优"],
            [25,42,27,43,1,53,22,"优"],
            [26,154,117,157,3.05,92,58,"中度污染"],
            [27,234,185,230,4.09,123,69,"重度污染"],
            [28,160,120,186,2.77,91,50,"中度污染"],
            [29,134,96,165,2.76,83,41,"轻度污染"],
            [30,52,24,60,1.03,50,21,"良"],
            [31,46,5,49,0.28,10,6,"优"]
        ]
        
        let dataGZ: [[Jsonable]] = [
            [1,26,37,27,1.163,27,13,"优"],
            [2,85,62,71,1.195,60,8,"良"],
            [3,78,38,74,1.363,37,7,"良"],
            [4,21,21,36,0.634,40,9,"优"],
            [5,41,42,46,0.915,81,13,"优"],
            [6,56,52,69,1.067,92,16,"良"],
            [7,64,30,28,0.924,51,2,"良"],
            [8,55,48,74,1.236,75,26,"良"],
            [9,76,85,113,1.237,114,27,"良"],
            [10,91,81,104,1.041,56,40,"良"],
            [11,84,39,60,0.964,25,11,"良"],
            [12,64,51,101,0.862,58,23,"良"],
            [13,70,69,120,1.198,65,36,"良"],
            [14,77,105,178,2.549,64,16,"良"],
            [15,109,68,87,0.996,74,29,"轻度污染"],
            [16,73,68,97,0.905,51,34,"良"],
            [17,54,27,47,0.592,53,12,"良"],
            [18,51,61,97,0.811,65,19,"良"],
            [19,91,71,121,1.374,43,18,"良"],
            [20,73,102,182,2.787,44,19,"良"],
            [21,73,50,76,0.717,31,20,"良"],
            [22,84,94,140,2.238,68,18,"良"],
            [23,93,77,104,1.165,53,7,"良"],
            [24,99,130,227,3.97,55,15,"良"],
            [25,146,84,139,1.094,40,17,"轻度污染"],
            [26,113,108,137,1.481,48,15,"轻度污染"],
            [27,81,48,62,1.619,26,3,"良"],
            [28,56,48,68,1.336,37,9,"良"],
            [29,82,92,174,3.29,0,13,"良"],
            [30,106,116,188,3.628,101,16,"轻度污染"],
            [31,118,50,0,1.383,76,11,"轻度污染"]
        ]
        
        let dataSH: [[Jsonable]] = [
            [1,91,45,125,0.82,34,23,"良"],
            [2,65,27,78,0.86,45,29,"良"],
            [3,83,60,84,1.09,73,27,"良"],
            [4,109,81,121,1.28,68,51,"轻度污染"],
            [5,106,77,114,1.07,55,51,"轻度污染"],
            [6,109,81,121,1.28,68,51,"轻度污染"],
            [7,106,77,114,1.07,55,51,"轻度污染"],
            [8,89,65,78,0.86,51,26,"良"],
            [9,53,33,47,0.64,50,17,"良"],
            [10,80,55,80,1.01,75,24,"良"],
            [11,117,81,124,1.03,45,24,"轻度污染"],
            [12,99,71,142,1.1,62,42,"良"],
            [13,95,69,130,1.28,74,50,"良"],
            [14,116,87,131,1.47,84,40,"轻度污染"],
            [15,108,80,121,1.3,85,37,"轻度污染"],
            [16,134,83,167,1.16,57,43,"轻度污染"],
            [17,79,43,107,1.05,59,37,"良"],
            [18,71,46,89,0.86,64,25,"良"],
            [19,97,71,113,1.17,88,31,"良"],
            [20,84,57,91,0.85,55,31,"良"],
            [21,87,63,101,0.9,56,41,"良"],
            [22,104,77,119,1.09,73,48,"轻度污染"],
            [23,87,62,100,1,72,28,"良"],
            [24,168,128,172,1.49,97,56,"中度污染"],
            [25,65,45,51,0.74,39,17,"良"],
            [26,39,24,38,0.61,47,17,"优"],
            [27,39,24,39,0.59,50,19,"优"],
            [28,93,68,96,1.05,79,29,"良"],
            [29,188,143,197,1.66,99,51,"中度污染"],
            [30,174,131,174,1.55,108,50,"中度污染"],
            [31,187,143,201,1.39,89,53,"中度污染"]
        ]
        
        let schema: [[String: String]] = [
            [ "name": "date", "index": "0", "text": "日" ],
            [ "name": "AQIindex", "index": "1", "text": "AQI指数" ],
            [ "name": "PM25", "index": "2", "text": "PM2.5" ],
            [ "name": "PM10", "index": "3", "text": "PM10" ],
            [ "name": "CO", "index": "4", "text": "一氧化碳（CO）" ],
            [ "name": "NO2", "index": "5", "text": "二氧化氮（NO2）" ],
            [ "name": "SO2", "index": "6", "text": "二氧化硫（SO2）" ]
        ]
        
        let itemStyle: ItemStyle = ItemStyle(
            .normal(CommonItemStyleContent(
                .opacity(0.8),
                .shadowBlur(10),
                .shadowOffsetX(0),
                .shadowOffsetY(0),
                .shadowColor(.rgba(0, 0, 0, 0.5))
                ))
        )
        
        var formatter = "function (obj) { var value = obj.value; return '<div style=\"border-bottom: 1px solid rgba(255,255,255,.3); font-size: 18px;padding-bottom: 7px;margin-bottom: 7px\">' + obj.seriesName + ' ' + value[0] + '日：' + value[7] + '</div>'+ " + schema[1]["text"]!
        formatter +=  " + '：' + value[1] + '<br>'+ " + schema[2]["text"]! + " + '：' + value[2] + '<br>'+ " + schema[3]["text"]! + " + '：' + value[3] + '<br>'+ "
        formatter +=  schema[4]["text"]! + " + '：' + value[4] + '<br>'+ " + schema[5]["text"]! + " + '：' + value[5] + '<br>'+ " + schema[6]["text"]! + " + '：' + value[6] + '<br>';}"

        return Option(
            .backgroundColor("#404a59"),
            .color(["#dd4444", "#fec42c", "#80F1BE"]),
            .legend(Legend(
                .y(.top),
                .data(["北京", "上海", "广州"]),
                .textStyle(TextStyle(
                    .color("#fff"),
                    .fontSize(16)
                    ))
                )),
            .grid(Grid(
                .x(.value(10%)),
                .x2(.value(150)),
                .y(.value(18%)),
                .y2(.value(10%))
                )),
            .tooltip(Tooltip(
                .padding(10),
                .backgroundColor("#222"),
                .borderColor("#777"),
                .borderWidth(1),
                .formatter(.function(formatter))
                )),
            .xAxis(Axis(
                .type(.value),
                .name("日期"),
                .nameGap(16),
                .nameTextStyle(TextStyle(
                    .color("#fff"),
                    .fontSize(14)
                    )),
                .max(31),
                .splitLine(SplitLine(
                    .show(false)
                    )),
                .axisLine(AxisLine(
                    .lineStyle(LineStyle(
                        .color("#eee")
                        ))
                    ))
                )),
            .yAxis(Axis(
                .type(.value),
                .name("AQI指数"),
                .nameLocation("end"),
                .nameGap(20),
                .nameTextStyle(TextStyle(
                    .color("#fff"),
                    .fontSize(20)
                    )),
                .axisLine(AxisLine(
                    .lineStyle(LineStyle(
                        .color("#eee")
                        ))
                    )),
                .splitLine(SplitLine(
                    .show(false)
                    ))
                )),
            .visualMaps([
                ContinuousVisualMap(
                    .left(.right),
                    .top(.value(10%)),
                    .dimension(2),
                    .min(0),
                    .max(250),
                    .itemWidth(30),
                    .itemHeight(120),
                    .calculable(true),
                    .precision(0.1),
                    .text(["圆形大小：PM2.5"]),
                    .textGap(30),
                    .textStyle(TextStyle(
                        .color("#fff")
                        )),
                    .inRange([
                        "symbolSize": [10, 70]
                        ]),
                    .outRange([
                        "symbolSize": [10, 70],
                        "color": ["rgba(255, 255, 255, 0.2"]
                        ]),
                    .controller(VisualMapController(
                        .inRange([
                            "color": ["#c23531"]
                        ]),
                        .outRange([
                            "color": ["#444"]
                        ])
                        ))
                ),
                ContinuousVisualMap(
                    .left(.right),
                    .bottom(.value(5%)),
                    .dimension(6),
                    .min(0),
                    .max(50),
                    .itemHeight(120),
                    .calculable(true),
                    .precision(0.1),
                    .text(["明暗：二氧化硫"]),
                    .textGap(30),
                    .textStyle(TextStyle(
                        .color("#fff")
                        )),
                    .inRange([
                        "colorLightness": [1, 0.5]
                        ]),
                    .outRange([
                        "color": ["rgba(255, 255, 255, 0.2)"]
                        ]),
                    .controller(VisualMapController(
                        .inRange([
                            "color": ["#c23531"]
                        ]),
                        .outRange([
                            "color": ["#444"]
                        ])
                        ))
                )
                ]),
            .series([
                ScatterSerie(
                    .name("北京"),
                    .itemStyle(itemStyle),
                    .data(dataBJ.map { $0 as Jsonable })
                ),
                ScatterSerie(
                    .name("上海"),
                    .itemStyle(itemStyle),
                    .data(dataSH.map { $0 as Jsonable })
                ),
                ScatterSerie(
                    .name("广州"),
                    .itemStyle(itemStyle),
                    .data(dataGZ.map { $0 as Jsonable })
                )
            ])
        )
    }

    // MARK: 大规模散点图
    /// 地址: http://echarts.baidu.com/demo.html#scatter-large
    static func scatterLargeOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
    
    // MARK: 各国人均寿命与GDP关系演变
    /// 地址: http://echarts.baidu.com/demo.html#scatter-life-expectancy-timeline
    static func scatterLifeExpectancyTimelineOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
    
    // MARK: Scatter Map Brush
    /// 地址: http://echarts.baidu.com/demo.html#scatter-map-brush
    static func scatterMapBrushOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
    
    // MARK: 全国主要城市空气质量
    /// 地址: http://echarts.baidu.com/demo.html#scatter-map
    static func scatterMapOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }

    // MARK: Scatter Nutrients
    /// 地址: http://echarts.baidu.com/demo.html#scatter-nutrients
    static func scatterNutrientsOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
    
    // MARK: Master Painter Color Choices Throughout History
    /// 地址: http://echarts.baidu.com/demo.html#scatter-painter-choice
    static func scatterPainterChoiceOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
    
    // MARK: Punch Card of Github
    /// 地址: http://echarts.baidu.com/demo.html#scatter-polar-punchCard
    static func scatterPolarPunchCardOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
    
    // MARK: Punch Card of Github
    /// 地址: http://echarts.baidu.com/demo.html#scatter-punchCard
    static func scatterPunchCardOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
    
    // MARK: 单轴散点图
    /// 地址: http://echarts.baidu.com/demo.html#scatter-single-axis
    static func scatterSingleAxisOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
    
    // MARK: 微博签到数据点亮中国
    /// 地址: http://echarts.baidu.com/demo.html#scatter-weibo
    static func scatterWeiboOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
    
    // MARK: 男性女性身高体重分布
    /// 地址: http://echarts.baidu.com/demo.html#scatter-weight
    static func scatterWeightOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
    
    // MARK: World Population (2010)
    /// 地址: http://echarts.baidu.com/demo.html#scatter-world-population
    static func scatterWorldPopulationOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
    
    // MARK: Scatter Nutrients Matrix
    /// 地址: http://echarts.baidu.com/demo.html#scatter-nutrients-matrix
    static func scatterNutrientsMatrixOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
    
    // MARK: Clustering Process
    /// 地址: http://echarts.baidu.com/demo.html#scatter-clustering-process
    static func scatterClusteringProcessOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
    
    // MARK: Linear Regression
    /// 地址: http://echarts.baidu.com/demo.html#scatter-linear-regression
    static func scatterLinearRegressionOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
    
    // MARK: Exponential Regression
    /// 地址: http://echarts.baidu.com/demo.html#scatter-exponential-regression
    static func scatterExponentialRegressionOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
    
    // MARK: Logarithmic Regression
    /// 地址: http://echarts.baidu.com/demo.html#scatter-logarithmic-regression
    static func scatterLogarithmicRegressionOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
    
    // MARK: Polynomial Regression
    /// 地址: http://echarts.baidu.com/demo.html#scatter-polynomial-regression
    static func scatterPolynomialRegressionOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
    
    // MARK: Calendar Effectscatter
    /// 地址: http://echarts.baidu.com/demo.html#calendar-effectscatter
    static func calendarEffectscatterOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
    
}

