//
//  ContentView.swift
//  cryptoWannabeSDK
//
//  Created by Michał Fereniec on 21/11/2022.
//

import SwiftUI
import WebKit

struct ContentView: View {
    @State private var showWebView = false
    
    var body: some View {
        Button {
            showWebView.toggle()
        } label: {
            Text("cryptoWannabeSDK")
        }
        .sheet(isPresented: $showWebView) {
//            WebView(url: URL(string: "proxy.wannabe.games/"))
        }
    }
    
}
