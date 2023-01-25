//
//  ARSignupForgotSelectionView.swift
//  NewsShort-SwiftUI
//
//  Created by Ashok Rawat on 05/12/22.
//

import SwiftUI

struct ARSignupForgotSelectionView: View {
    @EnvironmentObject var loginScreenSelected: LoginScreenSelected
    @EnvironmentObject var dataSource: ARDataSource
    
    var body: some View {
        HStack(alignment: .top) {
            Button(action: {
                loginScreenSelected.loginScreenType = .ForgotPassword
                loginScreenSelected.errorMessage = ""
            }) {
                Text("Forgot password")
                    .font(dataSource.selectedSubTitleFont)
                    .foregroundColor(Color(dataSource.selectedTheme.buttonBgColor))
            }
            
            Text("|")
                .font(dataSource.selectedSubTitleFont)
                .foregroundColor(Color(dataSource.selectedTheme.buttonBgColor))
            
            Button(action: {
                loginScreenSelected.loginScreenType = .SignUp
                loginScreenSelected.errorMessage = ""
            }) {
                Text("Signup")
                    .font(dataSource.selectedSubTitleFont)
                    .font(.system(size: 12))
                    .foregroundColor(Color(dataSource.selectedTheme.buttonBgColor))
            }
        }
    }
}

#if DEBUG
struct ARSignupForgotSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        ARSignupForgotSelectionView()
    }
}
#endif
