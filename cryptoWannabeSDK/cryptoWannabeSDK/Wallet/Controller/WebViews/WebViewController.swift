//
//  WebViewController.swift
//  cryptoWannabeSDK
//
//  Created by Michał Fereniec on 21/11/2022.
//

import Foundation
import WebKit

public class WebViewController: UIViewController {
    
    lazy var webView: WKWebView = {
        let webView = WKWebView()
        webView.navigationDelegate = self
        return webView
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        view.addSubview(webView)
        webView.frame = view.frame
        guard let proxyURL = URL(string: "https://proxy.wannabe.games/connect/\(UserDefaultsHandler.token)") else { return }
        
        var request = URLRequest(url: proxyURL)
//        request.setValue("8lTWSnJCHxA0NG1aOjwUL0j0vtGjA7HmqDQP900UrVCpKJntwd", forHTTPHeaderField: "auth")
        webView.load(request)
    }
}

extension WebViewController: WKNavigationDelegate {

    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
//        debugPrint("Michał \(String(describing: webView.url?.absoluteString))")
    }

    public func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
        debugPrint("webViewWebContent Process Did Terminate")
        self.webView.reload()
    }

    public func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        debugPrint("did Fail Navigation")
        self.reloadInputViews() // redundant ?
    }
}
