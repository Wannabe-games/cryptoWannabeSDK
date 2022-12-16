//
//  WalletMetadata.swift
//  cryptoWannabeSDK
//
//  Created by Michał Fereniec on 22/11/2022.
//

import Foundation

public struct WalletMetadata: Codable {
    //TODO: replicate the structure, that Filip serves
    let profile: Profile
    let email: String
    let decentralizedID: String
    let identityAddress: String
    let appPrivateKey: String
    let coreSessionToken: String?
    let authResponseToken: String
    let hubUrl: String
    let appPrivateKeyFromWalletSalt: String?
    let coreNode: String?
    let gaiaAssociationToken: String
}