//
//  ViewController.swift
//  SampleAppDesign
//
//  Created by Karthik Rajan T  on 27/08/20.
//  Copyright © 2020 Karthik Rajan T . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let colors:[UIColor] = [#colorLiteral(red: 0.4917530417, green: 0.6604549289, blue: 0.9523091912, alpha: 1), #colorLiteral(red: 0.9411865473, green: 0.6444346309, blue: 0.3747217059, alpha: 1), #colorLiteral(red: 0.9274052978, green: 0.3840048313, blue: 0.5347460508, alpha: 1), #colorLiteral(red: 0.6471508145, green: 0.4921735525, blue: 0.9555041194, alpha: 1), #colorLiteral(red: 0.4084976912, green: 0.8862252831, blue: 0.7500914931, alpha: 1)]
    let name: [String] = ["Anas Anas", "Naveen", "Elango", "Seran", "Gunal"]
    let subname: [String] = ["Title: FlyingWings", "Title: Illuster ", "Title: WingsFly", "Title: Little Girl", "Title: GirlLittle"]
    let rank: [String] = ["1", "2", "3", "4", "5"]
    let imageProfile = [UIImage(named: "one"), UIImage(named: "two"), UIImage(named: "three"), UIImage(named: "four"), UIImage(named: "five")]
    let category: [String] = ["Desiner", "Category", "Attention", "category", "Designer"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        collectionView.delegate = self
        collectionView.dataSource = self
    }

}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        cell.profileImage.image = self.imageProfile[indexPath.row]
        cell.rankingLabel.text = self.rank[indexPath.row]
        cell.titleLabel.text = self.name[indexPath.row]
        cell.subtitleLabel.text = self.subname[indexPath.row]
        cell.profileImage.layer.cornerRadius = cell.profileImage.frame.size.width / 2
        cell.backgrounVw.backgroundColor = colors[indexPath.row]
        cell.backgrounVw.layer.cornerRadius = cell.backgrounVw.frame.size.width / 12
        cell.contentView.backgroundColor = UIColor.clear
        cell.backgrounVw.layer.shadowColor = UIColor.gray.cgColor
        cell.backgrounVw.layer.shadowOpacity = 1
        cell.backgrounVw.layer.shadowOffset = .zero
        cell.backgrounVw.layer.shadowRadius = 12
        cell.backgrounVw.layer.shouldRasterize = true



        return cell
    }
    
}
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return category.count
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.categoryLabel.text = category[indexPath.row]
        if indexPath.row == 0 {
            cell.labelView.isHidden = false
        }
        else{
        cell.labelView.isHidden = true
        }
        return cell

    }
    
    
}
