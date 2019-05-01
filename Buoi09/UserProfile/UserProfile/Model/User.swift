//
//  User.swift
//  UserProfile
//
//  Created by Le Tuyen on 4/18/19.
//  Copyright © 2019 Le Tuyen. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

class User: Object, Mappable {
    required convenience init?(map: Map) {
        self.init()
    }
    
   @objc dynamic var id : String = ""
   @objc dynamic var username : String = ""
   @objc dynamic var name : String = ""
   @objc dynamic var location : String = ""
   @objc dynamic var profileImage : String = ""
   @objc dynamic var likesNo : Int = 0
   @objc dynamic var photosNo : Int = 0
   @objc dynamic var collectionsNo : Int = 0
    
    let photos = LinkingObjects(fromType: Photo.self, property: "user")
    
    override static func primaryKey() -> String? {
        return "id"
    }
    func mapping(map: Map) {
        self.id  <- map["id"]
        self.username <- map["username"]
        self.name <- map["name"]
        self.location <- map["location"]
        self.profileImage <- map["profile_image.small"]
        self.likesNo <- map["total_likes"]
        self.photosNo <- map["total_photos"]
        self.collectionsNo <- map["total_collections"]
    }
    
    
}

