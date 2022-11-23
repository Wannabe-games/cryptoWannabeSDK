//
//  Welcome.swift
//  cryptoWannabeSDK
//
//  Created by Michał Fereniec on 23/11/2022.
//

import Foundation

struct Welcome: Codable {
    let status: String
    let responseInfo: String
    let method: String
    let data: WalletMetadata
}
