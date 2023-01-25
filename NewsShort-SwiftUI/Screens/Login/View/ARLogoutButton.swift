//
//  ARLogoutButton.swift
//  NewsShort-SwiftUI
//
//  Created by Ashok Rawat on 02/12/22.
//

import SwiftUI

struct ARLogoutButton: View {
    @EnvironmentObject var loginScreenSelected: LoginScreenSelected
    @EnvironmentObject var dataSource: ARDataSource
    @EnvironmentObject var appState: AppState
    @State private var isAlert = false
    @Environment(\.dismiss) var dismiss
    @Environment(\.presentationMode) var presentationMode

    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Button(action: {
                    self.isAlert = true
                }) {
                    Image(systemName: "person.crop.circle").imageScale(.large)
                }
                .alert(isPresented: $isAlert) { () -> Alert in
                    Alert(title: Text("Alert!"),
                          message: Text("You have been alerted.\nThank you"),
                          primaryButton: .default(Text("OK")),
                          secondaryButton: .cancel(Text("Cancel")))
                }
//                .alert(isPresented: $isAlert) { () -> Alert in
//                    Alert(title: Text("Alert!"), message: Text("Do you want to logout."), primaryButton: .default(Text("OK"), action: {
//                        UserDefaults.appLoginUserAuthentic = false
//                        loginScreenSelected.userAuthenticate = false
//                        loginScreenSelected.errorMessage = ""
//                        loginScreenSelected.loginScreenType = .Login
//                    }), secondaryButton: .default(Text("Cancel")){
//                        self.isAlert = false
//                        self.presentationMode.wrappedValue.dismiss()
////                        dismiss()
////                        self.presentationMode.wrappedValue.dismiss()
//                    })}
                .foregroundColor(Color(dataSource.selectedTheme.buttonFgColor))
                .onAppear() {
                    UIView.appearance(whenContainedInInstancesOf: [UIAlertController.self]).tintColor = dataSource.selectedTheme.primaryColor
                }
            }
            Spacer()
        }
    }
}

struct ARLogoutButton_Previews: PreviewProvider {
    static var previews: some View {
        ARLogoutButton()
    }
}
