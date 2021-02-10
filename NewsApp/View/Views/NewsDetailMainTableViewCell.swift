//
//  NewsDetailMainTableViewCell.swift
//  NewsListApp
//
//  Created by Criss on 11/8/20.
//

import UIKit

class NewsDetailMainTableViewCell: UITableViewCell {
    @IBOutlet weak var newsImageView: NewsImageView!
    
    func configure(value: String?) {
        newsImageView.loadImage(urlString: value)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        newsImageView?.image = nil
    }
}
