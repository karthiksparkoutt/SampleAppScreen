//
//  DataViewController.swift
//  SampleAppDesign
//
//  Created by Karthik Rajan T  on 03/09/20.
//  Copyright © 2020 Karthik Rajan T . All rights reserved.
//

import UIKit

class DataViewController: UIViewController {
    
    var getName = String()
    var getImage = UIImage()
    
    @IBOutlet weak var dataLabelImage: UILabel!
    @IBOutlet weak var dataImageView: UIImageView!
    
    fileprivate func extractedFunc() {
        dataLabelImage.text! = getName
        dataImageView.image = getImage
        self.showAnimate()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        extractedFunc()
        // Do any additional setup after loading the view.
    }
    @IBAction func closePopUp(_ sender: AnyObject) {
        self.removeAnimate()
        //self.view.removeFromSuperview()
    }
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.view.removeFromSuperview()
            }
        });
    }
    
}
