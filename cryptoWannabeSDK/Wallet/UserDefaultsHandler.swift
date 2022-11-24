//
//  UserDefaultsHandler.swift
//  cryptoWannabeSDK
//
//  Created by Michał Fereniec on 22/11/2022.
//

import Foundation

//TODO: store WalletMetadata
//TODO: restore WalletMetadata
//TODO: nullify WalletMetadata

struct UserDefaultsHandler {
    @Storage(key: .localHost, defaultValue:  "")
    static var localhost: String
    
    @Storage(key: .proxyWannabe, defaultValue: "")
    static var proxyWannabe: String
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
    case localHost = "http://localhost:3000"
    case proxyWannabe = "https://proxy.wannabe.games"
}
/*
 //
 //  UserDefaultsWrapper.swift
 //  Fakty
 //
 //  Created by Piotr Nietrzebka on 21/06/2022.
 //  Copyright © 2022 INTERIA.PL. All rights reserved.
 //

 import Foundation

 struct UserDefaultsWrapper {
     
     @Storage(key: "latest-news-id-weekly", defaultValue: "")
     static var latestNewsIDWeekly: String
     
     @Storage(key: "latest-news-id-newest", defaultValue: "")
     static var latestNewsIDNewest: String
 }

 @propertyWrapper
 struct Storage<T: Codable> {
     private let key: String
     private let defaultValue: T

     init(key: String, defaultValue: T) {
         self.key = key
         self.defaultValue = defaultValue
     }

     var wrappedValue: T {
         get {
             // Read value from UserDefaults
             guard let data = UserDefaults.standard.object(forKey: key) as? Data else {
                 // Return defaultValue when no data in UserDefaults
                 return defaultValue
             }

             // Convert data to the desire data type
             let value = try? JSONDecoder().decode(T.self, from: data)
             return value ?? defaultValue
         }
         set {
             // Convert newValue to data
             let data = try? JSONEncoder().encode(newValue)
             
             // Set value to UserDefaults
             UserDefaults.standard.set(data, forKey: key)
         }
     }
 }

 */

