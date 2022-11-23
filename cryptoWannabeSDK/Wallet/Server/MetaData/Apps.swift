//
//  Apps.swift
//  cryptoWannabeSDK
//
//  Created by Michał Fereniec on 23/11/2022.
//

import Foundation

struct Apps: Codable {
    let httpLocalhost3000, httpsProxyWannabe: String
    
    enum CodingKeys: String, CodingKey {
        case httpLocalhost3000 = "http://localhost:3000"
        case httpsProxyWannabeGames = "https://proxy.wannabe.games"
    }
}
