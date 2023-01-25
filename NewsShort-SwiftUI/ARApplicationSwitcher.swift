//
//  ARApplicationSwitcher.swift
//  NewsShort-SwiftUI
//
//  Created by Ashok Rawat on 02/12/22.
//

import SwiftUI

struct ARApplicationSwitcher: View {
    @EnvironmentObject var loginScreenSelected: LoginScreenSelected
    @EnvironmentObject var dataSource: ARDataSource
    @State var selectedScreen: ScreenType
    
    var body: some View {
        VStack {
            if loginScreenSelected.userAuthenticate {
                ARHomeScreen(selectedScreen: selectedScreen)
            }
            else if !loginScreenSelected.userAuthenticate {
                ARLoginScreen()
            }
        }
        .onAppear() {
            print("Appeara ARApplicationSwitcher.....")
        }
    }
}

struct ARApplicationSwitcher_Previews: PreviewProvider {
    static var previews: some View {
        ARApplicationSwitcher(selectedScreen: .Home)
    }
}
