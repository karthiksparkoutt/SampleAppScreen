//
//  CategoryViewController.swift
//  SampleAppDesign
//
//  Created by Karthik Rajan T  on 03/09/20.
//  Copyright © 2020 Karthik Rajan T . All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var categoryTableView: UITableView!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var filteredData = [String]()
    var inSearchMode = false
    var getName = String()
    var list = [String]()
    var userName = String()
    
    
    fileprivate func extractedFunc() {
        super.viewDidLoad()
        categoryLabel.text! = getName
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        self.showAnimate()
        doneButton.layer.cornerRadius = 2
        categoryTableView.delegate = self
        categoryTableView.dataSource = self
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.done
        
    }
    override func viewDidLoad() {
        extractedFunc()
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
extension CategoryViewController: UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if inSearchMode {
            
            return filteredData.count
        }
        
        return list.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell", for: indexPath) as? CategoryTableViewCell {
            cell.contentView.backgroundColor = UIColor.clear
            
            
            let text: String!
            
            if inSearchMode {
                
                text = filteredData[indexPath.row]
                
            } else {
                
                text = list[indexPath.row]
            }
            
            cell.headerLabel.text = text

            return cell
            
        } else {
            
            return UITableViewCell()
        }
        
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchBar.text == nil || searchBar.text == "" {
            
            inSearchMode = false
            
            view.endEditing(true)
            
            categoryTableView.reloadData()
            
        } else {
            
            inSearchMode = true
            
            filteredData = list.filter({$0 == searchBar.text})
            
            categoryTableView.reloadData()
        }
    }
}
