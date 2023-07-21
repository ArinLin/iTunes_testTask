//
//  NetworkRequest.swift
//  iTunesTestTask
//
//  Created by Arina on 21.07.2023.
//

import Foundation

class NetworkRequest {
    
    static let shared = NetworkRequest(); private init() {}
    
    func requestData(urlStripg: String, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: urlStripg) else { return }
        
        URLSession.shared.dataTask(with: url) { data, responce, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure (error))
                    return
                }
                guard let data = data else { return }
                completion(.success(data))
            }
        }.resume()
    }
}
