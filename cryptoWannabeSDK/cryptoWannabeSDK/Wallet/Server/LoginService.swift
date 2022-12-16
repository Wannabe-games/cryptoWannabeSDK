//
//  LoginService.swift
//  CryptoWannabeSDK
//
//  Created by Michał Fereniec on 08/12/2022.
//


import Foundation

class LoginService {
   
    let proxyURL = URL(string: "https://proxy.wannabe.games/api/connect/\(UserDefaultsHandler.token)/wallet")!
    
    public init() {}

    public func getToken(completion: @escaping ((String) -> Void)) {
        var urlRequest = URLRequest(url: proxyURL)
        urlRequest.setValue("8lTWSnJCHxA0NG1aOjwUL0j0vtGjA7HmqDQP900UrVCpKJntwd", forHTTPHeaderField: "auth")
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data else { return }
            guard let model = try? JSONDecoder().decode(TokenResponse.self, from: data) else { return }
            UserDefaultsHandler.token = model.data.token
            completion(model.data.token)
        }.resume()
    }
}
