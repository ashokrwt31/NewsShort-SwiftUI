//
//  FullScreenModalView.swift
//  NewsShort-SwiftUI
//
//  Created by Ashok Rawat on 01/12/22.
//

import SwiftUI

struct FullScreenModalView: View {
    @Environment(\.presentationMode) var presentationMode
    var newsData: ARNewsData?
    @EnvironmentObject var dataSource: ARDataSource
    
    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                ImageUrlView(url: newsData?.imageUrl ?? nil)
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .scaleEffect(0.5)
                    .clipped()
                
                VStack(alignment: .trailing) {
                    HStack {
                        Spacer()
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "xmark")
                                .font(ARAppFont.titleFont())
                                .foregroundColor(Color(dataSource.selectedTheme.buttonFgColor))
                                .padding(10)
                        }
                        .background(Color(dataSource.selectedTheme.primaryColor))
                        .mask(Circle())
                        .padding(.top, 50)
                        .padding(.trailing, 20)
                    }
                    Spacer()
                }
            }
            .modalColor(UIColor(Color(dataSource.selectedTheme.modelBackGroundColor).opacity(0.7)))
        }
    }

}

struct FullScreenModalView_Previews: PreviewProvider {
    static var previews: some View {
        FullScreenModalView(newsData: ARNewsData(author: "Test author", content: "Test content", date: "21-11-2022", id: "122222", imageUrl: "123", readMoreUrl: "https://mamaearth.in/product/honey-malai-cold-cream-with-honey-malai-for-nourishing-glow-200-g?utm_source=inshorts&utm_medium=premium_story&utm_campaign=honey_malai_cold_cream&utm_content=first_story_of_the_day", time: "3:30", title: "Test Title", url: "www.google.com"))
    }
}


private struct ModalColorView: UIViewRepresentable {
    
    let color: UIColor
    
    func makeUIView(context: Context) -> some UIView {
        let view = UIView()
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = color
        }
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
    
}


struct ModalColorViewModifier: ViewModifier {
    
    let color: UIColor
    
    func body(content: Content) -> some View {
        content.background(ModalColorView(color: color))
    }
}

extension View {
    func modalColor(_ color: UIColor = .clear) -> some View {
        self.modifier(ModalColorViewModifier(color: color))
    }
}
