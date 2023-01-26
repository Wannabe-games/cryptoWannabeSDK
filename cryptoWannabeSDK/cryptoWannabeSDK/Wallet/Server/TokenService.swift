//
//  TokenService.swift
//  CryptoWannabeSDK
//
//  Created by Michał Fereniec on 01/12/2022.
//

import Foundation

class TokenService {

    func getToken(completion: @escaping ((String) -> Void)) {
        guard let proxyURL = URL(string: "https://proxy.wannabe.games/api/token") else { return }
        var urlRequest = URLRequest(url: proxyURL)
        urlRequest.setValue(UserDefaultsHandler.authorizationTokenValue,
                            forHTTPHeaderField: UserDefaultsHandler.authorizationTokenKey)
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data else { return }
            guard let model = try? JSONDecoder().decode(TokenResponse.self, from: data) else { return }
            UserDefaultsHandler.authorizationToken = model.data.token
            var sessionToken = model.data.token //ta sama sztuczka + w user defaultsach
            print("MMMMMM: \(model.data.token)")
            completion(model.data.token)
        }.resume()
    }
}
