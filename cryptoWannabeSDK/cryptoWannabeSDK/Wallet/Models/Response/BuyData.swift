//
//  BuyData.swift
//  CryptoWannabeSDK
//
//  Created by Michał Fereniec on 14/01/2023.
//

import Foundation

struct BuyData: Codable {
    let token: TokenDataModel
    let userURL: String
    let nextAction: String
}
