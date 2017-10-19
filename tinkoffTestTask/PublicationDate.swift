//
//  PublicationDate.swift
//  tinkoffTestTask
//
//  Created by Alex Dolenko on 18/10/2017.
//  Copyright © 2017 Alex Dolenko. All rights reserved.
//

import Foundation

struct SomeDate {
    let date: String
    let milliseconds: Int
}

extension SomeDate: Decodable {
    enum Keys: String, CodingKey {
        case milliseconds
    }
    
    init(from decoder: Decoder) {
        let container = try! decoder.container(keyedBy: Keys.self)
        
        let milliseconds: Int = try! container.decode(Int.self, forKey: .milliseconds)
        let date = Date(milliseconds: milliseconds)
        
        
        self.init(date: "\(date.date) \(date.time)", milliseconds: milliseconds)
    }
}
