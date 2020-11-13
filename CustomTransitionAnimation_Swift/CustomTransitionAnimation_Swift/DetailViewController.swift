//
//  DetailViewController.swift
//  CustomTransitionAnimation_Swift
//
//  Created by MR.Sahw on 2020/11/13.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var iamgeView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissVC(tap:)))
        iamgeView.addGestureRecognizer(tap)
        iamgeView.isUserInteractionEnabled = true
    }
    @objc func dismissVC(tap:UITapGestureRecognizer){
        dismiss(animated: true, completion: nil)
    }
}
