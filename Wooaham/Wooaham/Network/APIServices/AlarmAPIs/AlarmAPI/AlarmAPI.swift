//
//  AlarmAPI.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/10.
//

import Alamofire

class AlarmAPI {
    func getAlarm(_ delegate: AlarmViewController) {
        AF.request(URLConstant.alarm,
                   method: .get,
                   parameters: nil,
                   encoding: URLEncoding.default,
                   headers: APIConstant.header)
        .validate()
        .responseDecodable(of: AlarmResponse.self) { (response) in
            switch response.result {
            case .success(let response):
                if response.success {
                    delegate.didSuccessAlarm(response.data)
                }
                print("🔥\(response)")
            case .failure(let error):
                print("🔥\(error)")
            }
        }
    }
}
