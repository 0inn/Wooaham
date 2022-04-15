//
//  AlarmSwitchDataManager.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/15.
//

import Alamofire

class AlarmSwitchDataManager {
    
    func postAlarmSwitch(_ alarmId: CLong, _ enabled: Bool) {
        print("\(alarmId) \(enabled)")
        let url = "\(Const.URL.BASE_URL)/alarms/enable/\(alarmId)"
        
        let body: [String: Bool] = [
            "enabled": enabled
        ]
    
        AF.request(url,
                   method: .post,
                   parameters: body,
                   encoding: JSONEncoding.default,
                   headers: nil)
        .validate()
        .responseDecodable(of: AlarmTestResponse.self) { (response) in
            switch response.result {
            case .success(let response):
                print("🔥\(response)")
            case .failure(let error):
                print("🔥\(error)")
            }
        }
    }
    
}
