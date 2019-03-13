//
//  convertGRID_GPS.swift
//  Life_Day
//
//  Created by shin kim on 12/03/2019.
//  Copyright © 2019 shin kim. All rights reserved.
//

import Foundation

//////////////// GPS -> GRID ///////////////
func convertGRID_GPS(lat_X: Double, lng_Y: Double) -> LatXLngY {
    let RE = 6371.00877 // 지구 반경(km)
    let GRID = 5.0 // 격자 간격(km)
    let SLAT1 = 30.0 // 투영 위도1(degree)
    let SLAT2 = 60.0 // 투영 위도2(degree)
    let OLON = 126.0 // 기준점 경도(degree)
    let OLAT = 38.0 // 기준점 위도(degree)
    let XO:Double = 43 // 기준점 X좌표(GRID)
    let YO:Double = 136 // 기준점 Y좌표(GRID)
    
    //
    // LCC DFS 좌표변환 ( code : "TO_GRID"(위경도->좌표, lat_X:위도,  lng_Y:경도), "TO_GPS"(좌표->위경도,  lat_X:x, lng_Y:y) )
    //
    
    let DEGRAD = Double.pi / 180.0
    
    let re = RE / GRID
    let slat1 = SLAT1 * DEGRAD
    let slat2 = SLAT2 * DEGRAD
    let olon = OLON * DEGRAD
    let olat = OLAT * DEGRAD
    
    var sn = tan(Double.pi * 0.25 + slat2 * 0.5) / tan(Double.pi * 0.25 + slat1 * 0.5)
    sn = log(cos(slat1) / cos(slat2)) / log(sn)
    var sf = tan(Double.pi * 0.25 + slat1 * 0.5)
    sf = pow(sf, sn) * cos(slat1) / sn
    var ro = tan(Double.pi * 0.25 + olat * 0.5)
    ro = re * sf / pow(ro, sn)
    var rs = LatXLngY(lat: 0, lng: 0, x: 0, y: 0)
    
    rs.lat = lat_X
    rs.lng = lng_Y
    var ra = tan(Double.pi * 0.25 + (lat_X) * DEGRAD * 0.5)
    ra = re * sf / pow(ra, sn)
    var theta = lng_Y * DEGRAD - olon
    if theta > Double.pi {
        theta -= 2.0 * Double.pi
    }
    if theta < -Double.pi {
        theta += 2.0 * Double.pi
    }
    
    theta *= sn
    rs.x = Int(floor(ra * sin(theta) + XO + 0.5))
    rs.y = Int(floor(ro - ra * cos(theta) + YO + 0.5))
    
    return rs
}

struct LatXLngY {
    public var lat: Double
    public var lng: Double
    
    public var x: Int
    public var y: Int
}
