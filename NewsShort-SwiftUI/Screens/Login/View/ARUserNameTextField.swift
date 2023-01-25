//
//  ARUserNameTextField.swift
//  NewsShort-SwiftUI
//
//  Created by Ashok Rawat on 05/12/22.
//

import SwiftUI

struct ARUserNameTextField: View {
    @Binding var username: String
    @EnvironmentObject var dataSource: ARDataSource
    
    var body: some View {
        return TextField("Username", text: $username)
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 10).strokeBorder(Color(dataSource.selectedTheme.viewBorderColor), lineWidth: 2))
    }
}

#if DEBUG
struct ARUserNameTextField_Previews: PreviewProvider {
    @State static var username: String = "username"
    static var previews: some View {
        ARUserNameTextField(username: $username)
    }
}
#endif
