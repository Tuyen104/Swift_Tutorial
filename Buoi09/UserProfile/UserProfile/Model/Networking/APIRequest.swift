//
//  ProfileRequest.swift
//  UserProfile
//
//  Created by Le Tuyen on 4/23/19.
//  Copyright © 2019 Le Tuyen. All rights reserved.
//

import Foundation

public enum APIRequest {
    case profile(username : String)
}

extension APIRequest : Request {
    public var path: String {
        switch self {
        case .profile(username: let username):
            return "/users/\(username)/photos"
        }
    }
    
    public var method: HttpMethod {
        switch self {
        case .profile:
            return .get
        }
    }
    
    public var parameters: RequestParams {
        return .url(["client_id" : "b4c9f248833db2bb34344a0f4abe7448fbb1950593372aa423856b63afccb4cb"])
    }
    
    public var headers: [String : Any]? {
        return nil
    }
    
    public var dataType: DataType {
        switch self {
        case .profile:
            return .Json
        }
    }
    
    
}
