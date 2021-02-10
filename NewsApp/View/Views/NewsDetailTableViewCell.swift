//
//  NewsDetailTableViewCell.swift
//  NewsListApp
//
//  Created by Criss on 11/8/20.
//

import UIKit

class NewsDetailTableViewCell: UITableViewCell {
    @IBOutlet weak var valueLabel: UILabel!
    
    func configure(value: String?) {
        valueLabel.text = value
    }
}
