//
//  NewsShort_SwiftUIApp.swift
//  NewsShort-SwiftUI
//
//  Created by Ashok Rawat on 25/11/22.
//

import SwiftUI

//@main
struct NewsShort_SwiftUIApp: View {
    @StateObject var loginScreenSelected = LoginScreenSelected()
    @EnvironmentObject var dataSource: ARDataSource
    @State var selectedScreen: ScreenType
    
    var body: some View {
        ARApplicationSwitcher(selectedScreen: selectedScreen)
            .environmentObject(loginScreenSelected)
            .environmentObject(ARDataSource())
            .onAppear() {
                print("Appeara NewsShort_SwiftUIApp")
            }
    }
    
//    var body: some Scene {
//        WindowGroup {
//            ARApplicationSwitcher()
//                .environmentObject(loginScreenSelected)
//                .environmentObject(ARDataSource())
//        }
//    }
}

class AppState: ObservableObject {
    func reloadDashboard() {
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.reloadDashboard()
    }
}
