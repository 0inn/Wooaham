//
//  PhoneTimeAlarmAPI.swift
//  Wooaham
//
//  Created by 김영인 on 2022/05/25.
//

import Alamofire

class PhoneTimeAlarmAPI {
    func getPhoneTimeAlarm(_ delegate: AddPhoneViewController) {
        AF.request(URLConstant.phoneTimeAlarm,
                   method: .get,
                   parameters: nil,
                   encoding: JSONEncoding.default,
                   headers: KeyChain.getAuthorizationHeader(account: Key.KeyChainKey.accessToken))
        .validate()
        .responseDecodable(of: PhoneTimeResponse.self) { (response) in
            switch response.result {
            case .success(let response):
                guard let phoneTimeInfo = response.data else { return }
                delegate.didSuccessPhoneTimeAlarm(phoneTimeInfo)
                print("🔥\(response)")
            case .failure(let error):
                print("🔥\(error)")
            }
        }
    }
}
