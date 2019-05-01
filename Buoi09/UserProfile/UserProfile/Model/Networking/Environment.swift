//
//  Environment.swift
//  UserProfile
//
//  Created by Le Tuyen on 4/23/19.
//  Copyright © 2019 Le Tuyen. All rights reserved.
//

import Foundation

public enum EnvironmentName : String {
    case dev
    case pro
}

public struct Environment {
    public var name : EnvironmentName
    public var host : String
    public var headers : [String:Any] = [:]
    public var cachePolicy : URLRequest.CachePolicy = .reloadIgnoringLocalAndRemoteCacheData
    public init(_ name : EnvironmentName, host : String){
        self.name = name
        self.host = host
    }
}
