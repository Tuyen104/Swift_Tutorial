//
//  ApiRequest.swift
//  ProfileAPIPractice
//
//  Created by Le Tuyen on 4/24/19.
//  Copyright © 2019 Le Tuyen. All rights reserved.
//

import Foundation
public enum ApiRequest {
    case profile(username : String)
}

extension ApiRequest : Request {
    public var path: String {
        switch self {
        case .profile(let username):
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
        switch self {
        case .profile:
            return .url(["client_id" : "f71ef372124fda569b8bd856ed1f195e16fd122ca8110b1855a9279ec948d4dd"])
        }
    }
    
    public var headers: [String : Any]? {
        return nil
    }
    
    public var dataType: DataType {
        switch self {
        case .profile:
            return .json
        }
    }
    
    
}


