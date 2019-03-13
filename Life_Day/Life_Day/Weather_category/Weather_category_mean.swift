//
//  Weather_category_mean.swift
//  Life_Day
//
//  Created by shin kim on 11/03/2019.
//  Copyright © 2019 shin kim. All rights reserved.
//

import Foundation

func Weather_category_mean(val: String?) -> String {
    var result: String?
    
    switch val {
    case "T1H":
        result = "기온"
    case "RN1":
        result = "1시간 강수량"
    case "LGT":
        result = "낙뢰"
    case "POP":
        result = "강수확률"
    case "PTY":
        result = "강수형태"
    case "R06":
        result = "6시간 강수량"
    case "REH":
        result = "습도"
    case "S06":
        result = "6시간 신적설"
    case "SKY":
        result = "하늘상태"
    case "T3H":
        result = "3시간 기온"
    case "TMN":
        result = "아침 최저기온"
    case "TMX":
        result = "낮 최고기온"
    case "UUU":
        result = "풍속(동서성분)"
    case "VVV":
        result = "풍속(남북성분)"
    case "WAV":
        result = "파고"
    case "VEC":
        result = "풍향"
    case "WSD":
        result = "풍속"
    default :
        print("오류")
    }
    return result!
}
