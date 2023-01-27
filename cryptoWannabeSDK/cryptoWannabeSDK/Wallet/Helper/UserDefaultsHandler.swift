//
//  UserDefaultsHandler.swift
//  cryptoWannabeSDK
//
//  Created by Michał Fereniec on 22/11/2022.
//

import Foundation

struct UserDefaultsHandler {
    @Storage(key: .walletMetadata, defaultValue:  nil)
    static var walletMetadata: WalletMetadata?
    
    @Storage(key: .authorizationTokenKey, defaultValue: "")
    static var authorizationTokenKey: String
    
    @Storage(key: .authorizationTokenValue, defaultValue: "")
    static var authorizationTokenValue: String
    
    @Storage(key: .sessionToken, defaultValue: "")
    static var sessionToken: String
}

@propertyWrapper
struct Storage<T: Codable> {
    private let key: StorageKey
    private let defaultValue: T
    
    init(key: StorageKey, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    var wrappedValue: T {
        get {
            guard let data = UserDefaults.standard.object(forKey: key.rawValue) as? Data else {
                return defaultValue
            }
            let value = try? JSONDecoder().decode(T.self, from: data)
            return value ?? defaultValue
        }
        set {
            let data = try? JSONEncoder().encode(newValue)
            UserDefaults.standard.set(data, forKey: key.rawValue)
        }
    }
}

enum StorageKey: String {
    case walletMetadata
    case sessionToken
    case authorizationTokenValue
    case authorizationTokenKey
}
