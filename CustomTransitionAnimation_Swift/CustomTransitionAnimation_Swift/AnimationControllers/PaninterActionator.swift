//
//  PaninterActionator.swift
//  CustomTransitionAnimation_Swift
//
//  Created by MR.Sahw on 2020/11/15.
//

import UIKit

class PaninterActionator: UIPercentDrivenInteractiveTransition {
    let detailVC : UIViewController
    var isInterActive = false
    init(detailVC: UIViewController) {
        self.detailVC = detailVC
        super.init()
        let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePan(pan:)))
        detailVC.view.addGestureRecognizer(pan)
    }
    @objc func handlePan(pan: UIPanGestureRecognizer){
        let progress = pan.translation(in: pan.view).x / 200
        switch pan.state {
        case .began:
            isInterActive = true
            detailVC.dismiss(animated: true, completion: nil)
        case .changed:
            update(progress)
        case .cancelled , .ended:
            isInterActive = false
            if progress > 0.5 {
                finish() // 完成剩余动画
            }else{
                cancel() // 取消动画
            }
        default:
            break
        }
    }
}
