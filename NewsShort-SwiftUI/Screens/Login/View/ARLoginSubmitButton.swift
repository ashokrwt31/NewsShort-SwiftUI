//
//  ARLoginSubmitButton.swift
//  NewsShort-SwiftUI
//
//  Created by Ashok Rawat on 05/12/22.
//

import SwiftUI

struct ARLoginSubmitButton: View {
    @Binding var username: String
    @Binding var password: String
    @State var isShowLoader: Bool = false
    
    @EnvironmentObject var loginScreenSelected: LoginScreenSelected
    @EnvironmentObject var dataSource: ARDataSource
    
    func updateLoginPassword()  {
        switch loginScreenSelected.loginScreenType {
        case .Login: checkLoginSuccess()
        case .ForgotPassword: checkForgotPasswordChange()
        case .SignUp: checkSignUpSuccess()
        }
    }
        
        func checkLoginSuccess() {
            isShowLoader = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                if self.username == UserDefaults.appLoginUserName && self.password == UserDefaults.appLoginPasswod {
                    isShowLoader = false
                    loginScreenSelected.errorMessage = ""
                    loginScreenSelected.userAuthenticate = true
                    UserDefaults.appLoginUserAuthentic = loginScreenSelected.userAuthenticate
                    return
                }
                isShowLoader = false
                loginScreenSelected.errorMessage = "Information not correct! Please try again."
            }
        }
        
        func checkForgotPasswordChange() {
            if self.password.isEmpty {
                loginScreenSelected.errorMessage = "Please enter new password!"
                return
            }
            UserDefaults.appLoginPasswod = self.password
            loginScreenSelected.loginScreenType = .Login
            loginScreenSelected.errorMessage = ""
            password = ""
        }
    
        func checkSignUpSuccess() {
            if self.password.isEmpty && self.username.isEmpty {
                loginScreenSelected.errorMessage = "Please enter correct information!"
                return
            }
            UserDefaults.appLoginUserName = self.username
            UserDefaults.appLoginPasswod = self.password
            loginScreenSelected.loginScreenType = .Login
            loginScreenSelected.errorMessage = ""
            username = ""
            password = ""
        }
    
    var body: some View {
        return Button(action: {
            updateLoginPassword()
        }) {
            ZStack {
                Text(loginScreenSelected.loginScreenType.rawValue)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .font(dataSource.selectedTitleFont)
                    .padding()
                    .foregroundColor(Color(dataSource.selectedTheme.buttonFgColor))
                    .overlay(RoundedRectangle(cornerRadius: 10).strokeBorder(Color(dataSource.selectedTheme.viewBorderColor), lineWidth: 2))
                if isShowLoader && loginScreenSelected.loginScreenType == .Login {
                    ARActivityIndicatorView(animate: true)
                }
            }
        }
        .disabled(isShowLoader)
        .background(Color(dataSource.selectedTheme.buttonBgColor))
        .cornerRadius(10)
    }
}

#if DEBUG
struct ARLoginSubmitButton_Previews: PreviewProvider {
    @State static var username: String = "username"
    @State static var password: String = "password"
    static var previews: some View {
        ARLoginSubmitButton(username: $username, password: $password)
    }
}
#endif
