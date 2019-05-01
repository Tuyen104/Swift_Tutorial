//
//  Services.swift
//  UserProfile
//
//  Created by Le Tuyen on 4/23/19.
//  Copyright © 2019 Le Tuyen. All rights reserved.
//

import Foundation

public enum DataType {
    case Json
    case Data
}

public enum HttpMethod : String {
    case post = "POST"
    case get = "GET"
    case put = "PUT"
    case delete = "DELETE"
    case patch = "PATCH"
}

public enum RequestParams {
    case body (_ : [String : Any]?)
    case url (_ : [String : Any]?)
}

public protocol Request {
    var path : String {get}
    var method : HttpMethod {get}
    var parameters : RequestParams {get}
    var headers : [String: Any]? {get}
    var dataType : DataType {get}
}

public enum NetworkErrors: Error {
    case badInput
    case noData
}

