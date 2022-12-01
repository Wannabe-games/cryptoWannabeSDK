//
//  TokenResponse.swift
//  CryptoWannabeSDK
//
//  Created by Michał Fereniec on 01/12/2022.
//

import Foundation

struct TokenResponse: Decodable {
    let status: String
    let responseInfo: String
    let method: Method
    let data: TokenDataModel
}
