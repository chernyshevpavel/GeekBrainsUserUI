//
//  RotatePushAnimator.swift
//  user_ui
//
//  Created by Павел Чернышев on 08.01.2020.
//  Copyright © 2020 Павел Чернышев. All rights reserved.
//

import UIKit

class RotatePushAnimator: NSObject, UIViewControllerAnimatedTransitioning {
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
        destination.view.frame = source.view.frame
        var transform = CGAffineTransform(rotationAngle: -90)
        transform.tx = source.view.frame.width
        transform.ty = -source.view.frame.width
        //transform.translatedBy(x: source.view.frame.width, y: source.view.frame.width)
        destination.view.transform = transform
        //CATransform3DRotate(destination.view.transform3D, 90.0, source.view.frame.width, 0.0, 0.0)
        //CATransform3DTranslate(destination.view.transform3D, source.view.frame.width, 0, -source.view.frame.width)
        //var width = source.view.frame.width
//        while width > 0 {
//            width -= 50
//            CATransform3DTranslate(destination.view.transform3D, width, 0, -width)
//            sleep(1)
//        }
        UIView.animate(withDuration: 1, delay: 0, options: [], animations: {
            var transform = CGAffineTransform(rotationAngle: 0)
            transform.tx = 0
            transform.ty = 0
            destination.view.transform = transform
        }, completion: { finished in
            if finished && !transitionContext.transitionWasCancelled {
                source.view.transform = .identity
            }
            transitionContext.completeTransition(finished && !transitionContext.transitionWasCancelled)
        })
//        UIView.transition(from: source.view,
//                          to: destination.view,
//                          duration: 1,
//                          options: .transitionFlipFromRight,
//                          completion: {finished in
//                            if finished && !transitionContext.transitionWasCancelled {
//                                source.view.transform = .identity
//                            }
//                            transitionContext.completeTransition(finished && !transitionContext.transitionWasCancelled)
//        })
        
//        UIView.animateKeyframes(withDuration: self.transitionDuration(using: transitionContext),
//                                delay: 0,
//                                options: .calculationModePaced,
//                                animations: {
                                    
                                    //CATransform3DRotate(source.view.transform3D, 45.0, 0.0, 0.0, 0.0)
                                    //destination.view.transform = .identity
                                    
//                                    UIView.addKeyframe(withRelativeStartTime: 0,
//                                                       relativeDuration: 0.75,
//                                                       animations: {
//                                                           let translation = CGAffineTransform(translationX: -200, y: 0)
//                                                           let scale = CGAffineTransform(scaleX: 0.8, y: 0.8)
//                                                           source.view.transform = translation.concatenating(scale)
//                                    })
//                                    UIView.addKeyframe(withRelativeStartTime: 0.2,
//                                                       relativeDuration: 0.4,
//                                                       animations: {
//                                                           let translation = CGAffineTransform(translationX: source.view.frame.width / 2, y: 0)
//                                                           let scale = CGAffineTransform(scaleX: 1.2, y: 1.2)
//                                                           destination.view.transform = translation.concatenating(scale)
//                                    })
//                                    UIView.addKeyframe(withRelativeStartTime: 0.6,
//                                                       relativeDuration: 0.4,
//                                                       animations: {
//                                                           destination.view.transform = .identity
//                                    })
//        }) { finished in
//            if finished && !transitionContext.transitionWasCancelled {
//                source.view.transform = .identity
//            }
//            transitionContext.completeTransition(finished && !transitionContext.transitionWasCancelled)
//        }
    }    
}
