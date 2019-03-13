//
//  currentTime.swift
//  Life_Day
//
//  Created by shin kim on 11/03/2019.
//  Copyright © 2019 shin kim. All rights reserved.
//

import Foundation


func currentTime() -> Int{
    let date = Date()
    let calendar = Calendar.current
    let hour = calendar.component(.hour, from: date)
    let min = calendar.component(.minute, from: date)
    let result: Int?
    
    if min < 45 {
        result = hour - 1
    } else {
        result = hour
    }
    
    print("currentTime = \(hour)")
    
    return result!
}
