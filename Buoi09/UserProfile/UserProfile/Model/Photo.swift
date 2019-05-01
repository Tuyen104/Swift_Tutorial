//
//  Photo.swift
//  UserProfile
//
//  Created by Le Tuyen on 4/18/19.
//  Copyright © 2019 Le Tuyen. All rights reserved.
//
import RealmSwift
import ObjectMapper

class Photo: Object ,Mappable, NetworkModel {
    
    @objc dynamic var id : String = ""
    @objc dynamic var color : String = ""
    @objc dynamic var urlImage : String = ""
    @objc dynamic var likes : Int = 0
    @objc dynamic var createDate : Date = Date()
    @objc dynamic var users : User?
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    fileprivate var dateFormatter : DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        dateFormatter.timeZone = TimeZone.current
        return dateFormatter
    }
    
    func mapping(map: Map) {
        self.id <- map["id"]
        self.color <- map["color"]
        self.urlImage <- map["urls.small"]
        self.likes <- map["likes"]
        self.users <- map["user"]
        self.createDate <- (map["created_at"], DateFormatterTransform(dateFormatter: dateFormatter))
    }
    
    static var request: Request {
        return APIRequest.profile(username: "kaspercph")
    }
    
   public static func dowork(in dispatcher: Dispatcher, completion: @escaping Completion) {
        do{
            try dispatcher.execute(request: self.request, completion: {(result) in
                switch result {
                case .success(let data):
                    guard let json = data as? JSArray else {return}
                    let photos = Mapper<Photo>().mapArray(JSONArray: json)
                    do{
                        let realm = try Realm()
                        try realm.write {
                            for photo in photos{
                                realm.add(photo, update: true) 
                            }
                        }
                    }
                    catch{
                        completion(.failure(error))
                    }
                    completion(.success(photos))
                case .failure(let error):
                    completion(.failure(error))
                }
            })
        }
        catch{
            completion(.failure(error))
        }
    }
    
}
