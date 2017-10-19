//
//  Constants.swift
//  tinkoffTestTask
//
//  Created by Alex Dolenko on 18/10/2017.
//  Copyright © 2017 Alex Dolenko. All rights reserved.
//

import Foundation

struct Constants {
    struct Api {
        static let baseURL = "https://api.tinkoff.ru/v1/"
        static let news = "news"
        static let newsContent = "news_content"
    }
    
    struct CellIdentifiers {
        static let news = "newsCell"
    }
    
    struct SegueIdentifiers {
        static let article = "showArticle"
    }
}
