//
//  ArticleModel.swift
//  NewsListApp
//
//  Created by Criss on 11/8/20.
//

import Foundation

struct ArticlesModel: Codable {
    let articles: [ArticleModel]
}

struct ArticleModel: Codable {
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    
    
    let id: String?
    let dateAdded: String?
    let name: String?
    let email: String?
    let phoneNumber: String?
    let jobTitle: String?
    let age: Int?
    let avatar: String?
}
