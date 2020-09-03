//
//  CategoryViewController.swift
//  SampleAppDesign
//
//  Created by Karthik Rajan T  on 03/09/20.
//  Copyright © 2020 Karthik Rajan T . All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {

    var getName = String()

    @IBOutlet weak var categoryLabel: UILabel!
    
    fileprivate func extractedFunc() {
        super.viewDidLoad()
        categoryLabel.text! = getName
    }
    
    override func viewDidLoad() {
        extractedFunc()
    }
}
