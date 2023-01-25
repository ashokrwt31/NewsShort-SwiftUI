//
//  ARLoginSelectionView.swift
//  NewsShort-SwiftUI
//
//  Created by Ashok Rawat on 05/12/22.
//

import SwiftUI

struct ARLoginSelectionView: View {
    @EnvironmentObject var loginScreenSelected: LoginScreenSelected
    @EnvironmentObject var dataSource: ARDataSource
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Button(action: {
                    loginScreenSelected.loginScreenType = .Login
                    loginScreenSelected.errorMessage = ""
                }) {
                    Text("Login")
                        .font(dataSource.selectedSubTitleFont)
                        .foregroundColor(Color(dataSource.selectedTheme.buttonBgColor))
                }
            }
            .padding(.leading, 10)
            Spacer()
        }
    }
}

#if DEBUG
struct ARLoginSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        ARLoginSelectionView()
    }
}
#endif
