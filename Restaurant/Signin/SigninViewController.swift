//
//  SigninViewController.swift
//  Restaurant
//
//  Copyright © 2019 <ASi. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import Firebase

class SigninViewController: UIViewController {
    //MARK: - Variables
    private var router: RouterProtocol!
    lazy var contentViewSize = CGSize(width: self.view.frame.width, height: self.view.frame.height)
    
    fileprivate lazy var scrollView: UIScrollView = {
        let sv = UIScrollView(frame: .zero)
        sv.frame = self.view.bounds
        sv.contentSize = self.contentViewSize
        return sv
    }()
    
    fileprivate lazy var containerView: UIView = {
        let v = UIView()
        v.frame.size = self.contentViewSize
        return v
    }()
    
    fileprivate let imageView: UIImageView = {
        let iv = UIImageView(frame: .zero)
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "log")
        return iv
    }()
    
    fileprivate lazy var signinButton: UIButton = {
        let b = UIButton()
        b.setTitle("Зарегистрироваться", for: .normal)
        b.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 28)
        b.setTitleColor(.white, for: .normal)
        b.addTarget(self, action: #selector(didTapSigninButton), for: .touchUpInside)
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
    
    fileprivate lazy var confirmPasswordView: TextFieldView = {
        let v = TextFieldView()
        v.textField.placeholder = "Confirm password"
        v.textField.isSecureTextEntry = true
        v.textField.delegate = self
        v.imageView.image = UIImage(named: "ConfirmPassword")
        v.layer.cornerRadius = self.view.frame.width / 12
        return v
    }()
    
    fileprivate let loginLabel: UILabel = {
        let l = UILabel()
        l.text = "Уже зарегистированы?"
        l.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 18)
        l.textAlignment = .center
        l.textColor = .white
        return l
    }()
    
    fileprivate lazy var loginButton: UIButton = {
        let b = UIButton()
        b.setTitle("Войти", for: .normal)
        b.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 18)
        b.setTitleColor(#colorLiteral(red: 0.03141137213, green: 0.8178852201, blue: 0.902800858, alpha: 1), for: .normal)
        b.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        b.backgroundColor = .clear
        return b
    }()
    
    //MARK: - Cycle life
    override func viewDidLoad() {
        super.viewDidLoad()
        //View config
        view.backgroundColor = .black
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        
        //Router
        router = Routers(viewController: self)
        
        //Setup
        setupSigninButton()
        setupEmailView()
        setupImageView()
        setupPasswordView()
        setupConfirmPasswordView()
        setupLoginLabel()
        setupLoginButton()
        
        //Notification
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    //FIXME: - keyboard ( сделать правильное отображение клавитуры, чтобы не закрывало другие элементы на экранк) + same in LoginViewController
    
    //MARK: - Functions
    @objc func didTapSigninButton() {
        guard let email = emailView.textField.text,
            let password = passwordView.textField.text,
            let confirmPassword = confirmPasswordView.textField.text,
            email != "", password != "", confirmPassword != "" else { print("Error in enter" ); return }
        
        if password == confirmPassword {
            Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
                
                if error != nil {
                    print("Error")
                }
                
                if user != nil {
                    self.router.openMainViewController()
                    return
                }
                
                print("No such user")
            }
        } else {
            alertControllerError()
            //TODO: animatiom
        }
    }
    
    @objc func didTapLoginButton() {
        router.openLoginViewController()
    }
    
    fileprivate func alertControllerError() {
        let alert = UIAlertController(title: "Ошибка", message: "Произошла ошибка. Попробуйте еше раз", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    @objc func adjustForKeyboard(notification: Notification) {
        guard let keyboardValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        
        let keyboardScreenEndFrame = keyboardValue.cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)
        
        if notification.name == UIResponder.keyboardWillHideNotification {
            scrollView.contentInset = .zero
        } else {
            scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewEndFrame.height, right: 0)
        }
        scrollView.scrollIndicatorInsets = scrollView.contentInset
    }
    
    //MARK: - Setuo
    fileprivate func setupImageView() {
        containerView.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.width.equalTo(containerView.frame.width - 60)
            make.height.equalTo(40)
            make.centerX.equalTo(containerView.snp.centerX)
            make.bottom.equalTo(emailView.snp.top).offset(-50)
        }
    }
    
    fileprivate func setupEmailView() {
        containerView.addSubview(emailView)
        emailView.snp.makeConstraints { (make) in
            make.width.equalTo(containerView.frame.width - 60)
            make.height.equalTo(containerView.frame.width / 6)
            make.centerX.equalTo(containerView.snp.centerX)
            make.centerY.equalTo(containerView.snp.centerY).offset(-100)
        }
    }
    
    fileprivate func setupPasswordView() {
        containerView.addSubview(passwordView)
        passwordView.snp.makeConstraints { (make) in
            make.width.equalTo(containerView.frame.width - 60)
            make.height.equalTo(containerView.frame.width / 6)
            make.top.equalTo(emailView.snp.bottom).offset(30)
            make.centerX.equalTo(containerView.snp.centerX)
        }
    }
    
    fileprivate func setupConfirmPasswordView() {
        containerView.addSubview(confirmPasswordView)
        confirmPasswordView.snp.makeConstraints { (make) in
            make.width.equalTo(containerView.frame.width - 60)
            make.height.equalTo(containerView.frame.width / 6)
            make.top.equalTo(passwordView.snp.bottom).offset(30)
            make.centerX.equalTo(containerView.snp.centerX)
        }
    }
    
    fileprivate func setupLoginLabel() {
        containerView.addSubview(loginLabel)
        loginLabel.snp.makeConstraints { (make) in
            make.width.equalTo(containerView.frame.width - 60)
            make.height.equalTo(containerView.frame.width / 10)
            make.top.equalTo(confirmPasswordView.snp.bottom).offset(10)
            make.centerX.equalTo(containerView.snp.centerX)
        }
    }
    
    fileprivate func setupLoginButton() {
        containerView.addSubview(loginButton)
        loginButton.snp.makeConstraints { (make) in
            make.width.equalTo(containerView.frame.width - 60)
            make.height.equalTo(containerView.frame.width / 10)
            make.top.equalTo(loginLabel.snp.bottom)
            make.centerX.equalTo(containerView.snp.centerX)
        }
    }
    
    fileprivate func setupSigninButton() {
        containerView.addSubview(signinButton)
        signinButton.snp.makeConstraints { (make) in
            make.width.equalTo(containerView.frame.width - 60)
            make.height.equalTo(containerView.frame.width / 5)
            make.centerX.equalTo(containerView.snp.centerX)
            make.bottom.equalTo(containerView.frame.width / -9)
        }
    }
}

//MARK: - UITextFieldDelegate
extension SigninViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

//MARK: - Canvas
import SwiftUI

struct SigninPreviews: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<SigninPreviews.ContainerView>) -> UIViewController {
            return SigninViewController()
        }
        
        func updateUIViewController(_ uiViewController: SigninPreviews.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<SigninPreviews.ContainerView>) {
            
        }
    }
}

