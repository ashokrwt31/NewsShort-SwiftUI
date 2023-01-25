//
//  ARCategoryList.swift
//  NewsShort-SwiftUI
//
//  Created by Ashok Rawat on 25/11/22.
//

import SwiftUI

struct ARCategoryListView: View {
    @State private var viewModel = ARCategoryViewModel().getCategories()
    @EnvironmentObject var dataSource: ARDataSource
    
    var body: some View {
        List(viewModel.category, id: \.self) { category in
            NavigationLink {
                ARNewsListView(category: category)
            } label: {
                Text(category.capitalized)
                    .font(dataSource.selectedTitleFont)
                    .foregroundColor(Color(dataSource.selectedTheme.primaryColor))
            }
            .isDetailLink(false)
//            .navigationViewStyle(StackNavigationViewStyle())
        }
        .onAppear() {
            print("Category view")
//            dataSource.screenType = .Detail
        }
        
    }
}

struct ARCategoryListView_Previews: PreviewProvider {
    static var previews: some View {
        ARCategoryListView()
    }
}

