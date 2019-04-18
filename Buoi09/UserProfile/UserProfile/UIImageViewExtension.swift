//
//  UIImageViewExtension.swift
//  UserProfile
//
//  Created by Le Tuyen on 4/18/19.
//  Copyright © 2019 Le Tuyen. All rights reserved.
//

import Foundation
import AFNetworking

extension UIImageView{
    public func loadImageWithUrl(_ urlString : String) {
        if let url = URL(string: urlString){
            self.setImageWith(url)
        }
    }
}
