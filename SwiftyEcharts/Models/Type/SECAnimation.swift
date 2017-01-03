//
//  SECAnimation.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 04/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

//public enum SECAnimation

public protocol SECAnimated {
    var animation: Bool { get set }
    var animationThreshold: Float?  { get set }
    var animationDuration: Float? { get set }
//    var animationEasing: // FIXME: 具体如何实现？
    var animationDelay: Float? { get set }
    var animationDurationUpdate: Float? { get set }
//    var animationEasingUpdate: Float// FIXME: 具体如何实现？
    var animationDelayUpdate: Float? { get set }
}
