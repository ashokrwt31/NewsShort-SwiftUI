//
//  ARNewsListView.swift
//  NewsShort-SwiftUI
//
//  Created by Ashok Rawat on 29/11/22.
//

import SwiftUI

struct ARNewsListView: View {
    @State var category: String
    @State var isShowLoader: Bool = true
    
    @StateObject private var newsListViewModel = ARNewsListViewModel()
    @EnvironmentObject var dataSource: ARDataSource
    
    
//    var body: some View {
//            LoadingView(isShowing: .constant(true)) {
//                NavigationView {
//                    List(["1", "2", "3", "4", "5"], id: \.self) { row in
//                        Text(row)
//                    }.navigationBarTitle(Text("A List"), displayMode: .large)
//                }
//            }
//        }
    
    var body: some View {
        LoadingView(isShowing: .constant(isShowLoader)) {
            VStack(alignment: .leading) {
                ZStack {
                    ARActivityIndicatorView(animate: isShowLoader)
                    List {
                        
                        ForEach(newsListViewModel.newsList, id: \.self) { news in
                            ZStack(alignment: .leading) {
                                NavigationLink {
                                    ARNewsDetail(newsData: news, categoty: category.capitalized)
                                } label: {
                                    ARNewsView(newsData: news)
                                }
                                .navigationBarTitle(category.capitalized, displayMode: .inline).foregroundColor(Color(dataSource.selectedTheme.buttonFgColor))
                                .navigationViewStyle(StackNavigationViewStyle())
                            }
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color.white)
                        }
                    }
                    .task {
                        if isShowLoader {
                            newsListViewModel.updateSelectedCategory(category)
                            await newsListViewModel.getNewsListFromServer()
                            isShowLoader = false
                        }
                    }
                }
                
            }
        }
        .onAppear() {
        print("lisrt view")
        }
        .navigationBarItems(trailing: ARLogoutButton())
    }
}

struct ARNewsListView_Previews: PreviewProvider {
    static var previews: some View {
        ARNewsListView(category: "Test")
    }
}


struct LoadingView<Content>: View where Content: View {
    @EnvironmentObject var dataSource: ARDataSource
    @Binding var isShowing: Bool
    var content: () -> Content

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {

                self.content()
                    .disabled(self.isShowing)
                    .blur(radius: self.isShowing ? 3 : 0)

                VStack {
                    Text("Loading...").foregroundColor(Color(dataSource.selectedTheme.primaryColor))
                    ActivityIndicator(isAnimating: .constant(true), style: .large, color: dataSource.selectedTheme.primaryColor)
                }
                .frame(width: geometry.size.width / 2,
                       height: geometry.size.height / 5)
                .background(Color.secondary.colorInvert())
                .foregroundColor(Color.primary)
                .cornerRadius(20)
                .opacity(self.isShowing ? 1 : 0)

            }
        }
        .onAppear(){
            dataSource.screenType = .Detail
        }
    }

}

struct ActivityIndicator: UIViewRepresentable {

    @Binding var isAnimating: Bool
    let style: UIActivityIndicatorView.Style
    let color: UIColor

    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        let activityView = UIActivityIndicatorView(style: style)
        activityView.color = color
        return activityView
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}
