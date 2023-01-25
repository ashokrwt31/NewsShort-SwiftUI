//
//  ARThemeListView.swift
//  NewsShort-SwiftUI
//
//  Created by Ashok Rawat on 06/12/22.
//

import SwiftUI

struct ARThemeListView: View {
    @EnvironmentObject var dataSource: ARDataSource
    @State private var selectedItem: String = UserDefaults.appSelectedTheme
    
        var body: some View {
            VStack(alignment: .leading) {
                List {
                    Section(header: Text("Theme")) {
                        ForEach(ARThemeType.allCases, id: \.self) { theme in
                            SelectedRow(title: theme.stringValue, selectedItem: $selectedItem)
                        }
                    }
                    .headerProminence(.increased)
                }
                .listStyle(.grouped)
                .frame(width: UIScreen.main.bounds.width - 30, height: CGFloat(ARThemeType.allCases.count * 43) + 48, alignment: .center)
                .scrollIndicators(.hidden)
                .scrollDisabled(true)
            }
        }
    }

struct ARThemeListView_Previews: PreviewProvider {
    static var previews: some View {
        ARThemeListView()
    }
}


struct SelectedRow: View {
    let title: String
    @Binding var selectedItem: String
    @EnvironmentObject var dataSource: ARDataSource
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(Color(dataSource.selectedTheme.primaryColor))
                .font(dataSource.selectedSubTitleFont)
            Spacer()
            if title == selectedItem {
                Image(systemName: "checkmark")
                    .foregroundColor(.black)
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            self.selectedItem = self.title
            dataSource.selectedThemeAS = ARThemeType(rawValue: self.title)?.rawValue ?? 0
            UserDefaults.appSelectedTheme = self.title
            self.appState.reloadDashboard()
        }
    }
}
