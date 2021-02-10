//
//  NewsDetailMainTableViewCell.swift
//  NewsListApp
//
//  Created by Criss on 11/8/20.
//

import UIKit

class NewsDetailMainTableViewCell: UITableViewCell {
    @IBOutlet weak var newsImageView: NewsImageView!
    
    func configure(imageUrl: String?) {
        newsImageView.loadImage(urlString: imageUrl)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        newsImageView?.image = nil
    }
}
