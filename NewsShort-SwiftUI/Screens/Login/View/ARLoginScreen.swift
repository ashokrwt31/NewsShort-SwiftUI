//
//  ARLoginScreen.swift
//  NewsShort-SwiftUI
//
//  Created by Ashok Rawat on 02/12/22.
//

import SwiftUI

enum LoginScreenType: String {
    case Login = "Login"
    case ForgotPassword = "Forgot Password"
    case SignUp = "Signup"
}

struct ARLoginScreen: View {
    @State var username: String = ""
    @State var password: String = ""
    
    @EnvironmentObject var loginScreenSelected: LoginScreenSelected
    @EnvironmentObject var dataSource: ARDataSource
    
    var body: some View {
        
        ZStack {
            ScrollView (.vertical, showsIndicators: false) {
                VStack (alignment: .center) {
                    Image("app_logo")
                        .resizable()
                        .scaledToFit()
                    //                    .offset(x: 10.0, y: -UIScreen.main.bounds.height / 4)
                    
                    HStack(alignment: .top) {
                        Spacer()
                        VStack(alignment: .center) {
                            HStack {
                                if !loginScreenSelected.errorMessage.isEmpty {
                                    Text(loginScreenSelected.errorMessage)
                                        .foregroundColor(Color.red)
                                        .font(dataSource.selectedSubTitleFont)
                                        .padding(.leading, 5)
                                    Spacer()
                                }
                            }
                            switch loginScreenSelected.loginScreenType {
                            case .Login:
                                ARLogin(username: $username, password: $password)
                            case .SignUp:
                                ARSignUp(username: $username, password: $password)
                            case .ForgotPassword:
                                ARForgotPasswordView(username: $username, password: $password)
                                
                            }
                        }
                        .padding([.leading, .trailing],20)
                        .padding([.top, .bottom],40)
                        .background(Rectangle().fill(Color.white))
                        .cornerRadius(10)
                        .shadow(color: .gray, radius: 3, x: 1, y: 1)
                        Spacer()
                    }
                }
                .padding(.top, 70)
            }
            .frame(maxHeight: .infinity)
            .onAppear {
                UIScrollView.appearance().bounces = false
            }
        }
    }
}

struct ARLoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        ARLoginScreen()
    }
}



class LoginScreenSelected: ObservableObject {
    @Published var loginScreenType = LoginScreenType.Login
    @Published var errorMessage = ""
    @Published var userAuthenticate: Bool = UserDefaults.appLoginUserAuthentic
    
}

class ScreenSelected: ObservableObject {
   
}

