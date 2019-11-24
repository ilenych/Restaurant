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
        let contactsData = ContactsData(descriptionText: "Тут будет описание текста или текст из парсинга")
        presenter.recieveContacts(contactsData: contactsData)
    }
    
    
}
