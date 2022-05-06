//
//  TimeTableAPI.swift
//  Wooaham
//
//  Created by 김영인 on 2022/05/06.
//

import Alamofire

class TimeTableAPI{
    
    func getTimeTable(_ userId: CLong, _ delegate: TimeTableViewController) {
        
        let url = "\(Const.URL.BASE_URL)/info/timetable/\(userId)"
        
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   encoding: URLEncoding.queryString,
                   headers: nil)
        .validate()
        .responseDecodable(of: TimeTableResponse.self) { (response) in
            switch response.result {
            case .success(let response):
                delegate.didSuccessTimeTable(response.elsTimetable[1].row)
                print("🔥\(response)")
            case .failure(let error):
                print("🔥\(error)")
            }
        }
    }
    
}
