//
//  MianViewController.swift
//  CustomTransitionAnimation_Swift
//
//  Created by MR.Sahw on 2020/11/13.
//

import UIKit

class MianViewController: UIViewController {
    
    var panInteraction : PaninterActionator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
    }
    @IBAction func showDetail(_ sender: Any) {
        let detailVC = storyboard!.instantiateViewController(identifier: "DetailVC") as! DetailViewController
        detailVC.transitioningDelegate = self
        detailVC.modalPresentationStyle = .fullScreen
        panInteraction = PaninterActionator(detailVC: detailVC)
        present(detailVC, animated: true, completion: nil)
    }

}
///自定义转场动画
extension MianViewController : UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PresentAnimator()
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DismissAnimator()
    }
    // 交互动画 -- 主要是手势动画
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return panInteraction.isInterActive ? panInteraction : nil
    }
}
