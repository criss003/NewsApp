//
//  NewsViewModel.swift
//  NewsListApp
//
//  Created by Criss on 11/8/20.
//

import Foundation

struct NewsViewModelConstants {
    static let errorTitle = "Error"
    static let errorMessage = "You have no internet connection."
}

protocol NewsViewModelDelegate: class {
    func modelUpdateDidFinish()
}

class NewsViewModel {
    var articleListArray: [ArticleModel] = []
    var selectedArticle: ArticleModel?
    
    weak var delegate: NewsViewModelDelegate?
        
   func performModelUpdate() {
        NewsService().fetchArticles(completionHandler: { articlesModel in
            if let articles = articlesModel?.articles {
                self.articleListArray = articles
            }
            self.delegate?.modelUpdateDidFinish()
        })

    }
    
    func selectArticle(indexPath: IndexPath) {
        if articleListArray.count > indexPath.row {
            selectedArticle = articleListArray[indexPath.row]
        }
    }
    
    func articleAt(indexPath: IndexPath) -> ArticleModel? {
        if articleListArray.count > indexPath.row {
            return articleListArray[indexPath.row]
        }
        return nil
    }
    
    func numberOfRowsForArticles() -> Int {
        return articleListArray.count
    }
}
