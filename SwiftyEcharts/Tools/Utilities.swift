//
//  Utilities.swift
//  SwiftyEcharts
//
//  Created by Pluto-Y on 10/01/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import Foundation

// 自定义输出的方法，保证在打包Release版本的时候不会有输出信息
func printInfo(_ object: Any) {
    #if DEBUG
        Swift.print(object)
    #endif
}

// 自定义错误输出的方法，保证不管是Debug还是Release版本都会输出信息
func printError(_ object: Any) {
    Swift.print("Error: \(object)")
}

// 自定义警告输出的方法，保证不管是Debug还是Release版本都会输出信息
func printWarning(_ object: Any) {
    Swift.print("Warning: \(object)")
}
