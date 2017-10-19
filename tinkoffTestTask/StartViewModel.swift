//
//  StartViewModel.swift
//  tinkoffTestTask
//
//  Created by Alex Dolenko on 18/10/2017.
//  Copyright © 2017 Alex Dolenko. All rights reserved.
//

import Foundation

protocol StartViewModelType {
    func getNews(completion: @escaping  (([NewsItem]?, Errors?) -> Void))
}

struct StartViewModel: StartViewModelType{
    private let apiProvider: TinkoffAPIProviderType = TinkoffAPIProvider()
    private let dbProvider: DBProviderType = DBProvider()
    
    func getNews(completion: @escaping (([NewsItem]?, Errors?) -> Void)) {
        let dbNews = getNewsFromDB()
        apiProvider.getNews() { data, error in
            if let data = data {
                let response = try! JSONDecoder().decode(Response<[NewsItem]>.self, from: data)
                
                if let news = response.data {
                    
                    let sortedNews = news.sorted { $0.publicationDate.milliseconds >= $1.publicationDate.milliseconds }
                    self.saveNewsToDB(items: sortedNews)
                    completion(sortedNews, nil)
                    
                } else if let error = response.errorMessage {
                    completion(dbNews, .InternalServerError(error))
                }
            } else if let error = error {
                completion(dbNews, error)
            }
        }
        completion(dbNews, nil)
    }
    
    private func saveNewsToDB(items: [NewsItem]) {
        dbProvider.deleteAllNews()
        for item in items {
            dbProvider.save(newsItem: item)
        }
    }
    
    private func getNewsFromDB() -> [NewsItem]{
        return dbProvider.getNews()
    }
}

