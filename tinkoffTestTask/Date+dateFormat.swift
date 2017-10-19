//
//  Date+dateFormat.swift
//  tinkoffTestTask
//
//  Created by Alex Dolenko on 18/10/2017.
//  Copyright © 2017 Alex Dolenko. All rights reserved.
//

import Foundation


extension Date {
    var date: String {
        let formatter = DateFormatter()
        
        formatter.dateFormat = "MM.dd.yyyy"
        
        return formatter.string(from: self)
    }
    
    var time: String {
        let formatter = DateFormatter()
        
        formatter.dateFormat = "HH:mm:ss"
        return formatter.string(from: self)
    }
}
