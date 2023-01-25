//
//  ARSettingSliderView.swift
//  NewsShort-SwiftUI
//
//  Created by Ashok Rawat on 06/12/22.
//

import SwiftUI

struct ARSettingSliderView: View {
    @EnvironmentObject var dataSource: ARDataSource
     var sliderTitle: String = ""
     var minValue: Double = 80
     var maxValue: Double = 30
    
    @Binding var value: Double
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack{
                Slider(value: $value, in: minValue...maxValue) {
                }
            minimumValueLabel: {
                Text("\(minValue.int)").font(.subheadline).fontWeight(.semibold)
            } maximumValueLabel: {
                Text("\(maxValue.int)").font(.subheadline).fontWeight(.semibold)
            }
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.blue, lineWidth: 2)
            )
                VStack(alignment: .leading) {
                    HStack {
                        Text(sliderTitle)
                            .font(.system(size: 16, weight: .bold))
                        Text("\(value.int)")
                            .foregroundColor(Color(dataSource.selectedTheme.primaryColor))
                            .font(.system(size: 16, weight: .bold))
                    }
                    .padding([.leading,.trailing], 10)
                    .background(Color.white)
                }
                .padding(.leading, -160)
                .padding(.top, -42)
            }
        }
        .padding(.bottom, 10)
        
        Divider()
        .padding(.bottom, 10)
    }
}

struct ARSettingSliderView_Previews: PreviewProvider {
    @State static private var value: Double = 10.0
    static var previews: some View {
        ARSettingSliderView(value: $value)
    }
}
