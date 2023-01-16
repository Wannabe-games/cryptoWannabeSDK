//
//  BuyTokenService.swift
//  CryptoWannabeSDK
//
//  Created by Michał Fereniec on 14/01/2023.
//

import Foundation

class BuyTokenService {

    func getToken(completion: @escaping ((String) -> Void)) {
        guard let proxyURL = URL(string: "https://proxy.wannabe.games/api/connect/create") else { return }
        var urlRequest = URLRequest(url: proxyURL)
        urlRequest.setValue("8lTWSnJCHxA0NG1aOjwUL0j0vtGjA7HmqDQP900UrVCpKJntwd", forHTTPHeaderField: "transaction")
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data else { return }
            guard let model = try? JSONDecoder().decode(BuyResponse.self, from: data) else { return }
            UserDefaultsHandler.token = model.data.token
            completion(model.data.token)
        }.resume()
    }
}
