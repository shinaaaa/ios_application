//
//  currentDate.swift
//  Life_Day
//
//  Created by shin kim on 12/03/2019.
//  Copyright © 2019 shin kim. All rights reserved.
//

import Foundation

func currentDate() -> String{
    let date = Date()
    let calendar = Calendar.current
    let year = calendar.component(.year, from: date)
    let month = calendar.component(.month, from: date)
    let day = calendar.component(.day, from: date)
    var current_date: String?
    
    print("year = \(year)")
    print("month = \(month)")
    print("day = \(day)")
    //let minutes = calendar.component(.minute, from: date)
    if month < 10 {
        current_date = "\(year)0\(month)\(day)"
    } else {
        current_date = "\(year)\(month)\(day)"
    }
    print("current_date = \(current_date!)")
    
    return current_date!
}
