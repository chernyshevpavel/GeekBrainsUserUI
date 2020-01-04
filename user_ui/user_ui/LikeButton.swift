//
//  LikeView.swift
//  user_ui
//
//  Created by Павел Чернышев on 04.01.2020.
//  Copyright © 2020 Павел Чернышев. All rights reserved.
//

import UIKit

class LikeButton: UIButton {
    
    @IBInspectable var liked: Bool = false  {
           didSet {
               setUpDefault()
           }
    }
    
    @IBInspectable var likeCount: Int = 0 {
        didSet {
            setUpDefault()
        }
    }
    
    func like()  {
        liked = !liked
        if liked {
            setLinked()
        } else {
            disableLike()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpDefault()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpDefault()
    }
    
    private func setUpDefault() {
        setImage(UIImage(named: "like"), for: .normal)
        setTitle(String(likeCount), for: .normal)
        tintColor = liked ? .red : .gray
        
        imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
        imageView?.contentMode = .scaleAspectFit
    }

    
    
    func setLinked() {
        likeCount += 1
        setImage(UIImage(named: "like"), for: .normal)
        setTitle(String(likeCount), for: .normal)
    }
    
    func disableLike() {
        likeCount -= 1
        setImage(UIImage(named: "dislike"), for: .normal)
        setTitle(String(likeCount), for: .normal)
        tintColor = .gray
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        
    }
}
