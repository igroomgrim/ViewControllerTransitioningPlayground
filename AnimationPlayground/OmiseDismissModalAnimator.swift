//
//  DismissModalAnimator.swift
//  AnimationPlayground
//
//  Created by Anak Mirasing on 9/8/16.
//  Copyright © 2016 OMISE. All rights reserved.
//

import UIKit

class OmiseDismissModalAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    let duration = 0.4
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return duration
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        guard
            let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey),
            let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey),
            let containerView = transitionContext.containerView()
            else {
                return
        }
        
        UIView.animateWithDuration(self.duration, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0, options: .AllowUserInteraction, animations: {
                fromView.center.y += containerView.bounds.size.height
            
                toVC.view.transform = CGAffineTransformIdentity
                toVC.view.layer.cornerRadius = 0
                toVC.view.alpha = 1.0
            }, completion: {(completed: Bool) -> Void in
                
                transitionContext.completeTransition(completed)
        })
    }
}
