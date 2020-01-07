//
//  IndicatorViewController.swift
//  user_ui
//
//  Created by Павел Чернышев on 08.01.2020.
//  Copyright © 2020 Павел Чернышев. All rights reserved.
//

import UIKit

class IndicatorViewController: UIViewController {

    @IBOutlet weak var first: UIButton!
    @IBOutlet weak var second: UIButton!
    @IBOutlet weak var third: UIButton!
    
    @IBInspectable var speedAnimate: CGFloat = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startAnimate()
        // Do any additional setup after loading the view.
    }
    
    private func startAnimate() {
        UIView.animate(withDuration: TimeInterval(self.speedAnimate), delay: 0, options: [], animations: {
            self.first.alpha = 0.5
            self.second.alpha = 1.0
        }, completion: { _ in
            UIView.animate(withDuration: TimeInterval(self.speedAnimate), delay: 0, options: [], animations: {
                self.second.alpha = 0.5
                self.third.alpha = 1.0
            }, completion: { _ in
                UIView.animate(withDuration: TimeInterval(self.speedAnimate), delay: 0, options: [], animations: {
                    self.third.alpha = 0.5
                    self.first.alpha = 1.0
                }, completion: { _ in
                    self.startAnimate()
                })
            })
        })
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
