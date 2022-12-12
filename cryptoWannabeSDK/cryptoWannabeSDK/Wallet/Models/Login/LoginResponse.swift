//
//  LoginResponse.swift
//  CryptoWannabeSDK
//
//  Created by Michał Fereniec on 12/12/2022.
//

import Foundation

struct LoginResponse: Decodable {
    let status: String
    let responseInfo: String
    let method: Method
    let data: TokenDataModel
}
