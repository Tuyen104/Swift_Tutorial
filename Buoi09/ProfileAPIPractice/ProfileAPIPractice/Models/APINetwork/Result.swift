//
//  Result.swift
//  ProfileAPIPractice
//
//  Created by Le Tuyen on 4/24/19.
//  Copyright © 2019 Le Tuyen. All rights reserved.
//

import Foundation

public enum Result<Value> {
    case success(Value)
    case failure(Error)
    
    public var isSuccess : Bool {
        switch self {
        case .success:
            return true
        case .failure:
            return false
        }
    }
    public var isFailure : Bool {
        return !isSuccess
    }
    public var success : Value? {
        switch self {
        case .success(let value):
            return value
        case .failure:
            return nil
        }
    }
    public var failure : Error? {
        switch self {
        case .success:
            return nil
        case .failure(let error):
            return error
        }
    }
}


