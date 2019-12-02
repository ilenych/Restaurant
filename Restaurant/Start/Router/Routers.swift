//
//  AuthRouters.swift
//  Restaurant
//
//  Copyright © 2019 <ASi. All rights reserved.
//

import Foundation
import UIKit

protocol RouterProtocol {
    func openLoginViewController()
    func openSigninViewController()
    func openMainViewController()
}

class Routers {
    
    weak var viewController: UIViewController!
    required init(viewController: UIViewController) {
        self.viewController = viewController
    }
}

extension Routers: RouterProtocol {
    func openLoginViewController() {
        let loginViewController: LoginViewController = LoginViewController()
        loginViewController.modalTransitionStyle = .crossDissolve
        loginViewController.modalPresentationStyle = .overCurrentContext
        
        viewController.present(loginViewController, animated: true, completion: nil)
    }
    
    func openSigninViewController() {
        let signinViewController: SigninViewController = SigninViewController()
        signinViewController.modalTransitionStyle = .crossDissolve
        signinViewController.modalPresentationStyle = .overCurrentContext
        
        viewController.present(signinViewController, animated: true, completion: nil)
    }
    
    func openMainViewController() {
        let storyBoard = UIStoryboard(name: "MainViewController", bundle: nil)
        let MainVC = storyBoard.instantiateViewController(withIdentifier: String(describing: MainTabBarController.self)) as! MainTabBarController
        MainVC.modalTransitionStyle = .crossDissolve
        MainVC.modalPresentationStyle = .overCurrentContext
        
        viewController.present(MainVC, animated: true, completion: nil)
    }
}
