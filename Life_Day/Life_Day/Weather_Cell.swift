//
//  Weather_Cell.swift
//  Life_Day
//
//  Created by shin kim on 10/03/2019.
//  Copyright © 2019 shin kim. All rights reserved.
//

import UIKit

class Weather_Cell: UITableViewCell {

    @IBOutlet var baseDate: UILabel!    // 발표일자
    @IBOutlet var baseTime: UILabel!    // 발표시간
    @IBOutlet var category: UILabel!    // 자료구분코드
    @IBOutlet var obsrValue: UILabel!   //  예보 값
    @IBOutlet var sky_image: UIImageView!
    
}
