//
//  GroupListTableViewController.swift
//  user_ui
//
//  Created by Павел Чернышев on 03.01.2020.
//  Copyright © 2020 Павел Чернышев. All rights reserved.
//

import UIKit

class GroupListTableViewController: UITableViewController {

    var groupList:[Group] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.groupList = getGroupList()
    }

    // MARK: - Table view data source

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groupList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let groupSell = tableView.dequeueReusableCell(withIdentifier: "GroupTableViewCell") as! GroupTableViewCell
        let groupName: String =  self.groupList[indexPath.row].name
        groupSell.name.text = groupName
        return groupSell
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
    
    func getGroupList() -> [Group] {
        return GroupsDB.shared.userGroups
    }

}
