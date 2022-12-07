//
//  ContentView.swift
//  cryptoWannabeSDK EXAMPLES
//
//  Created by Michał Fereniec on 09/11/2022.
//

import SwiftUI
import CryptoWannabeSDK

struct ContentView: View {
    @State private var showWebView = false
        
    var body: some View {
        Button {
            showWebView.toggle()
        } label: {
            Text("Connect with Wallet")
        }
        .sheet(isPresented: $showWebView) {
            //tutaj otworzyc chrome'a z urlem
            WebView()
        }.onAppear {
            TokenService().getToken { token in
                print("Token: \(token)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        } .previewLayout(.sizeThatFits)
    }
}
