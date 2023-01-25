//
//  ARNetworkRequestProtocol.swift
//  PhotoApp
//
//  Created by Ashok Rawat on 27/10/22.
//

import Foundation

protocol ARNetworkRequestProtocol {
    
    var path: String { get }
    
    var headers: [String: String] { get }
    
    var params: [String: Any] { get }
    
    var urlParams: [String: String?] { get }
    
    var addAuthToken: Bool { get }
    
    var requestType: RequestType { get }
    
    var host: String  { get }
}

extension ARNetworkRequestProtocol {
    var host: String  {
        ARAPI.baseURL!
    }
    
    var path: String {
        "/news"
    }
    
    var addAuthToken: Bool {
        true
    }
    
    var params: [String: Any] {
        [:]
      }
    
    var urlParams: [String: String?] {
        [:]
      }

      var headers: [String: String] {
        [:]
      }
}

extension ARNetworkRequestProtocol {
    
    func createURLRequest(authToken: String) throws -> URLRequest {
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = host
        components.path = path
        
        if !urlParams.isEmpty {
            components.queryItems = urlParams.map {
                URLQueryItem(name: $0, value: $1)
            }
            components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
        }
        print(components.url ?? "nil url")
        guard let url = components.url else {
            throw ARNetworkError.invalidUrl
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = requestType.rawValue
        
        if !headers.isEmpty {
            request.allHTTPHeaderFields = headers
        }
        
        if addAuthToken {
            request.setValue(authToken, forHTTPHeaderField: "Authorization")
        }
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if !params.isEmpty {
            request.httpBody = try JSONSerialization.data(withJSONObject: params)
        }
        return request
    }
}
