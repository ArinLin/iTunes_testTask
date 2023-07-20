//
//  UserModel.swift
//  iTunesTestTask
//
//  Created by Arina on 20.07.2023.
//

import Foundation

struct User: Codable {
    let firstName: String
    let secondName: String
    let phone: String
    let email: String
    let password: String
    let age: Date
}
