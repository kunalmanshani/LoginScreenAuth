//
//  Alert.swift
//  LoginScreenAuth
//
//  Created by Gaditek on 23/11/2021.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showAlert (title: String , message: String) {
        
        let alert = UIAlertController(title: title, message: message , preferredStyle: .alert)
        let doneAlert = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(doneAlert)
        self.present(alert, animated: true, completion: nil)
    }
}
