//
//  AuthViewController.swift
//  Restaurant
//
//  Copyright © 2019 <ASi. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import Firebase

class AuthViewController: UIViewController {
    //MARK: - Variables
    
    private var router: RouterProtocol!
    
    fileprivate lazy var loginButton: AuthButton = {
        let b = AuthButton(title: "Вход", view: self.view)
        b.addTarget(self, action: Selector.didTapLoginButton, for: .touchUpInside)
        return b
    }()
    
    fileprivate lazy var signupButton: AuthButton = {
        let b = AuthButton(title: "Регистрация", view: self.view, bgColor: .white)
        b.addTarget(self, action: Selector.didTapSignupButton, for: .touchUpInside)
        return b
    }()
    
    fileprivate let imageView: AuthImage = {
        let iv = AuthImage(imageName: "base")
        return iv
    }()
    //MARK: - Cycle life
    override func viewDidLoad() {
        super.viewDidLoad()
        //view config
        view.backgroundColor = .black
        
        //Router
        router = Routers(viewController: self)
        
        //setup
        setupSignupButton()
        setupLoginButton()
        setupImageView()
        
        //function
        addStateDidChangeListener()
    }
    //MARK: - Functions
    fileprivate func addStateDidChangeListener() {
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if user != nil {
                self.router.openMainViewController()
            }
        }
    }
    
    @objc func didTapLoginButton() {
        router.openLoginViewController()
    }
    
    @objc func didTapSignupButton() {
        router.openSigninViewController()
    }
    
    //MARK: - Setup
    fileprivate func setupLoginButton() {
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints { (make) in
            make.width.equalTo(view.frame.width - 60)
            make.height.equalTo(view.frame.width / 5)
            make.bottom.equalTo(signupButton.snp.top).offset(-30)
            make.centerX.equalTo(view.snp.centerX)
        }
    }
    
    fileprivate func setupSignupButton() {
        view.addSubview(signupButton)
        signupButton.snp.makeConstraints { (make) in
            make.width.equalTo(view.frame.width - 60)
            make.height.equalTo(view.frame.width / 5)
            make.bottom.equalTo(view.frame.height / -9)
            make.centerX.equalTo(view.snp.centerX)
        }
    }
    
    fileprivate func setupImageView() {
        view.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.width.equalTo(view.frame.width)
            make.height.equalTo(view.frame.width - 40)
            make.centerX.equalTo(view.snp.centerX)
            make.bottom.equalTo(loginButton.snp.top).offset(-10)
        }
    }
}
//MARK: - Selector
fileprivate extension Selector {
    static let didTapLoginButton = #selector(AuthViewController.didTapLoginButton)
    static let didTapSignupButton = #selector(AuthViewController.didTapSignupButton)
}

