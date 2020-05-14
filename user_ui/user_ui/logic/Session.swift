//
//  session.swift
//  user_ui
//
//  Created by Павел Чернышев on 12.01.2020.
//  Copyright © 2020 Павел Чернышев. All rights reserved.
//

import Foundation

class Session {
    static let shared = Session();
    var token: String = "";
    var userId: String = ""
    private init() {
    }
}
