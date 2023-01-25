//
//  ARHomeRequest.swift
//  PhotoApp
//
//  Created by Ashok Rawat on 28/10/22.
//

import Foundation

struct ARNewsListRequest: ARNetworkRequestProtocol {
    var addAuthToken: Bool
    
    var selectedCategory: String = ""
    
    var requestType: RequestType {
        .GET
    }
    
    var urlParams: [String: String?]  {
        [ARAPIKey.categoryKey: selectedCategory]
    }
    
    init(addAuthToken: Bool) {
        self.addAuthToken = addAuthToken
    }
    
    mutating func updateSelectedCategory(_ selectedCategory: String) {
        self.selectedCategory = selectedCategory
    }
}
