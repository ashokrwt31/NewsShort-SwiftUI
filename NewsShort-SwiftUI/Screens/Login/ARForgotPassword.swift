//
//  ARForgotPassword.swift
//  NewsShort-SwiftUI
//
//  Created by Ashok Rawat on 02/12/22.
//

import SwiftUI

struct ARForgotPassword: View {
    @State private var password: String = ""
    @EnvironmentObject var dataSource: ARDataSource
    
    var body: some View {
        HStack {
            Spacer()
            VStack {
                SecureField("enter new password", text: $password)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 10).strokeBorder(.blue, lineWidth: 2))
                Button(action: {
                    
                }) {
                    Text("Change Password")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .font(dataSource.selectedSubTitleFont)
                        .padding()
                        .foregroundColor(.white)
                        .overlay(RoundedRectangle(cornerRadius: 10).strokeBorder(Color(dataSource.selectedTheme.viewBorderColor), lineWidth: 2))
                    
                }
                .background(Color.blue)
                .cornerRadius(10)
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

struct ARForgotPassword_Previews: PreviewProvider {
    static var previews: some View {
        ARForgotPassword()
    }
}
