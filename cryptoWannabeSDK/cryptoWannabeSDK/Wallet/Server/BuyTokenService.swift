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
        //missing field: barer
        //missing field: auth token
        urlRequest.setValue("8lTWSnJCHxA0NG1aOjwUL0j0vtGjA7HmqDQP900UrVCpKJntwd", forHTTPHeaderField: "transaction")
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data else { return }
            
            print("==========")
            print(urlRequest)
            print(urlRequest.allHTTPHeaderFields)
            print(urlRequest.allHTTPHeaderFields)
            print("==========")
            print(response)
            print(String(data: data, encoding: String.Encoding.utf8))
            print("==========")
            
            
            var model: BuyResponse?
            do {
                
                
                
                model = try JSONDecoder().decode(BuyResponse.self, from: data)
            }
            catch {
                print("error")
                print(error)
                print("error")
            }
            
//            UserDefaultsHandler.token = model.data.token
            
            
            
//            completion(model.data.token)
            
            print("dsdsa")
            print("dsdsa \(model?.data.token)")
            print("dsdsa")
            completion("dsadasas")
        }.resume()
    }
}
