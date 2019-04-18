//
//  User.swift
//  UserProfile
//
//  Created by Le Tuyen on 4/18/19.
//  Copyright © 2019 Le Tuyen. All rights reserved.
//

import Foundation
import ObjectMapper

class User: Mappable {
    var id : String = ""
    var username : String = ""
    var name : String = ""
    var location : String = ""
    var profileImage : String = ""
    var likes : Int = 0
    var photos : Int = 0
    var collections : Int = 0
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        self.id  <- map["id"]
        self.username <- map["username"]
        self.name <- map["name"]
        self.location <- map["location"]
        self.profileImage <- map["profile_image.small"]
        self.likes <- map["total_likes"]
        self.photos <- map["total_photos"]
        self.collections <- map["total_collections"]
    }
    
    
}
