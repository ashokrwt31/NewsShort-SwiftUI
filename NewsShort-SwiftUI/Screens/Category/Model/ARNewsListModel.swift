//
//  ARNewsListModel.swift
//  NewsShort
//
//  Created by Ashok Rawat on 03/11/22.
//

import Foundation

struct ARNewsListModel: Codable, Hashable {
    let category: String
    let data: [ARNewsData]
    let success: Bool
}

struct ARNewsData: Codable, Hashable {
    let author: String
    let content: String
    let date: String
    let id: String
    let imageUrl: String
    let readMoreUrl: String?
    let time: String
    let title: String
    let url: String
}

