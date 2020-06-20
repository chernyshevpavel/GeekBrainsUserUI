//
//  VKFriendsService.swift
//  user_ui
//
//  Created by Павел Чернышев on 23.05.2020.
//  Copyright © 2020 Павел Чернышев. All rights reserved.
//

import Foundation
import Alamofire
import RealmSwift

class VKFriendsService {
    struct VKFriendsResponse: Decodable  {
        var response: FriendsResponse
    }

    struct FriendsResponse: Decodable {
        let items: [User]
    }

    func get(parameters: Dictionary<String, String>, complition: @escaping () -> Void) {
        AF.request("https://api.vk.com/method/friends.get", parameters: Session.shared.implodeWithDefaultVKParams(params: parameters)).responseJSON { response in
            guard let data = response.data else {return}
            do {
                let friendsResp = try JSONDecoder().decode(VKFriendsResponse.self, from: data)
                print(friendsResp.response.items)
                self.saveFriends(friends: friendsResp.response.items)
                complition()
            } catch {
                print(error)
            }
        }
    }
    
    func saveFriends(friends: [User]) -> Void {
        do {
            let realm = try Realm()
            let oldFriends = realm.objects(User.self)
            realm.beginWrite()
            realm.delete(oldFriends)
            realm.add(friends)
            try realm.commitWrite()
            print(realm.objects(User.self))
        } catch {
            print(error)
        }
    }
}
