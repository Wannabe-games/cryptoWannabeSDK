//
//  WebView.swift
//  CryptoWannabeSDK
//
//  Created by Michał Fereniec on 25/11/2022.
//

import SwiftUI
import WebKit

struct WebView: UIViewControllerRepresentable {

    func makeUIViewController(context: Context) -> WebViewController {
        return WebViewController()
    }
    
    func updateUIViewController(_ UIViewController: WebViewController, context: Context) {
    }
}

