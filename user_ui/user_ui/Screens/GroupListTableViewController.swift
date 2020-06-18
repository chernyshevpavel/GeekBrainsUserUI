//
//  GroupListTableViewController.swift
//  user_ui
//
//  Created by Павел Чернышев on 03.01.2020.
//  Copyright © 2020 Павел Чернышев. All rights reserved.
//

import UIKit
import AlamofireImage

class GroupListTableViewController: UITableViewController {

    var groupList:[Group] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if GroupsDB.shared.userGroups.count == 0 {
            let vkGroupService = VKGroupsService()
            vkGroupService.get(parameters: [
                "extended": "1",
                "user_id": Session.shared.userId
            ]) { [weak self] groups in
                print(groups)
                self?.groupList = groups
                GroupsDB.shared.userGroups = groups
                self?.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groupList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let groupCell = tableView.dequeueReusableCell(withIdentifier: "GroupTableViewCell") as! GroupTableViewCell
        let currentGroup = self.groupList[indexPath.row]
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
            let removingGroup = groupList[indexPath.row]
            groupList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            GroupsDB.shared.userGroups.remove(at: indexPath.row)
            GroupsDB.shared.searchGroups.append(removingGroup)
        }
    }
    
    @IBAction func addGroup(segue: UIStoryboardSegue) {
        if segue.identifier == "addGroup" {
            guard let serchGroupTableVC = segue.source as? SearchGroupListTableViewController
                else {return}
            if let indexPath = serchGroupTableVC.tableView.indexPathForSelectedRow {
                let group = serchGroupTableVC.groupList[indexPath.row]
                GroupsDB.shared.searchGroups.remove(at: indexPath.row)
                if !groupList.contains(group) {
                    self.groupList.append(group)
                  //  serchGroupTableVC.groupList.remove(at: indexPath.row)
                    tableView.reloadData()
                }
            }
        }
    }
}
