//
//  ContactsInteractor.swift
//  Restaurant
//
//  Copyright © 2019 <ASi. All rights reserved.
//

import Foundation

protocol ContactsInteractorProtocol: class {
    func provideContacts()
}

protocol ContactsInteractorOutputProtocol: class {
    func recieveContacts(contactsData: ContactsData)
}

class ContactsInteractor {
    
    weak var presenter: ContactsInteractorOutputProtocol!
    
    required init(presenter: ContactsInteractorOutputProtocol) {
        self.presenter = presenter
    }
}

//MARK: - ContactsInteractorProtocol
extension ContactsInteractor: ContactsInteractorProtocol {
    func provideContacts() {
        DataFetherService.shared.fetchContacts { (contactsData) in
            guard let name = contactsData?.name,
                let description = contactsData?.description,
                let location = contactsData?.location else {
                    return
            }
            let contactsData = ContactsData(name: name, description: description, location: location)
            self.presenter.recieveContacts(contactsData: contactsData)
        }
    }  
}
