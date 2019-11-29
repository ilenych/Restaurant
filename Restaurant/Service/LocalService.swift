//
//  LocalService.swift
//  Restaurant
//
//  Copyright © 2019 <ASi. All rights reserved.
//

import Foundation

class LocalService {
    
    static func fethData(closure: @escaping ([Menu]) -> ()) {
        guard  let url = Bundle.main.url(forResource: "resource", withExtension: "json") else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let menu = try JSONDecoder().decode(MenuModel.self, from: data)
            closure(menu.menu)
        } catch {
            print(error.localizedDescription)
        }
    }
}
