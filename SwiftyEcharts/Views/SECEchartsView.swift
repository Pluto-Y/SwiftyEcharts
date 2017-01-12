//
//  SECUIEchartsViews.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 25/11/2016.
//  Copyright © 2016 com.pluto-y. All rights reserved.
//
import UIKit
import WebKit

public class SECEchartsView: WKWebView, WKNavigationDelegate, WKUIDelegate {
    
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
    
    // MARK: - UIWebViewDelegate
    public func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
        
        guard let option = option else {
            printWarning("The option is nil")
            self .callJsMethod("initEchartView")
            return;
        }
        resizeDiv()
        
        let optionJson = option.jsonString
        
        // 定义Js与Clousure之间的匹配关系
        // 必须要在option.jsonString调用过一次之后
        // 并且需要在调用loadEcharts之前，这样才能建立关系
        for (name, clourse) in SECJsMap.allMap() {
            print("name:\(name), clousure:\(clourse)")
        }
        
        let js = "loadEcharts('\(optionJson)')"
        print(js.stringByReplacingOccurrencesOfString("\n", withString: "\\n"))
        callJsMethod(js.stringByReplacingOccurrencesOfString("\n", withString: "\\n"))
        
    }
    
    public func webView(webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: () -> Void) {
        print(message)
        completionHandler()
    }
}
