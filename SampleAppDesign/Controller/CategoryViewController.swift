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
    
   var searchedCountry = [String]()
    var searching = false
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
extension CategoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return searchedCountry.count
        } else {
            return list.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell") as! CategoryTableViewCell
        if searching {
            cell.headerLabel.text = searchedCountry[indexPath.row]
        } else {
            cell.headerLabel.text = list[indexPath.row]
        }
        return cell
    }
    
}
extension CategoryViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchedCountry = list.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
        searching = true
        categoryTableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        categoryTableView.reloadData()
    }
    
}
