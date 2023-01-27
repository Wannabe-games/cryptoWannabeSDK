//
//  BuyTokenService.swift
//  CryptoWannabeSDK
//
//  Created by Michał Fereniec on 14/01/2023.
//

import Foundation

class BuyTokenService {
    //4 buttony do kazdego endpointu

    func getToken(completion: @escaping ((String?) -> Void)) {
        guard let proxyURL = URL(string: "https://proxy.wannabe.games/api/connect/create") else { return }
        var urlRequest = URLRequest(url: proxyURL)
        urlRequest.setValue(UserDefaultsHandler.authorizationTokenValue,
                            forHTTPHeaderField: UserDefaultsHandler.authorizationTokenKey)
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
            
            do {
                let model = try JSONDecoder().decode(BuyResponse.self, from: data)
                completion(model.responseInfo)
            } catch {
                print("ERROR: \(error.localizedDescription)")
                completion(nil)
            }
        }.resume()
    }
    
    func createPayment(transactionId: String, amount: Double) {
        let headers = [
            "memo": transactionId,
            "amount": String(amount)
        ]
        let request = NSMutableURLRequest(url: URL(string: "https://proxy.wannabe.games/api/payment/create")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error as Any)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse as Any)
                if let data = data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                        print(json)
                        if let jsonDict = json as? [String: Any] {
                            if let status = jsonDict["status"] as? String, status == "success" {
                                if let responseInfo = jsonDict["responseInfo"] as? String, responseInfo == "Payment created" {
                                    if let data = jsonDict["data"] as? [String: Any],
                                        let token = data["token"] as? String,
                                        let userURL = data["userURL"] as? String {
                                        print("Payment created with token: \(token) and userURL: \(userURL)")
                                    }
                                }
                            } else if let status = jsonDict["status"] as? String, status == "error" {
                                if let responseInfo = jsonDict["responseInfo"] as? String {
                                    print("Error: \(responseInfo)")
                                }
                            }
                        }
                    } catch {
                        print("Error deserializing JSON: \(error)")
                    }
                }
            }
        })
        dataTask.resume()
    }
}
