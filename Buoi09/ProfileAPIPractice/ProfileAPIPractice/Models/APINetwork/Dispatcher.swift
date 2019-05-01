//
//  Dispatcher.swift
//  ProfileAPIPractice
//
//  Created by Le Tuyen on 4/24/19.
//  Copyright © 2019 Le Tuyen. All rights reserved.
//

import Foundation
public typealias Completion = (Result<Any>) -> ()
public typealias JSObject = [String:Any]
public typealias JSArray = [JSObject]

public protocol Dispatcher {
    init (environment : Environment)
    func execute(request : Request, completion : @escaping Completion) throws
    func cancel()
}

public class NetworkDispatcherManager : Dispatcher {
    public var environment : Environment
    public var task : URLSessionDataTask?
    
    public required init(environment: Environment) {
        self.environment = environment
    }
    
    public func execute(request: Request, completion: @escaping Completion) throws {
        let urlRequest = try self.prepare(request: request)
        self.task = URLSession.shared.dataTask(with: urlRequest, completionHandler: {(data, response, error) in
            if let data = data {
                switch request.dataType {
                case .json :
                    do{
                        let json = try JSONSerialization.jsonObject(with: data, options: []) as! JSArray
                        completion(.success(json))
                    }
                    catch{
                        completion(.failure(error))
                    }
                    
                case .data:
                    completion(.success(data))
                    
                }
            }
            if let error = error {
                completion(.failure(error))
                return
            }
        })
        self.task?.resume()
    }
    
    public func cancel() {
        self.task?.cancel()
    }
    
    public func prepare(request : Request) throws -> URLRequest{
        //1. format the endpoint url using host url and path
        let fullUrl = "\(environment.host)/\(request.path)"
        
        //2. create an api request object with the url
        var apiRequest = URLRequest(url: URL(string: fullUrl)!)
        
        //3. set api request parameters either as body or as query params
        switch request.parameters {
        case .body(let params):
            if let params = params as? [String : String] {
                let body = try? JSONEncoder().encode(params)
                apiRequest.httpBody = body
            } else {
                throw NetworkErrors.badInput
            }
        case .url(let params):
            if let params = params as? [String : String] {
                let queryParams = params.map { pair  in
                    return URLQueryItem(name: pair.key, value: pair.value)
                }
                guard var components = URLComponents(string: fullUrl) else {
                    throw NetworkErrors.badInput
                }
                components.queryItems = queryParams
                apiRequest.url = components.url
            } else {
                throw NetworkErrors.badInput
            }
        }
        
        //4. set api request header using common enviorment header parameters and specific request parameters
        self.environment.headers.forEach { apiRequest.addValue($0.value as! String, forHTTPHeaderField: $0.key) }
        request.headers?.forEach { apiRequest.addValue($0.value as! String, forHTTPHeaderField: $0.key) }
        
        //5. set api request http method
        apiRequest.httpMethod = request.method.rawValue
        return apiRequest
    }
}
