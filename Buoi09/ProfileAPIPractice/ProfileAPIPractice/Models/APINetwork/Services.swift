//
//  Services.swift
//  ProfileAPIPractice
//
//  Created by Le Tuyen on 4/24/19.
//  Copyright © 2019 Le Tuyen. All rights reserved.
//

import Foundation

public enum DataType {
    case data
    case json
}

public enum HttpMethod : String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    case patch = "PATCH"
}

public enum RequestParams {
    case body (_ : [String : Any]?)
    case url (_ : [String : Any]?)
}

public enum NetworkErrors : Error {
    case noData
    case badInput
}

public protocol Request {
    var path : String {get}
    var method : HttpMethod {get}
    var parameters : RequestParams {get}
    var headers : [String:Any]? {get}
    var dataType : DataType {get}
}
