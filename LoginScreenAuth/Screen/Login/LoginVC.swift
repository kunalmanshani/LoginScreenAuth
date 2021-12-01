//
//  LoginVC.swift
//  LoginScreenAuth
//
//  Created by Gaditek on 24/11/2021.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!

    let viewModel = LoginVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.delegate = self
    }
    
    @IBAction func loginButtonTap(_ sender: Any){
        let email = emailTextField.text ?? ""
        let pass = passwordTextField.text ?? ""
        viewModel.login(email: email, password: pass)
    }

}
extension LoginVC: LoginDelegate{
    
    func loginSucess() {
        moveScreen(storyboard: "Main", vc: "CountryVC")
    }
    
    func loginFailure(message: String) {
        showAlert(title: "Wrong Crendentials", message: message)
    }
    
    
}
