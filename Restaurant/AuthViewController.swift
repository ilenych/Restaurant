//
//  AuthViewController.swift
//  Restaurant
//
//  Copyright © 2019 <ASi. All rights reserved.
//

import Foundation
import UIKit

class AuthViewController: UIViewController {
    
    fileprivate let login: UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 200, width: 100, height: 50))
        button.setTitle("LOG IN", for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir Next-Bold", size: 16)
        button.setTitleColor(.black, for: .normal)
        //        button.addTarget(self, action: Selector.didTapLoginButton, for: .touchUpInside)
        return button
    }()
    
    fileprivate let signup: UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 300, width: 100, height: 50))
        button.setTitle("SIGN UP", for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir Next-Bold", size: 16)
        button.setTitleColor(.black, for: .normal)
        //           button.addTarget(self, action: Selector.didTapSignupButton, for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        view.addSubview(login)
        view.addSubview(signup)
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
