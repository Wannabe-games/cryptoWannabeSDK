//
//  WalletService.swift
//  cryptoWannabeSDK
//
//  Created by Michał Fereniec on 24/11/2022.
//

import Foundation

class WalletService {
    
    func getWalletDetails(completion: @escaping ((WalletMetadata?) -> () )) {
        
        guard let wannabeURL = URL(string: "https://proxy.wannabe.games") else { return }
        
        let session = URLSession.shared
        let task = session.dataTask(with: wannabeURL) { data, response, error in
            if let httpResponse = response as? HTTPURLResponse{
                debugPrint(httpResponse.statusCode)
            }
            if let error = error {
                debugPrint(error)
            }
            
            guard let data = data else { completion(nil); return }
          
            let jsonDecoder = JSONDecoder()
            
            do {
                let wallets = try jsonDecoder.decode(WalletMetadata.self, from: data)
                completion(wallets)
            } catch {
                completion(nil)
                debugPrint(error)
            }
        }
        task.resume()
    }
}
