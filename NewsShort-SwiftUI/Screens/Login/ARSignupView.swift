//
//  ARSignupView.swift
//  NewsShort-SwiftUI
//
//  Created by Ashok Rawat on 02/12/22.
//

import SwiftUI

struct ARSignupView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var buttontTitle: String = "Login"
    
    var body: some View {
        HStack {
            Spacer()
            VStack(alignment: .center) {
                ARUserNameTextField(username: $username)
                ARPasswordTextField(password: $password)
//                LoginSubmitButton(buttonTitle: $buttontTitle)
            }
            .padding([.leading, .trailing],20)
            .padding([.top, .bottom],40)
            .background(Rectangle().fill(Color.white))
            .cornerRadius(10)
            .shadow(color: .gray, radius: 3, x: 1, y: 1)
            Spacer()
        }
    }
}

struct ARSignupView_Previews: PreviewProvider {
    static var previews: some View {
        ARSignupView()
    }
}

