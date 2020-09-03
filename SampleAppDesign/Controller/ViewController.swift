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
    @IBOutlet weak var customView: UIView!
    var name: NSArray = []
    var imageProfile: NSArray = []
    var category: NSArray = []
    let colors:[UIColor] = [#colorLiteral(red: 0.4917530417, green: 0.6604549289, blue: 0.9523091912, alpha: 1), #colorLiteral(red: 0.9411865473, green: 0.6444346309, blue: 0.3747217059, alpha: 1), #colorLiteral(red: 0.9274052978, green: 0.3840048313, blue: 0.5347460508, alpha: 1), #colorLiteral(red: 0.6471508145, green: 0.4921735525, blue: 0.9555041194, alpha: 1), #colorLiteral(red: 0.4084976912, green: 0.8862252831, blue: 0.7500914931, alpha: 1)]
    let subname: [String] = ["Title: FlyingWings", "Title: Illuster ", "Title: WingsFly", "Title: Little Girl", "Title: GirlLittle"]
    let rank: [String] = ["1", "2", "3", "4", "5"]
    
    fileprivate func extractedFunc() {
        name = ["Anas Anas", "Naveen", "Elango", "Seran", "Gunal"]
        imageProfile = [UIImage(named: "one")!, UIImage(named: "two")!, UIImage(named: "three")!, UIImage(named: "four")!, UIImage(named: "five")!]
        category = ["Desiner", "Category", "Attention", "category", "Designer"]
        tableView.delegate = self
        tableView.dataSource = self
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        extractedFunc()
    }
    func displayAlertMessage(messageToDisplay: String)
    {
        let alertController = UIAlertController(title: "Alert", message: messageToDisplay, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
            print("Ok button tapped");
        }
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion:nil)
    }
    func didPressButtonFromCustomView(sender:UIButton) {
         // do whatever you want
         // make view disappears again, or remove from its superview
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
        cell.profileImage.image = (imageProfile[indexPath.row] as! UIImage)
        cell.rankingLabel.text = self.rank[indexPath.row]
        cell.titleLabel.text = (name[indexPath.row] as! String)
        cell.subtitleLabel.text = self.subname[indexPath.row]
        cell.profileImage.layer.cornerRadius = cell.profileImage.frame.height / 2
        cell.backgrounVw.backgroundColor = colors[indexPath.row]
        cell.backgrounVw.layer.cornerRadius = 10
        cell.contentView.backgroundColor = UIColor.clear
        cell.backgrounVw.layer.shadowColor = UIColor.gray.cgColor
        cell.backgrounVw.layer.shadowOpacity = 1
        cell.backgrounVw.layer.shadowOffset = .zero
        cell.backgrounVw.layer.shadowRadius = 12
        cell.backgrounVw.layer.shouldRasterize = true
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let dataVc = storyBoard.instantiateViewController(withIdentifier: "DataViewController") as! DataViewController
        dataVc.getImage = imageProfile[indexPath.row] as! UIImage
        dataVc.getName = name[indexPath.row] as! String
        self.navigationController?.pushViewController(dataVc, animated: true)
    }
}
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return category.count
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let dataVc = storyBoard.instantiateViewController(withIdentifier: "CategoryViewController") as! CategoryViewController
        dataVc.getName = category[indexPath.row] as! String
        self.navigationController?.pushViewController(dataVc, animated: true)
        
//        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CategoryViewController") as! CategoryViewController
//        self.addChild(popOverVC)
//        popOverVC.getName = category[indexPath.row] as! String
//              popOverVC.view.frame = self.view.frame
//              self.view.addSubview(popOverVC.view)
//        popOverVC.didMove(toParent: self)
//        let customViewFrame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height - 200)
//         customView = UIView(frame: customViewFrame)
//
//         view.addSubview(customView)
//
//        customView.isHidden = false
//
//        let okayButtonFrame = CGRect(x: 40, y: 100, width: 50, height: 50)
//        let okayButton = UIButton(frame: okayButtonFrame )
//
//         customView.addSubview(okayButton)

    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.categoryLabel.text = (category[indexPath.row] as! String)
        return cell
    }
}
