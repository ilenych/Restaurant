//
//  DataFetherService.swift
//  Restaurant
//
//  Created by  SENAT on 30.11.2019.
//  Copyright © 2019 <ASi. All rights reserved.
//

import Foundation

class DataFetherService {
    
    static let shared = DataFetherService()
    
    var localService: DataFetherProtocol
    
    init(localService: DataFetherProtocol = LocalService()) {
        self.localService = localService
    }
    
    func fetchMenuPage(complition: @escaping (MenuModel?) -> ()) {
        let urlString = "resource.json"
        localService.fethData(urlString: urlString, response: complition)
    }
    
    func fetchContacts(complition: @escaping (ContactsData?) -> ()) {
        let urlString = "contacts.json"
        localService.fethData(urlString: urlString, response: complition)
    }
}
