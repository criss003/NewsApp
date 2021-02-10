//
//  ContactDetailAvatarTableViewCell.swift
//  NewsListApp
//
//  Created by Criss on 11/8/20.
//

import UIKit

struct ContactDetailAvatarTableViewCellConstants {
    static let defaultAvatarName = "logo"
}

class ContactDetailAvatarTableViewCell: UITableViewCell {
    @IBOutlet weak var contactNameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
        
    func configure(rowInfo: (title: String?, value: String?, avatar: String?)) {
        contactNameLabel.text = rowInfo.value
        
        guard NetworkConnection.isNetworkReachable else {
            setupDefaultAvatarImage()
            return
        }
        
        activityIndicatorView.startAnimating()
        if let avatar = rowInfo.avatar,
            let url = URL(string: avatar) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: url)
                DispatchQueue.main.async {
                    self.activityIndicatorView.stopAnimating()
                    if let imageData = data {
                        self.avatarImageView.image = UIImage(data: imageData)
                    } else {
                        self.setupDefaultAvatarImage()
                    }
                }
            }
        } else {
            setupDefaultAvatarImage()
        }
    }
    
    func setupDefaultAvatarImage() {
        avatarImageView.image = UIImage(named: ContactDetailAvatarTableViewCellConstants.defaultAvatarName)
    }
}
