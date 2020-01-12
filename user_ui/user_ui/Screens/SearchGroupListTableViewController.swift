//
//  SearchGroupListTableViewController.swift
//  user_ui
//
//  Created by Павел Чернышев on 03.01.2020.
//  Copyright © 2020 Павел Чернышев. All rights reserved.
//

import UIKit

class SearchGroupListTableViewController: UITableViewController {

    var groupList:[Group] = []
    
    override func loadView() {
        super.loadView()
    }
    
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
        //tableView.deleteRows(at: [indexPath], with: .automatic)
    }

    func getGroupList() -> [Group] {
        return GroupsDB.shared.searchGroups
    }

}
