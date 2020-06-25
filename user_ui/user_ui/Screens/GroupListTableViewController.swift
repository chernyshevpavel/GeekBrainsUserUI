//
//  GroupListTableViewController.swift
//  user_ui
//
//  Created by Павел Чернышев on 03.01.2020.
//  Copyright © 2020 Павел Чернышев. All rights reserved.
//

import UIKit
import AlamofireImage
import RealmSwift

class GroupListTableViewController: UITableViewController {

    var groupList: Results<Group>?
    var token: NotificationToken?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pairTableAndRealm()
        let vkGroupService = VKGroupsService()
        vkGroupService.get(parameters: [
            "extended": "1",
            "user_id": Session.shared.userId
        ])
    }
    

    func pairTableAndRealm() {
            guard let realm = try? Realm() else { return }
            groupList = realm.objects(Group.self)
            token = groupList?.observe { [weak self] (changes: RealmCollectionChange) in
                guard let tableView = self?.tableView else { return }
                switch changes {
                case .initial:
                    tableView.reloadData()
                case .update(_, let deletions, let insertions, let modifications):
                    tableView.beginUpdates()
                    tableView.insertRows(at: insertions.map({ IndexPath(row: $0, section: 0) }),
                                         with: .automatic)
                    tableView.deleteRows(at: deletions.map({ IndexPath(row: $0, section: 0)}),
                                         with: .automatic)
                    tableView.reloadRows(at: modifications.map({ IndexPath(row: $0, section: 0) }),
                                         with: .automatic)
                    tableView.endUpdates()
                case .error(let error):
                    fatalError("\(error)")
                }
            }
        }


    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groupList?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let groupCell = tableView.dequeueReusableCell(withIdentifier: "GroupTableViewCell") as! GroupTableViewCell
        let currentGroup = self.groupList![indexPath.row]
        groupCell.name.text = currentGroup.name
        guard let url = URL(string: currentGroup.photoPath) else {
            return groupCell
        }
        groupCell.avatarPhoto.image.af.setImage(withURL: url)
        return groupCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let removingGroup = groupList![indexPath.row]
            do {
                let realm = try Realm()
                realm.beginWrite()
                realm.delete(removingGroup)
                try realm.commitWrite()
            } catch {
                print(error)
            }
        }
    }
    
    @IBAction func addGroup(segue: UIStoryboardSegue) {
        if segue.identifier == "addGroup" {
            guard let serchGroupTableVC = segue.source as? SearchGroupListTableViewController
                else {return}
            if let indexPath = serchGroupTableVC.tableView.indexPathForSelectedRow {
                let group = serchGroupTableVC.groupList[indexPath.row]
                do {
                    var realm = try Realm()
                    realm.beginWrite()
                    realm.add(group, update: .modified)
                    try realm.commitWrite()
                } catch {
                    print(error)
                }
            }
        }
    }
}
