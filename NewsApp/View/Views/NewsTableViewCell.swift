//
//  NewsTableViewCell.swift
//  NewsListApp
//
//  Created by Criss on 11/8/20.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    @IBOutlet weak var hoursLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var newsImageView: NewsImageView!
    
    func configure(article: ArticleModel?) {
        titleLabel.text = article?.title
        hoursLabel.text = article?.timeAfterPublish()
        newsImageView.loadImage(urlString: article?.urlToImage)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        newsImageView?.setupDefaultImage()
    }
}
