//
//  NewsDetailsViewController.swift
//  NewsListApp
//
//  Created by Criss on 11/8/20.
//

import UIKit

struct NewsDetailsViewControllerConstants {
    static let detailCellIdentifier = "NewsDetailTableViewCell"
    static let detailMainCellIdentifier = "NewsDetailMainTableViewCell"
    static let detailFullArticleCellIdentifier = "NewsDetailFullArticleTableViewCell"
}

class NewsDetailsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: NewsDetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension NewsDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRows() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: NewsDetailsViewControllerConstants.detailMainCellIdentifier, for: indexPath) as! NewsDetailMainTableViewCell
            cell.configure(value: viewModel?.rowInfo(at: indexPath))
            return cell
        } else if let numberOfRows = viewModel?.numberOfRows(),
                  indexPath.row == numberOfRows - 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: NewsDetailsViewControllerConstants.detailFullArticleCellIdentifier, for: indexPath) as! NewsDetailFullArticleTableViewCell
            cell.configure(value: viewModel?.rowInfo(at: indexPath))
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: NewsDetailsViewControllerConstants.detailCellIdentifier, for: indexPath) as! NewsDetailTableViewCell
            cell.configure(value: viewModel?.rowInfo(at: indexPath))
            return cell
        }
    }
}
