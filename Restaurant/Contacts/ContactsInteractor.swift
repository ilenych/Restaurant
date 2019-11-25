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
        // json manager in future here
        let description = """
Ресторан авторской кухни Любовь...

"Любовь" - это богатое меню с блюдами из разных уголков мира, живая музыка по вечерам, ароматные паровые коктейли, сервис высокого уровня и уютная атмосфера.

Расположился ресторан в самом сердце нашего прекрасного города Уфа.

Из окон открывается вид на сквер Маяковского.
"""
        let contactsData = ContactsData(name: "Любовь...",
                                        descriptionText: description,
                                        location: "г.Уфа, Цюрупы 27")
        presenter.recieveContacts(contactsData: contactsData)
    }
    
    
}
