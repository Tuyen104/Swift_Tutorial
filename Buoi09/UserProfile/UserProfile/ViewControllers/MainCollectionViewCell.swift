//
//  MainCollectionViewCell.swift
//  UserProfile
//
//  Created by Le Tuyen on 4/18/19.
//  Copyright © 2019 Le Tuyen. All rights reserved.
//

import UIKit
import AFNetworking

class MainCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView : UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func updateImageWithUrl(_ urlString : String){
        self.imageView.loadImageWithUrl(urlString)
    }
}
