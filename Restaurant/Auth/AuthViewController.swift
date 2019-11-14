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
    fileprivate lazy var loginButton: UIButton = {
        let b = UIButton()
        b.setTitle("Вход", for: .normal)
        b.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 28)
        b.setTitleColor(.white, for: .normal)
        b.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        b.backgroundColor = #colorLiteral(red: 0.03141137213, green: 0.8178852201, blue: 0.902800858, alpha: 1)
        b.layer.cornerRadius = self.view.frame.width / 10
        b.clipsToBounds = true
        return b
    }()
    
    fileprivate lazy var signupButton: UIButton = {
        let b = UIButton()
        b.setTitle("Регистрация", for: .normal)
        b.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 28)
        b.setTitleColor(.black, for: .normal)
        b.addTarget(self, action: #selector(didTapSignupButton), for: .touchUpInside)
        b.backgroundColor = .white
        b.layer.cornerRadius = self.view.frame.width / 10
        b.clipsToBounds = true
        return b
    }()
    
    fileprivate let imageView: UIImageView = {
        let iv = UIImageView(frame: .zero)
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "base")
        return iv
    }()
    //MARK: - Cycle life
    override func viewDidLoad() {
        super.viewDidLoad()
        //view config
        view.backgroundColor = .black
        
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
                let storyBoard = UIStoryboard(name: "MainViewController", bundle: nil)
                let MainVC = storyBoard.instantiateViewController(withIdentifier: String(describing: MainViewController.self)) as! MainViewController
                MainVC.modalTransitionStyle = .crossDissolve
                MainVC.modalPresentationStyle = .overCurrentContext
                self.present(MainVC, animated: true, completion: nil)
            }
        }
    }
    
    @objc func didTapLoginButton() {
        let storyBoard = UIStoryboard(name: "LoginViewController", bundle: nil)
        let loginVC = storyBoard.instantiateViewController(withIdentifier: String(describing: LoginViewController.self)) as! LoginViewController
        loginVC.modalTransitionStyle = .crossDissolve
        loginVC.modalPresentationStyle = .overCurrentContext
        self.present(loginVC, animated: true, completion: nil)
    }
    
    @objc func didTapSignupButton() {
        let storyBoard = UIStoryboard(name: "SigninViewController", bundle: nil)
        let signinVC = storyBoard.instantiateViewController(withIdentifier: String(describing: SigninViewController.self)) as! SigninViewController
        signinVC.modalTransitionStyle = .crossDissolve
        signinVC.modalPresentationStyle = .overCurrentContext
        self.present(signinVC, animated: true, completion: nil)
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

//MARK: - Canvas
import SwiftUI

struct AuthPreviews: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<AuthPreviews.ContainerView>) -> UIViewController {
            return AuthViewController()
        }
        
        func updateUIViewController(_ uiViewController: AuthPreviews.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<AuthPreviews.ContainerView>) {
        }
    }
}
