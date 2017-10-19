//
//  NewsItem.swift
//  tinkoffTestTask
//
//  Created by Alex Dolenko on 18/10/2017.
//  Copyright © 2017 Alex Dolenko. All rights reserved.
//

import Foundation

struct NewsItem {
    let id: String
    let text: String
    let publicationDate: SomeDate
}


extension NewsItem: Decodable {
    enum Keys: String, CodingKey {
        case id, text, publicationDate
    }
    
    init(from decoder: Decoder) {
        let container = try! decoder.container(keyedBy: Keys.self)
        
        let id: String = try! container.decode(String.self, forKey: .id)
        let text: String = try! container.decode(String.self, forKey: .text)
        let publicationDate: SomeDate = try! container.decode(SomeDate.self, forKey: .publicationDate)

        self.init(id: id, text: text, publicationDate: publicationDate)
        
    }
}
