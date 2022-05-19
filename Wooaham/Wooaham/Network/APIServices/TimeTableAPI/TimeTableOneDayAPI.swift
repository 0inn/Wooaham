//
//  TimeTableOneDayAPI.swift
//  Wooaham
//
//  Created by 김영인 on 2022/05/05.
//

import Alamofire

class TimeTableOneDayAPI{
    
    func getTimeTableOneDay(_ delegate: HomeViewController) {
        
        let url = "\(Const.URL.BASE_URL)/info/timetable/one-day"
        
        let token = TokenUtils()
        guard let header = token.getAuthorizationHeader(accessToken: JWT.shared.jwt ?? "") else {
            return
        }
        
        let param: [String: Any] = [
            "startDay": getToday()
        ]
        
        AF.request(url,
                   method: .get,
                   parameters: param,
                   encoding: URLEncoding.queryString,
                   headers: header)
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
