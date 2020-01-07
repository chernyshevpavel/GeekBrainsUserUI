//
//  NewsTableViewCell3.swift
//  user_ui
//
//  Created by Павел Чернышев on 06.01.2020.
//  Copyright © 2020 Павел Чернышев. All rights reserved.
//

import UIKit

class NewsTableViewCell3: UITableViewCell {

    @IBOutlet weak var avatarView: AvatarView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var detailText: UILabel!
    @IBOutlet weak var detailImg: UIImageView!
    @IBOutlet weak var likeButton: LikeButton!
    @IBOutlet weak var commentButton: UIButton!
    
    @IBAction func likeButtonTouchUp(_ sender: LikeButton) {
        sender.like()
    }
}
