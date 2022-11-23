//
//  WebViewController.swift
//  cryptoWannabeSDK
//
//  Created by Michał Fereniec on 21/11/2022.
//

import Foundation

struct WebViewController {
    
}

extension WebViewController: WKNavigationDelegate {

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        track("didFinish!")
        self.hideProgressView()
    }
    
    func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
        track("webViewWebContentProcessDidTerminate")
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        track("didFail")
        self.hideProgressView()
    }
}
