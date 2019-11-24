//
//  ContactsConfigurator.swift
//  Restaurant
//
//  Copyright © 2019 <ASi. All rights reserved.
//

import Foundation

protocol ContactsConfiguratorProtocol: class {
    func configure(with viewController: ContactsViewController)
}

class ContactsConfigurator: ContactsConfiguratorProtocol {
    func configure(with viewController: ContactsViewController) {
        let presenter = ContactsPresenter(view: viewController)
        let interactor = ContactsInteractor(presenter: presenter)
        let router = ContactsRouter(view: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
    
 
}
