//
//  SECPieOptions.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 16/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import SwiftyEcharts

public struct SECPieOptions {
    // MARK: Customized Pie
    /// 地址:http://echarts.baidu.com/demo.html#pie-custom
    static func pieCustomOption() -> SECOption {
        return SECOption(
            .backgroundColor(.hexColor("#2c343c")),
            .title(SECTitle(
                .text("Customized Pie"),
                .left(.center),
                .top(.value(20)),
                .textStyle(SECTextStyle(
                    .color(.hexColor("#ccc"))
                    ))
                )),
            .tooltip(SECTooltip(
                .trigger(.item),
                .formatter(.string("{a} <br/>{b} : {c} ({d}%)"))
                )),
            .visualMap(SECContinuousVisualMap(
                .show(false),
                .min(80),
                .max(600),
                .inRange([
                    "colorLightness" : [0, 1]
                    ])
                )),
            .series([
                SECPieSerie(
                    .name("访问来源"),
                    .radius(55%),
                    .center([50%, 50%]),
                    .data([
                        [ "value":235, "name":"视频广告" ],
                        [ "value":274, "name":"联盟广告" ],
                        [ "value":310, "name":"邮件营销" ],
                        [ "value":335, "name":"直接访问" ],
                        [ "value":400, "name":"搜索引擎" ]
                        ]),
                    .roseType(true), // FIXME: 需要调整
                    .label(SECFormattedLabel(
                        .normal(SECFormattedLabelStyle(
                            .textStyle(SECTextStyle(
                                .color(.rgba(255, 255, 255, 0.3))
                                ))
                            ))
                        )),
                    .labelLine(SECPieSerie.LabelLine(
                        .normal(SECPieSerie.LabelLineContent(
                            .lineStyle(SECLineStyle(
                                .color(.rgba(255, 255, 255, 0.3))
                                )),
//                            .smooth(0.2), // FIXME: 需要调整类型
                            .length(10),
                            .length2(20)
                            ))
                        )),
                    .itemStyle(SECItemStyle(
                        .normal(SECCommonItemStyleContent(
                            .color(.hexColor("#c23531")),
                            .shadowBlur(200),
                            .shadowColor(.rgba(0, 0, 0, 0.5))
                            ))
                        )),
                    .animationType(.scale),
                    .animationEasing(.elasticOut),
                    .animationDelay(.function("function animationDelay(idx) { return Math.random() * 200 ;} "))
                )
                ])
        )
    }
}
