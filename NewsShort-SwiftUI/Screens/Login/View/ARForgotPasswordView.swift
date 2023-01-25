//
//  ARForgotPasswordView.swift
//  NewsShort-SwiftUI
//
//  Created by Ashok Rawat on 05/12/22.
//

import SwiftUI

struct ARForgotPasswordView: View {
    @Binding var username: String
    @Binding var password: String
    var body: some View {
        VStack {
            ARPasswordTextField(password: $password)
            ARLoginSubmitButton(username: $username, password: $password)
            ARLoginSelectionView()
        }
        .transition(.asymmetric(insertion: .scale, removal: .opacity).animation(.easeInOut(duration: 0.3)))
    }
}

#if DEBUG
struct ARForgotPasswordView_Previews: PreviewProvider {
    @State static var username: String = "username"
    @State static var password: String = "password"
    static var previews: some View {
        ARForgotPasswordView(username: $username, password: $password)
    }
}
#endif
