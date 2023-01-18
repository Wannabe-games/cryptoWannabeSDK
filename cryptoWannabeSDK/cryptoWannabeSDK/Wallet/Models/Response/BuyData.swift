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
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(token, forKey: .token)
        try container.encode(userURL, forKey: .userURL)
        try container.encode(nextAction, forKey: .nextAction)
    }

    enum CodingKeys: String, CodingKey {
        case token
        case userURL
        case nextAction
    }
}
