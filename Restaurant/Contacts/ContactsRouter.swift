//
//  ContactsRouter.swift
//  Restaurant
//
//  Copyright © 2019 <ASi. All rights reserved.
//

import Foundation
import UIKit

protocol ContactsRouterProtocol: class {
    func openInstagram()
    func openVK()
    func callNumber()
}

class ContactsRouter {
    weak var view: ContactsViewController!
    
    required init(view: ContactsViewController) {
        self.view = view
    }
}

extension ContactsRouter: ContactsRouterProtocol {
    func openInstagram() {
        let urlString = URL(string: "https://www.instagram.com/lubov.ufa")
        guard let url = urlString else { return }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    func openVK() {
        let urlString = URL(string: "https://vk.com/restloveufa")
        guard let url = urlString else { return }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    func callNumber() {
        let phoneURL = URL(string: "tel://+7(347)200-91-27")
        guard let url = phoneURL else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
