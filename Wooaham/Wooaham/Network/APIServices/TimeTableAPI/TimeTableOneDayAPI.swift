//
//  TimeTableOneDayAPI.swift
//  Wooaham
//
//  Created by 김영인 on 2022/05/05.
//

import Alamofire

class TimeTableOneDayAPI{
    func getTimeTableOneDay(_ delegate: HomeViewController) {
        let param: [String: Any] = [
            "startDay": getToday()
        ]
        AF.request(URLConstant.timeTableOneDay,
                   method: .get,
                   parameters: param,
                   encoding: URLEncoding.queryString,
                   headers: APIConstant.header)
        .validate()
        .responseDecodable(of: TimeTableOneDayResponse.self) { (response) in
            switch response.result {
            case .success(let response):
                guard let info = response.elsTimetable?[1].row else {
                    delegate.failToRequestTimeTableOneDay()
                    return
                }
                delegate.didSuccessTimeTableOneDay(info)
                print("🔥\(response)")
            case .failure(let error):
                print("🔥\(error)")
            }
        }
    }
}
