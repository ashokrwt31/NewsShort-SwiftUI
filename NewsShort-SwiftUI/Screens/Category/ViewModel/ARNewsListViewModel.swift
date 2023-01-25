//
//  ARNewsViewModel.swift
//  NewsShort
//
//  Created by Ashok Rawat on 03/11/22.
//

import Foundation

class ARNewsListViewModel: ObservableObject {
    
    @Published var newsList: [ARNewsData] = []
    
    private let networkRequest: ARNetworkRequest
    private var newsListRequest = ARNewsListRequest(addAuthToken: false)
    
    init(networkRequest: ARNetworkRequest = ARNetworkRequest()) {
        self.networkRequest = networkRequest
    }
    
    @MainActor
    func getNewsListFromServer() async {
        if let response: ARNewsListModel = try? await networkRequest.perform(newsListRequest) {
            newsList = response.data
        }
    }
    
    func updateSelectedCategory(_ selectedCategory: String) {
        newsListRequest.updateSelectedCategory(selectedCategory)
    }
}
