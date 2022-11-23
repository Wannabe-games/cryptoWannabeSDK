//
//  AppsMeta.swift
//  cryptoWannabeSDK
//
//  Created by Michał Fereniec on 22/11/2022.
//

import Foundation

struct AppsMeta: Codable {
    
    let httpLocalhost3000, httpsProxyWannabeGames: HTTP
    enum CodingKeys: String, CodingKey {
        case httpLocalhost3000 = "http://localhost:3000"
        case httpsProxyWannabeGames = "https://proxy.wannabe.games"
    }
}
