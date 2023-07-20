//
//  UserDefaultsManager.swift
//  iTunesTestTask
//
//  Created by Arina on 20.07.2023.
//

import Foundation

class DataBase {
    static let shared = DataBase(); private init() {}
    
    enum SettingKeys: String {
        case usersKey
    }
    
    let userKey = SettingKeys.usersKey.rawValue
    
    let defaults = UserDefaults.standard
    
    var users: [User] {
        get {
            if let data = defaults.value(forKey: userKey) as? Data { // когда получаем данные -- декодируем
                return try! PropertyListDecoder().decode([User].self, from: data)
            } else {
                return [User]()
            }
        }
        
        set {
            if let data = try? PropertyListEncoder().encode(newValue) { // когда отправляем данные -- кодируем
                defaults.set(data, forKey: userKey)
            }
        }
    }
    
    func saveUser(firstName: String, secondName: String, phone: String, email: String, password: String, age: Date) {
        
        let user = User(firstName: firstName, secondName: secondName, phone: phone, email: email, password: password, age: age)
        users.insert(user, at: 0)
    }
}
