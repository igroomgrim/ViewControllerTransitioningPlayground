//
//  PresentModalAnimator.swift
//  AnimationPlayground
//
//  Created by Anak Mirasing on 9/8/16.
//  Copyright © 2016 OMISE. All rights reserved.
//

import UIKit

class OmisePresentModalAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    let duration = 0.4
    
    override init() {
        super.init()
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return duration
    }
    
    
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        guard
            let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey),
            let presentedController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey),
            let toView = transitionContext.viewForKey(UITransitionContextToViewKey),
            
            let containerView = transitionContext.containerView()
            else {
                return
        }
        
//        let xx = fromVC.view.snapshotViewAfterScreenUpdates(true)
        
        let scaleTransform = CGAffineTransformMakeScale(0.95, 0.94)
        fromVC.view.clipsToBounds = true
        fromVC.view.layer.cornerRadius = 6
        fromVC.view.tag = 11
        
        toView.frame = transitionContext.finalFrameForViewController(presentedController)
        toView.center.y += containerView.bounds.size.height
        toView.layer.cornerRadius = 6
        
        containerView.addSubview(toView)
        
        UIView.animateWithDuration(duration, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0, options: .AllowUserInteraction, animations: {
            
            // scale old view
            fromVC.view.transform = scaleTransform
            
            fromVC.view.alpha = 0.6
           
            
            // slide up
            toView.center.y -= containerView.bounds.size.height - 26
            
            
            }, completion: {(completed: Bool) -> Void in
                transitionContext.completeTransition(completed)
        })
    }
}