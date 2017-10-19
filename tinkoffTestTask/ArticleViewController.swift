//
//  ArticleViewController.swift
//  tinkoffTestTask
//
//  Created by Alex Dolenko on 19/10/2017.
//  Copyright © 2017 Alex Dolenko. All rights reserved.
//

import UIKit

class ArticleViewController: UIViewController {

    var viewModel: ArticleViewModelType!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var publicationDateLabel: UILabel!
    
    
    var article: NewsContent! {
        didSet {
            titleLabel.text = article.title.text.htmlDecoded
            contentTextView.text = article.content.htmlDecoded
            publicationDateLabel.text = article.title.publicationDate.date
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getArticle()
    }
    
    private func getArticle() {
        viewModel.getArticle() { [weak self] article, error in
            if article != nil {
                self?.article = article
            }
            if let error = error {
                UIAlertController.showErrorAlert(error.localizedDescription, context: self)
            }
        }
    }
}
