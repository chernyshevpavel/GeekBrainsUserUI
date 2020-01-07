//
//  FriendCollectionViewController.swift
//  user_ui
//
//  Created by Павел Чернышев on 03.01.2020.
//  Copyright © 2020 Павел Чернышев. All rights reserved.
//

import UIKit

private let reuseIdentifier = "FriendCollectionViewCell"

class FriendCollectionViewController: UICollectionViewController {

    var friend: User = User()    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 1
    }

    @IBAction func likeClick(_ sender: Any) {
        (sender as! LikeButton).like()
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FriendCollectionViewCell
        cell.name.text = friend.name
        cell.photo.image = UIImage(named: friend.photoPath)
        // Configure the cell
    
        return cell
    }

}
