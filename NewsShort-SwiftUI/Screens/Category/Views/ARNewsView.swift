//
//  ARNewsView.swift
//  NewsShort-SwiftUI
//
//  Created by Ashok Rawat on 29/11/22.
//

import SwiftUI

struct ARNewsView: View {
    var newsData: ARNewsData?
    @EnvironmentObject var dataSource: ARDataSource
    
    var body: some View {
        AnyView(detailScreenView)
    }

    
    var detailScreenView: some View {
        HStack(alignment: .top) {
            ImageUrlView(url: newsData?.imageUrl ?? nil)
                .shadow(radius: 10)
                .padding(5)
                .overlay(RoundedRectangle(cornerRadius: 6)
                    .stroke(Color.blue, lineWidth: 1))
                .frame(width: 100, height: 100)
           
            VStack(alignment: .leading) {
                Text(newsData?.title ?? "")
                    .font(dataSource.selectedTitleFont)
                    .foregroundColor(Color(dataSource.selectedTheme.primaryColor))
                    .padding([.bottom], 10.0)
                
                Text(newsData?.author ?? "")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(Color(dataSource.selectedTheme.secondaryColor))
                    .padding([.bottom], 2.0)
                
                Text(newsData?.date ?? "")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(Color(dataSource.selectedTheme.primaryColor))
                
                Text(newsData?.time ?? "")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(Color(dataSource.selectedTheme.primaryColor))
            }
            .frame(width: UIScreen.main.bounds.width * 0.5)
        }
        .padding([.top, .leading, .trailing, .bottom] , 10.0)
        .background(Rectangle().fill(Color.white))
        .cornerRadius(10)
        .shadow(color: .blue, radius: 3, x: 2, y: 2)
    }
}

struct ARNewsView_Previews: PreviewProvider {
    static var previews: some View {
        ARNewsView(newsData: ARNewsData(author: "Test author", content: "Test content", date: "21-11-2022", id: "122222", imageUrl: "123", readMoreUrl: "122", time: "3:30", title: "Test Title", url: "www.google.com"))
    }
}

struct ImageUrlView: View {
    @ObservedObject var remoteImageModel: RemoteImageModel
    
    init(url: String?) {
        remoteImageModel = RemoteImageModel(imageUrl: url)
    }
    
    var body: some View {
        Image(uiImage: remoteImageModel.displayImage ?? UIImage(systemName: "book")!)
        .resizable()
    }
}






