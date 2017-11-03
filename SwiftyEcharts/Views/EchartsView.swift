//
//  EchartsViews.swift
//  SwiftyEcharts
//
//  Created by Pluto Y on 25/11/2016.
//  Copyright © 2016 com.pluto-y. All rights reserved.
//
import WebKit

open class EchartsView: WKWebView, WKNavigationDelegate, WKUIDelegate, WKScriptMessageHandler {
    
    open var option: Option?
    
    fileprivate var htmlContents: String = ""
    fileprivate var bundlePath: String = ""
    fileprivate var loadFinsih = false
    fileprivate var eventWithHandlers: [EchartsEvent: ([String: Any]) -> Void] = [:]

    public convenience init() {
        self.init(frame: CGRect.zero, configuration: WKWebViewConfiguration())
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
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) { [unowned self] in
                self.showLoading()
            }
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
    public func registerMap(_ name: String, data: NSDictionary, specialAreas: [String: Jsonable] = [:]) {
        let dataJson = data.jsonString
        self.callJsMethod("registerMap(\("'\(name)', '\(preDealWithParams(dataJson))', '\(specialAreas.jsonString)'"))")
    }
    
    /// 重置图表
    public func reset() {
        loadFinsih = false
        loadHTMLString(htmlContents, baseURL: URL(fileURLWithPath: (bundlePath as NSString).deletingLastPathComponent))
    }
    
