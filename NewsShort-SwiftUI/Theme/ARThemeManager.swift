//
//  ARThemeManager.swift
//  NewsShort-SwiftUI
//
//  Created by Ashok Rawat on 07/12/22.
//

import Foundation
import UIKit

enum ARThemeManager {
    static let themes: [ARTheme] = [ARThemeDefault(),ARThemeLight(), ARThemeBlue(), ARThemeGreen()]
    
    static func getTheme(_ theme: Int) -> ARTheme {
        Self.themes[theme]
    }
    
    static func getTitleFont() -> ARAppFont {
        return  ARThemeFont().titleFont
    }
    
    static func getSubTitleFont() -> ARAppFont {
        return  ARThemeFont().subTitleFont
    }
    
    static func navigationBarColors(background : UIColor?,
           titleColor : UIColor? = nil, tintColor : UIColor? = nil ){
            
            let navigationAppearance = UINavigationBarAppearance()
            navigationAppearance.configureWithOpaqueBackground()
            navigationAppearance.backgroundColor = background ?? .clear
            
            navigationAppearance.titleTextAttributes = [.foregroundColor: titleColor ?? .black]
            navigationAppearance.largeTitleTextAttributes = [.foregroundColor: titleColor ?? .black]
           
            UINavigationBar.appearance().standardAppearance = navigationAppearance
            UINavigationBar.appearance().compactAppearance = navigationAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = navigationAppearance

            UINavigationBar.appearance().tintColor = tintColor ?? titleColor ?? .black
        }
}
