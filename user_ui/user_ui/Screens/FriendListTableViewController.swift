//
//  FriendListTableViewController.swift
//  user_ui
//
//  Created by Павел Чернышев on 03.01.2020.
//  Copyright © 2020 Павел Чернышев. All rights reserved.
//

import UIKit
import AlamofireImage
import RealmSwift

struct Section<T> {
    var title: String
    var items: [T]
}

class FriendListTableViewController: UITableViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    var userList: [User] = []
    var sectionsFriends: [Section<User>] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        let friendsService = VKFriendsService()
        self.loadData()
        friendsService.get(parameters: [
            "order": "name",
            "fields":"id,first_name,photo_50"
        ]) { [weak self] in
            self?.loadData()
        }
    }
    
    func loadData() {
        do {
            let realm = try Realm()
            
            let friends = realm.objects(User.self)
            self.userList = Array(friends)
            self.sectionsFriends = Dictionary.init(grouping: self.userList ?? [], by:{$0.name.first})
                .sorted(by: {String($0.key!) < String($1.key!)})
                .map {Section(title: String($0.key!), items: $0.value)}
            self.tableView.reloadData()
        } catch {
            print(error)
        }
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sectionsFriends.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sectionsFriends[section].items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let friendCell = tableView.dequeueReusableCell(withIdentifier: "FriendTableViewCell") as! FriendTableViewCell
        let friend: User = sectionsFriends[indexPath.section].items[indexPath.row]
        let url = URL(string: friend.photoPath)!
        friendCell.photo.image.af.setImage(withURL: url)
        friendCell.name.text = "\(friend.name) \(friend.lastName)"
        
        return friendCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let friendCollectionViewCtrl = storyBoard.instantiateViewController(identifier: "FriendCollectionViewController") as! FriendCollectionViewController
        friendCollectionViewCtrl.friend = sectionsFriends[indexPath.section].items[indexPath.row]
        self.navigationController?.pushViewController(friendCollectionViewCtrl, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionsFriends[section].title
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

extension FriendListTableViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        sectionsFriends = Dictionary.init(grouping: userList.filter {(user) -> Bool in
            return searchText.isEmpty ? true : user.name.lowercased().contains(searchText.lowercased())
        }, by: {$0.name.first})
        .sorted(by: {String($0.key!) < String($1.key!)})
        .map {Section(title: String($0.key!), items: $0.value)}
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
}