    open func loadEcharts() {
        #if os(iOS)
            if #available(iOS 9.0, *) {
                loadHTMLString(htmlContents, baseURL: URL(fileURLWithPath: bundlePath))
            } else if #available(iOS 8.0, *) {
                loadEchartsForBugllyOfWKEchartsView()
            }
        #elseif os(OSX)
            loadEchartsForBugllyOfWKEchartsView()
        #endif
        
    }
    
    open func loadEcharts(with option: Option) {
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
    open func refreshEcharts(_ option: Option, _ notMerge: Bool = false, _ lazyUpdate: Bool = false, _ silent: Bool = false) {
        
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
    public func addListener(for event: EchartsEvent, with handler: @escaping ([String: Any]) -> Void) {
        self.configuration.userContentController.removeScriptMessageHandler(forName: event.rawValue)
        self.configuration.userContentController.add(self, name: event.rawValue)
        eventWithHandlers[event] = handler
        self.callJsMethod("addEchartEventHandler('\(event.rawValue)')")
    }
    
    public func removeListener(for event: EchartsEvent) {
        self.configuration.userContentController.removeScriptMessageHandler(forName: event.rawValue)
        eventWithHandlers[event] = nil
        self.callJsMethod("removeEchartEventHandler('\(event.rawValue)')")
    }
    
    public func removeAllListeners() {
        for (event, _) in eventWithHandlers {
            self.configuration.userContentController.removeScriptMessageHandler(forName: event.rawValue)
            self.callJsMethod("removeEchartEventHandler('\(event.rawValue)')")
        }
        eventWithHandlers.removeAll()
    }
    
    
    // MARK: - Private Functions
    fileprivate func initViews() {
        var bundle = Bundle.main
        if let frameworkBundle = Bundle(identifier: "com.pluto-y.SwiftyEcharts") {
            bundle = frameworkBundle
        }
        
        if let urlPath = bundle.path(forResource: "echarts", ofType: "html") {
            bundlePath = urlPath
        } else if let urlPath = bundle.path(forResource: "echarts", ofType: "html", inDirectory: "SwiftyEcharts.bundle") {
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
            let newScript = WKUserScript(source: js, injectionTime: .atDocumentEnd, forMainFrameOnly: false)
            userContentController.addUserScript(newScript)
        }
        
//        if let jsPath = bundle.path(forResource: "echarts.min", ofType: "js", inDirectory: "js"), let js = try? String(contentsOfFile: jsPath) {
//            let newScript = WKUserScript(source: js, injectionTime: .atDocumentEnd, forMainFrameOnly: false)
//            userContentController.addUserScript(newScript)
//        }
        
        userContentController.add(self, name: "wkechartview")
#if os(OSX)
#elseif os(iOS)
    scrollView.isScrollEnabled = false
    scrollView.bounces = false
#endif
        uiDelegate = self
        navigationDelegate = self
        reset()
        
    }
    
    /// 在 iOS8 以及在 OS X 的加载 Echarts 的方法
    private func loadEchartsForBugllyOfWKEchartsView() {
        do {
            let url = URL(fileURLWithPath: bundlePath)
            let fileURL = try fileURLForBuggyWKWebView8(fileURL: url)
            load(URLRequest(url: fileURL))
        } catch let error as NSError {
            print("Error: " + error.debugDescription)
        }
    }
    
    /// 解决 iOS8 以及在 OS X 上没办法加载本地内容以及资源文件的情况
    private func fileURLForBuggyWKWebView8(fileURL: URL) throws -> URL {
        // Some safety checks
        if !fileURL.isFileURL {
            throw NSError(
                domain: "BuggyWKWebViewDomain",
                code: 1001,
                userInfo: [NSLocalizedDescriptionKey: NSLocalizedString("URL must be a file URL.", comment:"")])
        }
        let _ = try! fileURL.checkResourceIsReachable()
        
        let absolutePath = fileURL.absoluteString
        let dirPath = (absolutePath as NSString).deletingLastPathComponent
        let dirUrl = URL(fileURLWithPath: dirPath)
        let jsUrl = dirUrl.appendingPathComponent("js")
        
        // Create "/temp/www" directory
        let fm = FileManager.default
        let tmpDirURL = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("www")
        try! fm.createDirectory(at: tmpDirURL, withIntermediateDirectories: true, attributes: nil)
        let tmpJsDirUrl = tmpDirURL.appendingPathComponent("js")
        try! fm.createDirectory(at: tmpJsDirUrl, withIntermediateDirectories: true, attributes: nil)
        
        let jsPath = jsUrl.absoluteString.replacingOccurrences(of: "file:", with: "")
        if let files = try? fm.contentsOfDirectory(atPath: jsPath) {
            for file in files {
                let jsFileUrl = URL(fileURLWithPath: jsPath + file)
                let dstURL = tmpJsDirUrl.appendingPathComponent(jsFileUrl.lastPathComponent)
                let _ = try? fm.removeItem(at: dstURL)
                try! fm.copyItem(at: jsFileUrl, to: dstURL)
            }
        }
        
        // Now copy given file to the temp directory
        let dstURL = tmpDirURL.appendingPathComponent(fileURL.lastPathComponent)
        let _ = try? fm.removeItem(at: dstURL)
        try! fm.copyItem(at: fileURL, to: dstURL)
        
        // Files in "/temp/www" load flawlesly :)
        return dstURL
    }
    
    fileprivate func callJsMethod(_ jsString: String, completionHandler: ((Any?, Error?) -> Swift.Void)? = nil) {
//        print(jsString)
        self.evaluateJavaScript(jsString, completionHandler: completionHandler)
    }
    
    fileprivate func preDealWithParams(_ paramsJson: String) -> String {
        // Pre-deal with the special character when pass parameter to js
        var js = paramsJson.replacingOccurrences(of: "\\n", with: "<br>")
        js = js.replacingOccurrences(of: "\n", with: "\\n")
        js = js.replacingOccurrences(of: "'", with: "\\'")
        return js
    }
    
    fileprivate func resizeDiv() {
        let height = frame.size.height
        let width = frame.size.width
        let divCss = "'height:\(height)px;width:\(width)px;'"
        let jsString = "resizeDiv(\(divCss))"
        callJsMethod(jsString)
    }
    
    // MARK: - Delegate
    // MARK: UIWebViewDelegate
    open func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        webView.evaluateJavaScript("echarts") { [weak self] (result, error) in
            Swift.print(result)
        }
        webView.evaluateJavaScript("document.readyState") { [weak self] (result, error) in
            guard let strongSelf = self else { return }
            guard let result = result as? String, result == "complete" else {
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.05, execute: { 
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
            let delayTime = DispatchTime.now() + 0.5
            DispatchQueue.main.asyncAfter(deadline: delayTime) {
                // 避免过早添加监听事件
                for (event, _) in strongSelf.eventWithHandlers {
                    printInfo("-addEchartEventHandler('\(event)')")
                    strongSelf.callJsMethod("addEchartEventHandler('\(event)')")
                }
            }
        }
    }
    
    open func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        printInfo(message)
        completionHandler()
    }
    
    // MARK: WKScriptMessageHandler
    open func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        Swift.print("name:\(message.name), body:\(message.body)")
        guard let event = EchartsEvent(rawValue: message.name), let handler = eventWithHandlers[event] else { return }
        handler(message.body as! [String: AnyObject])
    }
}


extension EchartsView {
    public func dispatchAction<T: EchartsAction>(_ action: T) {
        Swift.print("dispatchAction(\(action.jsonString))")
        
        callJsMethod("dispatchAction(\(action.jsonString))")
    }
}
