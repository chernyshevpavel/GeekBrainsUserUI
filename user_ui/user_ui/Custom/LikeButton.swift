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
        UIView.animate(withDuration: 0.2, delay: 0, options: [], animations: {
            self.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }, completion: { _ in
            UIView.animate(withDuration: 0.2, delay: 0, options: [], animations: {
                self.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            }, completion: { _ in
            })
        })
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
        setImage(liked ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart"), for: .normal)
        setTitle(String(likeCount), for: .normal)
        self.setTitleColor(getStateColor(), for: .init())
        tintColor = getStateColor()
        //imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        imageView?.contentMode = .scaleAspectFit
    }

    func getStateColor() -> UIColor {
        return liked ? .red : .gray
    }
    
    func setLinked() {
        likeCount += 1
        setImage(UIImage(systemName: "heart.fill"), for: .normal)
        setTitle(String(likeCount), for: .normal)
        tintColor = getStateColor()
    }
    
    func disableLike() {
        likeCount -= 1
        setImage(UIImage(systemName: "heart"), for: .normal)
        setTitle(String(likeCount), for: .normal)
        tintColor = getStateColor()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        
    }
}
