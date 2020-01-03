//
//  FriendListTableViewController.swift
//  user_ui
//
//  Created by Павел Чернышев on 03.01.2020.
//  Copyright © 2020 Павел Чернышев. All rights reserved.
//

import UIKit

class FriendListTableViewController: UITableViewController {
    
    var userList: [User] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        userList = getFriendList()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return userList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let friendCell = tableView.dequeueReusableCell(withIdentifier: "FriendTableViewCell") as! FriendTableViewCell
        let friendName: String =  self.userList[indexPath.row].name
        friendCell.name.text = friendName
        //friendCell.photo.
        return friendCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let friendCollectionViewCtrl = storyBoard.instantiateViewController(identifier: "FriendCollectionViewController") as! FriendCollectionViewController
        friendCollectionViewCtrl.setFriendName(name: String(userList[indexPath.row].name))
        self.navigationController?.pushViewController(friendCollectionViewCtrl, animated: true)
    }
    
    func getFriendList() -> [User] {
        var userList:[User] = []
        userList.append(User(name: "Pavel"))
        userList.append(User(name: "Lola"))
        userList.append(User(name: "Stas"))
        userList.append(User(name: "Vasiliy"))
        userList.append(User(name: "Andrey"))
        userList.append(User(name: "Kitil"))
        userList.append(User(name: "Sergey"))
        userList.append(User(name: "Ivan"))
        return userList
    }

}
