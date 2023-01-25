//
//  ARNewsDetail.swift
//  NewsShort-SwiftUI
//
//  Created by Ashok Rawat on 29/11/22.
//

import SwiftUI

struct ARNewsDetail: View {
    var newsData: ARNewsData?
    var categoty: String = ""
    @State private var isPresented = false
    @EnvironmentObject var dataSource: ARDataSource
    
    func getReadMoreURLString(_ text: String) -> String {
        return text.replacingOccurrences(of: "(https?://([-\\w\\.]+[-\\w])+(:\\d+)?(/([\\w/_\\.#-]*(\\?\\S+)?[^\\.\\s])?)?)/", with: "", options: .regularExpression, range: nil).replacingOccurrences(of: "-", with: " ").replacingOccurrences(of: "[0-9]", with: "", options: .regularExpression, range: nil)
    }
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading,spacing: 5){
                ImageUrlView(url: newsData?.imageUrl ?? nil)
                    .shadow(color: .gray, radius: 20, x: 2, y: 2)
                    .padding(5)
                    .overlay(RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.blue, lineWidth: 1))
                    .frame(width: UIScreen.main.bounds.width - 30, height: 180)
                    .onTapGesture {
                        self.isPresented.toggle()
                    }.fullScreenCover(isPresented: $isPresented,content: {
                        FullScreenModalView(newsData: newsData)
                   })
                
                Spacer()
                Text(newsData?.title ?? "")
                    .font(dataSource.selectedTitleFont)
                    .foregroundColor(Color(dataSource.selectedTheme.primaryColor))
                
                Spacer()
                Text(newsData?.content ?? "")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(Color(dataSource.selectedTheme.labelColor))
                
                Spacer()
                Text(newsData?.author ?? "")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(Color(dataSource.selectedTheme.secondaryColor))
                
                Text(newsData?.date ?? "")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(Color(dataSource.selectedTheme.secondaryColor))
                
                Text(newsData?.time ?? "")
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(Color(dataSource.selectedTheme.secondaryColor))
                    .padding([.bottom], 10.0)
                
                if let urlString = newsData?.readMoreUrl?.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed), let url = URL(string: urlString), let newsURL = newsData?.url {
                        
                    HStack {
                        Link(destination: url, label: {
                            Text("Read more about \(getReadMoreURLString(newsURL))")
                                .multilineTextAlignment(.leading)
                                .underline()
                            .font(.system(size: 10, weight: .regular))
                            .foregroundColor(.blue.opacity(0.8))
                        })
                    }
                }
            }
            .padding([.top, .leading, .trailing], 30.0)
            .frame(maxWidth: .infinity)
        }
        .navigationBarTitle(categoty + " News", displayMode: .inline)
        .navigationBarItems(trailing: ARLogoutButton())
    }
}

struct ARNewsDetail_Previews: PreviewProvider {
    static var previews: some View {
        ARNewsDetail(newsData: ARNewsData(author: "Test author", content: "Test content", date: "21-11-2022", id: "122222", imageUrl: "123", readMoreUrl: "https://mamaearth.in/product/honey-malai-cold-cream-with-honey-malai-for-nourishing-glow-200-g?utm_source=inshorts&utm_medium=premium_story&utm_campaign=honey_malai_cold_cream&utm_content=first_story_of_the_day", time: "3:30", title: "Test Title", url: "www.google.com"),
                     categoty: "Test")
    }
}
