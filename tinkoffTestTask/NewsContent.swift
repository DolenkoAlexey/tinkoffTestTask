//
//  NewsContent.swift
//  tinkoffTestTask
//
//  Created by Alex Dolenko on 18/10/2017.
//  Copyright © 2017 Alex Dolenko. All rights reserved.
//

import Foundation

struct NewsContent: Decodable {
    let title: NewsItem
    let content: String
    let creationDate: SomeDate
    let lastModificationDate: SomeDate
}
