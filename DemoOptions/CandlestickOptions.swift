//
//  CandlestickOptions.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 16/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import SwiftyEcharts

public final class CandlestickOptions {
    
    // MARK: Candlestick Brush
    /// 地址: http://echarts.baidu.com/demo.html#candlestick-brush
    static func candlestickBrushOption() -> Option {
//        let splitData: ([[Float]]) -> [String: [Jsonable]] = { rowData in
//            var categoryData: [Float] = []
//            var values: [[Float]] = []
//            for i in 0..<rowData.count {
//                var d = rowData[i]
//                categoryData.append(d[0])
//                d[0] = Float(i)
//                values.append(d)
//            }
//            return [
//                "categoryData": categoryData,
//                "values": values
//            ]
//        }
        
        // TODO: 添加实现
        return Option(
        )
    }
    
    // MARK: 2015 年上证指数
    /// 地址: http://echarts.baidu.com/demo.html#candlestick-sh-2015
    static func candlestickSh2015Option() -> Option {
        guard let jsonUrl = Bundle.main.url(forResource: "CandlestickSh2015", withExtension: "json"), let jsonData = try? Data(contentsOf: jsonUrl), let jsonObj = try? JSONSerialization.jsonObject(with: jsonData, options: []) else {
            return Option()
        }
        
        let rowData = (jsonObj as! [[String]]).reversed()
        
        let calculateMA: (Int, [[Float]]) -> [Jsonable] = { (dayCount, data) in
            var result: [Jsonable] = []
            for i in 0..<data.count {
                if (i < dayCount) {
                    result.append("-")
                    continue
                }
                var sum: Float = 0
                for j in 0..<dayCount {
                    sum += data[i-j][1]
                }
                result.append(sum / Float(dayCount))
            }
            return result
        }
        
        let datas: [Jsonable] = rowData.map { $0[0] }
        
        var data: [[Float]] = []
        for rd in rowData {
            var d: [Float] = []
            d.append(Float(rd[1]) ?? 0.0)
            d.append(Float(rd[2]) ?? 0.0)
            d.append(Float(rd[5]) ?? 0.0)
            d.append(Float(rd[6]) ?? 0.0)
            data.append(d)
        }
        
        return Option(
            .backgroundColor("#21202D"),
            .legend(Legend(
                .data(["日K", "MA5", "MA10", "MA20", "MA30"]),
                .inactiveColor("#777"),
                .textStyle(TextStyle(
                    .color("#fff")
                    ))
                )),
            .tooltip(Tooltip(
                .trigger(.axis),
                .axisPointer(AxisPointerForTooltip(
                    .animation(false),
                    .type(.cross),
                    .lineStyle(LineStyle(
                        .color("#376df4"),
                        .width(2),
                        .opacity(1)
                        ))
                ))
            )),
            .xAxis(Axis(
                .type(.category),
                .data(datas),
                .axisLine(AxisLine(
                    .lineStyle(LineStyle(
                        .color("#8392A5")
                        ))
                    ))
                )),
            .yAxis(Axis(
                .scale(true),
                .axisLine(AxisLine(
                    .lineStyle(LineStyle(
                        .color("#8392A5")
                        ))
                    )),
                .splitLine(SplitLine(.show(false)))
                )),
            .grid(Grid(.bottom(.value(80)))),
            .dataZoom([
                SliderDataZoom(
                    .textStyle(TextStyle(.color("#8392A5"))),
                    .handleIcon("M10.7,11.9v-1.3H9.3v1.3c-4.9,0.3-8.8,4.4-8.8,9.4c0,5,3.9,9.1,8.8,9.4v1.3h1.3v-1.3c4.9-0.3,8.8-4.4,8.8-9.4C19.5,16.3,15.6,12.2,10.7,11.9z M13.3,24.4H6.7V23h6.6V24.4z M13.3,19.6H6.7v-1.4h6.6V19.6z"),
                    .handleSize(80%),
                    .dataBackground(SliderDataZoom.DataBackground(
                        .areaStyle(AreaStyle(
                            .color("#8392A5")
                            )),
                        .lineStyle(EmphasisLineStyle(
                            .normal(LineStyle(
                                .opacity(0.8),
                                .color("#8392A5")
                                ))
                            ))
                        )),
                    .handleStyle(SliderDataZoom.HandleStyle(
                        .color("#fff"),
                        .shadowBlur(3),
                        .shadowColor(rgba(0, 0, 0, 0.6)),
                        .shadowOffsetX(2),
                        .shadowOffsetY(2)
                        ))
                ),
                InsideDataZoom()
                ]),
            .animation(false),
            .series([
                CandlestickSerie(
                    .name("日K"),
                    .data(data.map { $0 as Jsonable }),
                    .itemStyle(ItemStyle(
                        .normal(CommonItemStyleContent(
                            .color("#FD1050"),
                            .color0("#0CF49B"),
                            .borderColor("#FD1050"),
                            .borderColor0("#0CF49B")
                            ))
                        ))
                ),
                LineSerie(
                    .name("MA5"),
                    .data(calculateMA(5, data)),
                    .smooth(true),
                    .showSymbol(false),
                    .lineStyle(EmphasisLineStyle(
                        .normal(LineStyle(
                            .width(1)
                            ))
                        ))
                ),
                LineSerie(
                    .name("MA20"),
                    .data(calculateMA(20, data)),
                    .smooth(true),
                    .showSymbol(false),
                    .lineStyle(EmphasisLineStyle(
                        .normal(LineStyle(
                            .width(1)
                            ))
                        ))
                ),
                LineSerie(
                    .name("MA30"),
                    .data(calculateMA(30, data)),
                    .smooth(true),
                    .showSymbol(false),
                    .lineStyle(EmphasisLineStyle(
                        .normal(LineStyle(
                            .width(1)
                            ))
                        ))
                )
                ])
        )
    }
    
