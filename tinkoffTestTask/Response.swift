//
//  Response.swift
//  tinkoffTestTask
//
//  Created by Alex Dolenko on 18/10/2017.
//  Copyright © 2017 Alex Dolenko. All rights reserved.
//

import Foundation

struct Response<ResponseType: Decodable> {
    let resultCode: String
    let errorMessage: String?
    let data: ResponseType?
}

extension Response: Decodable {
    enum Keys: String, CodingKey {
        case resultCode
        case errorMessage = "plainMessage"
        case data = "payload"
    }
    
    init(from decoder: Decoder) {
        let container = try! decoder.container(keyedBy: Keys.self)
        
        let resultCode: String = try! container.decode(String.self, forKey: .resultCode)
        let errorMessage: String? = try? container.decode(String.self, forKey: .errorMessage)
        let data = try? container.decode(ResponseType.self, forKey: .data)
        
        self.init(resultCode: resultCode, errorMessage: errorMessage, data: data)
    }
}


