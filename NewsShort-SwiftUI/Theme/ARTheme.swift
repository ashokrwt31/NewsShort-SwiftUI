//
//  ARTheme.swift
//  NewsShort-SwiftUI
//
//  Created by Ashok Rawat on 07/12/22.
//

import Foundation
import UIKit

enum ARThemeType: Int, CaseIterable {
    
    case None
    case light
    case dark
    case green
    
    var stringValue: String {
        switch self {
        case .None:
            return "Default"
        case .light:
            return "Light"
        case .dark:
            return "Dark"
        case .green:
            return "Green"
        }
    }
    
    init?(rawValue: String) {
        switch rawValue {
        case "Light":
            self = .light
        case "Dark":
            self = .dark
        case "Default":
            self = .None
        case "Green":
            self = .green
        default:
            return nil
        }
    }
}

protocol ARTheme {
    var primaryColor: UIColor { get }
    var secondaryColor: UIColor { get }
    var labelColor: UIColor { get }
    var buttonBgColor: UIColor { get }
    var buttonFgColor: UIColor { get }
    var viewBorderColor: UIColor { get }
    var viewShadowColor: UIColor { get }
    var buttonSelectedColor: UIColor { get }
    var tabBarIconColor: UIColor { get }
    var tabBarBgColor: UIColor { get }
    var navBarBgColor: UIColor { get }
    var modelBackGroundColor: UIColor { get }
    var themeName: String { get }
    
    
}

protocol ARFontProtocol {
    var titleFont: ARAppFont { get }
    var subTitleFont: ARAppFont { get }
}
