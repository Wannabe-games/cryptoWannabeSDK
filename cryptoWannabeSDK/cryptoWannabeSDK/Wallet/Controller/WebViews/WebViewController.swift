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
        webView.frame = view.bounds
        //googlechrome://www.google.com
        //firefox://open-url?url=http://
//sniffer

        guard let proxyURL = URL(string: "https://proxy.wannabe.games/connect/\(UserDefaultsHandler.token)") else { return }
        UIApplication.shared.open(proxyURL, completionHandler: nil)
        var request = URLRequest(url: proxyURL)
        //        request.setValue("8lTWSnJCHxA0NG1aOjwUL0j0vtGjA7HmqDQP900UrVCpKJntwd", forHTTPHeaderField: "auth")
        webView.load(request)
        webView.navigationDelegate = self
       // sniff here/
        sniff()
    }
    
    func sniff() {
        var shouldSniff = true
        var userAlreadyLoggedIn = false
        var numberOfRepeats = 0
        
        Timer.scheduledTimer(withTimeInterval: 60 /*number of seconds*/, repeats: shouldSniff) { timer in
            
            guard let walletURL = URL(string: "https://proxy.wannabe.games/api/connect/\(UserDefaultsHandler.token)/wallet") else { return }
            let request = URLRequest(url: walletURL)
            
            if (userAlreadyLoggedIn == false && numberOfRepeats < 10) {
                shouldSniff = false
                numberOfRepeats += 1
                //alternatywnie: timer.invalidate()
                //some_condition should include max 10 repeats
            }
        }
    }
}

extension WebViewController: WKNavigationDelegate {
    
    public func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("Michał: fromCommit \(String(describing: webView.url?.absoluteString))")
    }
    //deeplink
    //universallink
    //bridge
    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("Michał: fromFinish \(String(describing: webView.url?.absoluteString))")
        
        guard let absoluteString = webView.url?.absoluteString else { return }
        if absoluteString.hasPrefix("https://proxy.wannabe.games/api/connect") && absoluteString.hasSuffix("wallet") {
//            Tu coś się dzieje
//            UIApplication.shared.open(absoluteString, completionHandler: nil)

        }
        //otworzyc przez chrome, a nie safari z tym linkiem
        print("Michał: token \(UserDefaultsHandler.token)")
//        if absoluteString == "https://proxy.wannabe.games/connect/\(UserDefaultsHandler.token)" {
        if absoluteString == "https://proxy.wannabe.games/api/connect/\(UserDefaultsHandler.token)/wallet" {
            
            //JSON with user data probably here
            
            webView.evaluateJavaScript("document.body.innerHTML") { html, error in
                print("Michał: evaluate2")
                print(html ?? nil)
                //maybe decode html here to get json with data about user login
            }
            //lub
            // 2 opcja
            // Wyciągnąc ciastka i inne rzeczy które autoryzują https
        }
    }

    public func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
        debugPrint("webViewWebContent Process Did Terminate")
//        self.webView.reload()
    }
}
