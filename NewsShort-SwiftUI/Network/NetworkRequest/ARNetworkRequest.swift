//
//  ARNetworkRequest.swift
//  PhotoApp
//
//  Created by Ashok Rawat on 27/10/22.
//

import Foundation

enum RequestType: String {
    case GET
    case POST
}

protocol ARRequestProtocol {
    func perform<T: Codable>(_ request: ARNetworkRequestProtocol) async throws -> T
}

struct ARNetworkRequest {
    let networkManagerProtocol: ARNetworkManagerProtocol
    
    init(networkManagerProtocol: ARNetworkManagerProtocol = ARNetworkManager()) {
        self.networkManagerProtocol = networkManagerProtocol
    }
}

extension ARNetworkRequest: ARRequestProtocol {
    func perform<T: Codable>(_ request: ARNetworkRequestProtocol) async throws -> T {
        do {
            let data = try await networkManagerProtocol.perform(request, authToken: "")
            print(T.self)
            let decodedResponse = try jsonDecoder.decode(T.self, from: data)
            return decodedResponse
        } catch {
            throw error
        }
    }
}


let jsonDecoder: JSONDecoder = {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    return decoder
}()
