//
//  ArticleViewModel.swift
//  tinkoffTestTask
//
//  Created by Alex Dolenko on 19/10/2017.
//  Copyright © 2017 Alex Dolenko. All rights reserved.
//

import Foundation

protocol ArticleViewModelType {
    func getArticle(completion: @escaping  ((NewsContent?, Errors?) -> Void))
}

struct ArticleViewModel: ArticleViewModelType{
    private let provider: TinkoffAPIProviderType = TinkoffAPIProvider()
    
    let id: String
    
    func getArticle(completion: @escaping ((NewsContent?, Errors?) -> Void)) {
        provider.getNewsContent(by: id) { data, error in
            if let data = data {
                let response = try! JSONDecoder().decode(Response<NewsContent>.self, from: data)
                
                if let article = response.data {
                    completion(article, nil)
                    
                } else if let error = response.errorMessage {
                    completion(nil, .InternalServerError(error))
                }
            } else if let error = error {
                completion(nil, error)
            }
        }
    }
}
