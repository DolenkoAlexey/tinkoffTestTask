//
//  ApiProvider.swift
//  tinkoffTestTask
//
//  Created by Alex Dolenko on 18/10/2017.
//  Copyright © 2017 Alex Dolenko. All rights reserved.
//

import Foundation

protocol TinkoffAPIProviderType {
    func getNews(complition: @escaping ((Data?, Errors?) -> Void))
    func getNewsContent(by id: String, complition: @escaping ((Data?, Errors?) -> Void))
}

struct TinkoffAPIProvider: TinkoffAPIProviderType {
    private func makeRequest(to url: URL, complition: @escaping ((Data?, Errors?) -> Void)) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let data = data {
                    complition(data, nil)
                } else if let error = error {
                    complition(nil, .RequestError(url, error))
                }
            }
        }
        
        task.resume()
    }
    
    func getNews(complition: @escaping ((Data?, Errors?) -> Void)) {
        let newsUrl = URL(string: Constants.Api.baseURL + Constants.Api.news)
        makeRequest(to: newsUrl!, complition: complition)
    }
    
    func getNewsContent(by id: String, complition: @escaping ((Data?, Errors?) -> Void)) {
        let newsContenUrl = URL(string: Constants.Api.baseURL + Constants.Api.newsContent + "?id=\(id)")
        makeRequest(to: newsContenUrl!, complition: complition)
    }
}
