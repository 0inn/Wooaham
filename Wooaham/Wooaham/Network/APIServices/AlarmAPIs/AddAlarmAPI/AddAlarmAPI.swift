//
//  AddAlarmAPI.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/15.
//

import Alamofire

class AddAlarmAPI {
    func postAlarm(_ alarmInfo: AddAlarmRequest, _ delegate: AddAlarmViewController) {
        let body: [String: Any] = [
            "title": alarmInfo.title,
            "time": alarmInfo.time,
            "daysOfWeek": alarmInfo.daysOfWeek ?? "1111111",
            "enabled": alarmInfo.enabled ?? true,
            "before10min": alarmInfo.before10min ?? false,
            "iconId": alarmInfo.iconId
        ]
        AF.request(URLConstant.alarm,
                   method: .post,
                   parameters: body,
                   encoding: JSONEncoding.default,
                   headers: APIConstant.header)
        .validate()
        .responseDecodable(of: AddAlarmResponse.self) { (response) in
            switch response.result {
            case .success(let response):
                if response.success {
                    delegate.didSuccessAddAlarm(response.data)
                }
                print("🔥\(response)")
            case .failure(let error):
                print("🔥\(error)")
            }
        }
    }
}
