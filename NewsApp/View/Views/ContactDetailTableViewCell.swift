//
//  ContactDetailTableViewCell.swift
//  NewsListApp
//
//  Created by Criss on 11/8/20.
//

import UIKit

class ContactDetailTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    func configure(rowInfo: (title: String?, value: String?, avatar: String?)) {
        nameLabel.text = rowInfo.title
        valueLabel.text = rowInfo.value
    }
}
