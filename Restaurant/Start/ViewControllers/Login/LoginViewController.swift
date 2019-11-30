//
//  LoginViewController.swift
//  Restaurant
//
//  Copyright © 2019 <ASi. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import Firebase

class LoginViewController: UIViewController {
    //MARK: - Variables
    var router: RouterProtocol!
    
    fileprivate let imageView: AuthImage = {
        let iv = AuthImage(imageName: "log")
        return iv
    }()
    
    fileprivate lazy var loginButton: AuthButton = {
        let b = AuthButton(title: "Вход", view: self.view)
        b.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        return b
    }()
    
    fileprivate lazy var emailView: TextFieldView = {
        let v = TextFieldView(view: self.view,
                              placeholder: "Email",
                              isSecureTextEntry: false,
                              imageName: "email")
        v.textField.delegate = self
        return v
    }()
    
    fileprivate lazy var passwordView: TextFieldView = {
        let v = TextFieldView(view: self.view,
                              placeholder: "Password",
                              isSecureTextEntry: true,
                              imageName: "password")
        v.textField.delegate = self
        return v
    }()
    
    fileprivate let signinLabel: AuthLabel = {
        let l = AuthLabel(text: "Нет аккаунта?")
        return l
    }()
    
    fileprivate lazy var signinButton: AuthButton = {
        let b = AuthButton(title: "Зарегистрироваться", view: self.view, strColor: #colorLiteral(red: 0.03141137213, green: 0.8178852201, blue: 0.902800858, alpha: 1))
        b.addTarget(self, action: #selector(didTapSigninButton), for: .touchUpInside)
        return b
    }()
    
    //MARK: - Cycle life
    override func viewDidLoad() {
        super.viewDidLoad()
        //view config
        view.backgroundColor = .black
        
        //Router
        router = Routers(viewController: self)
        
        //setup
        setupEmailView()
        setupPasswordView()
        setupLoginButton()
        setupImageView()
        setupSigninLabel()
        setupSigninButton()
    }
    
    //MARK: - Functions
    @objc func didTapLoginButton() {
        guard let email = emailView.textField.text,
            let password = passwordView.textField.text,
            email != "", password != ""
            else { print("Error in enter" ); return }
        
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error != nil {
                print("Error signin")
            }
            
            if user != nil {
                self.router.openMainViewController()
                return
            }
            print("No such user")
        }
    }
    
    @objc func didTapSigninButton() {
        router.openSigninViewController()
    }
    
    //MARK: - Setup
    fileprivate func setupImageView() {
        view.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.width.equalTo(view.frame.width - 60)
            make.height.equalTo(80)
            make.centerX.equalTo(view.snp.centerX)
            make.bottom.equalTo(emailView.snp.top).offset(-50)
        }
    }
    
    fileprivate func setupEmailView() {
        view.addSubview(emailView)
        emailView.snp.makeConstraints { (make) in
            make.width.equalTo(view.frame.width - 60)
            make.height.equalTo(view.frame.width / 6)
            make.centerX.equalTo(view.snp.centerX)
            make.centerY.equalTo(view.snp.centerY).offset(-30)
        }
    }
    
    fileprivate func setupPasswordView() {
        view.addSubview(passwordView)
        passwordView.snp.makeConstraints { (make) in
            make.width.equalTo(view.frame.width - 60)
            make.height.equalTo(view.frame.width / 6)
            make.top.equalTo(emailView.snp.bottom).offset(30)
            make.centerX.equalTo(view.snp.centerX)
        }
    }
    fileprivate func setupSigninLabel() {
        view.addSubview(signinLabel)
        signinLabel.snp.makeConstraints { (make) in
            make.width.equalTo(view.frame.width - 60)
            make.height.equalTo(view.frame.width / 10)
            make.top.equalTo(passwordView.snp.bottom).offset(20)
            make.centerX.equalTo(view.snp.centerX)
        }
    }
    
    fileprivate func setupSigninButton() {
        view.addSubview(signinButton)
        signinButton.snp.makeConstraints { (make) in
            make.width.equalTo(view.frame.width - 60)
            make.height.equalTo(view.frame.width / 10)
            make.top.equalTo(signinLabel.snp.bottom)
            make.centerX.equalTo(view.snp.centerX)
        }
    }
    
     fileprivate func setupLoginButton() {
         view.addSubview(loginButton)
         loginButton.snp.makeConstraints { (make) in
             make.width.equalTo(view.frame.width - 60)
             make.height.equalTo(view.frame.width / 5)
             make.bottom.equalTo(view.frame.width / -9)
             make.centerX.equalTo(view.snp.centerX)
         }
     }
}

//MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
