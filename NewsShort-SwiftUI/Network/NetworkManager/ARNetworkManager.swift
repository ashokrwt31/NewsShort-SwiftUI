//
//  ARNetworkManager.swift
//  PhotoApp
//
//  Created by Ashok Rawat on 27/10/22.
//

import Foundation

protocol ARNetworkManagerProtocol {
    func perform(_ request: ARNetworkRequestProtocol, authToken: String) async throws -> Data
}

struct ARNetworkManager {
    private let urlSession: URLSession
    
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
}

extension ARNetworkManager: ARNetworkManagerProtocol {
    func perform(_ request: ARNetworkRequestProtocol, authToken: String) async throws -> Data {
        let (data, response) = try await urlSession.data(for: request.createURLRequest(authToken: authToken))
        guard let res = response as? HTTPURLResponse, res.statusCode == 200 else {
            throw ARNetworkError.invalidServerResponse
        }
        return data
    }
}
