//
//  NetworkModel.swift
//  UserProfile
//
//  Created by Le Tuyen on 4/23/19.
//  Copyright © 2019 Le Tuyen. All rights reserved.
//

import Foundation

protocol NetworkModel{
    static var request : Request {get}
    static func dowork(in dispatcher : Dispatcher, completion : @escaping Completion)
}
