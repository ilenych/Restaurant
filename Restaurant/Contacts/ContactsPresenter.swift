//
//  ContactsPresenter.swift
//  Restaurant
//
//  Copyright © 2019 <ASi. All rights reserved.
//

import Foundation

struct ContactsData: Decodable {
    let name: String?
    let description: String?
    let location: String?
}

protocol ContactsPresenterProtocol: class {
    func showContacts()
    func showInstagram()
    func showVK()
    func phoneCall()
}

class ContactsPresenter {
    
    weak var view: ContactsViewControllerProtocol!
    var interactor: ContactsInteractorProtocol!
    var router: ContactsRouterProtocol!
    
    required init(view: ContactsViewControllerProtocol) {
        self.view = view
    }
}

//MARK: - ContactsPresenterProtocol
extension ContactsPresenter: ContactsPresenterProtocol {
    
    func showContacts() {
        interactor.provideContacts()
    }
    
    func showInstagram() {
        router.openInstagram()
    }
    
    func showVK() {
        router.openVK()
    }
    
    func phoneCall() {
        router.callNumber()
    }
}

//MARK: - ContactsInteractorOutputProtocol
extension ContactsPresenter: ContactsInteractorOutputProtocol {
    func recieveContacts(contactsData: ContactsData) {
        guard let description = contactsData.description,
        let name = contactsData.name,
        let location = contactsData.location else { return }
        view.setDescription(with: description)
        view.setupPlacemark(name: name, location: location)
        view.setupAddress(with: location)
    }
    
    
}
