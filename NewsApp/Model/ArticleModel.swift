//
//  ArticleModel.swift
//  NewsListApp
//
//  Created by Criss on 11/8/20.
//

import Foundation

struct ArticleModelConstants {
    static let receivedDateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z"
    static let defaultTimeAfterPublish = ""
}

struct ArticlesModel: Codable {
    let articles: [ArticleModel]
}

struct ArticleModel: Codable {
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    
    func timeAfterPublish() -> String? {
        guard let dateAdded = publishedAt else {
            return ArticleModelConstants.defaultTimeAfterPublish
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = ArticleModelConstants.receivedDateFormat
        guard let date = dateFormatter.date(from: dateAdded) else {
            return nil
        }
        return date.timestampString
    }
}
