//
//  ProductTableViewCell.swift
//  TableViewDemo02
//
//  Created by Le Tuyen on 4/6/19.
//  Copyright © 2019 Le Tuyen. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        priceButton.layer.cornerRadius = 23
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBOutlet weak var priceButton : UIButton!
    
}
