//
//  WalletService.swift
//  cryptoWannabeSDK
//
//  Created by Michał Fereniec on 24/11/2022.
//

import Foundation

class WalletService {
    
    func getWalletDetails(completion: @escaping ( [WalletMetadata]?) -> () ) {
        
        guard let wannabeURL = URL(string: "https://proxy.wannabe.games") else { return }
        
        let session = URLSession.shared
        let task = session.dataTask(with: wannabeURL) { data, response, error in
            if let httpResponse = response as? HTTPURLResponse{
                print(httpResponse.statusCode)
            }
            if let error = error {
                print(error)
            }
            
            guard let data = data else { completion(nil); return }
          
            let jsonDecoder = JSONDecoder()
            
            do { //[weak self]
                let wallets = try jsonDecoder.decode([WalletMetadata].self, from: data)
                completion(wallets)
            } catch {
                completion(nil)
                print(error)
            }
        }
        
        task.resume()
        
    }
}
