//
//  NewsDetailsViewController.swift
//  NewsListApp
//
//  Created by Criss on 11/8/20.
//

import UIKit

struct NewsDetailsViewControllerConstants {
    static let contactDetailsCellIdentifier = "ContactDetailTableViewCell"
    static let contactDetailsAvatarCellIdentifier = "ContactDetailAvatarTableViewCell"
}

class NewsDetailsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = NewsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
}

extension NewsDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: NewsDetailsViewControllerConstants.contactDetailsAvatarCellIdentifier, for: indexPath) as! ContactDetailAvatarTableViewCell
            cell.configure(rowInfo: viewModel.rowInfo(at: indexPath))
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: NewsDetailsViewControllerConstants.contactDetailsCellIdentifier, for: indexPath) as! ContactDetailTableViewCell
            cell.configure(rowInfo: viewModel.rowInfo(at: indexPath))
            return cell
        }
    }

}
