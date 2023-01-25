//
//  ARPasswordTextField.swift
//  NewsShort-SwiftUI
//
//  Created by Ashok Rawat on 05/12/22.
//

import SwiftUI

struct ARPasswordTextField: View {
    @Binding var password: String
    @EnvironmentObject var dataSource: ARDataSource
    
    var body: some View {
        return SecureField("Password", text: $password)
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 10).strokeBorder(Color(dataSource.selectedTheme.viewBorderColor), lineWidth: 2))
    }
}

#if DEBUG
struct ARPasswordTextField_Previews: PreviewProvider {
    @State static var password: String = "password"
    static var previews: some View {
        ARPasswordTextField(password: $password)
    }
}
#endif
