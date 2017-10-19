//
//  Errors.swift
//  tinkoffTestTask
//
//  Created by Alex Dolenko on 18/10/2017.
//  Copyright © 2017 Alex Dolenko. All rights reserved.
//

import Foundation

enum Errors: Error {
    case RequestError(URL, Error)
    case InternalServerError(String)
}

extension  Errors {
    var localizedDescription: String {
        switch self {
        case .RequestError(let url, let error):
            return "Requst error to url: \(url.absoluteString). Error: \(error.localizedDescription)"
        case .InternalServerError(let error):
            return "Internal server error: \(error)"
        }
    }
}
