//
//  Section.swift
//  SampleAppDesign
//
//  Created by Karthik Rajan T  on 07/09/20.
//  Copyright © 2020 Karthik Rajan T . All rights reserved.
//

import Foundation

class Section {
    var title : String?
    var list : [String]?
    var isColleps : Bool?
    init() {
    }
    
    init(title : String? , list : [String]?, isColleps : Bool?) {
        self.title = title
        self.list = list
        self.isColleps = isColleps
    }
}
