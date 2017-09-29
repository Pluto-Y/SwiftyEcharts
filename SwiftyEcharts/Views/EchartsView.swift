//
//  EchartsViews.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 25/11/2016.
//  Copyright © 2016 com.pluto-y. All rights reserved.
//
import UIKit
import WebKit

public class EchartsView: WKWebView, WKNavigationDelegate, WKUIDelegate, WKScriptMessageHandler {
    
    public var option: Option?
    
    private var htmlContents: String = ""
    private var bundlePath: String = ""
    private var loadFinsih = false
    private var eventWithHandlers: [EchartsEvent: ([String: AnyObject]) -> Void] = [:]

    public convenience init() {
        self.init(frame: CGRect.zero, configuration: WKWebViewConfiguration())
        initViews()
    }
    
    public override init(frame: CGRect, configuration: WKWebViewConfiguration) {
        super.init(frame: frame, configuration: configuration)
        initViews()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initViews()
    }
    
    deinit {
        self.configuration.userContentController.removeAllUserScripts()
    }
    
    // MAKR: - Public Functions
    /// 显示 ECharts 正在加载中的界面
    public func showLoading() {
        if !loadFinsih { // 如果还没页面加载完则等待 0.05 秒后刷新
            dispatch_after(UInt64(Double(NSEC_PER_SEC) * 0.05), dispatch_get_main_queue(), { [unowned self] in
                self.showLoading()
            })
            return
        }
        
        self.callJsMethod("showLoading()")
    }
    
    /// 隐藏 ECharts 正在加载中的界面
    public func hideLoading() {
        self.callJsMethod("hideLoading()")
    }
    
    /// 注册可用的地图，必须在包括 geo 组件或者 map 图表类型的时候才能使用。
    ///
    /// 使用方法见 option.geo。
    ///
    /// 示例 USA Population Estimates：http://echarts.baidu.com/gallery/editor.html?c=map-usa
    ///
    /// - Parameters:
    ///   - name: 地图名称，在 geo 组件或者 map 图表类型中设置的 map 对应的就是该值。
    ///   - data: 地图数据
    ///   - specialAreas: 可选。将地图中的部分区域缩放到合适的位置，可以使得整个地图的显示更加好看
    public func registerMap(name: String, data: NSDictionary, specialAreas: [String: Jsonable] = [:]) {
        let dataJson = data.jsonString
        self.callJsMethod("registerMap(\("'\(name)', '\(preDealWithParams(dataJson))', '\(specialAreas.jsonString)'"))")
    }
    
    /// 重置图表
    public func reset() {
        loadFinsih = false
        loadHTMLString(htmlContents, baseURL: NSURL(fileURLWithPath: bundlePath))
    }
    
    public func loadEcharts() {
//        if !loadFinsih && !self.resizeDivFinish { // 如果还没页面加载完则等待 0.05 秒后刷新
//            dispatch_after(UInt64(Double(NSEC_PER_SEC) * 0.05), dispatch_get_main_queue(), { [unowned self] in 
//                self.loadEcharts()
//            })
//            return
//        }
        loadHTMLString(htmlContents, baseURL: NSURL(fileURLWithPath: bundlePath))
    }
    
    public func loadEcharts(with option: Option) {
        self.option = option
        loadEcharts()
    }
    
    /// 设置图表实例的配置项以及数据，万能接口，所有参数和数据的修改都可以通过setOption完成，ECharts 会合并新的参数和数据，然后刷新图表。如果开启动画的话，ECharts 找到两组数据之间的差异然后通过合适的动画去表现数据的变化。
    ///
    /// - Parameters:
    ///   - option: 图表的配置项和数据。
    ///   - notMerge: 可选，是否不跟之前设置的option进行合并，默认为false，即合并。
    ///   - lazyUpdate: 可选，在设置完option后是否不立即更新图表，默认为false，即立即更新。
    ///   - silent: 可选，阻止调用 setOption 时抛出事件，默认为false，即抛出事件。
    public func refreshEcharts(option: Option, _ notMerge: Bool = false, _ lazyUpdate: Bool = false, _ silent: Bool = false) {
        
        JsCache.removeAll() // 清空之前缓存的方法，避免出现重复的情况， 在调用 option.jsonString 会重新生成
        let optionJson = option.jsonString
        
        // 定义Js与Clousure之间的匹配关系
        // 必须要在option.jsonString调用过一次之后
        // 并且需要在调用loadEcharts之前，这样才能建立关系
        for function in JsCache.allJsStrings() {
            self.callJsMethod(function)
            //            self.callJsMethod("function \(name)(params){ alert(\(name));eval('window.webkit.messageHandlers.\(name).postMessage(' + params + ')'); }")
        }
        
        self.callJsMethod("refreshEcharts('\(preDealWithParams("\(optionJson)"))', \(notMerge), \(lazyUpdate), \(silent))")
    }
    
    // MARK: - Event
    public func addListener(for event: EchartsEvent, with handler: ([String: AnyObject]) -> Void) {
        self.configuration.userContentController.removeScriptMessageHandlerForName(event.rawValue)
        self.configuration.userContentController.addScriptMessageHandler(self, name: event.rawValue)
        eventWithHandlers[event] = handler
        self.callJsMethod("addEchartEventHandler('\(event.rawValue)')")
    }
    
