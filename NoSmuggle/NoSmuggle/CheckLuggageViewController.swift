//
//  CheckLuggageViewController.swift
//  NoSmuggle
//
//  Created by Stefan Fessler on 16.11.19.
//  Copyright © 2019 Stefan Fessler. All rights reserved.
//

import UIKit

class CheckLuggageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MockData.shared.checkData.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrendTableViewCell") as! TrendTableViewCell
        
        let data = MockData.shared.checkData[indexPath.row]
        cell.scanImageView.contentMode = .scaleAspectFill
        cell.scanImageView.image = UIImage(named: data.imageName)
        cell.textLable.text = data.title
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 156
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let luggage = MockData.shared.checkData[indexPath.row]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "LuggageDetailViewController") as! LuggageDetailViewController
        controller.luggage = luggage
        
        self.navigationController?.pushViewController(controller, animated: true)
    }

    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {

        let sharedAction = UITableViewRowAction(style: .normal, title: "Share") { (action, indexPath) in
            self.share(indexPath: indexPath)
        }
        sharedAction.backgroundColor = self.view.tintColor
        
        let uncheckAction = UITableViewRowAction(style: .normal, title: "UnCheck") { (action, indexPath) in
            self.removeToCheck(indexPath: indexPath)
        }
        uncheckAction.backgroundColor = .gray
        
        let okAction = UITableViewRowAction(style: .normal, title: "Ok") { (action, indexPath) in
            self.ok(indexPath: indexPath)
        }
        okAction.backgroundColor = .green
        
        let foundAction = UITableViewRowAction(style: .normal, title: "Found") { (action, indexPath) in
            self.found(indexPath: indexPath)
        }
        foundAction.backgroundColor = .red
        
        return [uncheckAction, okAction, foundAction, sharedAction]
    }

    func removeToCheck(indexPath: IndexPath) {
        
        let luggage = MockData.shared.checkData[indexPath.row]
        MockData.shared.rendData.insert(luggage, at: 0)
        MockData.shared.checkData.remove(at: indexPath.row)
        self.tableView.reloadData()
    }
    
    func ok(indexPath: IndexPath) {
        
        MockData.shared.checkData.remove(at: indexPath.row)
        self.tableView.reloadData()
    }
    
    func found(indexPath: IndexPath) {
        
        MockData.shared.checkData.remove(at: indexPath.row)
        self.tableView.reloadData()
    }
    
    func share(indexPath: IndexPath) {
        
        self.tabBarController?.selectedIndex = 3
    }
}
