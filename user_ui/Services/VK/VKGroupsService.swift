//
//  VKGroupsService.swift
//  user_ui
//
//  Created by Павел Чернышев on 24.05.2020.
//  Copyright © 2020 Павел Чернышев. All rights reserved.
//

import Foundation
import Alamofire

class VKGroupsService {
    struct VKGroupsResponse: Decodable  {
        var response: GroupsResponse
    }

    struct GroupsResponse: Decodable {
        let items: [Group]
    }
    
    func get(parameters: Dictionary<String, String>, complition: @escaping ([Group]) -> Void) {
        let imolodedParams = Session.shared.implodeWithDefaultVKParams(params: parameters)
        AF.request("https://api.vk.com/method/groups.get", parameters: imolodedParams).responseJSON { response in
            guard let data = response.data else {return}
            do {
                let vkGroupsResp = try JSONDecoder().decode(VKGroupsResponse.self, from: data)
                complition(vkGroupsResp.response.items)
            } catch {
                print(error)
            }
        }
    }
}
