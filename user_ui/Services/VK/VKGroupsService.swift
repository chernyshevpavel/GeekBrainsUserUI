//
//  VKGroupsService.swift
//  user_ui
//
//  Created by Павел Чернышев on 24.05.2020.
//  Copyright © 2020 Павел Чернышев. All rights reserved.
//

import Foundation
import Alamofire
import RealmSwift

class VKGroupsService {
    struct VKGroupsResponse: Decodable  {
        var response: GroupsResponse
    }

    struct GroupsResponse: Decodable {
        let items: [Group]
    }
    
    func get(parameters: Dictionary<String, String>, complition: @escaping () -> Void) {
        let imolodedParams = Session.shared.implodeWithDefaultVKParams(params: parameters)
        AF.request("https://api.vk.com/method/groups.get", parameters: imolodedParams).responseJSON { response in
            guard let data = response.data else {return}
            do {
                let vkGroupsResp = try JSONDecoder().decode(VKGroupsResponse.self, from: data)
                print(vkGroupsResp.response.items)
                self.saveGroups(groups: vkGroupsResp.response.items)
                complition()
            } catch {
                print(error)
            }
        }
    }
    func saveGroups(groups: [Group]) -> Void {
        do {
            let realm = try Realm()
            let oldGroups = realm.objects(Group.self)
            realm.beginWrite()
            realm.delete(oldGroups)
            realm.add(groups)
            try realm.commitWrite()
            print(realm.objects(Group.self))
        } catch {
            print(error)
        }
    }
}
