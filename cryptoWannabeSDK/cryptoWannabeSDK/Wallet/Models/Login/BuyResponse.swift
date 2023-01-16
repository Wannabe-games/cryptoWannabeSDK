//
//  BuyResponse.swift
//  CryptoWannabeSDK
//
//  Created by Michał Fereniec on 14/01/2023.
//

import Foundation

class BuyResponse: Codable{
    let status: String
    let responseInfo: String
    let method: String
    let data: BuyData
    
    init(status: String, responseInfo: String, method: String, data: BuyData) {
        self.status = status
        self.responseInfo = responseInfo
        self.method = method
        self.data = data
    }
}
