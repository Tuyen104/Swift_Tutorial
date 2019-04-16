//
//  MainCollectionViewCell.swift
//  CollectionViewDemo01
//
//  Created by Le Tuyen on 4/7/19.
//  Copyright © 2019 Le Tuyen. All rights reserved.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView : UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func updateImageViewWithURL(_ urlString: String){
        self.imageView.loadGifWithUrlString(urlString)
    }

}
