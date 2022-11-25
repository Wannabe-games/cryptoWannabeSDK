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
   //         WebView(proxyURL: URL(string: "https://proxy.wannabe.games"))
        }
        
        Link(destination: URL(string: "https://proxy.wannabe.games")!, label: {
            Text("cryptoWannabe")
                .foregroundColor(.purple)
        })
    }
    
}
