//
//  RotatePushAnimator.swift
//  user_ui
//
//  Created by Павел Чернышев on 08.01.2020.
//  Copyright © 2020 Павел Чернышев. All rights reserved.
//

import UIKit

class RotatePopAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1.0
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let source = transitionContext.viewController(forKey: .from),
              let destination = transitionContext.viewController(forKey: .to)
        else {
            return
        }
        transitionContext.containerView.addSubview(destination.view)
        transitionContext.containerView.sendSubviewToBack(destination.view)
        
        destination.view.frame = source.view.frame
        
        let translation = CGAffineTransform(translationX: 0, y: 0)
        //let scale = CGAffineTransform(scaleX: 0.8, y: 0.8)
        destination.view.transform = translation
        
        UIView.transition(from: source.view,
                          to: destination.view,
                          duration: 1,
                          options: .transitionFlipFromLeft,
                          completion: {finished in
                            if finished && !transitionContext.transitionWasCancelled {
                                source.view.transform = .identity
                            }
                            transitionContext.completeTransition(finished && !transitionContext.transitionWasCancelled)
        })
        
//        UIView.animateKeyframes(withDuration: self.transitionDuration(using: transitionContext),
//                                delay: 0,
//                                options: .calculationModePaced,
//                                animations: {
//                                    UIView.addKeyframe(withRelativeStartTime: 0,
//                                                       relativeDuration: 0.4,
//                                                       animations: {
//                                                           let translation = CGAffineTransform(translationX: source.view.frame.width / 2, y: 0)
//                                                           let scale = CGAffineTransform(scaleX: 1.2, y: 1.2)
//                                                           source.view.transform = translation.concatenating(scale)
//                                    })
//                                    UIView.addKeyframe(withRelativeStartTime: 0.4,
//                                                       relativeDuration: 0.4,
//                                                       animations: {
//                                                           source.view.transform = CGAffineTransform(translationX: source.view.frame.width, y: 0)
//                                    })
//                                    UIView.addKeyframe(withRelativeStartTime: 0.25,
//                                                       relativeDuration: 0.75,
//                                                       animations: {
//                                                           destination.view.transform = .identity
//                                    })
//
//
//        }) { finished in
//            if finished && !transitionContext.transitionWasCancelled {
//                source.removeFromParent()
//            } else if transitionContext.transitionWasCancelled {
//                destination.view.transform = .identity
//            }
//            transitionContext.completeTransition(finished && !transitionContext.transitionWasCancelled)
//        }

    }    
}
