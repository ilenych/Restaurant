//
//  LocalService.swift
//  Restaurant
//
//  Copyright © 2019 <ASi. All rights reserved.
//

import Foundation

protocol DataFetherProtocol {
    func fethData<T: Decodable>(urlString: String, response: @escaping (T?) -> ())
}

class LocalService: DataFetherProtocol {
    
    func fethData<T: Decodable>(urlString: String, response: @escaping (T?) -> ()) {
        guard  let url = Bundle.main.url(forResource: urlString, withExtension: nil) else {
            print("Couldn't find file \(urlString) in main bundle.")
            return
        }
        let data = try? Data(contentsOf: url)
        let decoded = decodeJSON(type: T.self, data: data)
        response(decoded)
        
    }
    
    func decodeJSON<T: Decodable>(type: T.Type, data: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = data else { return nil }
        do {
            let objects = try decoder.decode(type.self, from: data)
            return objects
        } catch let jsonError {
            print("Failed to decode JSON", jsonError)
            return nil
        }
    }
}
