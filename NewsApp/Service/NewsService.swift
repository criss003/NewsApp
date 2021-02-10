//
//  NewsService.swift
//  NewsListApp
//
//  Created by Criss on 11/8/20.
//

import Foundation

struct NewsServiceConstants {
    static let newsURL = "http://newsapi.org/v2/everything?q=tesla&from=2021-01-09&sortBy=publishedAt&apiKey=f71af7261c434b5d8be60816ed910d8b"
    
    static let contactsFileName = "contacts"
    static let contactsFileType = "json"
    
    static let invalidURLErrorMessage = "Invalid URL"
    static let invalidURLErrorCode = 10001
    static let invalidDataErrorMessage = "Invalid Data"
    static let invalidDataErrorCode = 10002
    
    static let invalidPathErrorMessage = "Invalid filename/path."
}

class NewsService {
    
    func fetchArticles(completionHandler: @escaping (ArticlesModel?) -> Void) {
        
        performRequest(urlString: NewsServiceConstants.newsURL, errorHandler: { error in
            print(error.localizedDescription)
            completionHandler(nil)
        }, successHandler: { data in
            do {
                let articlesModel = try JSONDecoder().decode(ArticlesModel.self, from: data)
                completionHandler(articlesModel)
            } catch let jsonError {
                print(jsonError.localizedDescription)
                completionHandler(nil)
            }
        })
    }
    
    func performRequest(urlString: String,
                        errorHandler: @escaping (_ error: Error) -> Void,
                        successHandler: @escaping (_ data: Data) -> Void) {
        
        guard let url = URL(string: urlString) else {
            errorHandler(NSError(domain: NewsServiceConstants.invalidURLErrorMessage, code: NewsServiceConstants.invalidURLErrorCode, userInfo: nil))
            return
        }
        
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let err = error {
                errorHandler(err)
                return
            }
            guard let jsonData = data else {
                errorHandler(NSError(domain: NewsServiceConstants.invalidDataErrorMessage, code: NewsServiceConstants.invalidDataErrorCode, userInfo: nil))
                return
            }
            successHandler(jsonData)
            }.resume()
    }
}


