//
//  HeatmapOptions.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 16/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import SwiftyEcharts

public final class HeatmapOptions {
    
    // MARK: 热力图与百度地图扩展
    /// 地址: http://echarts.baidu.com/demo.html#heatmap-bmap
    static func heatmapBmapOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
    
    // MARK: 笛卡尔坐标系上的热力图
    /// 地址: http://echarts.baidu.com/demo.html#heatmap-cartesian
    static func heatmapCartesianOption() -> Option {
        let hours: [Jsonable] = ["12a", "1a", "2a", "3a", "4a", "5a", "6a",
                     "7a", "8a", "9a","10a","11a",
                     "12p", "1p", "2p", "3p", "4p", "5p",
                     "6p", "7p", "8p", "9p", "10p", "11p"]
        let days: [Jsonable] = ["Saturday", "Friday", "Thursday",
                    "Wednesday", "Tuesday", "Monday", "Sunday"]
        
        var data: [[Jsonable]] = [[0,0,5],[0,1,1],[0,2,0],[0,3,0],[0,4,0],[0,5,0],[0,6,0],[0,7,0],[0,8,0],[0,9,0],[0,10,0],[0,11,2],[0,12,4],[0,13,1],[0,14,1],[0,15,3],[0,16,4],[0,17,6],[0,18,4],[0,19,4],[0,20,3],[0,21,3],[0,22,2],[0,23,5],[1,0,7],[1,1,0],[1,2,0],[1,3,0],[1,4,0],[1,5,0],[1,6,0],[1,7,0],[1,8,0],[1,9,0],[1,10,5],[1,11,2],[1,12,2],[1,13,6],[1,14,9],[1,15,11],[1,16,6],[1,17,7],[1,18,8],[1,19,12],[1,20,5],[1,21,5],[1,22,7],[1,23,2],[2,0,1],[2,1,1],[2,2,0],[2,3,0],[2,4,0],[2,5,0],[2,6,0],[2,7,0],[2,8,0],[2,9,0],[2,10,3],[2,11,2],[2,12,1],[2,13,9],[2,14,8],[2,15,10],[2,16,6],[2,17,5],[2,18,5],[2,19,5],[2,20,7],[2,21,4],[2,22,2],[2,23,4],[3,0,7],[3,1,3],[3,2,0],[3,3,0],[3,4,0],[3,5,0],[3,6,0],[3,7,0],[3,8,1],[3,9,0],[3,10,5],[3,11,4],[3,12,7],[3,13,14],[3,14,13],[3,15,12],[3,16,9],[3,17,5],[3,18,5],[3,19,10],[3,20,6],[3,21,4],[3,22,4],[3,23,1],[4,0,1],[4,1,3],[4,2,0],[4,3,0],[4,4,0],[4,5,1],[4,6,0],[4,7,0],[4,8,0],[4,9,2],[4,10,4],[4,11,4],[4,12,2],[4,13,4],[4,14,4],[4,15,14],[4,16,12],[4,17,1],[4,18,8],[4,19,5],[4,20,3],[4,21,7],[4,22,3],[4,23,0],[5,0,2],[5,1,1],[5,2,0],[5,3,3],[5,4,0],[5,5,0],[5,6,0],[5,7,0],[5,8,2],[5,9,0],[5,10,4],[5,11,1],[5,12,5],[5,13,10],[5,14,5],[5,15,7],[5,16,11],[5,17,6],[5,18,0],[5,19,5],[5,20,3],[5,21,4],[5,22,2],[5,23,0],[6,0,1],[6,1,0],[6,2,0],[6,3,0],[6,4,0],[6,5,0],[6,6,0],[6,7,0],[6,8,0],[6,9,0],[6,10,1],[6,11,0],[6,12,2],[6,13,1],[6,14,3],[6,15,4],[6,16,0],[6,17,0],[6,18,0],[6,19,0],[6,20,1],[6,21,2],[6,22,2],[6,23,6]]
        
        data = data.map { [$0[1], $0[0], (($0[2] as! Int) == 0 ? "-" : $0[2])] }
        return Option(
            .tooltip(Tooltip(
                .position(.top)
                )),
            .animation(false),
            .grid(Grid(
                .height(50%),
                .y(.value(10%))
                )),
            .xAxis(Axis(
                .type(.category),
                .data(hours),
                .splitArea(SplitArea(
                    .show(true)
                    ))
                )),
            .yAxis(Axis(
                .type(.category),
                .data(days),
                .splitArea(SplitArea(.show(true)))
                )),
            .visualMap(ContinuousVisualMap(
                .min(0),
                .max(10),
                .calculable(true),
                .orient(.horizontal),
                .left(.center),
                .bottom(.value(15%))
                )),
            .series([
                HeatmapSerie(
                    .name("Punch Card"),
                    .data(data.map { $0 }),
                    .label(EmphasisLabel(
                        .normal(LabelStyle(
                            .show(true)
                            ))
                        )),
                    .itemStyle(ItemStyle(
                        .emphasis(CommonItemStyleContent(
                            .shadowBlur(10),
                            .shadowColor(rgba(0, 0, 0, 0.5))
                            ))
                        ))
                )
                ])
        )
    }
    
