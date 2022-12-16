//
//  WebViewController.swift
//  cryptoWannabeSDK
//
//  Created by Michał Fereniec on 21/11/2022.
//

import Foundation
import WebKit

public class WebViewController: UIViewController, WKNavigationDelegate {
    
    var token = UserDefaultsHandler.token

    lazy var webView: WKWebView = {
        let webView = WKWebView()
        webView.navigationDelegate = self
        return webView
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        view.addSubview(webView)
        webView.frame = view.bounds


        guard let proxyURL = URL(string: "https://proxy.wannabe.games/connect/\(UserDefaultsHandler.token)") else { return }
        //option with Safari
        UIApplication.shared.open(proxyURL, completionHandler: nil)
        var request = URLRequest(url: proxyURL)
        request.setValue("8lTWSnJCHxA0NG1aOjwUL0j0vtGjA7HmqDQP900UrVCpKJntwd", forHTTPHeaderField: "auth")
        //option with WKWebView (comment out 3 lines before)
        webView.load(URLRequest(url: proxyURL))
        webView.navigationDelegate = self
        webView.allowsBackForwardNavigationGestures = true
       
    }
}
