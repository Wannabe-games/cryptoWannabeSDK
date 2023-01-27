//
//  ContentView.swift
//  cryptoWannabeSDK EXAMPLES
//
//  Created by Michał Fereniec on 09/11/2022.
//

import SwiftUI
import CryptoWannabeSDK


struct ContentView: View {
    private let cryptoWannabeSDK = CryptoWannabeSDK()
    @State private var showWebView = false
        
    var body: some View {
        Button {
//            showWebView.toggle()
            
            cryptoWannabeSDK.getBuyToken()
        } label: {
            Text("Connect with Wallet")
        }
        
        Button {
            cryptoWannabeSDK.getToken()
        } label: {
            Text("Get Token")
        }
      
        
        Button {
            cryptoWannabeSDK.getAuthorizationToken()
        }  label: {
            Text("Get Authorization Token")
        }
        
        Button {
            cryptoWannabeSDK.getSessionToken()
        } label: {
            Text("Get Session Token")
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
