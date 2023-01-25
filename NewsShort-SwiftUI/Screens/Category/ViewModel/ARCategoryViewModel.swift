//
//  ARCategoryViewModel.swift
//  NewsShort
//
//  Created by Ashok Rawat on 03/11/22.
//

import Foundation

class ARCategoryViewModel: ObservableObject {
    
    func getCategories() -> ARCategoryModel {
        let url = Bundle.main.url(forResource: "NewsCategory", withExtension: "plist")!
        let data = try! Data(contentsOf: url)
        let decoder = PropertyListDecoder()
        return try! decoder.decode(ARCategoryModel.self, from: data)
    }
}
