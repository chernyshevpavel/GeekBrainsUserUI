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
        let friend: User = self.userList[indexPath.row]
        friendCell.name.text = friend.name
        friendCell.photo.image.image = UIImage(named: friend.photoPath)
        return friendCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let friendCollectionViewCtrl = storyBoard.instantiateViewController(identifier: "FriendCollectionViewController") as! FriendCollectionViewController
        friendCollectionViewCtrl.friend = userList[indexPath.row]
        self.navigationController?.pushViewController(friendCollectionViewCtrl, animated: true)
    }
    
    func getFriendList() -> [User] {
        var userList:[User] = []
        userList.append(User(name: "Pavel", img: "1"))
        userList.append(User(name: "Lola", img: "2"))
        userList.append(User(name: "Stas", img: "3"))
        userList.append(User(name: "Vasiliy", img: "4"))
        userList.append(User(name: "Andrey", img: "5"))
        userList.append(User(name: "Kitil", img: "6"))
        userList.append(User(name: "Sergey", img: "7"))
        return userList
    }

}
