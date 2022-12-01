//
//  AppsMeta.swift
//  cryptoWannabeSDK
//
//  Created by Michał Fereniec on 22/11/2022.
//

import Foundation

struct AppsMeta: Codable {
    let localhost3000, proxyWannabeGames: HTTP
    
    enum CodingKeys: String, CodingKey {
        case localhost3000 = "http://localhost:3000"
        case proxyWannabeGames = "https://proxy.wannabe.games"
    }
}
