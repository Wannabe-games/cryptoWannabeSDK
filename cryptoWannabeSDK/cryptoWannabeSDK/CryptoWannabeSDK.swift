//
//  CryptoWannabeSDK.swift
//  CryptoWannabeSDK
//
//  Created by Michał Fereniec on 09/11/2022.
//

import Foundation
import SwiftUI

public final class CryptoWannabeSDK {
    
    public init() {}

    private let loginService = LoginService()
    private let tokenService = TokenService()
    private let buyTokenService = BuyTokenService()
}

//MARK: -- wallet interface

extension CryptoWannabeSDK {
    public static var isWalletAuthenticated: Bool {
        return walletMedatada != nil
    }
    
    /// view - for swiftUI
    public var view: some View {
        WebView()
    }
    
    static var walletMedatada: WalletMetadata? {
        return UserDefaultsHandler.walletMetadata
    }
    
    public static func login() {
    }
    
    public static func logout() {
        UserDefaultsHandler.walletMetadata = nil
    }
    
    public func getToken() {
        tokenService.getToken { token in
            print("\(token)")
        }
    }
    
    public func getBuyToken() {
        buyTokenService.getToken { token in
            print("\(token)")
        }
    }
}
