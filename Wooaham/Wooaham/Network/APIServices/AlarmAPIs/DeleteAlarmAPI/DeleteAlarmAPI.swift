//
//  DeleteAlarmDataManager.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/15.
//

import Alamofire

class DeleteAlarmDataManager {
    
    func deleteAlarm(_ alarmId: CLong) {
        
        let url = "\(Const.URL.BASE_URL)/alarms/\(alarmId)"
    
        AF.request(url,
                   method: .delete,
                   parameters: nil,
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
