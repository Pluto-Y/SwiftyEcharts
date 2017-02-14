//
//  SECLineOptions.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 16/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import SwiftyEcharts

public struct SECLineOptions {
    
    /// 堆叠区域图
    /// 地址:http://echarts.baidu.com/demo.html#area-stack
    static func areaStackOption() -> SECOption {
        return SECOption(
            .title(SECTitle(
                .text("堆叠区域图")
                )),
            .tooltip(SECTooltip(
                .trigger(.axis)
                )),
            .toolbox(SECToolbox(
                .feature(SECToolbox.Feature(
                    .saveAsImage(SECToolbox.Feature.SaveAsImage(
                        
                        ))
                    ))
                )),
            .grid(SECGrid(
                .left(.percent(3)),
                .right(.percent(4)),
                .bottom(.percent(3)),
                .containLabel(true)
                )),
            .xAxis([
                SECAxis(
                    .type(.category),
                    .boundaryGap(.category(false)),
                    .data(["周一","周二","周三","周四","周五","周六","周日"])
                )
                ]),
            .yAxis([
                SECAxis(
                    .type(.value)
                )
                ]),
            .series([
                SECLineSerie(
                    .name("邮件营销"),
                    .stack("总量"),
                    .areaStyle(SECLineSerie.AreaStyle(
                        .normal(SECCommonAreaStyleContent())
                        )),
                    .data([120, 132, 101, 134, 90, 230, 210])
                ),
                SECLineSerie(
                    .name("联盟广告"),
                    .stack("总量"),
                    .areaStyle(SECLineSerie.AreaStyle(
                        .normal(SECCommonAreaStyleContent())
                        )),
                    .data([220, 182, 191, 234, 290, 330, 310])
                ),
                SECLineSerie(
                    .name("视频广告"),
                    .stack("总量"),
                    .areaStyle(SECLineSerie.AreaStyle(
                        .normal(SECCommonAreaStyleContent())
                        )),
                    .data([150, 232, 201, 154, 190, 330, 410])
                ),
                SECLineSerie(
                    .name("直接访问"),
                    .stack("总量"),
                    .areaStyle(SECLineSerie.AreaStyle(
                        .normal(SECCommonAreaStyleContent())
                        )),
                    .data([320, 332, 301, 334, 390, 330, 320])
                ),
                SECLineSerie(
                    .name("搜索引擎"),
                    .stack("总量"),
                    .label(SECLabel(
                        .normal(SECCommonLabelStyle(
                            .show(true),
                            .position(.top)
                            ))
                        )),
                    .areaStyle(SECLineSerie.AreaStyle(
                        .normal(SECCommonAreaStyleContent())
                        )),
                    .data([820, 932, 901, 934, 1290, 1330, 1320])
                )
                ])
        )
    }
    
    /// 指数折线图
    /// 地址: http://echarts.baidu.com/gallery/editor.html?c=line-log
    static func logAxisOption() -> SECOption {
        return SECOption(
            .title(SECTitle(
                .text("对数轴示例"),
                .left(.center)
                )),
            .tooltip(SECTooltip(
                .trigger(.item),
                .formatter(.string("{a} <br/>{b} : {c}"))
                )),
            .legend(SECLegend(
                .left(.left),
                .datas(["2的指数", "3的指数"])
                )),
            .xAxis([
                SECAxis(
                    .type(.category),
                    .name("x"),
                    .splitArea(SECSplitArea(
                        .show(false)
                        )),
                    .data(["一", "二", "三", "四", "五", "六", "七", "八", "九"])
                    )
                ]),
            .grid(SECGrid(
                .left(.percent(3)),
                .right(.percent(4)),
                .bottom(.percent(3)),
                .containLabel(true)
                )),
            .yAxis([
                SECAxis(
                    .type(.log),
                    .name("y")
                    )
                ]),
            .series([
                SECLineSerie(
                    .name("3的指数"),
                    .data([1, 3, 9, 27, 81, 247, 741, 2223, 6669])
                    ),
                SECLineSerie(
                    .name("2的指数"),
                    .data([1, 2, 4, 8, 16, 32, 64, 128, 256])
                    ),
                SECLineSerie(
                    .name("1/2的指数"),
                    .data([1, 0.5, 0.25, 0.125, 0.0625, 0.03125, 0.015625, 0.0078125, 0.00390625])
                    )
                ])
            )
    }
}
