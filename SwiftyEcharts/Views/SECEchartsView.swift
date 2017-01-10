//
//  SECUIEchartsViews.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 25/11/2016.
//  Copyright © 2016 com.pluto-y. All rights reserved.
//

import UIKit

public class SECEchartsView: UIWebView, UIWebViewDelegate {
    
    public var option: SECOption?
    
    
    private var htmlContents: String = ""
    private var bundlePath: String = ""

    public convenience init() {
        self.init(frame: CGRect.zero)
        initViews()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
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
        
        
        delegate = self
        scalesPageToFit = false
        scrollView.scrollEnabled = false
        scrollView.bounces = false
    }
    
    private func callJsMethod(jsString: String) {
        stringByEvaluatingJavaScriptFromString(jsString)
    }
    
    private func resizeDiv() {
        let height = frame.size.height
        let width = self.frame.size.width
        let divCss = "'height:\(height)px;width:\(width)px;'"
        let jsString = "resizeDiv(\(divCss))"
        callJsMethod(jsString)
    }
    
    // MARK: - UIWebViewDelegate
    public func webViewDidFinishLoad(webView: UIWebView) {
        resizeDiv()
    }
}
