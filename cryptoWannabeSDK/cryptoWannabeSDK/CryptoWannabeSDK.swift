//
//  CryptoWannabeSDK.swift
//  CryptoWannabeSDK
//
//  Created by Michał Fereniec on 09/11/2022.
//

import Foundation

public final class CryptoWannabeSDK {


}

//MARK: -- wallet interface

extension CryptoWannabeSDK {
    public static var isWalletAuthenticated: Bool {
        return walletMedatada != nil
    }
    
    static var walletMedatada: WalletMetadata? {
        return UserDefaultsHandler.walletMetadata
    }
    
    public static func login() {
    }
    
    public static func logout() {
        UserDefaultsHandler.walletMetadata = nil
    }
}
