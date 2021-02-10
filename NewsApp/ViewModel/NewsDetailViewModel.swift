//
//  NewsDetailViewModel.swift
//  NewsListApp
//
//  Created by Criss on 11/8/20.
//
import Foundation

class NewsDetailViewModel {
    var article: ArticleModel?
    
    init(article: ArticleModel?) {
        self.article = article
    }
    
    func numberOfRows() -> Int {
        return RowTypeModel.allCases.count
    }
    
    func rowInfo(at indexPath: IndexPath) -> String? {
        guard let rowType = RowTypeModel(rawValue: indexPath.row) else {
            return nil
        }
        return rowType.value(articleModel: article)
    }
}