    public func removeListener(for event: EchartsEvent) {
        self.configuration.userContentController.removeScriptMessageHandlerForName(event.rawValue)
        eventWithHandlers[event] = nil
        self.callJsMethod("removeEchartEventHandler('\(event.rawValue)')")
    }
    
    public func removeAllListeners() {
        for (event, _) in eventWithHandlers {
            self.configuration.userContentController.removeScriptMessageHandlerForName(event.rawValue)
            self.callJsMethod("removeEchartEventHandler('\(event.rawValue)')")
        }
        eventWithHandlers.removeAll()
    }
    
    
    // MARK: - Private Functions
    private func initViews() {
        var bundle = NSBundle.mainBundle()
        if let frameworkPath = NSBundle.mainBundle().pathForResource("SwiftyEcharts", ofType: "framework", inDirectory: "Frameworks"), let frameworkBundle = NSBundle(path: frameworkPath) {
            bundle = frameworkBundle
        }
        
        if let urlPath = bundle.pathForResource("echarts", ofType: "html") {
            bundlePath = urlPath
        } else if let urlPath = bundle.pathForResource("echarts", ofType: "html", inDirectory: "SwiftyEcharts.bundle") {
            bundlePath = urlPath
        } else {
            printError("ERROR: Can not find the echarts.html, please contact the developer")
            return
        }
        
        guard let htmlStr = try? String(contentsOfFile: bundlePath) else {
            return
        }
        printInfo("Info: the content of the echcart.html: \(htmlStr)")
        htmlContents = htmlStr
        
        
        let js = "var meta = document.createElement('meta'); meta.setAttribute('name', 'viewport'); meta.setAttribute('content', 'width=device-width'); document.getElementsByTagName('head')[0].appendChild(meta);"
        let userContentController = self.configuration.userContentController
        let array = userContentController.userScripts
        var fitWKUScript: WKUserScript?
        for wkUScript in array {
            if wkUScript.source == js {
                fitWKUScript = wkUScript
                break
            }
        }
        if fitWKUScript == nil {
            let newScript = WKUserScript(source: js, injectionTime: .AtDocumentEnd, forMainFrameOnly: false)
            userContentController.addUserScript(newScript)
        }
        
        userContentController.addScriptMessageHandler(self, name: "wkechartview")
        
        scrollView.scrollEnabled = false
        scrollView.bounces = false
        UIDelegate = self
        navigationDelegate = self
        reset()
        
    }
    
    private func callJsMethod(jsString: String, completionHandler: ((AnyObject?, NSError?) -> Void)? = nil) {
//        print(jsString)
        self .evaluateJavaScript(jsString, completionHandler: completionHandler)
    }
    
    private func preDealWithParams(paramsJson: String) -> String {
        // Pre-deal with the special character when pass parameter to js
        var js = paramsJson.stringByReplacingOccurrencesOfString("\\n", withString: "<br>")
        js = js.stringByReplacingOccurrencesOfString("\n", withString: "\\n")
        js = js.stringByReplacingOccurrencesOfString("'", withString: "\\'")
        return js
    }
    
    private func resizeDiv() {
        let height = frame.size.height
        let width = frame.size.width
        let divCss = "'height:\(height)px;width:\(width)px;'"
        let jsString = "resizeDiv(\(divCss))"
        callJsMethod(jsString)
    }
    
    // MARK: - Delegate
    // MARK: WKNavigationDelegate
    public func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
        webView .evaluateJavaScript("document.readyState") { [weak self] (result, error) in
            guard let strongSelf = self else { return }
            guard let result = result as? String where result == "complete" else {
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(0.05 * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), {
                    strongSelf.loadEcharts()
                })
                return
            }
            
            strongSelf.loadFinsih = true
            guard let option = strongSelf.option else {
                printWarning("The option is nil")
                strongSelf.callJsMethod("initEchartView()")
                return;
            }
            
            strongSelf.resizeDiv()
            JsCache.removeAll() // 清空之前缓存的方法，避免出现重复的情况， 在调用 option.jsonString 会重新生成
            let optionJson = option.jsonString
            
            // 定义Js与Clousure之间的匹配关系
            // 必须要在option.jsonString调用过一次之后
            // 并且需要在调用loadEcharts之前，这样才能建立关系
            for function in JsCache.allJsStrings() {
                printInfo(function)
                strongSelf.callJsMethod(function)
            }
            
            strongSelf.callJsMethod("loadEcharts('\(strongSelf.preDealWithParams("\(optionJson)"))')")
            let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(0.5 * Double(NSEC_PER_SEC)))
            dispatch_after(delayTime, dispatch_get_main_queue()) {
                // 避免过早添加监听事件
                for (event, _) in strongSelf.eventWithHandlers {
                    printInfo("-addEchartEventHandler('\(event)')")
                    strongSelf.callJsMethod("addEchartEventHandler('\(event)')")
                }
            }
        }
    }

    public func webView(webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: () -> Void) {
        printInfo(message)
        completionHandler()
    }
    
    // MARK: WKScriptMessageHandler
    public func userContentController(userContentController: WKUserContentController, didReceiveScriptMessage message: WKScriptMessage) {
        printInfo("name:\(message.name), body:\(message.body)")
        guard let event = EchartsEvent(rawValue: message.name), let handler = eventWithHandlers[event] else { return }
        handler(message.body as! [String: AnyObject])
    }

}