    // MARK: 上证指数
    /// 地址: http://echarts.baidu.com/demo.html#candlestick-sh
    static func candlestickShOption() -> Option {
        let upColor: Color = "#ec0000"
        let upBorderColor: Color = "#8A0000"
        let downColor: Color = "#00da3c"
        let downBorderColor: Color = "#008F28"
        
        let convertor: (Jsonable) -> Float = { d in
            if d is Double {
                return Float(d as! Double)
            } else {
                return Float(d as! Int)
            }
        }
        
        let splitData: ([[Jsonable]]) -> [String: [Jsonable]] = { rowData in
            var categoryData: [Float] = []
            var values: [[Float]] = []
            for data in rowData {
                var tmp = data
                tmp.removeFirst()
                categoryData.append(convertor(tmp[0]))
                values.append(tmp.map { convertor($0) })
            }
            return [
                "categoryData": categoryData.map { $0 },
                "values": values.map { $0 }
            ]
        }
        
        var data0: [String: [Jsonable]] = splitData([
            ["2013/1/24", 2320.26,2320.26,2287.3,2362.94],
            ["2013/1/25", 2300,2291.3,2288.26,2308.38],
            ["2013/1/28", 2295.35,2346.5,2295.35,2346.92],
            ["2013/1/29", 2347.22,2358.98,2337.35,2363.8],
            ["2013/1/30", 2360.75,2382.48,2347.89,2383.76],
            ["2013/1/31", 2383.43,2385.42,2371.23,2391.82],
            ["2013/2/1", 2377.41,2419.02,2369.57,2421.15],
            ["2013/2/4", 2425.92,2428.15,2417.58,2440.38],
            ["2013/2/5", 2411,2433.13,2403.3,2437.42],
            ["2013/2/6", 2432.68,2434.48,2427.7,2441.73],
            ["2013/2/7", 2430.69,2418.53,2394.22,2433.89],
            ["2013/2/8", 2416.62,2432.4,2414.4,2443.03],
            ["2013/2/18", 2441.91,2421.56,2415.43,2444.8],
            ["2013/2/19", 2420.26,2382.91,2373.53,2427.07],
            ["2013/2/20", 2383.49,2397.18,2370.61,2397.94],
            ["2013/2/21", 2378.82,2325.95,2309.17,2378.82],
            ["2013/2/22", 2322.94,2314.16,2308.76,2330.88],
            ["2013/2/25", 2320.62,2325.82,2315.01,2338.78],
            ["2013/2/26", 2313.74,2293.34,2289.89,2340.71],
            ["2013/2/27", 2297.77,2313.22,2292.03,2324.63],
            ["2013/2/28", 2322.32,2365.59,2308.92,2366.16],
            ["2013/3/1", 2364.54,2359.51,2330.86,2369.65],
            ["2013/3/4", 2332.08,2273.4,2259.25,2333.54],
            ["2013/3/5", 2274.81,2326.31,2270.1,2328.14],
            ["2013/3/6", 2333.61,2347.18,2321.6,2351.44],
            ["2013/3/7", 2340.44,2324.29,2304.27,2352.02],
            ["2013/3/8", 2326.42,2318.61,2314.59,2333.67],
            ["2013/3/11", 2314.68,2310.59,2296.58,2320.96],
            ["2013/3/12", 2309.16,2286.6,2264.83,2333.29],
            ["2013/3/13", 2282.17,2263.97,2253.25,2286.33],
            ["2013/3/14", 2255.77,2270.28,2253.31,2276.22],
            ["2013/3/15", 2269.31,2278.4,2250,2312.08],
            ["2013/3/18", 2267.29,2240.02,2239.21,2276.05],
            ["2013/3/19", 2244.26,2257.43,2232.02,2261.31],
            ["2013/3/20", 2257.74,2317.37,2257.42,2317.86],
            ["2013/3/21", 2318.21,2324.24,2311.6,2330.81],
            ["2013/3/22", 2321.4,2328.28,2314.97,2332],
            ["2013/3/25", 2334.74,2326.72,2319.91,2344.89],
            ["2013/3/26", 2318.58,2297.67,2281.12,2319.99],
            ["2013/3/27", 2299.38,2301.26,2289,2323.48],
            ["2013/3/28", 2273.55,2236.3,2232.91,2273.55],
            ["2013/3/29", 2238.49,2236.62,2228.81,2246.87],
            ["2013/4/1", 2229.46,2234.4,2227.31,2243.95],
            ["2013/4/2", 2234.9,2227.74,2220.44,2253.42],
            ["2013/4/3", 2232.69,2225.29,2217.25,2241.34],
            ["2013/4/8", 2196.24,2211.59,2180.67,2212.59],
            ["2013/4/9", 2215.47,2225.77,2215.47,2234.73],
            ["2013/4/10", 2224.93,2226.13,2212.56,2233.04],
            ["2013/4/11", 2236.98,2219.55,2217.26,2242.48],
            ["2013/4/12", 2218.09,2206.78,2204.44,2226.26],
            ["2013/4/15", 2199.91,2181.94,2177.39,2204.99],
            ["2013/4/16", 2169.63,2194.85,2165.78,2196.43],
            ["2013/4/17", 2195.03,2193.8,2178.47,2197.51],
            ["2013/4/18", 2181.82,2197.6,2175.44,2206.03],
            ["2013/4/19", 2201.12,2244.64,2200.58,2250.11],
            ["2013/4/22", 2236.4,2242.17,2232.26,2245.12],
            ["2013/4/23", 2242.62,2184.54,2182.81,2242.62],
            ["2013/4/24", 2187.35,2218.32,2184.11,2226.12],
            ["2013/4/25", 2213.19,2199.31,2191.85,2224.63],
            ["2013/4/26", 2203.89,2177.91,2173.86,2210.58],
            ["2013/5/2", 2170.78,2174.12,2161.14,2179.65],
            ["2013/5/3", 2179.05,2205.5,2179.05,2222.81],
            ["2013/5/6", 2212.5,2231.17,2212.5,2236.07],
            ["2013/5/7", 2227.86,2235.57,2219.44,2240.26],
            ["2013/5/8", 2242.39,2246.3,2235.42,2255.21],
            ["2013/5/9", 2246.96,2232.97,2221.38,2247.86],
            ["2013/5/10", 2228.82,2246.83,2225.81,2247.67],
            ["2013/5/13", 2247.68,2241.92,2231.36,2250.85],
            ["2013/5/14", 2238.9,2217.01,2205.87,2239.93],
            ["2013/5/15", 2217.09,2224.8,2213.58,2225.19],
            ["2013/5/16", 2221.34,2251.81,2210.77,2252.87],
            ["2013/5/17", 2249.81,2282.87,2248.41,2288.09],
            ["2013/5/20", 2286.33,2299.99,2281.9,2309.39],
            ["2013/5/21", 2297.11,2305.11,2290.12,2305.3],
            ["2013/5/22", 2303.75,2302.4,2292.43,2314.18],
            ["2013/5/23", 2293.81,2275.67,2274.1,2304.95],
            ["2013/5/24", 2281.45,2288.53,2270.25,2292.59],
            ["2013/5/27", 2286.66,2293.08,2283.94,2301.7],
            ["2013/5/28", 2293.4,2321.32,2281.47,2322.1],
            ["2013/5/29", 2323.54,2324.02,2321.17,2334.33],
            ["2013/5/30", 2316.25,2317.75,2310.49,2325.72],
            ["2013/5/31", 2320.74,2300.59,2299.37,2325.53],
            ["2013/6/3", 2300.21,2299.25,2294.11,2313.43],
            ["2013/6/4", 2297.1,2272.42,2264.76,2297.1],
            ["2013/6/5", 2270.71,2270.93,2260.87,2276.86],
            ["2013/6/6", 2264.43,2242.11,2240.07,2266.69],
            ["2013/6/7", 2242.26,2210.9,2205.07,2250.63],
            ["2013/6/13", 2190.1,2148.35,2126.22,2190.1]
            ])
        
        let calculateMA: (Int) -> [Jsonable] = { (dayCount) in
            var result: [Jsonable] = []
            let values: [[Float]] = data0["values"]!.map { $0 as! [Float] }
            for i in 0..<values.count {
                if (i < dayCount) {
                    result.append("-")
                    continue
                }
                var sum: Float = 0
                for j in 0..<dayCount {
                    sum += values[i-j][1]
                }
                result.append(sum / Float(dayCount))
            }
            return result
        }
        
        let markPointData: [[String: Jsonable]] = [
            [
                "name": "XX标点",
                "coord": ["2013/5/31", 2300],
                "itemStyle": ["normal": ["color": "rgb(41, 60, 85)"]]
            ],
            [
                "name": "highest value",
                "type": "max",
                "valueDim": "highest"
            ],
            [
                "name": "lowest value",
                "type": "min",
                "valueDim": "lowest"
            ],
            [
                "name": "average value on close",
                "type": "average",
                "valueDim": "close"
            ]
        ]
        
        let markLineData: [Jsonable] = [
            [
                [
                    "name": "from lowest to highest",
                    "type": "min",
                    "valueDim": "lowest",
                    "symbol": "circle",
                    "symbolSize": 10,
                    "label": [
                        "normal": ["show": false],
                        "emphasis": ["show": false]
                    ]
                ],
                [
                    "type": "max",
                    "valueDim": "highest",
                    "symbol": "circle",
                    "symbolSize": 10,
                    "label": [
                        "normal": ["show": false],
                        "emphasis": ["show": false]
                    ]
                ]
            ],
            [
                "name": "min line on close",
                "type": "min",
                "valueDim": "close"
            ],
            [
                "name": "max line on close",
                "type": "max",
                "valueDim": "close"
            ]
        ]
        
        return Option(
            .title(Title(
                .text("上证指数"),
                .left(.value(0))
                )),
            .tooltip(Tooltip(
                .trigger(.axis),
                .axisPointer(AxisPointerForTooltip(
                    .type(.cross)
                    ))
                )),
            .legend(Legend(
                .data(["日K", "MA5", "MA10", "MA20", "MA30"])
                )),
            .grid(Grid(
                .left(.value(10%)),
                .right(.value(10%)),
                .bottom(.value(15%))
                )),
            .xAxis(Axis(
                .type(.category),
                .data(data0["categoryData"]!),
                .scale(true),
                .boundaryGap(false),
                .axisLine(AxisLine(.onZero(false))),
                .splitLine(SplitLine(.show(false))),
                .splitNumber(20),
                .min("dataMin"),
                .max("dataMax")
                )),
            .yAxis(Axis(
                .scale(true),
                .splitArea(SplitArea(.show(true)))
                )),
            .dataZoom([
                InsideDataZoom(
                    .start(50),
                    .end(100)
                ),
                SliderDataZoom(
                    .show(true),
                    .y(.value(90%)),
                    .start(50),
                    .end(100)
                )
                ]),
            .series([
                CandlestickSerie(
                    .name("日k"),
                    .data(data0["values"]!),
                    .itemStyle(ItemStyle(
                        .normal(CommonItemStyleContent(
                            .color(upColor),
                            .color0(downColor),
                            .borderColor(upBorderColor),
                            .borderColor0(downBorderColor)
                            ))
                        )),
                    .markPoint(MarkPoint(
                        .label(EmphasisLabel(
                            .normal(LabelStyle(
                                .formatter(.function("function (param) { return param != null ? Math.round(param.value) : ''; }"))
                                ))
                            )),
                        .data(markPointData),
                        .tooltip(Tooltip(
                            .formatter(.function("function (param) { return param.name + '<br>' + (param.data.coord || ''); }"))
                            ))
                        )),
                    .markLine(MarkLine(
                        .symbols([.none, .none]),
                        .data(markLineData)
                        ))
                ),
                LineSerie(
                    .name("MA5"),
                    .data(calculateMA(5)),
                    .smooth(true),
                    .lineStyle(EmphasisLineStyle(
                        .normal(LineStyle(.opacity(0.5)))
                        ))
                ),
                LineSerie(
                    .name("MA10"),
                    .data(calculateMA(10)),
                    .smooth(true),
                    .lineStyle(EmphasisLineStyle(
                        .normal(LineStyle(.opacity(0.5)))
                        ))
                ),
                LineSerie(
                    .name("MA20"),
                    .data(calculateMA(20)),
                    .smooth(true),
                    .lineStyle(EmphasisLineStyle(
                        .normal(LineStyle(.opacity(0.5)))
                        ))
                ),
                LineSerie(
                    .name("MA30"),
                    .data(calculateMA(30)),
                    .smooth(true),
                    .lineStyle(EmphasisLineStyle(
                        .normal(LineStyle(.opacity(0.5)))
                        ))
                )
                ])
        )
    }
    
