//
//  WalletMetadataResponse.swift
//  cryptoWannabeSDK
//
//  Created by Michał Fereniec on 23/11/2022.
//

import Foundation

struct WalletMetadataResponse: Codable {
    let status: Status
    let responseInfo: String
    let method: Method
    let data: WalletMetadata
}
