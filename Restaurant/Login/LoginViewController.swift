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
    fileprivate let imageView: UIImageView = {
        let iv = UIImageView(frame: .zero)
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "log")
        return iv
    }()
    
    fileprivate lazy var loginButton: UIButton = {
        let b = UIButton()
        b.setTitle("Вход", for: .normal)
        b.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 28)
        b.setTitleColor(.white, for: .normal)
        b.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        b.backgroundColor = #colorLiteral(red: 0.03141137213, green: 0.8178852201, blue: 0.902800858, alpha: 1)
        b.clipsToBounds = true
        b.layer.cornerRadius = self.view.frame.width / 10
        return b
    }()
    //FIXME: - Bug
    //BUG: placeholder don't displayed in iphone 11
    fileprivate lazy var emailView: TextFieldView = {
        let v = TextFieldView()
        v.textField.placeholder = "Email"
        v.textField.delegate = self
        v.imageView.image = UIImage(named: "email")
        v.layer.cornerRadius = self.view.frame.width / 12
        return v
    }()
    
    fileprivate lazy var passwordView: TextFieldView = {
        let v = TextFieldView()
        v.textField.placeholder = "Password"
        v.textField.isSecureTextEntry = true
        v.textField.delegate = self
        v.imageView.image = UIImage(named: "password")
        v.layer.cornerRadius = self.view.frame.width / 12
        return v
    }()
    
    //MARK: - Cycle life
    override func viewDidLoad() {
        super.viewDidLoad()
        //view config
        view.backgroundColor = .black
        
        //setup
        setupEmailView()
        setupPasswordView()
        setupLoginButton()
        setupImageView()
    }
    
    //MARK: - Functions
    @objc func didTapLoginButton() {
         guard let email = emailView.textField.text, let password = passwordView.textField.text, email != "", password != "" else { print("Error in enter" ); return }
         Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
             if error != nil {
                 print("Error")
             }
             
             if user != nil {
                 let storyBoard = UIStoryboard(name: "MainViewController", bundle: nil)
                 let MainVC = storyBoard.instantiateViewController(withIdentifier: String(describing: MainViewController.self)) as! MainViewController
                 MainVC.modalTransitionStyle = .crossDissolve
                 MainVC.modalPresentationStyle = .overCurrentContext
                 self.present(MainVC, animated: true, completion: nil)
                 return
             }
             print("No such user")
         }
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
    
    fileprivate func setupLoginButton() {
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints { (make) in
            make.width.equalTo(view.frame.width - 60)
            make.height.equalTo(view.frame.width / 5)
            make.top.equalTo(passwordView.snp.bottom).offset(110)
            make.centerX.equalTo(view.snp.centerX)
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
}

//MARK: - Extension
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

//MARK: - Canvas
import SwiftUI

struct LoginPreviews: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<LoginPreviews.ContainerView>) -> UIViewController {
            return LoginViewController()
        }
        
        func updateUIViewController(_ uiViewController: LoginPreviews.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<LoginPreviews.ContainerView>) {
            
        }
    }
}
