//
//  TimeTableOneDayAPI.swift
//  Wooaham
//
//  Created by 김영인 on 2022/05/05.
//

import Alamofire

class TimeTableOneDayAPI{
    
    func getTimeTableOneDay(_ userId: CLong, _ delegate: HomeViewController) {
        
        let url = "\(Const.URL.BASE_URL)/info/timetable/one-day/\(userId)"
        
        let param: [String: Any] = [
            "startDay": getToday()
        ]
        
        AF.request(url,
                   method: .get,
                   parameters: param,
                   encoding: URLEncoding.queryString,
                   headers: nil)
        .validate()
        .responseDecodable(of: TimeTableOneDayResponse.self) { (response) in
            switch response.result {
            case .success(let response):
                delegate.didSuccessTimeTableOneDay(response.elsTimetable[1].row)
                print("🔥\(response)")
            case .failure(let error):
                print("🔥\(error)")
            }
        }
    }
    
}
