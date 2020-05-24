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
    
    func getDafaultVKParams() -> Dictionary<String, String>{
        return [
            "access_token": self.token,
            "v":"5.68"
        ]
    }
    
    func implodeWithDefaultVKParams(params: Dictionary<String, String>) -> Dictionary<String, String> {
        return params.merging(self.getDafaultVKParams()) { $1 }
    }
    
    private init() {
    }
}
