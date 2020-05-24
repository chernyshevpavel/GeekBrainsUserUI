//
//  Group.swift
//  user_ui
//
//  Created by Павел Чернышев on 03.01.2020.
//  Copyright © 2020 Павел Чернышев. All rights reserved.
//

import Foundation

class Group: Equatable, Decodable {
    static func == (lhs: Group, rhs: Group) -> Bool {
        return lhs.name == rhs.name
    }
    
    var id: Int = 0
    var name: String = ""
    var photoPath: String = ""
    
    init(name: String) {
        self.name = name
    }
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case photoPath = "photo_50"
    }
}
