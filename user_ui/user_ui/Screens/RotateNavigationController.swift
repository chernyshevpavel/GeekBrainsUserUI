//
//  RotateNavigationController.swift
//  user_ui
//
//  Created by Павел Чернышев on 08.01.2020.
//  Copyright © 2020 Павел Чернышев. All rights reserved.
//

import UIKit

class RotateNavigationController: UINavigationController, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        // Do any additional setup after loading the view.
    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .push {
            return RotatePushAnimator()
        } else if operation == .pop {
            return RotatePopAnimator()
        }
        return nil
    }

}
