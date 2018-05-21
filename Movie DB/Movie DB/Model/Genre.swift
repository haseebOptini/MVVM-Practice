//
//  Genre.swift
//  Movie DB
//
//  Created by Abdul Haseeb on 1/11/18.
//  Copyright © 2018 Abdul Haseeb. All rights reserved.
//

import Foundation

struct Genre {
    struct Keys {
        static let id = "id"
        static let name = "name"
    }
    let id: Int
    let name: String
    
    init(dictionary: [String : AnyObject]) {
        id = (dictionary[Keys.id] as? Int) ?? 0
        name = (dictionary[Keys.name] as? String) ?? ""
    }
}
