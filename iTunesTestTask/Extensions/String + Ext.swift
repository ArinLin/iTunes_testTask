//
//  String + Ext.swift
//  iTunesTestTask
//
//  Created by Arina on 19.07.2023.
//

import Foundation

extension String {
    
    enum ValidTypes {
        case name
        case email
        case password
    }
    
    enum Regex: String {
        case name = "[a-zA-Z]{1,}"
        case email = "[a-zA-Z0-9._]+@[a-zA-Z]+\\.[a-zA-Z]{2,4}"
        case password = "(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9]).{6,}"
    }
    
    func isValid(validType: ValidTypes) -> Bool {
        let format = "SELF MATCHES %@" // вводимые значения проверяем на соответствие регулярному выражению
        var regex = ""
        
        switch validType {
        case .name:
            regex = Regex.name.rawValue
        case .email:
            regex = Regex.email.rawValue
        case .password:
            regex = Regex.password.rawValue
        }
        return NSPredicate(format: format, regex).evaluate(with: self)
    }
    
}
