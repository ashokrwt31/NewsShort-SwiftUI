//
//  ARLoginView.swift
//  NewsShort-SwiftUI
//
//  Created by Ashok Rawat on 02/12/22.
//

import SwiftUI

struct ARLoginView: View {
    @State private var userName: String = ""
    @State private var password: String = ""
    @State private var loginFields: [LoginField] = [
        LoginField(fieldName: "username", fieldValue: "", showError: false, errorMessage: ""),
        LoginField(fieldName: "password", fieldValue: "", showError: false, errorMessage: "")
    ]
    @State private var isLoginSuccess = false
    @State private var text: String = ""
    
    func checkLogin() -> Bool {
        var userValid = true
        var passwordValid = true
        var tempLoginFields = [LoginField]()
        loginFields.forEach { field in
            var field = field
            field.errorMessage = ""
            field.showError = false
            switch field.fieldName {
            case "username":
                field.fieldValue = userName
                
                if userName.isEmpty {
                    field.errorMessage = "Username is empty."
                    field.showError = true
                    
                } else if userName != "12345" {
                    field.errorMessage = "Username is incorrect."
                    field.showError = true
                }
                userValid = !field.showError
                tempLoginFields.append(field)
            case "password":
                field.fieldValue = password
                if password.isEmpty {
                    field.errorMessage = "Password is empty."
                    field.showError = true
                } else if password != "12345" {
                    field.errorMessage = "Password is incorrect."
                    field.showError = true
                }
                passwordValid = !field.showError
                tempLoginFields.append(field)
            default: break
            }
        }
        isLoginSuccess = userValid && passwordValid
        loginFields = tempLoginFields
        return isLoginSuccess
    }
    
    func getBindingValue(_ field: LoginField) -> Binding<String> {
        switch field.fieldName {
        case "username": return $userName
        case "password": return $password
        default: break
        }
        return $text
    }
    
    var body: some View {
        HStack {
            Spacer()
            VStack(alignment: .center) {
                ForEach(loginFields, id: \.self) { field in
                    if field.showError {
                        Text(field.errorMessage)
                    }
                    TextField("enter \(field.fieldName)", text: getBindingValue(field))
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 10).strokeBorder(.blue, lineWidth: 2))
                }
                
                Button(action: {
                    if checkLogin() {
                        userName = ""
                        password = ""
                    }
                }) {
                    Text("Login")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .font(.system(size: 25))
                        .padding()
                        .foregroundColor(.white)
                        .overlay(RoundedRectangle(cornerRadius: 10).strokeBorder(.gray, lineWidth: 2))
                    
                }
                .background(Color.blue)
                .cornerRadius(10)
                HStack(alignment: .top) {
                    Button(action: {
                    }) {
                        Text("Forgot password")
                            .font(.system(size: 12))
                    }
                    
                    Text("|")
                        .font(.system(size: 12))
                        .foregroundColor(Color.blue)
                    
                    Button(action: {
                    }) {
                        Text("Signup")
                            .font(.system(size: 12))
                    }
                    
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
}

struct ARLoginView_Previews: PreviewProvider {
    static var previews: some View {
        ARLoginView()
    }
}



struct LoginField: Hashable {
    var fieldName: String
    var fieldValue: String
    var showError: Bool
    var errorMessage: String

}
