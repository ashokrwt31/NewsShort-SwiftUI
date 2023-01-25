//
//  ARHomeScreen.swift
//  NewsShort-SwiftUI
//
//  Created by Ashok Rawat on 25/11/22.
//

import SwiftUI

enum ScreenType: String {
    case Home
    case Setting
    case Profile
    case Detail
}

let coloredNavAppearance = UINavigationBarAppearance()

struct ARHomeScreen: View {
    
    @State var selectedScreen = ScreenType.Home
    @EnvironmentObject var dataSource: ARDataSource
    @State var isTabSelected = false

    
    func updateNavigationBarColor() {
        
//        UITabBar.appearance().backgroundColor = dataSource.selectedTheme.navBarBgColor
//        UITabBar.appearance().barTintColor = .red
//        let standardAppearance = UITabBarAppearance()
//
//        let itemAppearance = UITabBarItemAppearance()
//        itemAppearance.normal.iconColor = dataSource.selectedTheme.buttonFgColor
//        itemAppearance.selected.iconColor = dataSource.selectedTheme.buttonBgColor
//        itemAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: dataSource.selectedTheme.buttonFgColor, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14.0)]
//
//
//        itemAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: dataSource.selectedTheme.buttonBgColor, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14.0)]
//
//        standardAppearance.inlineLayoutAppearance = itemAppearance
//        standardAppearance.stackedLayoutAppearance = itemAppearance
//        standardAppearance.compactInlineLayoutAppearance = itemAppearance
//        UITabBar.appearance().standardAppearance = standardAppearance
    }
    
    var body: some View {
        NavigationView {
            TabView(selection: $selectedScreen) {
//                Group {
                    ARCategoryListView()
                        .tabItem {
                            Label("Home", systemImage: "house.fill")
                        }
                        .tag(ScreenType.Home)

                    ARSettingsView()
                        .tabItem {
                            Label("Setting", systemImage: "gear")
                        }
                        .tag(ScreenType.Setting)


                    ARProfileView()
                        .tabItem {
                            Label("Profile", systemImage: "person")
                            //                            .labelStyle(.iconOnly)
                        }
                        .tag(ScreenType.Profile)
                        .badge("New")
                }
//                .toolbar(.visible, for: .tabBar)
//                .toolbarBackground(Color(dataSource.selectedTheme.tabBarBgColor), for: .tabBar)
//                .toolbarColorScheme(.light, for: .tabBar)
            
            }
        
            .onAppear() {
//                updateNavigationBarColor()
//                dataSource.screenType = .Home
                print("screen \(selectedScreen)")
//            }
//            .accentColor(Color(dataSource.selectedTheme.accentColor))
//            .navigation(title: selectedScreen.rawValue, displayMode: .inline)
           
                    
        }
        
            

//        .navigationViewStyle(DefaultNavigationViewStyle())
//        .navigationViewStyle(StackNavigationViewStyle())
//        .edgesIgnoringSafeArea(.all)
//        .onReceive(dataSource.$selectedTheme, perform: { heading in
//            print("on receive \(heading)")
//            updateNavigationBarColor()
//        })
//        .navigationBarColor(backgroundColor: dataSource.selectedTheme.navBarBgColor, tintColor: .white)
//            .navigationBarItems(trailing: ARLogoutButton())
    }

}

struct ARHomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        ARHomeScreen()
    }
}


struct NaviBarVersionModifier : ViewModifier {
    var title : String
    var displayMode: NavigationBarItem.TitleDisplayMode
       
    @ViewBuilder
    func body(content: Content) -> some View {

        if #available(iOS 14, *) {
             content
            .navigationTitle(title)
            .navigationBarTitleDisplayMode( displayMode)
        }
        else {
            content.navigationBarTitle(title,displayMode: displayMode)
        }
    }
}

struct NavigationBarColor: ViewModifier {

  init(backgroundColor: UIColor, tintColor: UIColor) {
    let coloredAppearance = UINavigationBarAppearance()
    coloredAppearance.configureWithOpaqueBackground()
    coloredAppearance.backgroundColor = backgroundColor
    coloredAppearance.titleTextAttributes = [.foregroundColor: tintColor]
    coloredAppearance.largeTitleTextAttributes = [.foregroundColor: tintColor]
    coloredAppearance.backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: tintColor]
      
      
      let image = UIImage(systemName: "chevron.backward")?.withTintColor(tintColor, renderingMode: .alwaysOriginal)
      coloredAppearance.setBackIndicatorImage(image, transitionMaskImage: image)
                   
    UINavigationBar.appearance().standardAppearance = coloredAppearance
    UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
    UINavigationBar.appearance().compactAppearance = coloredAppearance
    UINavigationBar.appearance().tintColor = tintColor
      
    let compactAppearance = coloredAppearance.copy()

    if #available(iOS 15.0, *) { // For compatibility with earlier iOS.
          UINavigationBar.appearance().compactScrollEdgeAppearance = compactAppearance
    }
  }

  func body(content: Content) -> some View {
    content
  }
}

extension View {
    func navigation (title : String ,
      displayMode : NavigationBarItem.TitleDisplayMode = .automatic) -> some View{
        
        self.modifier( NaviBarVersionModifier(title: title, displayMode: displayMode))
    }
    
    func navigationBarColor(backgroundColor: UIColor, tintColor: UIColor) -> some View {
        self.modifier(NavigationBarColor(backgroundColor: backgroundColor, tintColor: tintColor))
      }
}


struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }

    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }

}


//extension UITabBarController {
//    override open func viewDidLoad() {
////        let appearance = UITabBarAppearance()
////
////        appearance.backgroundColor = .black
////
////        tabBar.standardAppearance = appearance
//        UITabBar.appearance().barTintColor = UIColor.red
//                UITabBar.appearance().tintColor = .green
//    }
//
//}


struct NavigationBackButton: ViewModifier {

    @Environment(\.presentationMode) var presentationMode
    var color: UIColor
    var text: String?

    func body(content: Content) -> some View {
        return content
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(
                leading: Button(action: {  presentationMode.wrappedValue.dismiss() }, label: {
                    HStack(spacing: 2) {
                        Image(systemName: "chevron.backward")
                            .foregroundColor(Color(color))

                        if let text = text {
                            Text(text)
                                .foregroundColor(Color(color))
                        }
                    }
                })
            )
    }
}

extension View {
    func navigationBackButton(color: UIColor, text: String? = nil) -> some View {
        modifier(NavigationBackButton(color: color, text: text))
    }
}
