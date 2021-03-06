//
//  DeleteAlarmAPI.swift
//  Wooaham
//
//  Created by κΉμμΈ on 2022/04/15.
//

import Alamofire

class DeleteAlarmAPI {
    
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
                print("π₯\(response)")
            case .failure(let error):
                print("π₯\(error)")
            }
        }
    }
    
}
