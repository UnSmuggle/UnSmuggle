//
//  LuggageDetailViewController.swift
//  NoSmuggle
//
//  Created by Stefan Fessler on 16.11.19.
//  Copyright © 2019 Stefan Fessler. All rights reserved.
//

import UIKit

class LuggageDetailViewController: UIViewController {

    var luggage: Luggage!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var image0: UIImageView!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image1height: NSLayoutConstraint!
    @IBOutlet weak var textLable: UILabel!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var okbutton: UIButton!
    @IBOutlet weak var foundButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        okbutton.tintColor = .green
        foundButton.tintColor = .red
        
        image0.contentMode = .scaleAspectFill
        image1.contentMode = .scaleAspectFill
        image2.contentMode = .scaleAspectFill
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = "ID Nr: " + luggage.packageID
        
        titleLable.text = luggage.title
        image0.image = UIImage(named: luggage.imageName)
        
        if let image = UIImage(named: luggage.imageName + "-1") {
            image1.image = image
        } else {
            image1height.constant = 0
        }
        
        textLable.text = "Luggage Detail:"
        image2.image = UIImage(named: "outside")
    }
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        scrollView.contentSize = contentView.frame.size
    }
    
    @IBAction func okTouched(_ sender: Any) {
        
        if let index = MockData.shared.checkData.firstIndex(of: self.luggage) {
            MockData.shared.checkData.remove(at: index)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func foundTouched(_ sender: Any) {
     
        if let index = MockData.shared.checkData.firstIndex(of: self.luggage) {
            MockData.shared.checkData.remove(at: index)
        }
        
        self.navigationController?.popViewController(animated: true)
    }
}
