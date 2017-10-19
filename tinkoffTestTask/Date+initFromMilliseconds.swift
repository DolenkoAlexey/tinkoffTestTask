//
//  Date+dateFromMilliseconds.swift
//  tinkoffTestTask
//
//  Created by Alex Dolenko on 18/10/2017.
//  Copyright © 2017 Alex Dolenko. All rights reserved.
//

import Foundation

extension Date {
    init(milliseconds:Int) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds / 1000))
    }
}
