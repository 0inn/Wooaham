//
//  AlarmAPI.swift
//  Wooaham
//
//  Created by κΉμμΈ on 2022/04/15.
//

import Alamofire

class AlarmSwitchAPI {
    
    func postAlarmSwitch(_ alarmId: CLong, _ enabled: Bool) {

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
                print("π₯\(response)")
            case .failure(let error):
                print("π₯\(error)")
            }
        }
    }
    
}
