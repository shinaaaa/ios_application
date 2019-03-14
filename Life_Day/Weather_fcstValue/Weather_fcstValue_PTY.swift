//
//  Weather_fcstValue_PTY.swift
//  Life_Day
//
//  Created by shin kim on 11/03/2019.
//  Copyright © 2019 shin kim. All rights reserved.
//

import Foundation

func Weather_fcstValue_PTY(val: Double?) -> String {
    var result: String?
    
    switch val {
    case 0:
        result = "없음"
    case 1:
        result = "비"
    case 2:
        result = "비/눈"
    case 3:
        result = "눈"
    default:
        print("오류")
    }
    
    return result!
}
