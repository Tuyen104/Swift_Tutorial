//
//  UIImageViewExtension.swift
//  CollectionViewDemo01
//
//  Created by Le Tuyen on 4/15/19.
//  Copyright © 2019 Le Tuyen. All rights reserved.
//

import UIKit
import Kingfisher
//import SwiftyGif



extension UIImageView{
    public func loadGifWithUrlString(_ urlString:String){
        if let url = URL(string: urlString){
           self.kf.setImage(with: url)
        }
    }
}
