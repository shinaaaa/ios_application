//
//  Weather_fcstValue_SKY.swift
//  Life_Day
//
//  Created by shin kim on 11/03/2019.
//  Copyright © 2019 shin kim. All rights reserved.
//

import Foundation

func Weather_fcstValue_SKY(val: Double?) -> String {
    var result: String?
    
    switch val {
    case 1:
        result = "맑음"
    case 2:
        result = "구름 조금"
    case 3:
        result = "구름 많음"
    case 4:
        result = "흐림"
    default:
        print("오류")
    }
    
    return result!
}
