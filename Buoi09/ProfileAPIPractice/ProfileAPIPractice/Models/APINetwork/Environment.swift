//
//  Environment.swift
//  ProfileAPIPractice
//
//  Created by Le Tuyen on 4/24/19.
//  Copyright © 2019 Le Tuyen. All rights reserved.
//

import Foundation

public enum EnvironmentName {
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
