//
//  Echarts.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 09/09/2017.
//  Copyright © 2017 com.pluto-y. All rights reserved.
//

import JavaScriptCore

public final class Echarts {
    public static let frameworkBundle: NSBundle? = {
        if let bundlePath = NSBundle.mainBundle().pathForResource("SwiftyEcharts", ofType: "framework", inDirectory: "Frameworks") {
            return NSBundle(path: bundlePath)!
        }
        for bundle in NSBundle.allBundles() {
            if let bundlePath = bundle.pathForResource("SwiftyEcharts", ofType: "framework") {
                return NSBundle(path: bundlePath)!
            }
        }
        return nil
    }() 
    
    public static func loadEcharts(context: JSContext) {
        guard let echartScriptPath = frameworkBundle?.pathForResource("echarts.min", ofType: "js", inDirectory: "js"), let echartsScripts = try? String(contentsOfFile: echartScriptPath) else {
            return
        }
        
        context.evaluateScript(echartsScripts)
    }
}

// MARK: DataTool
extension Echarts {
    public class DataTool {
        public static func prepareBoxplotData(datas: [[Float]]) -> [String: [Jsonable]] {
            guard let scriptPath = frameworkBundle?.pathForResource("dataTool", ofType: "js", inDirectory: "js"), let scripts = try? String(contentsOfFile: scriptPath) else {
                return [:]
            }
            
            guard let context = JSContext(virtualMachine: JSVirtualMachine()) else {
                return [:]
            }
            
            Echarts.loadEcharts(context)
            context.evaluateScript(scripts)
            
            let scriptResult = context.evaluateScript("echarts.dataTool.prepareBoxplotData(\(datas))")
            let scriptResultDic = scriptResult?.toDictionary() as! [String: NSArray]
            var result: [String: [Jsonable]] = [:]
            var outliers: [[Jsonable]] = []
            for outer in scriptResultDic["outliers"]! {
                var innerArr: [Jsonable] = []
                for inner in outer as! NSArray {
                    innerArr.append(inner as! Jsonable)
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
                    innerArr.append(inner as! Jsonable)
                }
                boxDatas.append(innerArr)
            }
            result["boxData"]  = boxDatas.map { $0 as Jsonable }
            return result
        }
    }
}
