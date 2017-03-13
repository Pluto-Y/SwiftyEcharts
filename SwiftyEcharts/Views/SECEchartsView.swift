//
//  SECUIEchartsViews.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 25/11/2016.
//  Copyright © 2016 com.pluto-y. All rights reserved.
//
import UIKit
import WebKit

public class SECEchartsView: WKWebView, WKNavigationDelegate, WKUIDelegate, WKScriptMessageHandler {
    
    public var option: SECOption?
    
    
    private var htmlContents: String = ""
    private var bundlePath: String = ""

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
    
    // MAKR: - Public Functions
    public func loadEcharts() {
        self.loadHTMLString(htmlContents, baseURL: NSURL(fileURLWithPath: bundlePath))
    }
    
    /// 设置图表实例的配置项以及数据，万能接口，所有参数和数据的修改都可以通过setOption完成，ECharts 会合并新的参数和数据，然后刷新图表。如果开启动画的话，ECharts 找到两组数据之间的差异然后通过合适的动画去表现数据的变化。
    ///
    /// - Parameters:
    ///   - option: 图表的配置项和数据。
    ///   - notMerge: 可选，是否不跟之前设置的option进行合并，默认为false，即合并。
    ///   - lazyUpdate: 可选，在设置完option后是否不立即更新图表，默认为false，即立即更新。
    ///   - silent: 可选，阻止调用 setOption 时抛出事件，默认为false，即抛出事件。
    public func refreshEcharts(option: SECOption, _ notMerge: Bool = false, _ lazyUpdate: Bool = false, _ silent: Bool = false) {
        
        SECJsCache.removeAll() // 清空之前缓存的方法，避免出现重复的情况， 在调用 option.jsonString 会重新生成
        let optionJson = option.jsonString
        
        // 定义Js与Clousure之间的匹配关系
        // 必须要在option.jsonString调用过一次之后
        // 并且需要在调用loadEcharts之前，这样才能建立关系
        for function in SECJsCache.allJsStrings() {
            self.callJsMethod(function)
            //            self.callJsMethod("function \(name)(params){ alert(\(name));eval('window.webkit.messageHandlers.\(name).postMessage(' + params + ')'); }")
        }
        
        let js = "refreshEcharts('\(optionJson.stringByReplacingOccurrencesOfString("\\n", withString: "<br>"))', \(notMerge), \(lazyUpdate), \(silent))"
//        print(js)
        self.callJsMethod(js.stringByReplacingOccurrencesOfString("\n", withString: "\\n"))
    }
    
    // MARK: - Private Functions
    private func initViews() {
        var bundle = NSBundle.mainBundle()
        if let frameworkPath = NSBundle.mainBundle().pathForResource("SwiftyEcharts", ofType: "framework", inDirectory: "Frameworks"), let frameworkBundle = NSBundle(path: frameworkPath) {
            bundle = frameworkBundle
        }
        
        let urlPath = bundle.pathForResource("echarts", ofType: "html")
        guard let path = urlPath else {
            printError("ERROR: Can not find the echarts.html, please contact the developer")
            return
        }
        
        bundlePath = path
        
        guard let htmlStr = try? String(contentsOfFile: path) else {
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
        
    }
    
    private func callJsMethod(jsString: String) {
        self.evaluateJavaScript(jsString, completionHandler: nil)
    }
    
    private func resizeDiv() {
        let height = frame.size.height
        let width = self.frame.size.width
        let divCss = "'height:\(height)px;width:\(width)px;'"
        let jsString = "resizeDiv(\(divCss))"
        callJsMethod(jsString)
    }
    
    // MARK: - Delegate
    // MARK: UIWebViewDelegate
    public func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
        
        guard let option = option else {
            printWarning("The option is nil")
            self.callJsMethod("initEchartView")
            return;
        }
        resizeDiv()
        
        SECJsCache.removeAll() // 清空之前缓存的方法，避免出现重复的情况， 在调用 option.jsonString 会重新生成
        let optionJson = option.jsonString
        
        // 定义Js与Clousure之间的匹配关系
        // 必须要在option.jsonString调用过一次之后
        // 并且需要在调用loadEcharts之前，这样才能建立关系
        for function in SECJsCache.allJsStrings() {
            print(function)
            self.callJsMethod(function)
        }
        
        
        let js = "loadEcharts('\(optionJson.stringByReplacingOccurrencesOfString("\\n", withString: "<br>"))')"
        print(js)
        callJsMethod(js.stringByReplacingOccurrencesOfString("\n", withString: "\\n"))
        
    }
    
    public func webView(webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: () -> Void) {
        print(message)
        completionHandler()
    }
    
    // MARK: WKScriptMessageHandler
    public func userContentController(userContentController: WKUserContentController, didReceiveScriptMessage message: WKScriptMessage) {
        print("name:\(message.name), body:\(message.body)")
    }
}
