//
//  DbProvider.swift
//  tinkoffTestTask
//
//  Created by Alex Dolenko on 19/10/2017.
//  Copyright © 2017 Alex Dolenko. All rights reserved.
//

import Foundation
import CoreData
import UIKit

protocol DBProviderType {
    func getNews() -> [NewsItem]
    func save(newsItem: NewsItem)
    func deleteAllNews()
}

struct DBProvider: DBProviderType {
    private var managedContext: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        return appDelegate.persistentContainer.viewContext
    }
    
    func getNews() -> [NewsItem] {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "DBNewsItem")
        
        do {
            let items = try managedContext.fetch(fetchRequest)
            var resultNews = [NewsItem]()
            for dbNewsItem in items{
                let id = dbNewsItem.value(forKeyPath: "id") as! String
                let text = dbNewsItem.value(forKeyPath: "text") as! String
                let publicationDate = dbNewsItem.value(forKeyPath: "publicationDate") as! String
                let milliseconds = dbNewsItem.value(forKeyPath: "milliseconds") as! Int
                
                resultNews.append(NewsItem(id: id, text: text, publicationDate: SomeDate(date: publicationDate, milliseconds: milliseconds)))
            }
            
            return resultNews
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        return []
    }
    
    
    func save(newsItem: NewsItem) {
        let entity = NSEntityDescription.entity(forEntityName: "DBNewsItem", in: managedContext)!
        let dbnewsItem = NSManagedObject(entity: entity, insertInto: managedContext)
        
        dbnewsItem.setValue(newsItem.id, forKeyPath: "id")
        dbnewsItem.setValue(newsItem.text, forKeyPath: "text")
        dbnewsItem.setValue(newsItem.publicationDate.date, forKeyPath: "publicationDate")
        dbnewsItem.setValue(newsItem.publicationDate.milliseconds, forKey: "milliseconds")
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error.localizedDescription))")
        }
    }
    
    func deleteAllNews() {
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "DBNewsItem")
        let request = NSBatchDeleteRequest(fetchRequest: fetch)
        
        do {
            try managedContext.execute(request)
        } catch let error as NSError {
            print("Could not delete. Error: \(error)")
        }
    }
}
