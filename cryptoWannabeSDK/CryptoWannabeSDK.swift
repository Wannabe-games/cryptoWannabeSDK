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
    
    public static var walletMedatada: WalletMetadata? {
        return UserDefaultsHandler.walletMetadata
    }
    
    public static func login() {
        //TODO: checklist to run auth:
        /*/
        1. ta metodka niech przyjmuje jako parametr VC, w którym ma zaprezentować swój WaletAuthVC
         2. zaimplementować WalletAuthVC
         3. walletauthvc ma mieć na pokładzie webview, który odpali tego pierwszego urla od Filipa
         4. jak skończysz, daj znać, strzelimy se teamviewera
         
         *BONUS* niech to się kurwa zacznie kompilować pls [`]
         */
    }
    
    public static func logout() {
        UserDefaultsHandler.walletMetadata = nil
    }
}
