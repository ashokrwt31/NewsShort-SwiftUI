//
//  ARActivityIndicatorView.swift
//  NewsShort-SwiftUI
//
//  Created by Ashok Rawat on 30/11/22.
//

import SwiftUI

struct ARActivityIndicatorView: View {
    @EnvironmentObject var dataSource: ARDataSource
    @State var animate = false
    
    let style = StrokeStyle(lineWidth: 6, lineCap: .round)
    
    func getColor() -> [Color] {
        return [Color.red]// [Color(dataSource.selectedTheme.primaryColor)]
    }
    
    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0, to: 0.2)
                .stroke(AngularGradient(gradient: .init(colors: [.green]), center: .center), style: style)
                .rotationEffect(Angle(degrees: animate ? 360 : 0))
                .animation(Animation.linear(duration: 0.7).repeatForever().repeatForever(autoreverses: false))

            Circle()
                .trim(from: 0.5, to: 0.7)
                .stroke(AngularGradient(gradient: .init(colors: [.green]), center: .center), style: style)
                .rotationEffect(Angle(degrees: animate ? 360 : 0))
                .animation(Animation.linear(duration: 0.7).repeatForever().repeatForever(autoreverses: false))
        }.onAppear() {
            self.animate.toggle()
        }
        .frame(width: 50, height: 50)
    }
}

extension View {
    @ViewBuilder func hidden(_ shouldHide: Bool) -> some View {
        switch shouldHide {
        case true: self.hidden()
        case false: self
        }
    }
}

//struct ARActivityIndicatorView_Previews: PreviewProvider {
//    static var previews: some View {
////        ARActivityIndicatorView()
//    }
//}



struct LoaderView: View {
    var tintColor: Color = .blue
    var scaleSize: CGFloat = 1.0
    
    var body: some View {
        ProgressView()
            .scaleEffect(scaleSize, anchor: .center)
            .progressViewStyle(CircularProgressViewStyle(tint: tintColor))
    }
}

extension View {
    @ViewBuilder func hidden1(_ shouldHide: Bool) -> some View {
        switch shouldHide {
        case true: self.hidden()
        case false: self
        }
    }
}
