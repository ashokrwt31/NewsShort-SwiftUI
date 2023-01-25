//
//  ARSettingSegmentView.swift
//  NewsShort-SwiftUI
//
//  Created by Ashok Rawat on 06/12/22.
//

import SwiftUI

struct ARSettingSegmentView: View {
    @EnvironmentObject var dataSource: ARDataSource
    @Binding var fontWeight: Int
    var segmentTitle: String = ""
    @State private var selection = 0
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(segmentTitle)
                .font(.system(size: 16, weight: .bold))
                .padding(.leading, 20)
                Picker(selection: $fontWeight, label: Text("Options")) {
                    ForEach(0 ..< ARFontWeightType.allValues.count, id: \.self) { index in
                        Text(ARFontWeightType.allValues[index].rawValue)
                        }
                    }
                .onAppear {
                    UISegmentedControl.appearance().selectedSegmentTintColor = dataSource.selectedTheme.secondaryColor
                }
                .pickerStyle(SegmentedPickerStyle())
                .foregroundColor(Color(dataSource.selectedTheme.primaryColor))
                .background(Color(dataSource.selectedTheme.viewShadowColor))
                .clipShape(RoundedRectangle(cornerRadius: 5, style: .circular))
                .mask(RoundedRectangle(cornerRadius: 5, style: .circular))
        }
        Divider()
            .padding(.bottom, 20)
    }
}

struct ARSettingSegmentView_Previews: PreviewProvider {
    @State static private var fontWeight: Int = 1
    static var previews: some View {
        ARSettingSegmentView(fontWeight: $fontWeight)
    }
}




