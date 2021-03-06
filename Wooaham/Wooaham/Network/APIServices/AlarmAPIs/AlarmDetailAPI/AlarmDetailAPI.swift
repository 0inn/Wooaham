//
//  AlarmAPI.swift
//  Wooaham
//
//  Created by κΉμμΈ on 2022/04/15.
//

import Alamofire

class AlarmDetailAPI {
    
    func getAlarmDetail(_ alarmId: CLong, _ delegate: AddAlarmViewController) {
        
        let url = "\(Const.URL.BASE_URL)/alarms/details"
        
        let params: [String: CLong] = [
            "alarmId": alarmId
        ]
        
        AF.request(url,
                   method: .get,
                   parameters: params,
                   encoding: URLEncoding.default,
                   headers: nil)
        .validate()
        .responseDecodable(of: AlarmDetailResponse.self) { (response) in
            switch response.result {
            case .success(let response):
                if response.success {
                    delegate.didSuccessAlarmDetail(response.data)
                }
                print("π₯\(response)")
            case .failure(let error):
                print("π₯\(error)")
            }
        }
        
    }
}
