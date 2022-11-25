//
//  WalletAuthViewController.swift
//  CryptoWannabeSDK
//
//  Created by Michał Fereniec on 25/11/2022.
//

import Foundation
import UIKit //?
import WebKit

class WalletAuthViewController: WKWebView, WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {

        if(navigationAction.navigationType == .other){
            if let redirectedURL = navigationAction.request.url {
           //     self.delete.openURL(url: redirectedURL)
            }
            decisionHandler(.cancel)
            return
        }
        decisionHandler(.allow)
    }
}
