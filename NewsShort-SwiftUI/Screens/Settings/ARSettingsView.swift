//
//  ARSettingsView.swift
//  NewsShort-SwiftUI
//
//  Created by Ashok Rawat on 25/11/22.
//

import SwiftUI

struct ARSettingsView: View {
    @EnvironmentObject var dataSource: ARDataSource
    @State private var titleFont: Double = UserDefaults.appTitleFontSize
    @State private var subTitleFont: Double = UserDefaults.appSubTitleFontSize
    @State private var titleFontWeight = UserDefaults.appTitleWeight.indexValue
    @State private var subTitleFontWeight = UserDefaults.appSubTitleWeight.indexValue
    
    var body: some View {
        
        ZStack(alignment: .top) {
            ScrollView (.vertical, showsIndicators: false) {
                VStack {
                    
                    ARSettingSliderView(sliderTitle: "Title Size",minValue: 12, maxValue: 24, value: $titleFont )
                        .onChange(of: titleFont) { _ in
                            UserDefaults.appTitleFontSize = titleFont
                            dataSource.fontSelectedChange = true
                    }
                    
                    ARSettingSegmentView(fontWeight: $titleFontWeight, segmentTitle: "Title Weight")
                        .onChange(of: titleFontWeight) { _ in
                            print(titleFontWeight)
                            UserDefaults.appTitleWeight = ARFontWeight(fontWeight: ARFontWeightType(id: titleFontWeight)?.rawValue ?? "Bold", indexValue: titleFontWeight)
                            dataSource.fontSelectedChange = true
                        }
                    
                    ARSettingSliderView(sliderTitle: "Subtitle Size",minValue: 8, maxValue: 16, value: $subTitleFont)
                        .onChange(of: subTitleFont) { _ in
                            UserDefaults.appSubTitleFontSize = subTitleFont
                            dataSource.fontSelectedChange = true
                        }
                    
                    ARSettingSegmentView(fontWeight: $subTitleFontWeight, segmentTitle: "Subtitle Weight").onChange(of: subTitleFontWeight) { _ in
                        UserDefaults.appSubTitleWeight = ARFontWeight(fontWeight: ARFontWeightType(id: subTitleFontWeight)?.rawValue ?? "Regular", indexValue: subTitleFontWeight)
                        dataSource.fontSelectedChange = true
                    }
                    
                    ARThemeListView().background(Color.red)
                    VStack {
                        ARLogoutButton().background(Color.gray).frame(height: 100)
                    }
                }
                .padding(.top, 40)
                .padding([.leading,.trailing], 15)
                .onAppear() {
                    UISegmentedControl.appearance().selectedSegmentTintColor = .blue
                    UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
                    UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(Color(dataSource.selectedTheme.secondaryColor))], for: .normal)
                }
            }
        }
    }
}

struct ARSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        ARSettingsView()
    }
}


extension Double {
     var int: Int {
         get { Int(self) }
         set { self = Double(newValue) }
     }
 }


// TextField("Sub Title Font", value: self.$subTitleFont, formatter: NumberFormatter())

