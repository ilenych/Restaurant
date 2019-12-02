//
//  MenuModel.swift
//  Restaurant
//
//  Copyright © 2019 <ASi. All rights reserved.
//

import Foundation

struct MenuModel: Decodable {
    var menu: [Menu]
}

struct Menu: Decodable {
    let page: String
}
