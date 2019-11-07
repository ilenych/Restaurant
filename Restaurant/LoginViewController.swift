//
//  LoginViewController.swift
//  Restaurant
//
//  Copyright © 2019 <ASi. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    fileprivate let imageView: UIImageView = {
        let iv = UIImageView(frame: .zero)
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "log")
        return iv
    }()
    
    fileprivate let emailTF: UITextField = {
        let e = UITextField()
        let attributedPlaceholder = NSAttributedString(string: " Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        e.attributedPlaceholder = attributedPlaceholder
        e.textColor = .black
        e.keyboardType = UIKeyboardType.emailAddress
        e.backgroundColor = .white
        return e
    }()
    
    fileprivate let passwordTF: UITextField = {
        let p = UITextField()
        let attributedPlaceholder = NSAttributedString(string: " Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        p.attributedPlaceholder = attributedPlaceholder
        p.textColor = .black
        p.backgroundColor = .white
        p.isSecureTextEntry = true
        return p
    }()
    
    fileprivate let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Вход", for: .normal)
        button.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 28)
        button.setTitleColor(.white, for: .normal)
        //         button.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        button.backgroundColor = #colorLiteral(red: 0.03141137213, green: 0.8178852201, blue: 0.902800858, alpha: 1)
        button.layer.cornerRadius = 40
        button.clipsToBounds = true
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupEmailTF()
        setupPasswordTF()
        setupLoginButton()
        setupImageView()
    }
    
    fileprivate func setupImageView() {
          view.addSubview(imageView)
          imageView.snp.makeConstraints { (make) in
              make.width.equalTo(view.frame.width - 60)
              make.height.equalTo(80)
              make.centerX.equalTo(view.snp.centerX)
            make.bottom.equalTo(emailTF.snp.top).offset(-50)
          }
      }
    
    fileprivate func setupEmailTF() {
        view.addSubview(emailTF)
        emailTF.snp.makeConstraints { (make) in
            make.width.equalTo(view.frame.width - 100)
            make.height.equalTo(50)
            make.centerX.equalTo(view.snp.centerX)
            make.bottom.equalTo(view.snp.centerY)
        }
    }
    
    fileprivate func setupPasswordTF() {
        view.addSubview(passwordTF)
        passwordTF.snp.makeConstraints { (make) in
            make.width.equalTo(view.frame.width - 100)
            make.height.equalTo(50)
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(emailTF.snp.bottom).offset(30)
        }
    }
    
    fileprivate func setupLoginButton() {
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints { (make) in
            make.width.equalTo(view.frame.width - 60)
            make.height.equalTo(view.frame.width / 5)
            make.top.equalTo(passwordTF.snp.bottom).offset(80)
            make.centerX.equalTo(view.snp.centerX)
        }
    }
}

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
