//
//  Echarts.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 09/09/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import JavaScriptCore

/// 用于封装一些通用的Echarts提供的工具
public final class Echarts {
    /// SwiftyEcharts.framework的位置
    public static let frameworkBundle: Bundle? = {
        if let bundlePath = Bundle.main.path(forResource: "SwiftyEcharts", ofType: "framework", inDirectory: "Frameworks") {
            return Bundle(path: bundlePath)!
        }
        // 避免不在Frameworks目录下的情况， 例如在unit test中就不出现在Framework下
        for bundle in Bundle.allBundles {
            if let bundlePath = bundle.path(forResource: "SwiftyEcharts", ofType: "framework") {
                return Bundle(path: bundlePath)!
            }
        }
        return nil
    }()
    
    /// 加载echart.min.js的内容到JSContext中
    ///
    /// - Parameter context: 需要加载到的JSContext
    public static func loadEcharts(_ context: JSContext) {
        guard let echartScriptPath = frameworkBundle?.path(forResource: "echarts.min", ofType: "js", inDirectory: "js"), let echartsScripts = try? String(contentsOfFile: echartScriptPath) else {
            return
        }
        
        context.evaluateScript(echartsScripts)
    }
}

// MARK: DataTool
extension Echarts {
    /// 针对DataTool模块的封装
    public class DataTool {
        
        /// 加载dataTool.js模块到JSContext中
        ///
        /// - Parameter context: 需要加载到的JSContext
        public static func loadDataTool(_ context: JSContext) {
            guard let scriptPath = frameworkBundle?.path(forResource: "dataTool", ofType: "js", inDirectory: "js"), let scripts = try? String(contentsOfFile: scriptPath) else {
                return
            }
            Echarts.loadEcharts(context)
            context.evaluateScript(scripts)
        }
        
        /// 执行echarts.dataTool.prepareBoxplotData的方法，并将返回值获得用于给业务层用
        ///
        /// - Parameters:
        ///   - datas: 需要执行该方法的数据
        ///   - option: 可以配置的项目，可以配置为选项有'boundIQR'的选项以及'layout'选项
        ///             其中 `layout` 可以配置为 'horizontal' 或 'vertical' 用于 Boxplot 的布局
        ///             其中 `boundIQR` 用来配置小于该值的是 outlier 的值，默认是1.5, 意思是: Q1 - 1.5 * (Q3 - Q1), 
        /// - Notes: 虽然 `boundIQR` 配置的是数值，但是应该以字符串传入
        /// - Returns: 转换后的数据
        public static func prepareBoxplotData(_ datas: [[Float]], _ option: [String: String] = [:]) -> [String: [Jsonable]] {
            guard let context = JSContext(virtualMachine: JSVirtualMachine()) else {
                return [:]
            }
            
            self.loadDataTool(context)
            
            let scriptResult = context.evaluateScript("echarts.dataTool.prepareBoxplotData(\(datas), \(option.jsonString))")
            guard let sr = scriptResult, !sr.isUndefined , sr.isObject else {
                return [:]
            }
            
            let scriptResultDic = scriptResult?.toDictionary() as! [String: NSArray]
            var result: [String: [Jsonable]] = [:]
            var outliers: [[Jsonable]] = []
            for outer in scriptResultDic["outliers"]! {
                var innerArr: [Jsonable] = []
                for inner in outer as! NSArray {
                    innerArr.append(inner as! Float)
                }
                outliers.append(innerArr)
            }
            result["outliers"] = outliers.map { $0 as Jsonable }
            var axisDatas: [String] = []
            for axisData in scriptResultDic["axisData"]! {
                axisDatas.append(axisData as! String)
            }
            result["axisData"]  = axisDatas.map { $0 as Jsonable }
            var boxDatas: [[Jsonable]] = []
            for outer in scriptResultDic["boxData"]! {
                var innerArr: [Jsonable] = []
                for inner in outer as! NSArray {
                    innerArr.append(inner as! Float)
                }
                boxDatas.append(innerArr)
            }
            result["boxData"]  = boxDatas.map { $0 as Jsonable }
            return result
        }
    }
}
