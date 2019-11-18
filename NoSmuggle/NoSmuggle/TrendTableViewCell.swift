//
//  TrendTableViewCell.swift
//  NoSmuggle
//
//  Created by Stefan Fessler on 16.11.19.
//  Copyright © 2019 Stefan Fessler. All rights reserved.
//

import UIKit

class TrendTableViewCell: UITableViewCell {

    @IBOutlet weak var scanImageView: UIImageView!
    @IBOutlet weak var textLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
