//
//  LoginVM.swift
//  LoginScreenAuth
//
//  Created by Gaditek on 24/11/2021.
//

import Foundation
import UIKit

protocol LoginDelegate: AnyObject {
    func loginSucess()
    func loginFailure(message: String)
}

class LoginVM {
    
    weak var delegate: LoginDelegate?
    let loginModel = LoginModel()
    
    func login(email: String, password: String) {
        
        if email == loginModel.email && password == loginModel.pass {
            self.delegate?.loginSucess()
        } else {
            self.delegate?.loginFailure(message: "please check email or password")
        }
    }
}
