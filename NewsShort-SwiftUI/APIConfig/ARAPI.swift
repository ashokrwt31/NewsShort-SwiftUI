//
//  ARAPI.swift
//  AsyncAwaitPOC
//
//  Created by Ashok Rawat on 03/10/22.
//

import Foundation

enum ARAPI {
    static let baseURL = Bundle.infoPlistAPIValue(forKey: "baseURL", valueType: String.self)
    static let placeHolderImageURL = Bundle.infoPlistAPIValue(forKey: "placeHolderImageURL", valueType: String.self)
}

extension Bundle {
    static func infoPlistAPIValue<T>(forKey key: String, valueType: T.Type) ->
    T? {
        guard let path = Bundle.main.path(forResource: "ARAPIConfig", ofType: "plist"),
              let dict = NSDictionary(contentsOfFile: path),
              let value = dict.object(forKey: key) as? T else {
            return nil
        }
        return value
    }
}
