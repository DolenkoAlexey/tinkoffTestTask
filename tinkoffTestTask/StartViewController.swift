//
//  ViewController.swift
//  tinkoffTestTask
//
//  Created by Alex Dolenko on 18/10/2017.
//  Copyright © 2017 Alex Dolenko. All rights reserved.
//

import UIKit

class StartViewController: UITableViewController {
    
    var viewModel: StartViewModelType!
    
    fileprivate var news: [NewsItem]!
    
    override lazy var refreshControl: UIRefreshControl! = {
        let refreshControl = UIRefreshControl()
        
        refreshControl.addTarget(self, action: #selector(updateNews), for: UIControlEvents.valueChanged)
        
        return refreshControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        
        tableView.addSubview(self.refreshControl)
        
        updateNews()
    }
    
    @objc private func updateNews() {
        refreshControl?.beginRefreshing()
        viewModel.getNews() { [weak self] news, error in
            if news != nil {
                self?.news = news!
                self?.tableView.reloadData()
            }
            if let error = error {
                UIAlertController.showErrorAlert(error.localizedDescription, context: self)
            }
            self?.refreshControl?.endRefreshing()
        }
    }
}

extension StartViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.SegueIdentifiers.article,
            let articleViewController = segue.destination as? ArticleViewController,
            let newsItem = (sender as? NewsItemTableViewCell)?.newsItem {
            
            let articleVewModel = ArticleViewModel(id: newsItem.id)
            articleViewController.viewModel = articleVewModel
        }
    }
}

extension StartViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIdentifiers.news, for: indexPath) as! NewsItemTableViewCell
        
        let newsItem = news[indexPath.row]
        cell.newsItem = newsItem
        
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news?.count ?? 0
    }
}
