//
//  NewsDetailFullArticleTableViewCell.swift
//  NewsApp
//
//  Created by Criss on 2/10/21.
//

import UIKit

class NewsDetailFullArticleTableViewCell: UITableViewCell {
    private var fullArticleURL: String?
    
    func configure(value: String?) {
        fullArticleURL = value
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        guard let urlString = fullArticleURL,
            let url = URL(string: urlString) else {
            return
        }
        UIApplication.shared.open(url)
    }
}
