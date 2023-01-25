//
//  ARUserDefault.swift
//  NewsShort-SwiftUI
//
//  Created by Ashok Rawat on 05/12/22.
//

import Foundation

@propertyWrapper
struct ARUserDefault<T: Codable> {
    let key: String
    let defaultValue: T
    
    init(key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    var wrappedValue: T {
        get {
            
            if let data = UserDefaults.standard.object(forKey: key) as? Data,
               let user = try? JSONDecoder().decode(T.self, from: data) {
                return user
                
            }
            
            return  defaultValue
        }
        set {
            if let encoded = try? JSONEncoder().encode(newValue) {
                UserDefaults.standard.set(encoded, forKey: key)
            }
        }
    }
}


extension UserDefaults {
    @ARUserDefault(key: "app_login_user_name", defaultValue: "1234")
    static var appLoginUserName: String
    
    @ARUserDefault(key: "app_login_user_password", defaultValue: "1234")
    static var appLoginPasswod: String
    
    @ARUserDefault(key: "app_login_user_authentic", defaultValue: false)
    static var appLoginUserAuthentic: Bool
    
    @ARUserDefault(key: "app_title_font_size", defaultValue: 17.0)
    static var appTitleFontSize: Double
    
    @ARUserDefault(key: "app_sub_title_font_size", defaultValue: 10.0)
    static var appSubTitleFontSize: Double
    
    @ARUserDefault(key: "app_title_weight", defaultValue: ARFontWeight(fontWeight: "Bold", indexValue: 1))
    static var appTitleWeight: ARFontWeight
    
    @ARUserDefault(key: "app_sub_title_weight", defaultValue: ARFontWeight(fontWeight: "Regular", indexValue: 0))
    static var appSubTitleWeight: ARFontWeight
    
    @ARUserDefault(key: "app_selected_theme", defaultValue: "Light")
    static var appSelectedTheme: String
}
