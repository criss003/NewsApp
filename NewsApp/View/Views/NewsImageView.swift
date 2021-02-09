//
//  NewsImageView.swift
//  NewsApp
//
//  Created by Criss on 2/10/21.
//

import UIKit

struct NewsImageViewConstants {
    static let defaultAvatarName = "logo"
}

class NewsImageView: UIImageView {
    func loadImage(urlString: String?) {
        let activityIndicator = activityIndicatorView
        activityIndicator.startAnimating()
        if let newsUrlString = urlString,
            let url = URL(string: newsUrlString) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: url)
                DispatchQueue.main.async {
                    activityIndicator.stopAnimating()
                    if let imageData = data {
                        self.image = UIImage(data: imageData)
                    } else {
                        self.setupDefaultImage()
                    }
                }
            }
        } else {
            setupDefaultImage()
        }
    }
    
    func setupDefaultImage() {
        image = UIImage(named: NewsImageViewConstants.defaultAvatarName)
    }
    
    private lazy var activityIndicatorView: UIActivityIndicatorView = {
            let activityIndicator = UIActivityIndicatorView()
            activityIndicator.hidesWhenStopped = true
            activityIndicator.color = UIColor.black
            self.addSubview(activityIndicator)

            activityIndicator.translatesAutoresizingMaskIntoConstraints = false

            let centerX = NSLayoutConstraint(item: self,
                                             attribute: .centerX,
                                             relatedBy: .equal,
                                             toItem: activityIndicator,
                                             attribute: .centerX,
                                             multiplier: 1,
                                             constant: 0)
            let centerY = NSLayoutConstraint(item: self,
                                             attribute: .centerY,
                                             relatedBy: .equal,
                                             toItem: activityIndicator,
                                             attribute: .centerY,
                                             multiplier: 1,
                                             constant: 0)
            self.addConstraints([centerX, centerY])
            return activityIndicator
        } ()
}
