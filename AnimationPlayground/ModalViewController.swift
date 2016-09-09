//
//  ModalViewController.swift
//  AnimationPlayground
//
//  Created by Anak Mirasing on 9/8/16.
//  Copyright © 2016 OMISE. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {
    
    @IBOutlet weak var formView: UIView!
    @IBOutlet weak var formSwitch: UISwitch!
    @IBOutlet weak var mainLabel: UILabel!
    var subLabel: UILabel!
    
    @IBOutlet weak var formHeightConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        subLabel = UILabel()
        subLabel.text = "Sub label label label"
        subLabel.alpha = 0
        formView.addSubview(subLabel)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        subLabel.frame = mainLabel.frame
        subLabel.sizeToFit()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func formSwitchChaged(sender: UISwitch) {
        animateFormView(sender.on)
    }
    
    func animateFormView(expand: Bool) {
        formHeightConstraint.constant = expand ? 120: 60
        
        let newCenterYForLabel = CGPoint(x: subLabel.center.x, y: (expand ? subLabel.center.y + 60 : subLabel.center.y - 60))
        
        UIView.animateWithDuration(0.4, delay: 0, options: [.CurveEaseOut], animations: {
                self.view.layoutIfNeeded()
            
                self.subLabel.alpha = expand ? 1: 0
                self.subLabel.center = newCenterYForLabel
            
            }, completion: { _ in
    
        })
    }
}