    // MARK: 触屏上的坐标轴指示器
    /// 地址: http://echarts.baidu.com/demo.html#candlestick-touch
    static func candlestickTouchOption() -> Option {
        let colorList: [Color] = ["#c23531","#2f4554", "#61a0a8", "#d48265", "#91c7ae","#749f83",  "#ca8622", "#bda29a","#6e7074", "#546570", "#c4ccd3"]
        let labelFont = "bold 12px Sans-serif"
        
        let calculateMA: (Int, [[Float]]) -> [Jsonable] = { (dayCount, data) in
            var result: [Jsonable] = []
            for i in 0..<data.count {
                if (i < dayCount) {
                    result.append("-")
                    continue
                }
                var sum: Float = 0
                for j in 0..<dayCount {
                    sum += data[i-j][1]
                }
                result.append(sum / Float(dayCount))
            }
            return result
        }
        
        let dates = ["2016-03-29", "2016-03-30", "2016-03-31", "2016-04-01", "2016-04-04", "2016-04-05", "2016-04-06", "2016-04-07", "2016-04-08", "2016-04-11", "2016-04-12", "2016-04-13", "2016-04-14", "2016-04-15", "2016-04-18", "2016-04-19", "2016-04-20", "2016-04-21", "2016-04-22", "2016-04-25", "2016-04-26", "2016-04-27", "2016-04-28", "2016-04-29", "2016-05-02", "2016-05-03", "2016-05-04", "2016-05-05", "2016-05-06", "2016-05-09", "2016-05-10", "2016-05-11", "2016-05-12", "2016-05-13", "2016-05-16", "2016-05-17", "2016-05-18", "2016-05-19", "2016-05-20", "2016-05-23", "2016-05-24", "2016-05-25", "2016-05-26", "2016-05-27", "2016-05-31", "2016-06-01", "2016-06-02", "2016-06-03", "2016-06-06", "2016-06-07", "2016-06-08", "2016-06-09", "2016-06-10", "2016-06-13", "2016-06-14", "2016-06-15", "2016-06-16", "2016-06-17", "2016-06-20", "2016-06-21", "2016-06-22"]
        let data: [[Float]] = [[17512.58,17633.11,17434.27,17642.81,86160000],[17652.36,17716.66,17652.36,17790.11,79330000],[17716.05,17685.09,17669.72,17755.7,102600000],[17661.74,17792.75,17568.02,17811.48,104890000],[17799.39,17737,17710.67,17806.38,85230000],[17718.03,17603.32,17579.56,17718.03,115230000],[17605.45,17716.05,17542.54,17723.55,99410000],[17687.28,17541.96,17484.23,17687.28,90120000],[17555.39,17576.96,17528.16,17694.51,79990000],[17586.48,17556.41,17555.9,17731.63,107100000],[17571.34,17721.25,17553.57,17744.43,81020000],[17741.66,17908.28,17741.66,17918.35,91710000],[17912.25,17926.43,17885.44,17962.14,84510000],[17925.95,17897.46,17867.41,17937.65,118160000],[17890.2,18004.16,17848.22,18009.53,89390000],[18012.1,18053.6,17984.43,18103.46,89820000],[18059.49,18096.27,18031.21,18167.63,100210000],[18092.84,17982.52,17963.89,18107.29,102720000],[17985.05,18003.75,17909.89,18026.85,134120000],[17990.94,17977.24,17855.55,17990.94,83770000],[17987.38,17990.32,17934.17,18043.77,92570000],[17996.14,18041.55,17920.26,18084.66,109090000],[18023.88,17830.76,17796.55,18035.73,100920000],[17813.09,17773.64,17651.98,17814.83,136670000],[17783.78,17891.16,17773.71,17912.35,80100000],[17870.75,17750.91,17670.88,17870.75,97060000],[17735.02,17651.26,17609.01,17738.06,95020000],[17664.48,17660.71,17615.82,17736.11,81530000],[17650.3,17740.63,17580.38,17744.54,80020000],[17743.85,17705.91,17668.38,17783.16,85590000],[17726.66,17928.35,17726.66,17934.61,75790000],[17919.03,17711.12,17711.05,17919.03,87390000],[17711.12,17720.5,17625.38,17798.19,88560000],[17711.12,17535.32,17512.48,17734.74,86640000],[17531.76,17710.71,17531.76,17755.8,88440000],[17701.46,17529.98,17469.92,17701.46,103260000],[17501.28,17526.62,17418.21,17636.22,79120000],[17514.16,17435.4,17331.07,17514.16,95530000],[17437.32,17500.94,17437.32,17571.75,111990000],[17507.04,17492.93,17480.05,17550.7,87790000],[17525.19,17706.05,17525.19,17742.59,86480000],[17735.09,17851.51,17735.09,17891.71,79180000],[17859.52,17828.29,17803.82,17888.66,68940000],[17826.85,17873.22,17824.73,17873.22,73190000],[17891.5,17787.2,17724.03,17899.24,147390000],[17754.55,17789.67,17664.79,17809.18,78530000],[17789.05,17838.56,17703.55,17838.56,75560000],[17799.8,17807.06,17689.68,17833.17,82270000],[17825.69,17920.33,17822.81,17949.68,71870000],[17936.22,17938.28,17936.22,18003.23,78750000],[17931.91,18005.05,17931.91,18016,71260000],[17969.98,17985.19,17915.88,18005.22,69690000],[17938.82,17865.34,17812.34,17938.82,90540000],[17830.5,17732.48,17731.35,17893.28,101690000],[17710.77,17674.82,17595.79,17733.92,93740000],[17703.65,17640.17,17629.01,17762.96,94130000],[17602.23,17733.1,17471.29,17754.91,91950000],[17733.44,17675.16,17602.78,17733.44,248680000],[17736.87,17804.87,17736.87,17946.36,99380000],[17827.33,17829.73,17799.8,17877.84,85130000],[17832.67,17780.83,17770.36,17920.16,89440000]]
        let volumes = [86160000,79330000,102600000,104890000,85230000,115230000,99410000,90120000,79990000,107100000,81020000,91710000,84510000,118160000,89390000,89820000,100210000,102720000,134120000,83770000,92570000,109090000,100920000,136670000,80100000,97060000,95020000,81530000,80020000,85590000,75790000,87390000,88560000,86640000,88440000,103260000,79120000,95530000,111990000,87790000,86480000,79180000,68940000,73190000,147390000,78530000,75560000,82270000,71870000,78750000,71260000,69690000,90540000,101690000,93740000,94130000,91950000,248680000,99380000,85130000,89440000]
        
        let dataMA5 = calculateMA(5, data)
        let dataMA10 = calculateMA(10, data)
        let dataMA20 = calculateMA(20, data)
        
        return Option(
            .animation(false),
            .color(colorList),
            .title(Title(
                .left(.center),
                .text("移动端 K线图")
                )),
            .legend(Legend(
                .top(30),
                .data(["日K", "MA5", "MA10", "MA20", "MA30"])
                )),
            .tooltip(Tooltip(
                .triggerOn(.none),
                .transitionDuration(0),
                .confine(true),
                //                .borderRadius(4), // FIXME: borderRadius没有效果？？
                .borderWidth(1),
                .borderColor("#333"),
                .backgroundColor(rgba(255, 255, 255, 0.9)),
                .textStyle(TextStyle(
                    .fontSize(12),
                    .color("#333")
                    )),
                .position(.function("function (pos, params, el, elRect, size) { var obj = { top: 60 }; obj[['left', 'right'][+(pos[0] < size.viewSize[0] / 2)]] = 5; return obj; }"))
                )),
//            .axisPointer(AxisPointerForOption(
//                .line(["xAxisIndex": [0, 1]])
//                )),
            .dataZoom([
                SliderDataZoom(
                    .xAxisIndexes([0, 1]),
                    .realtime(false),
                    .start(20),
                    .end(70),
                    .top(65),
                    .height(20),
                    .handleIcon("M10.7,11.9H9.3c-4.9,0.3-8.8,4.4-8.8,9.4c0,5,3.9,9.1,8.8,9.4h1.3c4.9-0.3,8.8-4.4,8.8-9.4C19.5,16.3,15.6,12.2,10.7,11.9z M13.3,24.4H6.7V23h6.6V24.4z M13.3,19.6H6.7v-1.4h6.6V19.6z"),
                    .handleSize(120%)
                ),
                InsideDataZoom(
                    .xAxisIndexes([0, 1]),
                    .start(40),
                    .end(70)
//                    .top(30), // FIXME: 没有效果？？
//                    .height(20) // FIXME: 没有效果？？
                )
                ]),
            .xAxises([
                Axis(
                    .type(.category),
                    .data(dates.map { $0 as Jsonable }),
                    .boundaryGap(false),
                    .axisLine(AxisLine(
                        .lineStyle(LineStyle(
                            .color("#777")
                            ))
                        )),
                    .axisLabel(AxisLabel(
                        .formatter(.function("function (value) { return echarts.format.formatTime('MM-dd', value); }"))
                        )),
                    .min("dataMin"),
                    .max("dataMax"),
                    .axisPointer(AxisPointerForAxis(.show(true)))
                ),
                Axis(
                    .type(.category),
                    .gridIndex(1),
                    .data(dates.map { $0 as Jsonable }),
                    .scale(true),
                    .boundaryGap(false),
                    .splitLine(SplitLine(.show(false))),
                    .axisLabel(AxisLabel(.show(false))),
                    .axisTick(AxisTick(.show(false))),
                    .axisLine(AxisLine(.show(false))),
                    .splitNumber(20),
                    .min("dataMin"),
                    .max("dataMax"),
                    .axisPointer(AxisPointerForAxis(
                        .type(.shadow),
                        .label(Label(.show(false))),
                        .triggerTooltip(true),
                        .handle(AxisPointerForAxis.Handle(
                            .show(true),
                            .margin(30),
                            .color("#B80C00")
                            ))
                        ))
                )
                ]),
            .yAxises([
                Axis(
                    .scale(true),
                    .splitNumber(2),
                    .axisLine(AxisLine(
                        .lineStyle(LineStyle(
                            .color("#777")
                            ))
                        )),
                    .splitLine(SplitLine(.show(true))),
                    .axisTick(AxisTick(.show(false))),
                    .axisLabel(AxisLabel(
                        .inside(true),
                        .formatter(.string("{value}"))
                        ))
                ),
                Axis(
                    .scale(true),
                    .gridIndex(1),
                    .splitNumber(2),
                    .axisLabel(AxisLabel(.show(false))),
                    .axisLine(AxisLine(.show(false))),
                    .axisTick(AxisTick(.show(false))),
                    .splitLine(SplitLine(.show(false)))
                )
                ]),
            .grids([
                Grid(
                    .left(20),
                    .right(20),
                    .top(110),
                    .height(120)
                ),
                Grid(
                    .left(20),
                    .right(20),
                    .height(40),
                    .top(260)
                )
                ]),
            .graphic([
                GroupGraphic(
                    .left(.center),
                    .top(70),
                    .width(300),
                    .bounding(.raw),
                    .children([
                        TextGraphic(
                            .id("MA5"),
                            .style(TextGraphic.Style(
                                .fill(colorList[1]),
                                .font(labelFont)
                                )),
                            .left(0)
                        ),
                        TextGraphic(
                            .id("MA10"),
                            .style(TextGraphic.Style(
                                .fill(colorList[2]),
                                .font(labelFont)
                                )),
                            .left(.center)
                        ),
                        TextGraphic(
                            .id("MA20"),
                            .style(TextGraphic.Style(
                                .fill(colorList[3]),
                                .font(labelFont)
                                )),
                            .right(0)
                        )
                        ])
                )
                ]),
            .series([
                BarSerie(
                    .name("Volume"),
                    .xAxisIndex(1),
                    .yAxisIndex(1),
                    .itemStyle(ItemStyle(
                        .normal(CommonItemStyleContent(
                            .color("#7fbe9e")
                            )),
                        .emphasis(CommonItemStyleContent(
                            .color("#140")
                            ))
                        )),
                    .data(volumes.map { $0 as Jsonable })
                ),
                CandlestickSerie(
                    .name("日K"),
                    .data(data.map { $0 as Jsonable }),
                    .itemStyle(ItemStyle(
                        .normal(CommonItemStyleContent(
                            .color("#ef232a"),
                            .color0("#14b143"),
                            .borderColor("#ef232a"),
                            .borderColor0("#14b143")
                            )),
                        .emphasis(CommonItemStyleContent(
                            .color(.black),
                            .color0("#444"),
                            .borderColor(.black),
                            .borderColor0("#444")
                            ))
                        ))
                ),
                LineSerie(
                    .name("MA5"),
                    .data(dataMA5.map { $0 as Jsonable }),
                    .smooth(true),
                    .showSymbol(false),
                    .lineStyle(EmphasisLineStyle(
                        .normal(LineStyle(
                            .width(1)
                            ))
                        ))
                ),
                LineSerie(
                    .name("MA10"),
                    .data(dataMA10.map { $0 as Jsonable }),
                    .smooth(true),
                    .showSymbol(false),
                    .lineStyle(EmphasisLineStyle(
                        .normal(LineStyle(
                            .width(1)
                            ))
                        ))
                ),
                LineSerie(
                    .name("MA20"),
                    .data(dataMA20.map { $0 as Jsonable }),
                    .smooth(true),
                    .showSymbol(false),
                    .lineStyle(EmphasisLineStyle(
                        .normal(LineStyle(
                            .width(1)
                            ))
                        ))
                )
                ])
        )
    }
    
