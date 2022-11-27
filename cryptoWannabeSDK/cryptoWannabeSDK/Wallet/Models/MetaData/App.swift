//
//  App.swift
//  cryptoWannabeSDK
//
//  Created by Michał Fereniec on 23/11/2022.
//

import Foundation

struct App: Codable {
    let localhost3000, proxyWannabe: String

    enum CodingKeys: String, CodingKey {
        case localhost3000 = "http://localhost:3000"
        case proxyWannabe = "https://proxy.wannabe.games"
    }
}
