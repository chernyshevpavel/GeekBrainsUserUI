//
//  FriendsDB.swift
//  user_ui
//
//  Created by Павел Чернышев on 12.01.2020.
//  Copyright © 2020 Павел Чернышев. All rights reserved.
//

import Foundation

class GroupsDB {
    var userGroups: [Group] = []
    var searchGroups: [Group] = []
    
    public static let shared = GroupsDB()
    private init() {
        userGroups.append(Group(name: "Building"))
        userGroups.append(Group(name: "Travels"))
        userGroups.append(Group(name: "Family"))
        userGroups.append(Group(name: "Cups"))
        userGroups.append(Group(name: "Laptops"))
        
        searchGroups.append(Group(name: "Auto"))
        searchGroups.append(Group(name: "Tracks"))
        searchGroups.append(Group(name: "bitrix"))
        searchGroups.append(Group(name: "IOS Development"))
        searchGroups.append(Group(name: "Java"))
        searchGroups.append(Group(name: "Spring"))
        searchGroups.append(Group(name: "HTML 5"))
        searchGroups.append(Group(name: "Angular"))
    }
}
