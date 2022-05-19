//
//  EditAlarmAPI.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/15.
//

import Alamofire

class EditAlarmAPI {
    
    func editAlarm(_ alarmId: CLong, _ alarmInfo: EditAlarmRequest, _ delegate: AddAlarmViewController) {
        
        let url = "\(Const.URL.BASE_URL)/alarms/\(alarmId)"
        
        let body: [String: Any] = [
            "title": alarmInfo.title,
            "time": alarmInfo.time,
            "daysOfWeek": alarmInfo.daysOfWeek ?? "1111111",
            "enabled": alarmInfo.enabled ?? true,
            "before10min": alarmInfo.before10min ?? false,
            "iconId": alarmInfo.iconId
        ]
        
        AF.request(url,
                   method: .put,
                   parameters: body,
                   encoding: JSONEncoding.default,
                   headers: nil)
        .validate()
        .responseDecodable(of: EditAlarmResponse.self) { (response) in
            switch response.result {
            case .success(let response):
                if response.success {
                    delegate.didSuccessEditAlarm(response.data.alarmId)
                }
                print("🔥\(response)")
            case .failure(let error):
                print("🔥\(error)")
            }
        }
        
    }
}
