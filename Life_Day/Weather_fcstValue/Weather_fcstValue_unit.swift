//
//  Weather_fcstValue_unit.swift
//  Life_Day
//
//  Created by shin kim on 11/03/2019.
//  Copyright © 2019 shin kim. All rights reserved.
//

import Foundation

func Weather_fcstValue_unit(val: String?) -> String {
    var result: String?
    
    switch val {
    case "T1H":
        result = "℃"
    case "RN1":
        result = "mm"
    case "REH":
        result = "%"
    case "S06":
        result = "cm"
    case "T3H":
        result = "℃"
    case "TMN":
        result = "℃"
    case "TMX":
        result = "℃"
    case "UUU":
        result = "m/s"
    case "VVV":
        result = "m/s"
    case "WAV":
        result = "M"
    case "VEC":
        result = "m/s"
    case "WSD":
        result = "m/s"
    default:
        print("오류")
    }
    
    return result!
}
