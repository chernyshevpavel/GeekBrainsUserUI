//
//  NewsTableViewController.swift
//  user_ui
//
//  Created by Павел Чернышев on 06.01.2020.
//  Copyright © 2020 Павел Чернышев. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController {
    
    var newsList: [News] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        newsList = getNews()
        tableView.register(UINib(nibName: "NewsTableViewCell3", bundle: nil), forCellReuseIdentifier: "NewsTableViewCell3")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return newsList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell3") as! NewsTableViewCell3
        let currentNews = newsList[indexPath.row]
        cell.title.text = currentNews.title
        cell.date.text = currentNews.date
        cell.avatarView.image.image = UIImage(named: currentNews.previewImg)
        cell.detailText.text = currentNews.detailText
        cell.detailImg.image = UIImage(named: currentNews.detailImg)
        cell.likeButton.likeCount = currentNews.likesCount
        cell.commentButton.setTitle(String(currentNews.commentsCount), for: .normal)
        return cell
    }
    

    @IBAction func tapBtn(_ sender: IdentifireButton) {
        print(sender.identifier)
    }


    func getNews() -> [News] {
        return [
            News(title: "First News", date: "17:45", previewImg: "2", detailImg: "2", detailText: "small text about nothing", likesCount: 2, commentsCount: 5),
            News(title: "Second News", date: "10:33", previewImg: "1", detailImg: "1", detailText: "many text many text many text many text many text many text many text many text many text many text many text many text many text many text many text many text many text many text many text many text many text many text many text many text many text many text many text many text many text ", likesCount: 2, commentsCount: 5),
            News(title: "Thers News", date: "8:34", previewImg: "3", detailImg: "4", detailText: "small text about nothing", likesCount: 2, commentsCount: 5),
            
        ]
    }
    
    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
