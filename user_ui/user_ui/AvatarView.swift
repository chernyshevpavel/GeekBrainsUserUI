//
//  AvatarView.swift
//  user_ui
//
//  Created by Павел Чернышев on 04.01.2020.
//  Copyright © 2020 Павел Чернышев. All rights reserved.
//

import UIKit

class AvatarView: UIView {
    
    var image: UIImageView!
    
    @IBInspectable var shadowCollor: UIColor = UIColor.black {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var shadowOpacity: CGFloat = 0.5 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 4.0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addImage()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addImage()
    }
    
    func addImage() {
        image = UIImageView(frame: frame)
        addSubview(image)
    }
    
    override func layoutSubviews() {
        image.frame = bounds
        layer.shadowColor = shadowCollor.cgColor
        layer.shadowOpacity = Float(shadowOpacity)
        layer.shadowRadius = shadowRadius
        layer.shadowOffset = CGSize(width: 0, height: 1)
        image.layer.cornerRadius = bounds.size.height / 2
        image.layer.masksToBounds = true
    }


}
