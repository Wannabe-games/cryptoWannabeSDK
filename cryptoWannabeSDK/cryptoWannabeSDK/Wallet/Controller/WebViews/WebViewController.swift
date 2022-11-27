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
        guard let proxyURL = URL(string: "https://www.allegro.pl") else { return }
//        guard let link = URL(string: "https://proxy.wannabe.games") else { return }
        let request = URLRequest(url: proxyURL)
        webView.load(request)
    }
}

extension WebViewController: WKNavigationDelegate {

    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("Michał \(webView.url?.absoluteString)")
    }
//
//    func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
//        track("webViewWebContentProcessDidTerminate")
//    }
//
//    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
//        track("didFail")
//        self.hideProgressView()
//    }
}
