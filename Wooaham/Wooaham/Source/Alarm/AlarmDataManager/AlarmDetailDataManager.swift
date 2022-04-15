//
//  AlarmDetailDataManager.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/15.
//

import Alamofire

class AlarmDetailDataManager {
    
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
                } else {
                    //delegate.failedToRequestAlarmDetail("오늘의딜 불러오는데 실패하였습니다.")
                }
                print("🔥\(response)")
            case .failure(let error):
                print("🔥\(error)")
            }
        }
        
    }
}
