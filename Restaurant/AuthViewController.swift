//
//  AuthViewController.swift
//  Restaurant
//
//  Copyright © 2019 <ASi. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class AuthViewController: UIViewController {
    
    fileprivate let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Вход", for: .normal)
        button.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 28)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        button.backgroundColor = #colorLiteral(red: 0.03141137213, green: 0.8178852201, blue: 0.902800858, alpha: 1)
        button.layer.cornerRadius = 40
        button.clipsToBounds = true
        return button
    }()
    
    fileprivate let signupButton: UIButton = {
        let button = UIButton()
        button.setTitle("Регистрация", for: .normal)
        button.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 28)
        button.setTitleColor(.black, for: .normal)
        //           button.addTarget(self, action: Selector.didTapSignupButton, for: .touchUpInside)
        button.backgroundColor = .white
        button.layer.cornerRadius = 40
        button.clipsToBounds = true
        return button
    }()
    
    fileprivate let imageView: UIImageView = {
        let iv = UIImageView(frame: .zero)
        //        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "base")
        //        iv.clipsToBounds = true
        //        iv.layer.cornerRadius = 12
        return iv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupSignupButton()
        setupLoginButton()
        setupImageView()
    }
    
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
    
     @objc func didTapLoginButton() {
          let storyBoard = UIStoryboard(name: "LoginViewController", bundle: nil)
          let loginVC = storyBoard.instantiateViewController(withIdentifier: String(describing: LoginViewController.self)) as! LoginViewController
          loginVC.modalTransitionStyle = .crossDissolve
          loginVC.modalPresentationStyle = .overCurrentContext
          self.present(loginVC, animated: true, completion: nil)
      }
}


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
