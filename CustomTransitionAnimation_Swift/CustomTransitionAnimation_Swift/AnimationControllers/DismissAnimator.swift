//
//  DismissAnimator.swift
//  CustomTransitionAnimation_Swift
//
//  Created by MR.Sahw on 2020/11/13.
//

import UIKit

class DismissAnimator: NSObject,UIViewControllerAnimatedTransitioning {
    // 动画时间
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    // 动画逻辑
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromView = transitionContext.view(forKey: .from),
              let toView = transitionContext.view(forKey: .to) else {return}
        let containerView = transitionContext.containerView
        containerView.addSubview(toView)
        
        /// 动画逻辑
        toView.alpha = 0
        toView.transform = CGAffineTransform(translationX: -containerView.frame.width, y: 0)
        UIView.animate(withDuration: transitionDuration(using: transitionContext)) {
            fromView.alpha = 0
            fromView.transform = CGAffineTransform(translationX: containerView.frame.width, y: 0)
            toView.alpha = 1
            toView.transform = .identity
        } completion: { _ in
            fromView.transform = .identity
            toView.transform = .identity
            transitionContext.completeTransition(true)
        }
    }
}
