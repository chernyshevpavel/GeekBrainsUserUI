//
//  File.swift
//  user_ui
//
//  Created by Павел Чернышев on 03.01.2020.
//  Copyright © 2020 Павел Чернышев. All rights reserved.
//

import Foundation

struct User: Decodable {
    var id: Int = 0
    var name: String = ""
    var lastName: String = ""
    var photoPath: String = ""
    
    init(name: String) {
        self.name = name
    }
    
    init(name: String, img: String) {
        self.name = name
        self.photoPath = img
    }
    
    init() {
        
    }
    
    enum CodingKeys: String, CodingKey {
        case name = "first_name"
        case lastName = "last_name"
        case photoPath = "photo_50"
    }
}
