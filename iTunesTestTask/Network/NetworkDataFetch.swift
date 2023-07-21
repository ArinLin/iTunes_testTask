//
//  NetworkDataFetch.swift
//  iTunesTestTask
//
//  Created by Arina on 21.07.2023.
//

import Foundation

class NetworkDataFetch {
    static let shared = NetworkDataFetch(); private init() {}
    
    func fetchAlbum(urlString: String, responce: @escaping (AlbumModel?, Error?) -> Void) {
        NetworkRequest.shared.requestData(urlStripg: urlString) { result in
            switch result {
            case .success(let data):
                do {
                    let albums = try JSONDecoder().decode(AlbumModel.self, from: data)
                    responce(albums, nil)
                } catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                }
            case .failure(let error):
                print("Error received requesting data: \(error.localizedDescription)")
                responce(nil, error)
            }
        }
    }
}
