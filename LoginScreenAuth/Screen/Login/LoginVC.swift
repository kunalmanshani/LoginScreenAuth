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
    
    let emailImg = UIImage(named: "email")
    let passImg = UIImage(named: "password")
    let hidePass = UIImage(named: "hidden")
    let showPass = UIImage(named: "eye")
    var isPasswordVisible = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let tapGestureRecoginzer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGesture: )))
        
        showPassIcon(textField: passwordTextField, andImage: hidePass!, andGesture: tapGestureRecoginzer)
        AddleftImage(textField: passwordTextField, andImage: passImg!)
        AddleftImage(textField: emailTextField, andImage: emailImg!)
        
        viewModel.delegate = self
    }
    @objc func imageTapped(tapGesture: UITapGestureRecognizer) {
        let tappedImg = tapGesture.view as! UIImageView
        if isPasswordVisible {
            isPasswordVisible = false
            tappedImg.image = showPass
            passwordTextField.isSecureTextEntry = false
        }
        else{
            isPasswordVisible = true
            tappedImg.image = hidePass
            passwordTextField.isSecureTextEntry = true
        }
        
    }
    
    func showPassIcon(textField: UITextField, andImage rightImg: UIImage,andGesture tapGesture: UITapGestureRecognizer) {
       
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: rightImg.size.width, height: rightImg.size.height)
        
        let rightImgView = UIImageView()
        rightImgView.frame = CGRect(x: -5, y: 5, width: rightImg.size.width-10, height: rightImg.size.height-10)
        
        view.addSubview(rightImgView)
        rightImgView.image = rightImg
        textField.rightView = view
        textField.rightViewMode = .always
        
        rightImgView.isUserInteractionEnabled = true
        rightImgView.addGestureRecognizer(tapGesture)
        
    }
    
    func AddleftImage(textField: UITextField ,andImage Img: UIImage) {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: Img.size.width+10, height: Img.size.height)
        
        let leftImgView = UIImageView()
        leftImgView.frame = CGRect(x: 10, y: 5, width: Img.size.width-5, height: Img.size.height-5)
        
        view.addSubview(leftImgView)

        leftImgView.image = Img
        textField.leftView = view
        textField.leftViewMode = .always
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
