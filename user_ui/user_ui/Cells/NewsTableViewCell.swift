//
//  NewsTableViewCell.swift
//  user_ui
//
//  Created by Павел Чернышев on 06.01.2020.
//  Copyright © 2020 Павел Чернышев. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var previewImg: AvatarView!
    @IBOutlet weak var detailText: UILabel!
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var viewsBtn: UIButton!
    
    @IBAction func LikeBtnClick(_ sender: LikeButton) {
    }
    
    @IBAction func CommentBtnClick(_ sender: Any) {
    }
    @IBAction func ForwardBtnClick(_ sender: Any) {
    }
}
