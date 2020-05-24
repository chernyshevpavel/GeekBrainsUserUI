//
//  VKResponse.swift
//  user_ui
//
//  Created by Павел Чернышев on 21.05.2020.
//  Copyright © 2020 Павел Чернышев. All rights reserved.
//

import Foundation

struct VKResponse<T>: Codable  {
    var response: T
}
