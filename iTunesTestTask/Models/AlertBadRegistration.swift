//
//  AlertBadRegistration.swift
//  iTunesTestTask
//
//  Created by Arina on 20.07.2023.
//

import UIKit

extension UIViewController {
    func alertOk(title: String, message: String) {
        let alet = UIAlertController (title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default)
        
        alet.addAction(ok)
        present(alet, animated: true, completion: nil)
    }
}
