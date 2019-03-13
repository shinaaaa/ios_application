//
//  ListViewController.swift
//  Life_Day
//
//  Created by shin kim on 11/03/2019.
//  Copyright © 2019 shin kim. All rights reserved.
//


import Alamofire
import SwiftyJSON
import UIKit
import MapKit

class ListViewController: UITableViewController, CLLocationManagerDelegate {
    
    // 테이블 뷰를 구성할 리스트 데이터
    lazy var list: [WeatherVO] = {
        var datalist = [WeatherVO]()
        return datalist
    }()
    
    var lat: Int = 0
    var lng: Int = 0
    var count: Int = 0
    
    
    let locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        // Do any additional setup after loading the view, typically from a nib.
        
        // For use in foreground
        
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            self.locationManager.delegate = self
            self.locationManager.startUpdatingLocation()
            self.locationManager.distanceFilter = kCLDistanceFilterNone
            self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        }
        
        self.Weather_API()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        print("Error \(error)")
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
            
            
            print("lantitude = \(locValue.latitude)")
            print("longitude = \(locValue.longitude)")
            print("LatXLngY = \(convertGRID_GPS(lat_X: locValue.latitude, lng_Y: locValue.longitude).x)")
            print("LatXLngY = \(convertGRID_GPS(lat_X: locValue.latitude, lng_Y: locValue.longitude).y)")
            
            lat = convertGRID_GPS(lat_X: locValue.latitude, lng_Y: locValue.longitude).x
            lng = convertGRID_GPS(lat_X: locValue.latitude, lng_Y: locValue.longitude).y
            
            while count == 0 {
            self.Weather_API()
            count = 1
        }
    }
    
    /* 각 행이 화면에 표시해야 할 내용을 구성하는데 사용된다.
     반환하는 값은 전체 테이블 불의 목록이 아니라 개별적인 테이블 셀 객체
     화면에 표현해야 할 목록의 수만큼 메소드가 반복적으로 호출
     첫번째 인자값은 구성할 테이블 뷰 객체에 대한 참조
     두번째 인자값은 구성할 행에 대한 참조 정보
     */
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 주어진 행에 맞는 데이터 소스를 읽어온다.
        let row = self.list[indexPath.row]
        // 테이블 셀 객체를 직접 생성라는 대신 큐로부터 가져온다.
        // dequeueReusableCell 메소드는 인자값을 입력받은 아이디를 이용하여 스토리보드에 정의된 프로토타입 셀을 찾고, 이를 인스턴스로 생성하여 우리에게 제공한다.
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as! Weather_Cell
        // 테이블 뷰에 title이 있으면 출력 없으면 오류 없이 그냥 미출력
        cell.baseDate?.text = row.baseDate
        cell.baseTime?.text = row.baseTime
        cell.category?.text = row.category
        cell.obsrValue?.text = row.obsrValue
        
        cell.sky_image.image = row.sky_image
        
        // 테이블 뷰의 셀 인스턴스
        return cell
    }
    
    /* 테이블 뷰가 생성해야할 행의 개수를 반환
     생성해야할 수를 임의로 지정하기 보다 데이터 소스의 크기를 동적을 반환하는 것이 바람직하다.
     첫번째 인자값은 메소드를 호출한 데이블 뷰에 대한 정보
     두번째 인자값은 섹션에 대한 정보
     */
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 테이블 뷰의 목록의 길이
        return self.list.count  // 리스트의 크기 만큼 테이블 뷰의 행의 갯수 생성
    }
    
    /* 사용자가 목록 중에서 특정 행을 선택했을 때 호출
     사용자가 선택한 내용에 맞는 액션을 처리하는 용도로 사용
     화면에 목록으 표시하는 용도의 테이블이면 구현할 필요없음
     첫번째 인자값은 사용자가 터치한 테이블 뷰에 대한 참조값
     두번쨰 인자값이 터치된 행에 대한 정보
     */
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // NSLog()객체는 문자열로 입력된 값을 Xcode의 콘솔 로그 창에 출력해주는 기능을 한다.
        // print()와 바슷하지만 Object-C에서도 사용할 수 있다.
        NSLog("선택된 행은 \(indexPath.row) 번째 행입니다.")
    }
    
    // 테이블 뷰의 셀 높이 고정, inspector 조정이 안됨
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    //MARK: - Weather의 API를 받아서 리스트에 저장하는 클래스
    func Weather_API() {
        let serviceKey = "qPaKtPFXuD0yHTVcEz2ld9WDwKR0PVHmMesO%2FQl2MGGtnAh1IWV8qJMQkHZmn04J0xmRn%2B2YqB6tmaboC8pXow%3D%3D"
        
        let url = "http://newsky2.kma.go.kr/service/SecndSrtpdFrcstInfoService2/ForecastGrib?serviceKey=\(serviceKey)&base_date=\(currentDate())&base_time=\(currentTime())00&nx=63&ny=110&numOfRows=10&pageNo=1&_type=json"
        
        DispatchQueue.main.async {
            Alamofire.request(url).responseJSON(completionHandler: {(response) in
                switch response.result {
                case . success(let value):
                    if let data = response.data, let _ = String(data: data, encoding: .utf8) {
                        do {
                            print("\(response)")
                            
                            let json = try JSON(data: data)
                            
                            for (_, subJson) in json["response"]["body"]["items"]["item"] {
                                print("@@@@@@@@@@@@@@@@@@@@@@@@@@@")
                                
                                if let baseDate = subJson["baseDate"].int, let baseTime = subJson["baseTime"].int, let category = subJson["category"].string, let obsrValue = subJson["obsrValue"].double {
                                    
                                    print("baseDate = \(baseDate)")
                                    print("baseTime = \(baseTime)")
                                    print("category = \(category)")
                                    print("obsrValue = \(obsrValue)")
                                    
                                    let wvo = WeatherVO()
                                    let unit: String?
                                    
                                    
                                    wvo.baseDate = "\(baseDate)"
                                    wvo.baseTime = "\(baseTime)"
                                    
                                    if category == "SKY" {
                                        
                                         switch obsrValue {
                                         case 1:
                                         wvo.sky_image = UIImage(named: "ic_sunny.png")
                                         case 2:
                                         wvo.sky_image = UIImage(named: "ic_cloudy.png")
                                         case 3:
                                         wvo.sky_image = UIImage(named: "ic_cloidy.png")
                                         case 4:
                                         wvo.sky_image = UIImage(named: "ic_foggy.png")
                                         default: break
                                         }
                                        
                                        unit = Weather_fcstValue_SKY(val: obsrValue)
                                        wvo.obsrValue = unit!
                                    } else if category == "PTY" {
                                        unit = Weather_fcstValue_PTY(val: obsrValue)
                                        wvo.obsrValue = unit!
                                    } else {
                                        unit = Weather_fcstValue_unit(val: category)
                                        wvo.obsrValue = "\(obsrValue)" + unit!
                                    }
                            
                                    wvo.category = "\(Weather_category_mean(val: category))"
                            
                                    // list 배열에 추가
                                    self.list.append(wvo)
                                    self.tableView.reloadData()
                                    
                                }
                            }
                        } catch {
                            print("Unexpected error: \(error).")
                        }
                    }
                    
                case .failure(let error):
                    print(error.localizedDescription)
                }
            })
        }
    }
}