    // MARK: 热力图 - 颜色的离散映射
    /// 地址: http://echarts.baidu.com/demo.html#heatmap-large-piecewise
    static func heatmapLargePiecewiseOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
    
    // MARK: 热力图 - 2w 数据
    /// 地址: http://echarts.baidu.com/demo.html#heatmap-large
    static func heatmapLargeOption() -> Option {
        // TODO: 添加实现
        return Option(
        )
    }
    
    static public func getVirtualData(_ year: Int) -> [Jsonable] {
        var result: [Jsonable] = []
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dayTime = 24*3600
        let start = "\(year)-01-01"
        let end = "\(year+1)-01-01"
        var date = dateFormatter.date(from: start)!
        let endDay = dateFormatter.date(from: end)!
        while date.compare(endDay) == .orderedAscending {
            let data: [Jsonable] = [
                dateFormatter.string(from: date),
                arc4random_uniform(1000)
            ]
            result.append(data)
            date = Date(timeInterval: Double(dayTime), since: date)
        }
        return result
    }
    
    // MARK: Calendar Heatmap Vertical
    /// 地址: http://echarts.baidu.com/demo.html#calendar-vertical
    static func calendarVerticalOption() -> Option {
        return Option(
            .tooltip(Tooltip(
                .position(.top),
                .formatter(.function("function (p) {var format = echarts.format.formatTime('yyyy-MM-dd', p.data[0]);return format + ': ' + p.data[1];}"))
                )),
            .visualMap(ContinuousVisualMap(
                .min(0),
                .max(1000),
                .calculable(true),
                .orient(.vertical),
                .left(.value(670)),
                .top(.center)
                )),
            .calendars([
                Calendar(
                    .left(.value(50)),
                    .range("2015"),
                    .cellSize([8, "auto"]),
                    .orient(.vertical)
                ),
                Calendar(
                    .left(.center),
                    .cellSize([8, "auto"]),
                    .range("2016"),
                    .orient(.vertical)
                ),
                Calendar(
                    .right(.value(50)),
                    .range("2017"),
                    .cellSize([8, "auto"]),
                    .bottom(.value(10)),
                    .orient(.vertical),
                    .dayLabel(DayLabel(
                        .margin(5)
                        ))
                )
                ]),
            .series([
                HeatmapSerie(
                    .coordinateSystem(.calendar),
                    .calendarIndex(0),
                    .data(HeatmapOptions.getVirtualData(2015))
                ),
                HeatmapSerie(
                    .coordinateSystem(.calendar),
                    .calendarIndex(1),
                    .data(HeatmapOptions.getVirtualData(2016))
                ),
                HeatmapSerie(
                    .coordinateSystem(.calendar),
                    .calendarIndex(2),
                    .data(HeatmapOptions.getVirtualData(2017))
                )
                ])
        )
    }
    
    // MARK: Calendar Heatmap Horizontal
    /// 地址: http://echarts.baidu.com/demo.html#calendar-horizontal
    static func calendarHorizontalOption() -> Option {
        return Option(
            .tooltip(Tooltip(.position(.top))),
            .visualMap(ContinuousVisualMap(
                .min(0),
                .max(1000),
                .calculable(true),
                .orient(.horizontal),
                .left(.center),
                .top(.top)
                )),
            .calendars([
                Calendar(
                    .range("2017"),
                    .cellSize(["auto", 8])
                ),
                Calendar(
                    .top(.value(145)),
                    .range("2016"),
                    .cellSize(["auto", 8])
                ),
                Calendar(
                    .top(.value(230)),
                    .range("2015"),
                    .cellSize(["auto", 8]),
                    .right(.value(5))
                )
                ]),
            .series([
                HeatmapSerie(
                    .coordinateSystem(.calendar),
                    .calendarIndex(0),
                    .data(HeatmapOptions.getVirtualData(2017))
                ),
                HeatmapSerie(
                    .coordinateSystem(.calendar),
                    .calendarIndex(1),
                    .data(HeatmapOptions.getVirtualData(2016))
                ),
                HeatmapSerie(
                    .coordinateSystem(.calendar),
                    .calendarIndex(2),
                    .data(HeatmapOptions.getVirtualData(2015))
                )
                ])
        )
    }
}
