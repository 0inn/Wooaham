//
//  AlarmDataManager.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/10.
//

import Alamofire

class AlarmDataManager {
    
    func getAlarm(_ userId: CLong, _ delegate: AlarmViewController) {
        
        let url = "\(Const.URL.BASE_URL)/alarms"
        
        let params: [String: CLong] = [
            "userId": 1
        ]
        
        AF.request(url,
                   method: .get,
                   parameters: params,
                   encoding: URLEncoding.default,
                   headers: nil)
        .validate()
        .responseDecodable(of: AlarmResponse.self) { (response) in
            switch response.result {
            case .success(let response):
                if response.success {
                    delegate.didSuccessAlarm(response.data)
                } else {
                    //delegate.failedToRequestAlarm("실패")
                }
                print("🔥\(response)")
            case .failure(let error):
                print("🔥\(error)")
            }
        }
    }
    
}
