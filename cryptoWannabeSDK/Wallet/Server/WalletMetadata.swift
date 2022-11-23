//
//  WalletMetadata.swift
//  cryptoWannabeSDK
//
//  Created by Michał Fereniec on 22/11/2022.
//

import Foundation

struct WalletMetadata { //dataClass
    //TODO: replicate the structure, that Filip serves
    let profile: Profile
    let email: JSONNull?
    let decentralizedID: String
    let identityAddress: String
    let appPrivateKey: String
    let coreSessionToken: JSONNull? //I guess - probably can be other type
    let authResponseToken: String
    let hubUrl: String
    let appPrivateKeyFromWalletSalt: JSONNull? //i guess because of null
    let coreNode: JSONNull? //the same as above
    let gaiaAssociationToken: String
    
    enum CodingKeysL String, CodingKey {
        case profile, email, decentralizedID, identityAddress, appPrivateKey, coreSessionToken, authResponseToken
        case hubURL = "hubURL"
        case appPrivateKeyFromWalletSalt, coreNode, gaiaAssociationToken
    }
}
