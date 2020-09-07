//
//  CategoryTableViewCell.swift
//  SampleAppDesign
//
//  Created by Karthik Rajan T  on 04/09/20.
//  Copyright © 2020 Karthik Rajan T . All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var downButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
