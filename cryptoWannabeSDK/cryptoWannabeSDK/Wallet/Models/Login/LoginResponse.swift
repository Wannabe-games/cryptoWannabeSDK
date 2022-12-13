//
//  LoginResponse.swift
//  CryptoWannabeSDK
//
//  Created by Michał Fereniec on 12/12/2022.
//

import Foundation

class LoginResponse {
    let status: String
    let responseInfo: String
    let method: String
    let data: String
    
    init(status: String, responseInfo: String, method: String, data: String) {
        self.status = status
        self.responseInfo = responseInfo
        self.method = method
        self.data = data
    }
}