    // MARK: OHLC Chart
    /// 地址: http://echarts.baidu.com/demo.html#custom-ohlc
    static func customOhlcOption() -> Option {
        guard let jsonPath = Bundle.main.url(forResource: "stock-DJI", withExtension: "json"), let jsonData = try? Data(contentsOf: jsonPath), let jsonObj = try? JSONSerialization.jsonObject(with: jsonData, options: []) else {
            return Option()
        }
        
        let dataArr: [[Any]] = (jsonObj as! NSArray) as! [[Any]]
        
        let convertor: (Any) -> Float = { d in
            if d is Float {
                return d as! Float
            } else if d is Double {
                return Float(d as! Double)
            } else {
                return Float(d as! Int)
            }
        }
        
        let splitData: ([[Any]]) -> [String: [Jsonable]] = { rowData in
            var categoryData: [String] = []
            var values: [[Float]] = []
            for i in 0..<rowData.count {
                var d = rowData[i]
                categoryData.append(d[0] as! String)
                d[0] = Float(i)
                values.append(d.map { convertor($0) })
            }
            return [
                "categoryData": categoryData.map { $0 as Jsonable },
                "values": values.map { $0 }
            ]
        }
        
        let data = splitData(dataArr)
        
        return Option(
            .backgroundColor("#eee"),
            .animation(false),
            .legend(Legend(
                .bottom(10),
                .left(.center),
                .data(["Dow-Jones index"])
                )),
            .tooltip(Tooltip(
                .trigger(.axis),
                .axisPointer(AxisPointerForTooltip(
                    .type(.cross)
                    )),
                .backgroundColor(rgba(245, 245, 245, 0.8)),
                .borderWidth(1),
                .borderColor("#ccc"),
                .padding(10),
                .textStyle(TextStyle(
                    .color("#000")
                    )),
                .position(.function("function (pos, params, el, elRect, size) { var obj = {top: 10}; obj[['left', 'right'][+(pos[0] < size.viewSize[0] / 2)]] = 30; return obj; }")),
                .extraCssText("width: 170px")
                )),
            .axisPointer(AxisPointerForOption(
                .link(["xAxisIndex": "all"]),
                .label(Label(
                    .backgroundColor("#777")
                    ))
                )),
            .toolbox(Toolbox(
                .feature(ToolboxFeature(
                    .dataZoom(ToolboxFeatureDataZoom(
                        .yAxisIndex(false)
                        )),
                    .brush(ToolboxFeatureBrush(
                        .type([.lineX, .clear])
                        ))
                    ))
                )),
            .grid(Grid(
                .left(.value(10%)),
                .right(.value(8%)),
                .bottom(150)
                )),
            .xAxis(Axis(
                .type(.category),
                .data(data["categoryData"]!),
                .scale(true),
                .boundaryGap(false),
                .axisLine(AxisLine(.onZero(false))),
                .splitLine(SplitLine(.show(false))),
                .splitNumber(20),
                .min("dataMin"),
                .max("dataMax"),
                .axisPointer(AxisPointerForAxis(
                    .z(100)
                    ))
                )),
            .yAxis(Axis(
                .scale(true),
                .splitArea(SplitArea(
                    .show(true)
                    ))
                )),
            .dataZoom([
                InsideDataZoom(
                    .start(98),
                    .end(10)
//                    .minValueSpan(10) // FIXME: 没有minValueSpan
                ),
                SliderDataZoom(
                    .show(true),
                    .bottom(60),
                    .start(98),
                    .end(100)
//                    .minValueSpan(10) // FIXME: 没有minValueSpan
                )
                ]),
            .series([
                CustomSerie(
                    .name("Dow-Jones index"),
                    .renderItem("function renderItem(params, api) { var xValue = api.value(0); var openPoint = api.coord([xValue, api.value(1)]); var closePoint = api.coord([xValue, api.value(2)]); var lowPoint = api.coord([xValue, api.value(3)]); var highPoint = api.coord([xValue, api.value(4)]); var halfWidth = api.size([1, 0])[0] * 0.35; var style = api.style({ stroke: api.visual('color') }); return { type: 'group', children: [{ type: 'line', shape: { x1: lowPoint[0], y1: lowPoint[1], x2: highPoint[0], y2: highPoint[1] }, style: style }, { type: 'line', shape: { x1: openPoint[0], y1: openPoint[1], x2: openPoint[0] - halfWidth, y2: openPoint[1] }, style: style }, { type: 'line', shape: { x1: closePoint[0], y1: closePoint[1], x2: closePoint[0] + halfWidth, y2: closePoint[1] }, style: style }] }; }"),
                    .dimensions(["null", "open", "close", "lowest", "highest"]),
                    .encode([
                        "x": 0,
                        "y": [1, 2, 3, 4],
                        "tooltip": [1, 2, 3, 4]
                        ]),
                    .data(data["values"]!)
                )
                ])
        )
    }
    
}
