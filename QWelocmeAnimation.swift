//
//  QWelocmeAnimation.swift
//  Ordersmoke
//
//  Created by qzp on 15/9/9.
//  Copyright (c) 2015年 qzp. All rights reserved.
//

import UIKit

/// 动画
//实现UIViewControllerAnimatedTransitioning协议
class QWelocmeAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    var duration: NSTimeInterval = 0.5
    
    
    //动画执行时间
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        
        
        return duration
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        //The view in which the animated transition should take place.
        let  containerView = transitionContext.containerView()
        
        /// 获取要进入的视图view viewForKey ， 获取要进入的视图viewcontroller  viewControllerForKey
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)
        let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)
        
        toView?.alpha = 0
        fromView?.alpha = 0.8
        
        containerView.addSubview(toView!)
        
        UIView.animateWithDuration(duration, animations: { () -> Void in
            toView?.alpha = 1
            fromView?.alpha = 0
            
            }) { (_ ) -> Void in
                fromView?.alpha = 1
                transitionContext.completeTransition(true)
        }
    }
    
}