//
//  NetworkManager.swift
//  test
//
//  Created by Drygan on 6/5/19.
//  Copyright © 2019 drygan.dev. All rights reserved.
//

import Foundation

final class NetworkManager {
    
    private lazy var session = URLSession(configuration: URLSessionConfiguration.default)
    
    func executeRequest(_ request: URLRequest, completion: @escaping (Pair?, Error?) -> Void) {
        session.dataTask(with: request) { data, response, error in
            guard let data = data else { DispatchQueue.main.async {completion(nil, error)}; return }
            let decoder = JSONDecoder()
            do {
                let pair = try decoder.decode(Pair.self, from: data)
                DispatchQueue.main.async {completion(pair, nil)}
            } catch let e {
                DispatchQueue.main.async {completion(nil, e)};
                print(e)
            }
            
        }.resume()
        
    }
    
}
