//
//  WebView.swift
//  cryptoWannabeSDK
//
//  Created by Michał Fereniec on 21/11/2022.
//

import Foundation
import SwiftUI
import WebKit

enum NetworkError: Error {
    case decodingError
    case domainError
    case urlError
}


extension WebView {

    static var all: Resource<[WalletMetadata]> = {
        guard let url = URL(string: "proxy.wannabe.games/api/token")
        else {
            fatalError("Couldn't find url!")
        }
        
        return Resource<[FilipowyStruct]>(url: url)
    }()
    
}



struct WebView : UIViewRepresentable {
    
    guard let url = URL(string: "proxy.wannabe.games/") else { fatalError("Couldn't find URL!") }

    func makeUIView(context: Context) -> WebView {
        return WKWebView()

    }

    func updateUIView(_ UIView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)

    }
    
    //2nd option
    let config = WKWebViewConfiguration()
    //... configure config here ...
    let rectangle = CGRect()
    let webView = WKWebView(frame: rectangle, configuration: config)

}

extension WebView: WKNavigationDelegate {

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        // track("didFinish")
        // self.hideProgressView()
    }

    func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
        // track("webViewWebContentProcessDidTerminate")
    }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        // track("didFail")
        // self.hideProgressView()
    }
    
//    func load<T>(request: Resource<T>, completion: @escaping (Result<T, NetworkError>) -> Void) {
//
//        var request = URLRequest(url: resource.url)
//        request.httpMethod = resource.httpMethod.rawValue
//        request.httpBody = resource.body
////        request.addValue(<#T##String#>, forHTTPHeaderField: <#T##String#>) //wstawic jsona i headera
//
//        URLSession.shared.dataTask(with: resource.url) { data, response, error in
//
//            guard let data = data, error == nil else {
//                completion(.failure(.domainError))
//                return
//            }
//
//            let result = try? JSONDecoder().decode(T.self, from: data)
//            if let result = result {
//                DispatchQueue.main.async {
//                    completion(.success(result))
//                }
//            } else {
//                completion(.failure(.decodingError))
//            }
//
//        }.resume()
//    }

}


//protocol UIViewRepresentable : View where Self.Body == Never

#if DEBUG
struct WebView_Previews : PreviewProvider {
    static var previews: some View {
        WebView(request: URLRequest(url: URL(string: "https://www.apple.com")!))
    }
}
#endif
