//
//  SongsModel.swift
//  iTunesTestTask
//
//  Created by Arina on 21.07.2023.
//

import Foundation

struct SongsModel: Decodable {
    let results: [Song]
}

struct Song: Decodable {
    let trackName: String?
}
