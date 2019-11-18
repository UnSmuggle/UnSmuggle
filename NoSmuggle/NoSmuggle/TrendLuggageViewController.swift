//
//  TrendLuggageViewController.swift
//  NoSmuggle
//
//  Created by Stefan Fessler on 16.11.19.
//  Copyright © 2019 Stefan Fessler. All rights reserved.
//

import UIKit

class TrendLuggageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MockData.shared.rendData.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrendTableViewCell") as! TrendTableViewCell
        let data = MockData.shared.rendData[indexPath.row]
        cell.scanImageView.contentMode = .scaleAspectFill
        cell.scanImageView.image = UIImage(named: data.imageName)
        cell.textLable.text = data.title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 156
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let luggage = MockData.shared.rendData[indexPath.row]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "LuggageDetailViewController") as! LuggageDetailViewController
        controller.luggage = luggage
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {

        let checkAction = UITableViewRowAction(style: .normal, title: "Check") { (action, indexPath) in
            self.addToCheck(indexPath: indexPath)
        }
        checkAction.backgroundColor = .red
        
      return [checkAction]
    }
    
    func addToCheck(indexPath: IndexPath) {
        
        let luggage = MockData.shared.rendData[indexPath.row]
        MockData.shared.rendData.remove(at: indexPath.row)
        MockData.shared.checkData.append(luggage)
        MockData.shared.historyData.append(luggage)
        self.tableView.reloadData()
    }
}
