//
//  ARDataSource.swift
//  NewsShort-SwiftUI
//
//  Created by Ashok Rawat on 07/12/22.
//

import Foundation
import SwiftUI

class ARDataSource: ObservableObject, Equatable {
    static func == (lhs: ARDataSource, rhs: ARDataSource) -> Bool {
        return lhs.selectedTheme.themeName == rhs.selectedTheme.themeName
    }
    
    @Published var screenType = ScreenType.Home
    
    @Published var selectedTheme: ARTheme = ARThemeManager.getTheme(ARThemeType.init(rawValue: UserDefaults.appSelectedTheme)?.rawValue ?? 0)
    
    @Published var selectedTitleFont: ARAppFont = ARThemeManager.getTitleFont()
    
    @Published var selectedSubTitleFont: ARAppFont = ARThemeManager.getSubTitleFont()
    
    @AppStorage("selectedTheme") var selectedThemeAS = ARThemeType.init(rawValue: UserDefaults.appSelectedTheme)?.rawValue ?? 0 {
        didSet {
            updateTheme()
        }
    }
    
    @AppStorage("fontSelectedChange") var fontSelectedChange = false {
        didSet {
            updateFont()
        }
    }

    
    init() {
        updateTheme()
        updateFont()
    }
    
    func updateTheme() {
        selectedTheme = ARThemeManager.getTheme(selectedThemeAS)
    }
    
    func updateFont() {
        selectedTitleFont = ARThemeManager.getTitleFont()
        selectedSubTitleFont = ARThemeManager.getSubTitleFont()
    }
}
