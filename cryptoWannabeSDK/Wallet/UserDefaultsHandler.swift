//
//  UserDefaultsHandler.swift
//  cryptoWannabeSDK
//
//  Created by Michał Fereniec on 22/11/2022.
//

import Foundation

//TODO: store WalletMetadata
//TODO: restore WalletMetadata
//TODO: nullify WalletMetadata

var profile: Profile? = nil
var email: String? = nil
var decentralizedID: String? = nil
var identityAddress: String? = nil
var appPrivateKey: String? = nil
var coreSessionToken: String? = nil
var authResponseToken: String? = nil
var hubURL: URL? = nil
var appPrivateKeyFromWalletSalt: String? = nil
var coreNode: String? = nil
var gaiaAssociationToken: String? = nil

let defaults = UserDefaults.standard

defaults.set(profile, forKey: Profile)
defaults.set(email, forKey: <#T##String#>)


//let wallet = WalletMetadata(profile: profile, email: email, decentralizedID: decentralizedID, identityAddress: identityAddress, appPrivateKey: appPrivateKey, coreSessionToken: coreSessionToken, authResponseToken: authResponseToken, hubUrl: hubURL, appPrivateKeyFromWalletSalt: appPrivateKeyFromWalletSalt, coreNode: coreNode, gaiaAssociationToken: gaiaAssociationToken)

func remove() {
    //WalletMetadata properties set to nil
    wallet.profile = nil
}
