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
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        extractedFunc()
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
