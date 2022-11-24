//
//  Profile.swift
//  cryptoWannabeSDK
//
//  Created by Michał Fereniec on 22/11/2022.
//

import Foundation

struct Profile: Codable {
    let type: String
    let context: String
    let apps: App
    let appsMeta: AppsMeta
    let stxAddress: STXAddress
    
    enum CodingKeys: String, CodingKey {
        case type = "@type"
        case context = "@context"
        case apps, appsMeta, stxAddress
    }
}
