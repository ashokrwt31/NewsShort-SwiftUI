//
//  ARCustomFontWeight.swift
//  NewsShort
//
//  Created by Ashok Rawat on 03/11/22.
//

import Foundation
import UIKit
import SwiftUI


//struct ARFontWeight: Codable, Hashable {
//    var fontWeight: UIFont.Weight
//
//    enum CodingKeys: String, CodingKey {
//           case fontWeight
//        }
//
//    init(from decoder: Decoder) throws {
//
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        self.fontWeight = try values.decode(UIFont.Weight.self, forKey: .fontWeight)
//    }
//}


protocol ARFontFamily {
 var value: String { get }

}
typealias ARAppFont = Font

enum ARFontWeightType: String, ARFontFamily, CaseIterable {
    
    case regular = "Regular"
    case bold = "Bold"
    case light = "Light"
    case semiBold = "SemiBold"
    case medium = "Medium"
    
    static let allValues = [regular, bold, light, semiBold, medium]
    
    
    init?(id : Int) {
            switch id {
            case 0:
                self = .regular
            case 1:
                self = .bold
            case 2:
                self = .light
            case 3:
                self = .semiBold
            case 4:
                self = .medium
            default:
                return nil
            }
        }
    
    var value: String {
        switch self {
        case .regular: return "Regular"
        case .bold: return "Bold"
        case .light: return "Light"
        case .semiBold: return "SemiBold"
        case .medium: return "Medium"
        }
    }
    
    var toFontWeight: UIFont.Weight {
        switch self {
        case .light:
            return .light
        case .regular:
            return .regular
        case .bold:
            return .bold
        case .medium:
            return .medium
        case .semiBold:
            return .semibold
        }
    }
}


struct ARFontWeight: Codable, Hashable {
    var fontWeight: String
    var indexValue: Int
}

extension ARAppFont {
    
    static func subTitleFont(with size: CGFloat = 12)  -> ARAppFont {
        return Font(UIFont.systemFont(ofSize: UserDefaults.appSubTitleFontSize, weight: ARFontWeightType(id: UserDefaults.appSubTitleWeight.indexValue)?.toFontWeight ?? .bold))
    }
    
    static func titleFont(with size: CGFloat = 16)  -> ARAppFont {
        return Font(UIFont.systemFont(ofSize: UserDefaults.appTitleFontSize, weight: ARFontWeightType(id: UserDefaults.appTitleWeight.indexValue)?.toFontWeight ?? .regular))
    }
}

