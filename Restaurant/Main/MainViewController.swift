//
//  MainViewController.swift
//  Restaurant
//
//  Copyright © 2019 <ASi. All rights reserved.
//

import UIKit
import Firebase

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray
        
    }
    
    @IBAction func signoutButtonAction(_ sender: UIButton) {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error.localizedDescription)
        }
        dismiss(animated: true, completion: nil)
    }
}
