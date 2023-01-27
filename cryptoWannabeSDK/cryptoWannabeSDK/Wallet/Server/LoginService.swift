//
//  LoginService.swift
//  CryptoWannabeSDK
//
//  Created by Michał Fereniec on 08/12/2022.
//


import Foundation

class LoginService {
   
    let proxyURL = URL(string: "https://proxy.wannabe.games/api/connect/\(UserDefaultsHandler.sessionToken)/wallet")!
    
    var view: WebView {
        return self.view
    }
    
    init() {}

    func getToken(completion: @escaping ((String) -> Void)) {
        var urlRequest = URLRequest(url: proxyURL)
        urlRequest.setValue(UserDefaultsHandler.authorizationTokenValue,
                            forHTTPHeaderField: UserDefaultsHandler.authorizationTokenKey)
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data else { return }
            guard let model = try? JSONDecoder().decode(TokenResponse.self, from: data) else { return }
            UserDefaultsHandler.sessionToken = model.data.token
            completion(model.data.token)
        }.resume()
    }
}
