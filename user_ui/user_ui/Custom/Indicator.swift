//
//  Indicator.swift
//  user_ui
//
//  Created by Павел Чернышев on 08.01.2020.
//  Copyright © 2020 Павел Чернышев. All rights reserved.
//

import UIKit

class Indicator: UIView {

    @IBOutlet weak var firstIndicator: UIButton!
    @IBOutlet weak var secondIndicator: UIButton!
    @IBOutlet weak var thirdtIndicator: UIButton!
    
    @IBInspectable var speedAnimate: CGFloat = 0.25
    @IBInspectable var indicatorColor: UIColor = .lightGray
    var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        xibSetup()
    }
    
    func xibSetup() {
        contentView = loadFromXib()
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(contentView)
        firstIndicator.tintColor = indicatorColor
        secondIndicator.tintColor = indicatorColor
        thirdtIndicator.tintColor = indicatorColor
        animate()
    }
    
    func loadFromXib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let xib = UINib(nibName: String(describing: type(of: self)) + "View", bundle: bundle)
        return xib.instantiate(withOwner: self, options: nil).first as! UIView
    }

    func animate() {
        UIView.animate(withDuration: TimeInterval(self.speedAnimate), delay: 0, options: [], animations: {
            self.firstIndicator.alpha = 0.5
            self.secondIndicator.alpha = 1.0
        }, completion: { _ in
            UIView.animate(withDuration: TimeInterval(self.speedAnimate), delay: 0, options: [], animations: {
                self.secondIndicator.alpha = 0.5
                self.thirdtIndicator.alpha = 1.0
            }, completion: { _ in
                UIView.animate(withDuration: TimeInterval(self.speedAnimate), delay: 0, options: [], animations: {
                    self.thirdtIndicator.alpha = 0.5
                    self.firstIndicator.alpha = 1.0
                }, completion: { _ in
                    self.animate()
                })
            })
        })
    }
}
