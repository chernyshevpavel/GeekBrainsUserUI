//
//  Group.swift
//  user_ui
//
//  Created by Павел Чернышев on 03.01.2020.
//  Copyright © 2020 Павел Чернышев. All rights reserved.
//

import Foundation
import RealmSwift

class Group: Object, Decodable {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var photoPath: String = ""
    
    required init(name: String) {
        self.name = name
    }
    
    required init() {
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case photoPath = "photo_50"
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
