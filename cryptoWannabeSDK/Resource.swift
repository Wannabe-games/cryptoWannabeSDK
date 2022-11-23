//
//  Resource.swift
//  cryptoWannabeSDK
//
//  Created by Michał Fereniec on 22/11/2022.
//

import Foundation

struct Resource<T: Codable> {
    let url: URL
    var httpMethod: Method
    var body: Data? = nil
}
