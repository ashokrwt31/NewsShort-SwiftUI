//
//  ARThemeLight.swift
//  NewsShort-SwiftUI
//
//  Created by Ashok Rawat on 07/12/22.
//

import Foundation
import UIKit

struct ARThemeLight: ARTheme {
    
    var buttonBgColor: UIColor = UIColor(named: "LightTheme-ButtonBgColor")!
    
    var buttonFgColor: UIColor = UIColor(named: "LightTheme-ButtonFgColor")!
    
    var viewBorderColor: UIColor = UIColor(named: "LightTheme-ViewBorderColor")!
     
    var viewShadowColor: UIColor = UIColor(named: "LightTheme-ViewShadowColor")!
    
    var buttonSelectedColor: UIColor = UIColor(named: "LightTheme-NavBarBgColor")!
    
    var tabBarIconColor: UIColor = UIColor(named: "LightTheme-TabBarIconColor")!
    
    var tabBarBgColor: UIColor = UIColor(named: "LightTheme-TabBarBgColor")!
    
    var navBarBgColor: UIColor = UIColor(named: "LightTheme-NavBarBgColor")!
    
    var primaryColor: UIColor = UIColor(named: "LightTheme-PrimaryColor")!
    
    var secondaryColor: UIColor = UIColor(named: "LightTheme-SecondaryColor")!
    
    var labelColor: UIColor = UIColor(named: "LightTheme-LabelColor")!
    
    var modelBackGroundColor: UIColor = UIColor(named: "LightTheme-ModelBackGroundColor")!
    
    var themeName: String = "Blue"
    
}

struct ARThemeFont: ARFontProtocol {
    var titleFont: ARAppFont = ARAppFont.titleFont()
    var subTitleFont: ARAppFont = ARAppFont.subTitleFont()
}
