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
    }
    
    enum Regex: String {
        case name = "[a-zA-Z]{1,}"
    }
    
    func isValid(validType: ValidTypes) -> Bool {
        let format = "SELF MATCHES %@" // вводимые значения проверяем на соответствие регулярному выражению
        var regex = ""
        
        switch validType {
        case .name:
            regex = Regex.name.rawValue
        }
        
        return NSPredicate(format: format, regex).evaluate(with: self)
    }
    
}
