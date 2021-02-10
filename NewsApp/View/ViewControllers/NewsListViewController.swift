//
//  NewsListViewController.swift
//  NewsListApp
//
//  Created by Criss on 11/8/20.
//

import UIKit

struct NewsListViewControllerConstants {
    static let title = "Front Page"
    static let newsCellIdentifier = "NewsTableViewCell"
    static let newsMainCellIdentifier = "NewsMainTableViewCell"
}

class NewsListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    let viewModel = NewsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = NewsListViewControllerConstants.title
        populateView()
    }
    
    func populateView() {
        guard NetworkConnection.isNetworkReachable else {
            UIAlertController.showAlert(parentController: self,
                                        message: NewsViewModelConstants.errorMessage,
                                        title: NewsViewModelConstants.errorTitle)
            return
        }
        
        activityIndicatorView.startAnimating()
        activityIndicatorView.center = view.center
        
        viewModel.delegate = self
        viewModel.performModelUpdate()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? NewsDetailsViewController {
            viewController.viewModel = viewModel
        }
    }
}

extension NewsListViewController: NewsViewModelDelegate {

    func modelUpdateDidFinish() {
        DispatchQueue.main.async {
            self.activityIndicatorView.stopAnimating()
            self.tableView.reloadData()
        }
    }
}

extension NewsListViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsForArticles()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: NewsListViewControllerConstants.newsMainCellIdentifier, for: indexPath) as! NewsMainTableViewCell
            cell.configure(article: viewModel.articleAt(indexPath: indexPath))
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: NewsListViewControllerConstants.newsCellIdentifier, for: indexPath) as! NewsTableViewCell
            cell.configure(article: viewModel.articleAt(indexPath: indexPath))
            return cell
        }
    }
    
    // MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.selectArticle(indexPath: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


