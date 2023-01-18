//
//  NFTMintResponse.swift
//  CryptoWannabeSDK
//
//  Created by Michał Fereniec on 18/01/2023.
//

import Foundation

struct NFTMintResponse: Codable {
    let status: String
    let responseInfo: String
    let method: String
    let data: NFTMintData
    let nextAction: String?
}
