//
//  WebView.swift
//  CryptoWannabeSDK
//
//  Created by Michał Fereniec on 25/11/2022.
//

import SwiftUI
import WebKit

public struct WebView: UIViewControllerRepresentable {
    public init() {}

    public func makeUIViewController(context: Context) -> WebViewController {
        return WebViewController()
    }
    
    public func updateUIViewController(_ uiViewController: WebViewController, context: Context) {
    }
}
