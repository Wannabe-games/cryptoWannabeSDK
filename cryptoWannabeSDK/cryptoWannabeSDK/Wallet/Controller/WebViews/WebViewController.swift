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
        
        self.webView.navigationDelegate = self
    }
}

extension WebViewController: WKNavigationDelegate {
    
    public func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("Michał: fromCommit \(webView.url?.absoluteString)")
    }
    
    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("Michał: fromFinish \(webView.url?.absoluteString)")
        
        guard let absoluteString = webView.url?.absoluteString else { return }
        if absoluteString.hasPrefix("https://proxy.wannabe.games/api/connect") && absoluteString.hasSuffix("wallet") {
//            Tu coś się dzieje
        }
        
        print("Michał: token \(UserDefaultsHandler.token)")
        if absoluteString == "https://proxy.wannabe.games/connect/\(UserDefaultsHandler.token)" {
//        if absoluteString == "https://proxy.wannabe.games/api/connect/\(UserDefaultsHandler.token)/wallet" {
            //Tu najprawdopodobniej dostanę odpowiedz
            
            webView.evaluateJavaScript("document.body.innerHTML") { html, error in
                print("Michał: evaluate2")
                print(html)
            }
        }
    }

    public func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
        debugPrint("webViewWebContent Process Did Terminate")
//        self.webView.reload()
    }
}
