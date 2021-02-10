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
    
    static let unnamedGroup: Character = "*"
    static let unnamedContact = "John Doe"
}

protocol NewsViewModelDelegate: class {
    func modelUpdateDidFinish()
}

class NewsViewModel {
        
    // MARK: Vars
    
    weak var delegate: NewsViewModelDelegate?
        
    var articleListArray: [ArticleModel] = []
    var selectedArticle: ArticleModel?
    
    // MARK: Methods
        
    func performModelUpdate() {
        NewsService().fetchContacts(completionHandler: { articlesModel in
            self.articleListArray = articlesModel.articles
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
    
    // MARK: Articles Details
    
    func numberOfRows() -> Int {
        return RowTypeModel.allCases.count
    }
    
    func rowInfo(at indexPath: IndexPath) -> (title: String?, value: String?, avatar: String?) {
        //guard let rowType = RowTypeModel(rawValue: indexPath.row) else {
            return (nil, nil, nil)
        //}
        //return (rowType.title, rowType.value(contactModel: selectedArticle), rowType.avatar(contactModel: selectedContact))
    }
}
