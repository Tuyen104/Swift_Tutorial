//
//  Photo.swift
//  UserProfile
//
//  Created by Le Tuyen on 4/18/19.
//  Copyright © 2019 Le Tuyen. All rights reserved.
//

import Foundation
import ObjectMapper

class Photo: Mappable {
    var id : String = ""
    var color : String = ""
    var urlImage : String = ""
    var likes : Int = 0
    var users : User?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        self.id <- map["id"]
        self.color <- map["color"]
        self.urlImage <- map["urls.small"]
        self.likes <- map["likes"]
        self.users <- map["user"]
    }
    
    
}
