//
//  CategoryViewController.swift
//  SampleAppDesign
//
//  Created by Karthik Rajan T  on 03/09/20.
//  Copyright © 2020 Karthik Rajan T . All rights reserved.
//

import UIKit

enum cellHeight : CGFloat{
    case Header = 44
    case Row = 40
}
class CategoryViewController: UIViewController {

    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var categoryTableView: UITableView!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet var searchbar: UISearchBar!

    
    var getName = String()
    var list = [String]()
    var userName = String()
    var data: [String] = []
    var cellData : [Section] = [Section(title: "Section 1", list: ["Row 1", "Row 2", "Row 3"], isColleps: true),Section(title: "Section 2", list: ["Row 1", "Row 2", "Row 3"], isColleps: true),Section(title: "Section 3", list: ["Row 1", "Row 2", "Row 3"], isColleps: true),Section(title: "Section 4", list: ["Row 1", "Row 2", "Row 3"], isColleps: true),Section(title: "Section 5", list: ["Row 1", "Row 2", "Row 3"], isColleps: true)]
    var searchActive = true
    var filtered:[String] = []
    fileprivate func extractedFunc() {
        super.viewDidLoad()
        categoryLabel.text! = getName
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        self.showAnimate()
        doneButton.layer.cornerRadius = 2
        categoryTableView.delegate = self
        categoryTableView.dataSource = self
        categoryTableView.tableFooterView = UIView()
        searchbar.delegate = self

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
   func numberOfSections(in tableView: UITableView) -> Int {
          return cellData.count
      }
      
      func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
          return cellHeight.Header.rawValue
      }
      
      func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableCell(withIdentifier: "HeaderCell") as! CategoryTableViewCell
          
          let sectionData = cellData[section]
          header.headerLabel.text = sectionData.title
        
          ///arrow rotate
          header.downButton.transform = CGAffineTransform(rotationAngle: (sectionData.isColleps)! ? 0.0 : .pi)
          header.downButton.tag = section
          header.downButton.addTarget(self, action: #selector(buttonHandlerSectionArrowTap(sender:)), for: .touchUpInside)
          return header.contentView
      }
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return  cellData[section].isColleps ?? false ? (cellData[section].list?.count ?? 0) : 0
      }
      func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
          return cellHeight.Row.rawValue
      }
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContentCell") as! CategoryTableViewCell
          
          let listData = cellData[indexPath.section].list
          cell.contentLabel.text = listData?[indexPath.row]
          
          return cell
      }

      ///Button action arrow in header
      @objc func buttonHandlerSectionArrowTap(sender : UIButton)  {
          let sectionData = cellData[sender.tag]
          sectionData.isColleps = !sectionData.isColleps!
          categoryTableView.reloadSections(IndexSet(integer: sender.tag), with: .automatic)
      }
    
    
}
extension CategoryViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true
    }

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        filtered = data.filter({ (text) -> Bool in
            let tmp:NSString = text as NSString
            let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
            return range.location != NSNotFound
        })

        if (filtered.count == 0){
            searchActive = false
        }
        else{
            searchActive = true
        }
        self.categoryTableView.reloadData()
    }
}
