//
//  RowTypeModel.swift
//  NewsListApp
//
//  Created by Criss on 11/8/20.
//

import Foundation

struct RowTypeModelConstants {
    static let receivedDateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z"
    static let displayDateFormat = "dd.MM.yyyy"
    
    static let nameTitle = ""
    static let jobTitle = "Job Title"
    static let dateTitle = "Date Added"
    static let emailTitle = "Email"
    static let phoneTitle = "Phone Number"
    static let ageTitle = "Age"
}

enum RowTypeModel: Int, CaseIterable {
    case urlToImage
    case author
    case title
    case description
    case url
    
    func value(articleModel: ArticleModel?) -> String? {
        guard let article = articleModel else {
            return nil
        }
        switch self {
        case .urlToImage:
            return article.urlToImage
        case .author:
            return article.author
        case .title:
            return article.title
        case .description:
            return article.description
        case .url:
            return article.url
        }
    }

}

