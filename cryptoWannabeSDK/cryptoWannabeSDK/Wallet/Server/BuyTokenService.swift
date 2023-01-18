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
                print(error)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse)
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
