//
//  NewsItemTableViewCell.swift
//  tinkoffTestTask
//
//  Created by Alex Dolenko on 18/10/2017.
//  Copyright © 2017 Alex Dolenko. All rights reserved.
//

import UIKit

class NewsItemTableViewCell: UITableViewCell {

    @IBOutlet weak var newsLabel: UILabel!
    @IBOutlet weak var publicationDateLabel: UILabel!
    
    var newsItem: NewsItem! {
        didSet {
            newsLabel.text = newsItem.text
            publicationDateLabel.text = newsItem.publicationDate.date.description
        }
    }

}
